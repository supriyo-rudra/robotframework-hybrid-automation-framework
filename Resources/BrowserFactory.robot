*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.saucedemo.com

*** Keywords ***
Launch Browser

    Open Browser    ${URL}    chrome

    Maximize Browser Window

Close Browser Session

    Close All Browsers