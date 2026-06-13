*** Settings ***
Resource    ../../Resources/TestSetup.robot
Resource    ../../APIs/UserAPI.robot

*** Test Cases ***
Create Employee Hybrid

	[Tags]
	...    regression

	${env}    ${employee_data}=    Initialize Employee API Test Context
	${employees}=    Set Variable    ${employee_data}[employees]

	FOR    ${employee}    IN    @{employees}
		${response}=    Create Employee    ${employee}[name]    ${employee}[job]
		Verify Status Code    ${response.status_code}    201
		Should Contain    ${response.text}    ${employee}[name]
		Log To Console    Employee Created Successfully
	END
