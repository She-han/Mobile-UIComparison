Feature: Item Discount on German Fiscal POS

  @PT-2173 @Fiscalisation @Germany @AUTOMATED @ManualVerification
  Scenario: Complete transaction with item discounts by Amount on German Fiscal POS
    Given user signs on as "Germany Fiscal Sales Assistant"
    When user enters "${Product Fiscal De 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal De 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Item Discount (Amount)" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "Item Discount (Amount)" is displayed in "Receipt" list
    And "Amount" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    When user presses "SignOff" button
    Then "Enter User" page is shown

