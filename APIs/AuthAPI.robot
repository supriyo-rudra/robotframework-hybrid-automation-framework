*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://reqres.in
${API_KEY}     free_user_3F5IcYN7thV2ymEch3SEjEd77lU

*** Keywords ***
Create API Session

    [Arguments]
    ...    ${base_url}=${BASE_URL}
    ...    ${api_key}=${API_KEY}

    ${headers}=
    ...    Create Dictionary
    ...    x-api-key=${api_key}

    Create Session
    ...    reqres
    ...    ${base_url}
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