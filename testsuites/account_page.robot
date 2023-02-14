*** Comments ***
Check user's account info using Token to login (not GUI).


*** Settings ***
Library             SeleniumLibrary
Resource            ../resources/generic_keywords.robot
Resource            ../resources/login_keywords.robot
Resource            ../resources/account_keywords.robot
Variables           ../pageobjects/home_locators.py
Variables           ../pageobjects/account_locators.py

Test Setup          TestSetup
Test Teardown       TestTeardown


*** Test Cases ***
User account infos
    [Tags]    regression
    Page Should Contain    ${user_first_name}
    Page Should Contain    ${user_last_name}
    Page Should Contain    ${user_email}

Account Page Buttons
    Page Should Contain Element    ${account_back_btn}
    Page Should Contain Button    ${account_delete_btn}


*** Keywords ***
TestSetup
    OpenAccountPage

TestTeardown
    Close Browser
