*** Settings ***
Resource                      ../Resources/common.robot
Library                       DataDriver    reader_class=TestDataApi    name=Leads.csv    #iterates through the Leads csv
Suite Setup                   Setup Browser
Suite Teardown                End suite
Test Template                 Entering A Lead With Data

*** Test Cases ***
Entering A Lead With Data with ${First Name} ${Last Name} ${Phone} ${Company} ${Website}
    [Tags]                    AllData

*** Keywords ***
Entering A Lead With Data
    [Arguments]               ${First Name1}   ${Last Name1}    ${Phone1}    ${Company1}    ${Website1}
    [tags]                    Lead
    Home
    LaunchApp                 Sales

    ClickText                 Leads
    VerifyText                Recently Viewed             timeout=120s
    ClickText                 New
    VerifyText                Lead Information
    UseModal                  On                          # Only find fields from open modal dialog

    TypeText                  First Name                  ${First Name1}
    TypeText                  Last Name                   ${Last Name1}
    Picklist                  Lead Status                 Working
    TypeText                  Phone                       ${Phone1}                    First Name
    TypeText                  Company                     ${Company1}                  Last Name
    TypeText                  Website                     ${Website1}

    ClickText                 Lead Source
    ClickText                 Advertisement
    ClickText                 Save                        partial_match=False
    UseModal                  Off
    Sleep                     1

    #Delete the lead to clean up data
    LaunchApp                 Sales
    ClickText                 Leads
    VerifyText                Recently Viewed             timeout=120s

    ClickText                 ${first Name1}
    ClickText                 Delete
    ClickText                 Delete
    VerifyText                Recently Viewed
    VerifyNoText              ${First Name1}
    VerifyNoText              ${Last Name1}