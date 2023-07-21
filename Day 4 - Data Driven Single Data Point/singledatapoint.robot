*** Settings ***
Resource                      ../Resources/common.robot
Library                       String
Suite Setup                   Setup Browser
Suite Teardown                End suite

*** Test Cases ***
Entering A Lead
    [tags]                    Lead                        SingleDataPoint
    Appstate                  Home
    LaunchApp                 Sales
    Log Variables             level=WARN

    ClickText                 Leads
    VerifyText                Recently Viewed             timeout=120s
    ClickText                 New
    VerifyText                Lead Information
    UseModal                  On                          # Only find fields from open modal dialog

    TypeText                  First Name                  ${First Name}
    TypeText                  Last Name                   ${Last Name}
    Picklist                  Lead Status                 Working
    TypeText                  Phone                       ${Phone}                    First Name
    TypeText                  Company                     ${Company}                  Last Name
    TypeText                  Website                     ${Website}

    ClickText                 Lead Source
    ClickText                 Advertisement
    ClickText                 Save                        partial_match=False
    UseModal                  Off
    Sleep                     1
    
Delete A Lead
    [tags]                    Lead                        SingleDataPoint
    LaunchApp                 Sales
    ClickText                 Leads
    VerifyText                Recently Viewed             timeout=120s

    ${fullName}=              Catenate                    ${First Name}    ${Last Name}

    ClickText                 ${fullName}
    ClickText                 Delete
    ClickText                 Delete
    VerifyText                Recently Viewed
    VerifyNoText              ${fullName}