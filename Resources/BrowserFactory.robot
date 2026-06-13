*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.saucedemo.com

*** Keywords ***
Launch Browser

    [Arguments]    ${url}=${URL}

    Open Browser    ${url}    chrome

    Maximize Browser Window

    Register Keyword To Run On Failure
    ...    Capture Page Screenshot

Close Browser Session

    Close All Browsers