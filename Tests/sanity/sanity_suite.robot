*** Settings ***
Resource    ../../Resources/TestSetup.robot
Resource    ../../APIs/AuthAPI.robot
Resource    ../../APIs/UserAPI.robot
Resource    ../../Pages/LoginPage.robot
Resource    ../../Pages/InventoryPage.robot

Test Teardown    Close Browser Session

*** Test Cases ***
Valid Login

    [Tags]    sanity    regression

    ${env}    ${ui_data}=    Initialize UI Test Context

    Launch Application From Config    ${env}
    Login To SauceDemo    ${ui_data}[users][valid_user][username]    ${ui_data}[users][valid_user][password]
    Verify Inventory Page

Invalid Password

    [Tags]    sanity    regression

    ${env}    ${ui_data}=    Initialize UI Test Context

    Launch Application From Config    ${env}
    Login To SauceDemo    ${ui_data}[users][invalid_password][username]    ${ui_data}[users][invalid_password][password]
    Verify Login Error    Epic sadface: Username and password do not match

Invalid Username

    [Tags]    sanity    regression

    ${env}    ${ui_data}=    Initialize UI Test Context

    Launch Application From Config    ${env}
    Login To SauceDemo    ${ui_data}[users][invalid_username][username]    ${ui_data}[users][invalid_username][password]
    Verify Login Error    Epic sadface: Username and password do not match any user

API Login

    [Tags]    sanity    regression

    ${env}    ${api_data}=    Initialize API Test Context
    ${login}=    Set Variable    ${api_data}[login]

    ${response}=    Login API    ${login}[email]    ${login}[password]

    Verify Status Code    ${response.status_code}    200

Get User

    [Tags]    sanity    regression

    ${env}    ${api_data}=    Initialize API Test Context
    ${user}=    Set Variable    ${api_data}[user]

    ${response}=    Get User    ${user}[id]

    Verify Status Code    ${response.status_code}    200
    Verify Text Present    ${response.text}    Janet