*** Settings ***
Resource    ../../Resources/TestSetup.robot
Resource    ../../APIs/AuthAPI.robot
Resource    ../../APIs/UserAPI.robot
Resource    ../../Resources/HybridKeywords.robot
Resource    ../../Pages/LoginPage.robot
Resource    ../../Pages/InventoryPage.robot

Test Teardown    Close Browser Session

*** Test Cases ***
Valid Login

    [Tags]    regression

    ${env}    ${ui_data}=    Initialize UI Test Context

    Launch Application From Config    ${env}
    Login To SauceDemo    ${ui_data}[users][valid_user][username]    ${ui_data}[users][valid_user][password]
    Verify Inventory Page

Inventory

    [Tags]    regression

    ${env}    ${ui_data}=    Initialize UI Test Context

    Launch Application From Config    ${env}
    Login To SauceDemo    ${ui_data}[users][valid_user][username]    ${ui_data}[users][valid_user][password]
    Verify Inventory Page

API Login

    [Tags]    regression

    ${env}    ${api_data}=    Initialize API Test Context
    ${login}=    Set Variable    ${api_data}[login]

    ${response}=    Login API    ${login}[email]    ${login}[password]

    Verify Status Code    ${response.status_code}    200
    ${token}=    Extract Token    ${response}
    Verify Token Exists    ${token}

Get User

    [Tags]    regression

    ${env}    ${api_data}=    Initialize API Test Context
    ${user}=    Set Variable    ${api_data}[user]

    ${response}=    Get User    ${user}[id]

    Verify Status Code    ${response.status_code}    200
    Verify Text Present    ${response.text}    Janet

API Login Then UI Login

    [Tags]    regression

    ${env}=    Load Environment Config
    ${api_data}=    Load API Data
    ${ui_data}=    Load UI Data
    ${login}=    Set Variable    ${api_data}[login]

    Create API Session    ${env}[api][base_url]    ${env}[api][api_key]
    ${response}=    Login API    ${login}[email]    ${login}[password]

    Verify Status Code    ${response.status_code}    200
    ${token}=    Extract Token    ${response}
    Verify Token Exists    ${token}

    Launch Application From Config    ${env}
    Login To SauceDemo    ${ui_data}[users][valid_user][username]    ${ui_data}[users][valid_user][password]
    Verify Inventory Page

Invalid Password

    [Tags]    regression

    ${env}    ${ui_data}=    Initialize UI Test Context

    Launch Application From Config    ${env}
    Login To SauceDemo    ${ui_data}[users][invalid_password][username]    ${ui_data}[users][invalid_password][password]
    Verify Login Error    Epic sadface: Username and password do not match

Invalid Username

    [Tags]    regression

    ${env}    ${ui_data}=    Initialize UI Test Context

    Launch Application From Config    ${env}
    Login To SauceDemo    ${ui_data}[users][invalid_username][username]    ${ui_data}[users][invalid_username][password]
    Verify Login Error    Epic sadface: Username and password do not match any user

Locked User

    [Tags]    regression

    ${env}    ${ui_data}=    Initialize UI Test Context

    Launch Application From Config    ${env}
    Login To SauceDemo    ${ui_data}[users][locked_user][username]    ${ui_data}[users][locked_user][password]
    Verify Login Error    Epic sadface: Sorry, this user has been locked out.

Data Driven

    [Tags]    regression

    ${env}    ${users_data}=    Initialize Users Test Context
    ${users}=    Set Variable    ${users_data}[users]

    FOR    ${user}    IN    @{users}
        Launch Application From Config    ${env}
        Login To SauceDemo    ${user}[username]    ${user}[password]
        Verify Inventory Page
        Close Browser Session
    END

Create Employee Hybrid

    [Tags]    regression

    ${env}    ${employee_data}=    Initialize Employee API Test Context
    ${employees}=    Set Variable    ${employee_data}[employees]

    FOR    ${employee}    IN    @{employees}
        ${response}=    Create Employee    ${employee}[name]    ${employee}[job]
        Verify Status Code    ${response.status_code}    201
        Verify Text Present    ${response.text}    ${employee}[name]
        Log To Console    Employee Created Successfully
    END