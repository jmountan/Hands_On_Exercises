*** Settings ***
Resource                      ../resources/common.robot
Library                       String
Library                       DateTime
Suite Setup                   Setup Browser
Suite Teardown                End suite


*** Test Cases ***
Entering A Lead
    [tags]                    Lead                        Leveraging Variables
    Appstate                  Home
    LaunchApp                 Sales

    ClickText                 Leads
    Sleep                     1s
    ClickText                 New                        anchor=Import
    VerifyText                Lead Information
    UseModal                  On                          # Only find fields from open modal dialog

    Picklist                  Salutation                  Ms.
    TypeText                  First Name                  Tina
    TypeText                  Last Name                   Smith
    Picklist                  Lead Status                 New
    TypeText                  Phone                       +12234567858449             First Name
    TypeText                  Company                     Growmore                    Last Name
    TypeText                  Title                       Manager                     Address Information
    TypeText                  Email                       tina.smith@gmail.com        Rating
    TypeText                  Website                     https://www.growmore.com/

    Picklist                  Lead Source                 Partner
    ClickText                 Save                        partial_match=False
    UseModal                  Off
    Sleep                     2
    
    ClickText                 Details                    anchor=Chatter
    VerifyText               Ms. Tina Smith
    VerifyText               Manager                     anchor=Title
    VerifyField               Phone                       +12234567858449
    VerifyField               Company                     Growmore
    VerifyField               Website                     https://www.growmore.com/

    # as an example, let's check Phone number format. Should be "+" and 14 numbers
    ${phone_num}=             GetFieldValue               Phone
    Should Match Regexp	      ${phone_num}	              ^[+]\\d{14}$
    
    ClickText                 Leads
    VerifyText                Tina Smith
    VerifyText                Manager
    VerifyText                Growmore

Delete Tina Smith's Lead
    [tags]                    Lead                        Leveraging Variables
    LaunchApp                 Sales
    ClickText                 Leads
    Sleep                     2 sec
    
    Wait Until Keyword Succeeds   1 min   5 sec   ClickText    Tina Smith
    ClickText                    Show more actions
    ClickText                    Delete
    ClickText                    Delete
    ClickText                    Close
    VerifyNoText                 Tina Smith

Create Account Growmore
    [Tags]                        Account                Leveraging Variables
    LaunchApp                     Sales
    ClickText                     Accounts
    ClickText                     New
    UseModal                      On

    #Create a unique name for the account
    ${currentTimestamp}=          Get Current Date
    ${genericName}=               Convert To String      Growmore
    ${uniqueAccountName}=         Catenate               ${currentTimestamp}    ${genericName}

    Sleep                         1 sec
    Wait Until Keyword Succeeds   1 min   5 sec   TypeText   Account Name    ${uniqueAccountName}
    PickList                      Type            Competitor
    ClickText                     Website
    TypeText                      Website         www.growmore.org
    ClickText                     Phone
    TypeText                      Phone           1234567890
    PickList                      Industry        Banking
    ClickText                     Employees
    TypeText                      Employees       100
    ClickText                     Save            partial_match=false
    UseModal                      Off

    ClickText                 Details                    anchor=Related
    VerifyText               ${uniqueAccountName}
    VerifyText               ${uniqueAccountName}                    anchor=Account Name
    VerifyField               Phone                       (123) 456-7890
    VerifyField               Employees                   100
    VerifyField               Website                     www.growmore.org
    VerifyField               Industry                    Banking