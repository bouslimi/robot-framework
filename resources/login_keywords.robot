*** Settings ***
Library         SeleniumLibrary
Library         ../librairies/database_lib.py
Library         ../librairies/api_lib.py
Library         ../librairies/drivermanager_lib.py
Resource        generic_variables.robot
Variables       ../pageobjects/login_locators.py


*** Keywords ***
LoginToWebapp
    [Arguments]    ${email}=${user_email}    ${password}=${user_password}
    Input Text    ${login_email_txt}    ${email}
    Input Text    ${login_password_txt}    ${password}
    Click Button    ${login_login_btn}

LoginToWebappViaToken
    [Arguments]    ${email}=${user_email}
    ${user_token} =    GetUserToken    ${email}
    Log To Console    ${user_token}
    Execute Javascript    localStorage.setItem('email', '${email}')
    Execute Javascript    localStorage.setItem('token', '${user_token}')
    Reload Page
