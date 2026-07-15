Feature: Transaction Discount as a percentage

  @PT-629 @Fiscalisation @Poland @FiscalPolandTransactionDiscountPercent @No_Printer @AUTOMATED
  Scenario: Transaction Discount as a percentage
    Given user signs on as "Poland Fiscal Sales Assistant"
    When user enters "${Product Fiscal Pl 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal Pl 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "20% Transaction Discount" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    Given "Transaction Discount (20% Transaction Discount 20%)" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
