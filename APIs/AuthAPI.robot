*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://reqres.in
${API_KEY}     free_user_3F5IcYN7thV2ymEch3SEjEd77lU

*** Keywords ***
Create API Session

    ${headers}=    Create Dictionary
    ...    x-api-key=${API_KEY}

    Create Session
    ...    reqres
    ...    ${BASE_URL}
    ...    headers=${headers}

Login API

    [Arguments]
    ...    ${email}
    ...    ${password}

    ${body}=    Create Dictionary
    ...    email=${email}
    ...    password=${password}

    ${response}=    POST On Session
    ...    reqres
    ...    /api/login
    ...    json=${body}

    RETURN    ${response}