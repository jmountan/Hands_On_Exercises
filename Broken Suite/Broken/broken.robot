# Tip: Everything that starts with # is a guidance for you and will not get executed.

*** Settings ***

Documentation           Test suite for Pace starter.
Library                 QWeb
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers

# Tip: The Settings section is where you define test suite level configuration.
#      Suite Setup and Teardown are actions that happen before and after a test suite run.
#      For first time users, we don't recommend to change them.
#      You may change chrome to firefox should you wish to test your application on Firefox.

*** Test Cases ***

# Tip: Test cases start from here. The structure of a test case is as follows:
#      Name of the test
#          [Documentation]    A short explanation of the test.
#          Test steps
#
#      A new test case starts from the beginning of the line. Each test step starts with four
#      spaces, followed by a QWord, at least four spaces, and its arguments.

Test the home page
    [Documentation]     Go to the web shop, and verify that the slogan text appears on the page.
    GoTo                https://qentinelqi.github.io/shop/
    VerifyText          Find your spirit animal

Check the navigation menu items
    [Documentation]     Go to the shop homepage and verify the menu items.
    GoTo                https://qentinelqi.github.io/shop/
    VerifyText          Products
    VerifyText          Our Story
    VerifyText          Contact

Shop for products
    [Documentation]     Select the "Sacha the Deer" product to add to cart and confirm its in the cart, verify details on the page,
    ...                 add the product to the cart and continue shopping.
    GoTo                https://qentinelqi.github.io/shop/
    ClickText           Sacha the Deer
    VerifyText          Slim Fit, 5oz 100% Cotton T-Shirt.
    GoTo                https://qentinelqi.github.io/shop/
    ClickText           Bumble the Elephant
    ClickText           Add to cart
    VerifyText          Cart summary
    VerifyText          Sacha the Deer
    ClickText           Continue shopping

# Pro Tip: Make sure that when each test case starts, your application is in a well-defined
#          initial state. The test cases above use GoTo with a fixed URL to set the initial
#          application state, but we recommend starting each test case with the dedicated
#          AppState QWord. The test case below starts with AppState Home, where Home is an
#          initial state defined in the Keywords section at the end of the file. More initial
#          states could be defined as needed.

Continue shopping
    [Documentation]     Now add "Gavin the Tiger" to the cart and confirm its in the cart.
    AppState            Home
    ClickText           Gavin the Tiger
    VerifyText          His favorite meal is chickpea salad with a lemon juice dressing.
    VerifyText          $9.00
    ClickText           Add to carts
    ClickText           Continue shopping
    # Check if we've exited the "cart" by looking for text in the footer.
    VerifyText          Fur, Inc.

Check Our Story
    [Documentation]    VerifyText on Ava Sandler and Steph Poco in the /about/ page
    Appstate           Home
    VerifyText         Ava Sandler
    VerifyText         Steph Poco
    VerifyText         Passion
    VerifyText         Animal
    VerifyText         Style

Start payment info
    [Documentation]    Start filling out the payment info. We will only fill out a fake name, email, and address After that the test is done.
    Appstate           Home   
    ClickText          shopping_cart
    ClickText          Checkout
    TypeText           Tina Smith            Full name
    TypeText           Email                 Tina.Smith@growmore.com   
    
    ClickText          I don't see my address    
    TypeText           Street address       416 Growmore Ave.      
    TypeText           City                 DreamCity
    ClickText          Country
    ClickText          Canada
    ClickText          Province/State
    ClickText          Manitoba
    TypeText           Postal/ZIP code      12345

*** Keywords ***

Home
    [Documentation]     Set the application state to the shop home page.
    GoTo                https://qentinelqi.github.io/shop/

# Pro Tip: In this Keywords section, you could combine QWords to make your own keywords using
#          the structure shown above. The pro way is to define them in a separate file and import
#          that file under Settings.