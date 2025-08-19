*** Settings ***
Library    SeleniumLibrary
Variables  ../config/config.py
Resource   ../resources/LoginPage.resource
Resource   ../resources/connections.resource


***Test Cases ***
Read Data Plane URL
    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window
    Login To Rudderstack    ${USER}    ${PASS}
    ${data_plane_url}=    Get Data Plane URL
    Log To Console    Data Plane URL: ${data_plane_url}
    [Teardown]    Close Browser