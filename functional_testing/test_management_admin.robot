*** Settings ***
Library           SeleniumLibrary
Resource          keywords.robot

*** Test Cases ***
Admin cancels auction ending
    Open auction
    Choose role as admin
    Login as admin
    Cancel end auction
    [Teardown]    Close Browser

Admin confirms auction ending
    Open auction
    Choose role as admin
    Login as admin
    Confirm end auction
    [Teardown]    Close Browser    


Admin accepts auctioned item
    Open auction
    Choose role as admin
    Login as admin
    Accept auctioned item
    [Teardown]    Close Browser

Admin rejects auctioned item
    Open auction
    Choose role as admin
    Login as admin
    Reject auctioned item
    [Teardown]    Close Browser

Admin blacklists user
    Open auction
    Choose role as admin
    Login as admin
    Confirm blacklist
    [Teardown]    Close Browser

Admin cancels user blacklist
    Open auction
    Choose role as admin
    Login as admin
    Cancel blacklist
    [Teardown]    Close Browser






