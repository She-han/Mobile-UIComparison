Feature: Item Discount (Percentage) on German Fiscal POS

  @PT-2174 @Fiscalisation @Germany @AUTOMATED @ManualVerification
  Scenario: Add an Item Discount (Percentage) and Complete Transaction on German Fiscal POS
    Given user signs on as "Germany Fiscal Sales Assistant"
    When user enters "${Product Fiscal De 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal De 2}" into "Input Box" field
    And user presses "ENT" button
    Then user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "10% Item Discount (%)" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "10% Item Discount (%)" is displayed in "Receipt" list
    And "-€15.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown