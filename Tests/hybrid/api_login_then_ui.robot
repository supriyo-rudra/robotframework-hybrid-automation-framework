*** Settings ***
Library     ../../Libraries/YamlReader.py
Resource    ../../APIs/AuthAPI.robot
Resource    ../../Resources/BrowserFactory.robot
Resource    ../../Resources/HybridKeywords.robot
Resource    ../../Pages/LoginPage.robot
Resource    ../../Pages/InventoryPage.robot

Test Teardown    Close Browser Session

*** Variables ***
${ENV_FILE}         Config/env.yaml
${API_DATA_FILE}    TestData/api_data.yaml
${UI_DATA_FILE}     TestData/ui_data.yaml

*** Test Cases ***
API Login Then UI Login

	[Tags]
	...    smoke
	...    regression

	${env}=    Load Yaml    ${ENV_FILE}
	${api_data}=    Load Yaml    ${API_DATA_FILE}
	${ui_data}=    Load Yaml    ${UI_DATA_FILE}

	Create API Session    ${env}[api][base_url]    ${env}[api][api_key]
	${response}=    Login API    ${api_data}[login][email]    ${api_data}[login][password]

	Should Be Equal As Integers    ${response.status_code}    200

	${token}=    Extract Token    ${response}

	Should Not Be Empty    ${token}

	Launch Browser    ${env}[application][ui_url]

	Login To SauceDemo
	...    ${ui_data}[users][valid_user][username]
	...    ${ui_data}[users][valid_user][password]

	Verify Inventory Page
