*** Settings ***
Library             SeleniumLibrary
Resource            ../resources/generic_keywords.robot
Resource            ../resources/login_keywords.robot
Resource            ../resources/signup_keywords.robot
Resource            ../resources/home_keywords.robot

Test Setup          TestSetup
Test Teardown       TestTeardown


*** Test Cases ***
Login with correct credentials
    [Tags]    regression
    Wait Until Page Contains    ${home_welcome_msg}
    Capture Page Screenshot    EMBED


*** Keywords ***
TestSetup
    SignupTestUser
    OpenBrowserMaximized
    ${default_selenium_speed} =    Get Selenium Speed
    Log To Console    Default Selenium speed : ${default_selenium_speed}
    Set Selenium Speed    0.1s    # default is 0s (time between actions)
    Set Selenium Timeout    10s    # default Timeout is 5s (time before throwing an error)
    Set Selenium Implicit Wait    5s    # default Implicit wait is 0s (searching for element)
    LoginToWebapp

TestTeardown
    Sleep    0.5s
    Close Browser
