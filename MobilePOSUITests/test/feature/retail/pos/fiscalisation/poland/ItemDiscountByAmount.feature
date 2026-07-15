Feature: Item Discount By Amount

  @PT-627 @Fiscalisation @Poland @FiscalPolandItemDiscountByAmount @No_Printer @AUTOMATED
  Scenario: Item Discount By Amount
    Given user signs on as "Poland Fiscal Sales Assistant"
    And user enters "${Product Fiscal Pl 1}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${Product Fiscal Pl 2}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Manager Item Discount (Amount)" from "Selection List" list
    And user presses "OK" button
    Then "Enter Item Discount Amount" page is shown
    And user enters "4,00" into "Input Box" field
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "Manager Item Discount (Amount)" is displayed in "Receipt" list
    And "-4,00 PLN" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
