*** Settings ***
Library             SeleniumLibrary
Resource            ../resources/generic_keywords.robot
Resource            ../resources/home_keywords.robot

Test Setup          TestSetup
Test Teardown       TestTeardown


*** Test Cases ***
Home Page Content
    [Tags]    regression
    Wait Until Page Contains    Welcome to AUTestBOT, Your Test Automation Bot.
    Page Should Contain    Tiltle Card 1 here
    Page Should Contain    SubHeader Card 1 here
    Page Should Contain Element    xpath://a[.='Download 1']
    Capture Page Screenshot    EMBED

User Logout
    ${logout_button}    Set Variable    xpath://button[.='Logout']
    Wait Until Element Is Visible    ${logout_button}
    Click Button    ${logout_button}
    Wait Until Element Is Not Visible    ${logout_button}


*** Keywords ***
TestSetup
    OpenHomePage

TestTeardown
    Close Browser
