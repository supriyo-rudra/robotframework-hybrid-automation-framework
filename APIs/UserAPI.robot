*** Settings ***
Library    Collections
Library    RequestsLibrary
Resource   AuthAPI.robot

*** Keywords ***
Get User

	[Arguments]
	...    ${user_id}

	${response}=
	...    GET On Session
	...    reqres
	...    /api/users/${user_id}

	RETURN    ${response}

Get Users List Page

	${data}=    Load API Test Data
	${users}=    Get From Dictionary    ${data}    users
	${page}=    Get From Dictionary    ${users}    list_page
	RETURN    ${page}

Get Users By Page

	[Arguments]    ${page}

	${params}=    Create Dictionary
	...    page=${page}

	${response}=    GET On Session
	...    reqres
	...    url=/api/users
	...    params=${params}

	RETURN    ${response}
