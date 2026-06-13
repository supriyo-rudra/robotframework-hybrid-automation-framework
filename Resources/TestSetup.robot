*** Settings ***
Library    ../Libraries/YamlReader.py
Resource   BrowserFactory.robot
Resource   CommonKeywords.robot
Resource   ../APIs/AuthAPI.robot

*** Variables ***
${ENV_FILE}              Config/env.yaml
${UI_DATA_FILE}          TestData/ui_data.yaml
${API_DATA_FILE}         TestData/api_data.yaml
${USERS_DATA_FILE}       TestData/users.yaml
${EMPLOYEE_DATA_FILE}    TestData/employee_data.yaml

*** Keywords ***
Load Environment Config

    ${env}=    Load Yaml    ${ENV_FILE}
    RETURN    ${env}

Load UI Data

    ${data}=    Load Yaml    ${UI_DATA_FILE}
    RETURN    ${data}

Load API Data

    ${data}=    Load Yaml    ${API_DATA_FILE}
    RETURN    ${data}

Load UI Test Data

    ${ui_data}=    Load UI Data
    RETURN    ${ui_data}

Load API Test Data

    ${api_data}=    Load API Data
    RETURN    ${api_data}

Load Users Test Data

    ${users_data}=    Load Yaml    ${USERS_DATA_FILE}
    RETURN    ${users_data}

Load Employee Test Data

    ${employee_data}=    Load Yaml    ${EMPLOYEE_DATA_FILE}
    RETURN    ${employee_data}

Initialize UI Test Context

    ${env}=    Load Environment Config
    ${ui_data}=    Load UI Test Data
    RETURN    ${env}    ${ui_data}

Initialize Users Test Context

    ${env}=    Load Environment Config
    ${users_data}=    Load Users Test Data
    RETURN    ${env}    ${users_data}

Initialize API Test Context

    ${env}=    Load Environment Config
    ${api_data}=    Load API Test Data
    Create API Session    ${env}[api][base_url]    ${env}[api][api_key]
    RETURN    ${env}    ${api_data}

Initialize Employee API Test Context

    ${env}=    Load Environment Config
    ${employee_data}=    Load Employee Test Data
    Create API Session    ${env}[api][base_url]    ${env}[api][api_key]
    RETURN    ${env}    ${employee_data}

Launch Application From Config
    [Arguments]    ${env}

    Launch Browser    ${env}[application][ui_url]