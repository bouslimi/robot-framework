*** Settings ***
Library             SeleniumLibrary
Resource            ../resources/generic_keywords.robot
Resource            ../resources/login_keywords.robot
Library             DataDriver    ../testdata/login_failed_data.csv

Suite Setup         OpenBrowserMaximized
Suite Teardown      Close Browser
Test Template       FailedLogin


*** Test Cases ***
FailedLoginTestWithCSV using ${email} and ${password}


*** Keywords ***
FailedLogin
    [Arguments]    ${email}    ${password}
    Set Selenium Speed    0.1s
    LoginToWebapp    ${email}    ${password}
    Alert Should Be Present    ${login_error_msg}    ACCEPT
    Sleep    0.2s
