Feature: Take Now

  @PT-4485 @TakeNow @POS @AUTOMATED @ReactPos
  Scenario: Cancel the dispatch by selecting Take Now as the Delivery Method
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    When user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Dispatch Functions" button
    And user presses "Dispatch" button and "Enter Reference" page shown
    And user presses "OK" button and "Capture Customer Name" page shown
    And user enters "${Customer 1 Name}" into "Customer Forename Text" field
    And user presses "Search By Name" button and "Select Customer" page shown
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Dispatch Address Confirmation" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Item For Dispatch" page shown
    And user presses "Take Now" button
    And user presses "Complete" button and "Confirm Cancel" page shown
    And user presses "Continue" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
