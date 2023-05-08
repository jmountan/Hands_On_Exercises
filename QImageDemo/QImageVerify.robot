*** Settings ***
Resource                        ../Resources/common.robot
Suite Setup                     Setup Browser
Suite Teardown                  End suite
Library                         FakerLibrary
Library                         QImage

*** Test Cases ***
Verify checked icons
    [Documentation]             We are entering a lead with random data
    [tags]                      QImage
    Appstate                    Home
    LaunchApp                   Sales

    ClickText    Opportunities
    ClickText    Growmore-
    ClickText    Details    partial_match=False

    ${element}=             Capture Icon                    //*[contains(text(),'Budget Confirmed')]

   