*** Settings ***
Resource    ../../Resources/TestSetup.robot
Resource    ../../Pages/LoginPage.robot
Resource    ../../Pages/InventoryPage.robot

Test Teardown    Close Browser Session

*** Test Cases ***
Data Driven Login Validation

	[Tags]    regression

	${env}    ${users_data}=    Initialize Users Test Context
	${users}=    Set Variable    ${users_data}[users]

	FOR    ${user}    IN    @{users}
		Launch Application From Config    ${env}
		Login To SauceDemo    ${user}[username]    ${user}[password]
		Verify Inventory Page
		Close Browser Session
	END
