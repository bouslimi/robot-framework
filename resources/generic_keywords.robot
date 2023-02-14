*** Settings ***
Library         SeleniumLibrary
Library         ../librairies/database_lib.py
Library         ../librairies/api_lib.py
Library         ../librairies/drivermanager_lib.py
Resource        generic_variables.robot
Variables       ../pageobjects/generic_locators.py


*** Keywords ***
OpenBrowserMaximized
    [Arguments]    ${url}=${base_url}    ${browser_name}=${browser}
    ${driver_path} =    GetDriverPath    ${browser_name}
    Open Browser    ${url}    ${browser}    executable_path=${driver_path}[0]
    Maximize Browser Window
