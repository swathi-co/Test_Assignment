*** Settings ***
Library    SeleniumLibrary
Variables    ../config/config.py   
Resource   ../resources/LoginPage.resource

*** Variables ***
${Webhook_dest}     xpath=//div[contains(@id,"destination-")]//span[contains(text(),"Webhook")]


*** Test Cases ***
Verify Webhook Destination Events
    Open Browser    ${BASE_URL}    chrome
    Maximize Browser Window
    Login To Rudderstack    ${USER}    ${PASS}
    Wait Until Element Is Visible    ${Webhook_dest}    10s
    Click Element    ${Webhook_dest}

Verify the Events counts
    ${delivered}=    Get Text    xpath=//span[contains(text(),"Delivered")]/following-sibling::span
    ${failed}=       Get Text    xpath=//span[contains(text(),"Failed")]/following-sibling::span
    Log To Console    Delivered Events: ${delivered}
    Log To Console    Failed Events: ${failed}