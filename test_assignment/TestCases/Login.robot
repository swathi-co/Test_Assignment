*** Settings ***
Variables    ../config/config.py   
Library    SeleniumLibrary
Resource   ../resources/LoginPage.resource
 

*** Test Cases ***
Login To Rudderstack Dashboard
    
    [Documentation]    Test login using credentials from environment variables
    Log   ENV = ${ENV}
    Log    USER = ${USER}
    Log    PASS = ${PASS}
    Log    BASE_URL = ${BASE_URL}
    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window
    Login To Rudderstack    ${USER}    ${PASS}
    ${title}=    Get Title
    Should Contain    ${title}    RudderStack
    [Teardown]    Close Browser

