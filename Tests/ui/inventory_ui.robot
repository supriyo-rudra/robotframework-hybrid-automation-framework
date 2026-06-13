*** Settings ***
Resource    ../../Resources/BrowserFactory.robot
Resource    ../../Pages/LoginPage.robot
Resource    ../../Pages/InventoryPage.robot

Suite Setup       Launch Browser
Suite Teardown    Close Browser Session

*** Test Cases ***
Inventory Page Validation

    [Tags]    sanity    regression

    Enter Username    standard_user

    Enter Password    secret_sauce

    Click Login

    Verify Inventory Page