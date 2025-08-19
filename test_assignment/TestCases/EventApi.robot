*** Settings ***
Variables    ../config/config.py
Library      SeleniumLibrary
Resource     ../resources/LoginPage.resource
Resource     ../resources/connections.resource
Library      ../libraries/EventAPI.py
*** Test Cases ***
Event API Test execution
    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window
    Login To Rudderstack    ${USER}    ${PASS}
    ${data_plane_url}=    Get Data Plane URL
    ${write_key}=    Get Write Key
    Log To Console    Using DP: ${data_plane_url}
    Log To Console    Using WK: ${write_key}
    ${status}    ${resp}=    Send Track Event    user_123    E2E Event    {"plan":"premium"}
    Log To Console    Track Resp: ${status} ${resp}
    [Teardown]    Close Browser
