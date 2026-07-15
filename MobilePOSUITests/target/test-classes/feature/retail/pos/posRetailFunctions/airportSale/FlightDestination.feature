Feature: Flight Destination

  @PT-4515 @AirportHub @ReactPos @AUTOMATED
  Scenario: Airport Sale - Confirm Final Destination before performing an airport sale
    Given "Enter User" page is shown
    And user enters "${Airport Operator 1 Username}" into "User Name Text" field
    And user presses "ENT" button
    And user enters "${Airport Operator 1 Password}" into "Password Text" field
    And user presses "ENT" button
    And "Capture Flight Code" page is shown
    And "Airport Transaction" is displayed in "Receipt" list
    # Invalid flight code
    When user enters "FD85" into "Input Box" field
    And user presses "ENT" button and "Capture Airport Code" page shown
    And user enters "${Airport Code 2}" into "Input Box" field
    And user presses "ENT" button and "Confirm Final Destination" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Receipt Destination Selection" page shown
    And user presses "Print Only" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Capture Flight Code" page is shown
    And user presses "Sign Off" button
    And "Enter User" page is shown

  @PT-4519 @AirportHub @ReactPos @AUTOMATED
  Scenario: Confirm Final Destination by accessing the Airport Code screen from the Select Flight screen
    Given "Enter User" page is shown
    And user enters "${Airport Operator 1 Username}" into "User Name Text" field
    And user presses "ENT" button
    And user enters "${Airport Operator 1 Password}" into "Password Text" field
    And user presses "ENT" button
    And "Capture Flight Code" page is shown
    And "Airport Transaction" is displayed in "Receipt" list
    # Partial id of the flight code
    When user enters "ab" into "Input Box" field
    And user presses "ENT" button and "Select Flight" page shown
    And user presses "Airport Code" button and "Capture Airport Code" page shown
    And user enters "${Airport Code 2}" into "Input Box" field
    And user presses "ENT" button and "Confirm Final Destination" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Receipt Destination Selection" page shown
    And user presses "Print Only" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Capture Flight Code" page is shown
    And user presses "Sign Off" button
    And "Enter User" page is shown
