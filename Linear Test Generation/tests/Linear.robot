*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite


*** Test Cases ***
Entering A Lead
    [tags]                    Lead    testgen    linear    numtests=3    Linear Generation
    Appstate                  Home
    LaunchApp                 Sales

    ClickText                 Leads
    VerifyText                Change Owner
    ClickText                 New
    VerifyText                Lead Information
    UseModal                  On                          # Only find fields from open modal dialog

    Picklist                  Salutation                  [Ms.,Mrs.,Mr.]
    TypeText                  First Name                  [Tina, Jessica, John]
    TypeText                  Last Name                   [Smith, Thomas, Theodore]
    Picklist                  Lead Status                 New
    TypeText                  Phone                       +12234567858449             First Name
    TypeText                  Company                     Growmore                    Last Name
    TypeText                  Title                       Manager                     Address Information
    TypeText                  Email                       VALID_EMAIL_ADDRESS         Rating
    TypeText                  Website                     https://www.growmore.com/

    Picklist                  Lead Source                 Partner
    ClickText                 Save                        partial_match=False
    UseModal                  Off
    Sleep                     1
    
    ClickText                 Details
    VerifyField               Name                        [Ms. Tina Smith, Mrs. Jessica Thomas, Mr. John Theodore]
    VerifyField               Lead Status                 New
    VerifyField               Phone                       +12234567858449
    VerifyField               Company                     Growmore
    VerifyField               Website                     https://www.growmore.com/

    # as an example, let's check Phone number format. Should be "+" and 14 numbers
    ${phone_num}=             GetFieldValue               Phone
    Should Match Regexp	      ${phone_num}	              ^[+]\\d{14}$
    
    ClickText                 Leads
    VerifyText                [Tina Smith, Jessica Thomas, John Theodore]
    VerifyText                Manager
    VerifyText                Growmore

Delete Tina Smith's Lead
    [tags]                    Lead    testgen    numtests=3    Linear Generation
    LaunchApp                 Sales
    ClickText                 Leads
    Sleep                     1

    ClickText                    [Tina Smith, Jessica Thomas, John Theodore]    timeout=3
    ClickText                    Show more actions
    ClickText                    Delete
    ClickText                    Delete
    ClickText                    Close
    VerifyNoText                 [Tina Smith, Jessica Thomas, John Theodore]