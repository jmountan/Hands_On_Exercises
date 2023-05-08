*** Settings ***
Resource                        ../Resources/common.robot
Suite Setup                     Setup Browser
Suite Teardown                  End suite
Library                         FakerLibrary
Library                         QImage

*** Test Cases ***
Verify checked icons
    [Documentation]             We are entering a lead with random data
    [tags]                      Lead                        Salesforce Login    Creation
    Appstate                    Home
    LaunchApp                   Sales

   