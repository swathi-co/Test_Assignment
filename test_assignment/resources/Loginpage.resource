*** Variables ***
${USERNAME_INPUT}   id=text-input-email
${PASSWORD_INPUT}   id=text-input-password
${LOGIN_BTN}      xpath=//button[contains(@class,"ant-btn-primary")]
${SKIP_MFA_LINK}    xpath=//a[normalize-space(.)="I'll do this later"]
${go_Dashboard}     xpath=//button[contains(@class,"ant-btn-primary")]

*** Keywords ***
Login To Rudderstack
    [Arguments]    ${user}    ${password}
    Input Text    ${USERNAME_INPUT}    ${user}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Wait Until Element Is Visible    ${LOGIN_BTN}    10s
    Click Button  ${LOGIN_BTN}
    Wait Until Page Contains Element    ${SKIP_MFA_LINK}    10s
    Click Element    ${SKIP_MFA_LINK}
    Wait Until Page Contains Element    ${go_Dashboard}    30s
    Click Element    ${go_Dashboard}

