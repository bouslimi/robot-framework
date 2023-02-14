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
OpenHomePage
    OpenBrowserMaximized
    LoginToWebappViaToken
