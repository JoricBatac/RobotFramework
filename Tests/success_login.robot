*** Settings ***

Documentation   A test for a successful login
...
...             Test cases for exercise
...
Library         SeleniumLibrary

*** Test Cases ***
Successful user log in
    Open Browser  https://saucedemo.com/    chrome
    Maximize Browser Window
    Page Should Contain Element    login-button
    Input Text    user-name    standard_user
    Input Password    password    secret_sauce
    Click Button    login-button
    Element Text Should Be  class:title     PRODUCTS
    [Teardown]  Close Browser

Locked out user
    Open Browser  https://saucedemo.com/    chrome
    Maximize Browser Window
    Page Should Contain Element    login-button
    Input Text    user-name    locked_out_user
    Input Password    password    secret_sauce
    Click Button    login-button
    Element Text Should Be      css:*[data-test="error"]    Epic sadface: Sorry, this user has been locked out.
    [Teardown]  Close Browser

Wrong Password
    Open Browser  https://saucedemo.com/    chrome
    Maximize Browser Window
    Page Should Contain Element    login-button
    Input Text    user-name    locked_out_user
    Input Password    password    where_is_the_sauce
    Click Button    login-button
    Element Text Should Be      css:*[data-test="error"]    Epic sadface: Username and password do not match any user in this service
    [Teardown]  Close Browser
