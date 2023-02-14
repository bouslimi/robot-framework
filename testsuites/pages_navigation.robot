*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/generic_keywords.robot


*** Test Cases ***
TBD
    OpenBrowserMaximized

    Set Selenium Speed    0.1s

    Log To Console    Check navigation between pages after login logout

    ${actual_location} =    Get Location
    Log To Console    ${actual_location}
    Go To    ${base_url}#/account
    ${actual_location} =    Get Location
    Log To Console    ${actual_location}
    Go Back
    ${actual_location} =    Get Location
    Log To Console    ${actual_location}

    Close Browser
