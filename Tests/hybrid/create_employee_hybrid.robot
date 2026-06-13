*** Settings ***
Library     ../../Libraries/YamlReader.py
Resource    ../../APIs/AuthAPI.robot
Resource    ../../APIs/UserAPI.robot

*** Variables ***
${ENV_FILE}              Config/env.yaml
${EMPLOYEE_DATA_FILE}    TestData/employee_data.yaml

*** Test Cases ***
Create Employee Hybrid

	[Tags]
	...    regression

	${env}=    Load Yaml    ${ENV_FILE}
	${employee_data}=    Load Yaml    ${EMPLOYEE_DATA_FILE}
	${employees}=    Set Variable    ${employee_data}[employees]

	Create API Session    ${env}[api][base_url]    ${env}[api][api_key]

	FOR    ${employee}    IN    @{employees}
		${response}=    Create Employee    ${employee}[name]    ${employee}[job]
		Should Be Equal As Integers    ${response.status_code}    201
		Should Contain    ${response.text}    ${employee}[name]
		Log To Console    Employee Created Successfully
	END
