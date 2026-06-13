*** Settings ***
Library     ../../Libraries/YamlReader.py
Resource    ../../APIs/AuthAPI.robot
Resource    ../../APIs/UserAPI.robot

Suite Setup    Create API Session

*** Test Cases ***
GET User

	${data}=    Load Yaml    TestData/api_data.yaml
	${user}=    Set Variable    ${data}[user]
	${user_id}=    Set Variable    ${user}[id]

	${response}=    Get User    ${user_id}

	Should Be Equal As Integers    ${response.status_code}    200
