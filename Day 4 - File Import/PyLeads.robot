*** Settings ***
Resource            ../Resources/common.robot
Library             String
Suite Setup         Setup Browser
Suite Teardown      End suite

*** Test Cases ***
Entering A Lead
    [tags]          Lead                        FileImport
    FOR             ${LeadEntry}                IN                          @{LeadList}
        Appstate    Home
        LaunchApp                               Sales

        ClickText                               Leads
        VerifyText                              Recently Viewed             timeout=120s
        ClickText                               New
        VerifyText                              Lead Information
        UseModal    On                          # Only find fields from open modal dialog

        TypeText    First Name                  ${LeadEntry}[0]
        TypeText    Last Name                   ${LeadEntry}[1]
        Picklist    Lead Status                 Working
        TypeText    Phone                       ${LeadEntry}[2]             First Name
        TypeText    Company                     ${LeadEntry}[3]             Last Name
        TypeText    Website                     ${LeadEntry}[4]

        ClickText                               Lead Source
        ClickText                               Advertisement
        ClickText                               Save                        partial_match=False
        UseModal    Off
        Sleep       1

        #Delete the lead afterward
        LaunchApp                               Sales
        ClickText                               Leads
        VerifyText                              Recently Viewed             timeout=120s

        ${fullName}=                            Catenate                    ${LeadEntry}[0]    ${LeadEntry}[1]

        ClickText                               ${fullName}
        ClickText                               Delete
        ClickText                               Delete
        VerifyText                              Recently Viewed
    END
