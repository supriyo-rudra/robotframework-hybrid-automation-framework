*** Settings ***
Resource    ../../Resources/TestSetup.robot
Resource    ../../Pages/LoginPage.robot

Test Teardown    Close Browser Session

*** Test Cases ***
Locked User Validation

	[Tags]
	...    sanity
	...    regression

	${env}    ${ui_data}=    Initialize UI Test Context

	Launch Application From Config    ${env}

	Login To SauceDemo
	...    ${ui_data}[users][locked_user][username]
	...    ${ui_data}[users][locked_user][password]

	Verify Login Error
	...    Epic sadface: Sorry, this user has been locked out.
