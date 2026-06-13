*** Settings ***
Resource    ../../Resources/TestSetup.robot
Resource    ../../APIs/AuthAPI.robot
Resource    ../../APIs/UserAPI.robot

*** Test Cases ***
Get User Details

    [Tags]    regression

    ${env}    ${data}=    Initialize API Test Context
    ${user}=    Set Variable    ${data}[user]
    ${user_id}=    Set Variable    ${user}[id]

    ${response}=    Get User    ${user_id}

    Verify Status Code    ${response.status_code}    200
    Should Contain    ${response.text}    Janet

    Log To Console    ${response.json()}