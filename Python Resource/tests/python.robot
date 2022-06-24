*** Settings ***
Resource                      ../resources/common.robot
Library                      ../resources/pyLib.py
Suite Setup                   Setup Browser
Suite Teardown                End suite


*** Test Cases ***

Perform Demo With Python
    [Tags]                    Python Exercise
    Print Message             Hello from Python!
    Print Message             Let's explore our ability to leverage Python within CRT
    Print Message             We have a native package for CRT called robot.api.
    Print Message             That's what we are using right now to print to the console!!
    Print Message             What about other Python libraries?
    Print Message             No problem! We simply install those libraries in our pace.before
    Print Message             For this example we will use Numpy
    
Entering A Lead
    [tags]                    Lead                        Python Exercise
    Appstate                  Home
    LaunchApp                 Sales

    ClickText                 Leads
    VerifyText                Recently Viewed             timeout=120s
    ClickText                 New                        anchor=Import
    VerifyText                Lead Information
    UseModal                  On                          # Only find fields from open modal dialog

    Picklist                  Salutation                  Ms.
    TypeText                  First Name                  Tina
    TypeText                  Last Name                   Smith
    Picklist                  Lead Status                 Working
    TypeText                  Phone                       +12234567858449             First Name
    TypeText                  Company                     Growmore                    Last Name
    TypeText                  Title                       Manager                     Address Information
    TypeText                  Email                       tina.smith@gmail.com        Rating
    TypeText                  Website                     https://www.growmore.com/

    ClickText                 Lead Source
    ClickText                 Advertisement
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
    [tags]                    Lead                        Python Exercise
    LaunchApp                 Sales
    ClickText                 Leads
    VerifyText                Recently Viewed             timeout=120s
    
    Wait Until Keyword Succeeds   1 min   5 sec   ClickText    Tina Smith
    ClickText                    Show more actions
    ClickText                    Delete
    ClickText                    Delete
    ClickText                    Close
    VerifyNoText                 Tina Smith