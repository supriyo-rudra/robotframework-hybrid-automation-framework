*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${USERNAME_FIELD}    id:user-name
${PASSWORD_FIELD}    id:password
${LOGIN_BUTTON}      id:login-button

*** Keywords ***
Enter Username
    [Arguments]    ${username}
    Input Text    ${USERNAME_FIELD}    ${username}

Enter Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_FIELD}    ${password}

Click Login
    Click Button    ${LOGIN_BUTTON}