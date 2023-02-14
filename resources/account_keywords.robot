*** Settings ***
Library         SeleniumLibrary
Library         ../librairies/database_lib.py
Library         ../librairies/api_lib.py
Library         ../librairies/drivermanager_lib.py
Resource        generic_variables.robot
Resource        login_keywords.robot
Resource        generic_keywords.robot
Variables       ../pageobjects/login_locators.py
Variables       ../pageobjects/home_locators.py
Variables       ../pageobjects/account_locators.py


*** Keywords ***
OpenAccountPage
    OpenBrowserMaximized
    LoginToWebappViaToken
    Wait Until Element Is Visible    ${home_myaccount_btn}
    Click Link    ${home_myaccount_btn}
    Wait Until Page Contains Element    ${account_title_h1}
