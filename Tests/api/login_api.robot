*** Settings ***
Resource    ../../Resources/TestSetup.robot
Resource    ../../APIs/AuthAPI.robot

*** Test Cases ***
Successful Login API

    [Tags]    smoke    sanity    regression

    ${env}    ${data}=    Initialize API Test Context
    ${login}=    Set Variable    ${data}[login]
    ${email}=    Set Variable    ${login}[email]
    ${password}=    Set Variable    ${login}[password]

    ${response}=    Login API    ${email}    ${password}

    Verify Status Code    ${response.status_code}    200

    Log To Console    ${response.json()}