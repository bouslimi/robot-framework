*** Settings ***
Library     SeleniumLibrary
Library     ../librairies/database_lib.py
Library     ../librairies/api_lib.py
Library     ../librairies/drivermanager_lib.py
Resource    generic_variables.robot


*** Keywords ***
SignupTestUser
    [Arguments]    ${request_url}=${base_url}${signup_endpoint}    ${first_name}=${user_first_name}    ${last_name}=${user_last_name}    ${email}=${user_email}    ${password}=${user_password}
    ${response_status} =    UserSignupViaApi
    ...    ${request_url}
    ...    ${first_name}
    ...    ${last_name}
    ...    ${email}
    ...    ${password}
    Log To Console    Response Status: ${response_status}
    IF    ${response_status} == 200
        Log To Console    Test User successfullly created!
    ELSE IF    ${response_status} == 409
        Log To Console    Test User already created!
    ELSE
        Fail    ERROR WHILE CREATING TEST USER (SIGNUP VIA API)!
    END
