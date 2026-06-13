*** Settings ***
Library     ../../Libraries/YamlReader.py
Resource    ../../Resources/BrowserFactory.robot
Resource    ../../Pages/LoginPage.robot
Resource    ../../Pages/InventoryPage.robot

Test Teardown    Close Browser Session

*** Variables ***
${ENV_FILE}           Config/env.yaml
${USERS_DATA_FILE}    TestData/users.yaml

*** Test Cases ***
Data Driven Login Validation

	${env}=    Load Yaml    ${ENV_FILE}
	${users_data}=    Load Yaml    ${USERS_DATA_FILE}
	${users}=    Set Variable    ${users_data}[users]

	FOR    ${user}    IN    @{users}
		Launch Browser    ${env}[application][ui_url]
		Login To SauceDemo    ${user}[username]    ${user}[password]
		Verify Inventory Page
		Close Browser Session
	END
