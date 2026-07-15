Feature: Return Unverified Receipt

@PT-15283 @AUTOMATED @POS
  Scenario: Unverified Receipt Return
    Given user signs on as "UNVERIFIED RETURN"
    When user presses "Returns" button and "Transaction Basket" page shown
    Then user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user enters "1234" into "Input Box" field
    And user presses "OK" button and "Enter Return Item" page shown
    When user enters "${Style Colour Size Product}" into "Input Box" field
    And user presses "Return Item" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "No" button and "Enter Return Item" page shown
    And user presses "Finish" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then the receipt displayed on "Primary Printer" printer with following details
      | text | Refund 																			|
      | text | R ${Style Colour Size Product 2 Description} |
      | text | ${Style Colour Size Product 2 Price} 				|
      | text | Refund Cash UK 															|
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
