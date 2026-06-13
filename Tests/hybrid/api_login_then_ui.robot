*** Settings ***
Resource    ../../Resources/TestSetup.robot
Resource    ../../APIs/AuthAPI.robot
Resource    ../../Resources/HybridKeywords.robot
Resource    ../../Pages/LoginPage.robot
Resource    ../../Pages/InventoryPage.robot

Test Teardown    Close Browser Session

*** Test Cases ***
API Login Then UI Login

	[Tags]
	...    smoke
	...    sanity
	...    regression

	${env}=    Load Environment Config
	${api_data}=    Load API Test Data
	${ui_data}=    Load UI Test Data

	Create API Session    ${env}[api][base_url]    ${env}[api][api_key]
	${response}=    Login API    ${api_data}[login][email]    ${api_data}[login][password]

	Verify Status Code    ${response.status_code}    200

	${token}=    Extract Token    ${response}

	Verify Token Exists    ${token}

	Launch Application From Config    ${env}

	Login To SauceDemo
	...    ${ui_data}[users][valid_user][username]
	...    ${ui_data}[users][valid_user][password]

	Verify Inventory Page
