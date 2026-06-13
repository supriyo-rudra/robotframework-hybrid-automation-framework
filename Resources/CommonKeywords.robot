*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary

*** Keywords ***
Capture Screenshot On Failure

	Capture Page Screenshot

Verify Status Code

	[Arguments]
	...    ${actual}
	...    ${expected}

	Should Be Equal As Integers
	...    ${actual}
	...    ${expected}

Verify Token Exists

	[Arguments]
	...    ${token}

	Should Not Be Empty
	...    ${token}

Verify Text Present

	[Arguments]
	...    ${actual}
	...    ${expected}

	Should Contain
	...    ${actual}
	...    ${expected}
