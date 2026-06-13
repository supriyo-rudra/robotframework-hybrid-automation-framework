*** Keywords ***
Extract Token

	[Arguments]
	...    ${response}

	${json}=
	...    Set Variable
	...    ${response.json()}

	${token}=
	...    Set Variable
	...    ${json}[token]

	RETURN    ${token}
