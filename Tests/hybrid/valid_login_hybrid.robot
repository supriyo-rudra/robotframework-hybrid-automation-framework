*** Settings ***
Library     ../../Libraries/YamlReader.py
Resource    ../../Resources/BrowserFactory.robot
Resource    ../../Pages/LoginPage.robot
Resource    ../../Pages/InventoryPage.robot

Test Teardown    Close Browser Session

*** Variables ***
${ENV_FILE}         Config/env.yaml
${UI_DATA_FILE}     TestData/ui_data.yaml

*** Test Cases ***
Valid Login Hybrid

	[Tags]
	...    smoke
	...    sanity
	...    regression

	${env}=    Load Yaml    ${ENV_FILE}
	${ui_data}=    Load Yaml    ${UI_DATA_FILE}

	Launch Browser    ${env}[application][ui_url]

	Login To SauceDemo
	...    ${ui_data}[users][valid_user][username]
	...    ${ui_data}[users][valid_user][password]

	Verify Inventory Page
