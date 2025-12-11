*** Settings ***
Library           SeleniumLibrary
Resource          keywords.robot

*** Test Cases ***
Login user
    Open auction
    Choose role as user
    Login as user
    [Teardown]    Close Browser

Login with wrong user credentials
    Open auction
    Choose role as user
    Wrong user credentials
    [Teardown]    Close Browser

Login with wrong admin credentials
    Open auction
    Choose role as admin
    Wrong admin credentials
    [Teardown]    Close Browser

Login admin
    Open auction
    Choose role as admin
    Login as admin
    [Teardown]    Close Browser

Register new user
    Open auction
    Choose role as user
    New user
    [Teardown]    Close Browser

Logout user
    Open auction
    Choose role as user
    Login as user
    Logout
    [Teardown]    Close Browser

Logout admin
    Open auction
    Choose role as admin
    Login as admin
    Logout
    [Teardown]    Close Browser
