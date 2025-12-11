*** Settings ***
Library           SeleniumLibrary
Resource          keywords.robot

*** Test Cases ***
Null bid
    Open auction
    Choose role as user
    Login as user
    Null bid
    [Teardown]    Close Browser

Input non numeric bid
    Open auction
    Choose role as user
    Login as user
    Non numeric bid
    [Teardown]    Close Browser    

Underprice bid
    Open auction
    Choose role as user
    Login as user
    Underprice bid
    [Teardown]    Close Browser

Normal bid
    Open auction
    Choose role as user
    Login as user
    Normal bid
    [Teardown]    Close Browser

Underhighest bid
    Open auction
    Choose role as user
    Login as user
    Under highest bid
    [Teardown]    Close Browser

Buyout bid
    Open auction
    Choose role as user
    Login as user    
    Buyout bid
    [Teardown]    Close Browser
