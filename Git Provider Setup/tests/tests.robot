*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite


*** Test Cases ***
Entering A Lead
    [tags]                    Lead
    Appstate                  Home
    LaunchApp                 Sales

    ClickText                 Leads
    ClickText                 New
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
    Sleep                     1
    
    ClickText                 Details
    VerifyField               Name                        Ms. Tina Smith
    VerifyField               Lead Status                 New
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
    [tags]                    Lead
    LaunchApp                 Sales
    ClickText                 Leads

    ClickText                    Tina Smith    timeout=3
    ClickText                    Show more actions
    ClickText                    Delete
    ClickText                    Delete
    ClickText                    Close
    VerifyNoText                 Tina Smith