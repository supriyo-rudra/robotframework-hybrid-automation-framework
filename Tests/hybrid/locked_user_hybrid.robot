*** Settings ***
Library     ../../Libraries/YamlReader.py
Resource    ../../Resources/BrowserFactory.robot
Resource    ../../Pages/LoginPage.robot

Test Teardown    Close Browser Session

*** Variables ***
${ENV_FILE}        Config/env.yaml
${UI_DATA_FILE}    TestData/ui_data.yaml

*** Test Cases ***
Locked User Validation

	[Tags]
	...    regression

	${env}=    Load Yaml    ${ENV_FILE}
	${ui_data}=    Load Yaml    ${UI_DATA_FILE}

	Launch Browser    ${env}[application][ui_url]

	Login To SauceDemo
	...    ${ui_data}[users][locked_user][username]
	...    ${ui_data}[users][locked_user][password]

	Verify Login Error
	...    Epic sadface: Sorry, this user has been locked out.
