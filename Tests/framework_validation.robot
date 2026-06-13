*** Settings ***
Library    ../Libraries/YamlReader.py

*** Test Cases ***
Validate Framework Setup

    ${data}=    Load Yaml    TestData/users.yaml

    Log To Console    ${data}