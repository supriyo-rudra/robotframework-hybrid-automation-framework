*** Settings ***
Resource    ../../Resources/TestSetup.robot
Resource    ../../Pages/LoginPage.robot
Resource    ../../Pages/InventoryPage.robot

Test Teardown    Close Browser Session

*** Test Cases ***
Valid Login Hybrid

	[Tags]
	...    smoke
	...    sanity
	...    regression

	${env}    ${ui_data}=    Initialize UI Test Context

	Launch Application From Config    ${env}

	Login To SauceDemo
	...    ${ui_data}[users][valid_user][username]
	...    ${ui_data}[users][valid_user][password]

	Verify Inventory Page
