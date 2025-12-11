*** Settings ***
Library           SeleniumLibrary
Resource          keywords.robot

*** Test Cases ***
Auction submission
    Open auction
    Choose role as user
    Login as user
    Submit item for auction
    [Teardown]    Close Browser

Submit auction without start price
    Open auction
    Choose role as user
    Login as user
    No start price
    [Teardown]    Close Browser

Submit auction without buyout price
    Open auction
    Choose role as user
    Login as user
    No buyout price
    [Teardown]    Close Browser

Submit auction with non numeric start price
    Open auction
    Choose role as user
    Login as user
    Non numeric start price
    [Teardown]    Close Browser

Submit auction with buyout less than start price
    Open auction
    Choose role as user
    Login as user
    Buyout less than start price
    [Teardown]    Close Browser

Submit auction with negative start price
    Open auction
    Choose role as user
    Login as user
    Minus price
    [Teardown]    Close Browser

Payment
    Open auction
    Choose role as user
    Login as user
    Checkout
    [Teardown]    Close Browser