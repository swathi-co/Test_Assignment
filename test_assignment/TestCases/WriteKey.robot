*** Settings ***
Library    SeleniumLibrary
Variables  ../config/config.py
Resource   ../resources/Loginpage.resource
Resource   ../resources/connections.resource

*** Test Cases ***
Read Write Key
    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window
    Login To Rudderstack    ${USER}    ${PASS}
    ${data_plane_url}=    Get Data Plane URL
    ${write_key}=    Get Write Key
    Log To Console    Data Plane URL: ${data_plane_url}
    Log To Console    Write Key: ${write_key}
    [Teardown]    Close Browser