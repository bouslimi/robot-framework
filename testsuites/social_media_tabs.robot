*** Settings ***
Library             SeleniumLibrary
Resource            ../resources/generic_keywords.robot
Resource            ../resources/generic_keywords.robot

Test Setup          TestSetup
Task Teardown       TestTeardown


*** Test Cases ***
LinkedIn Page
    Click Element    ${generic_linkedin_btn}
    Switch Window    NEW
    Title Should Be    ${generic_linkedin_title}
    Switch Window    MAIN
    Title Should Be    ${generic_app_name}

Github Page
    Click Element    ${generic_github_btn}
    Switch Window    NEW
    Title Should Be    ${generic_github_title}
    Switch Window    MAIN
    Title Should Be    ${generic_app_name}


*** Keywords ***
TestSetup
    OpenBrowserMaximized

TestTeardown
    Close Browser
