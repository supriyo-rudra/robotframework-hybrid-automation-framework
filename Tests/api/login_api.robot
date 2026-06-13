*** Settings ***
Library     ../../Libraries/YamlReader.py

Resource    ../../APIs/AuthAPI.robot

Suite Setup    Create API Session

*** Test Cases ***
Successful Login API

    [Tags]    smoke    sanity    regression

    ${data}=    Load Yaml    TestData/api_data.yaml
    ${login}=    Set Variable    ${data}[login]
    ${email}=    Set Variable    ${login}[email]
    ${password}=    Set Variable    ${login}[password]

    ${response}=    Login API    ${email}    ${password}

    Should Be Equal As Integers    ${response.status_code}    200

    Log To Console    ${response.json()}