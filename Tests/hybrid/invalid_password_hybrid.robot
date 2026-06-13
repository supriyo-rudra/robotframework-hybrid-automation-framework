*** Settings ***
Resource    ../../Resources/TestSetup.robot
Resource    ../../Pages/LoginPage.robot

Test Teardown    Close Browser Session

*** Test Cases ***
Invalid Password Hybrid

	[Tags]
	...    sanity
	...    regression

	${env}    ${ui_data}=    Initialize UI Test Context

	Launch Application From Config    ${env}

	Login To SauceDemo
	...    ${ui_data}[users][invalid_password][username]
	...    ${ui_data}[users][invalid_password][password]

	Verify Login Error
	...    Epic sadface: Username and password do not match
