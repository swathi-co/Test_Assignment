*** Settings***

Library    String
*** Variables ***
${DATA_PLANE_URL}    xpath=//span[contains(text(),"dataplane.rudderstack.com")]
${WRITE_KEY}         xpath=//span[contains(text(),"Write key")]

*** Keywords ***
Get Data Plane URL
    Wait Until Element Is Visible    ${DATA_PLANE_URL}    20s
    ${url}=    Get Text    ${DATA_PLANE_URL}
    Log    Data Plane URL = ${url}
    Set Suite Variable    ${DATA_PLANE_URL}    ${url}
    [Return]    ${url}

Get Write Key
    Wait Until Element Is Visible    ${WRITE_KEY}    20s
    ${raw_text}=    Get Text    ${WRITE_KEY}
    # raw_text looks like: "Write key 31SjpkFNj55tauQpUOehQLsguKE"
    ${key}=    Remove String    ${raw_text}    Write key
    ${key}=    Strip String    ${Key}
    Log    Write Key = ${key}
    Set Suite Variable    ${WRITE_KEY}    ${key}
    [Return]    ${key}

