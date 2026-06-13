*** Settings ***
Resource    ../../Resources/TestSetup.robot
Resource    ../../Pages/LoginPage.robot

Test Teardown    Close Browser Session

*** Test Cases ***
Invalid Username Validation

	[Tags]
	...    sanity
	...    regression

	${env}    ${ui_data}=    Initialize UI Test Context

	Launch Application From Config    ${env}

	Login To SauceDemo
	...    ${ui_data}[users][invalid_username][username]
	...    ${ui_data}[users][invalid_username][password]

	Verify Login Error
	...    Epic sadface: Username and password do not match any user
