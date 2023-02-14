*** Settings ***
Library             SeleniumLibrary
Resource            ../resources/generic_keywords.robot
Resource            ../resources/login_keywords.robot

Suite Setup         OpenBrowserMaximized
Suite Teardown      Close Browser
Test Template       FailedLogin


*** Variables ***
${wrong_email}          wrong@autestbot.org
${wrong_password}       wrong-01
${empty_string}         ${EMPTY}


*** Test Cases ***    email    password
Valid email Wrong password    [Tags]    regression
    ${user_email}    ${wrong_password}
Valid email Empty password    [Tags]    regression
    ${user_email}    ${empty_string}
Wrong email Valid password    ${wrong_email}    ${user_password}
Empty email Valid password    ${empty_string}    ${user_password}
Empty email Empty password    ${empty_string}    ${empty_string}
Wrong email Wrong password    ${wrong_email}    ${wrong_password}


*** Keywords ***
FailedLogin
    [Arguments]    ${email}    ${password}
    Set Selenium Speed    0.1s
    LoginToWebapp    ${email}    ${password}
    Alert Should Be Present    ${login_error_msg}    ACCEPT
    Sleep    0.2s
