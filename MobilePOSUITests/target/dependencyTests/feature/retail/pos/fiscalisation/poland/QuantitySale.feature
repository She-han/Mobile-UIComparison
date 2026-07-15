Feature: Quantity Sale

  @PT-605 @Fiscalisation @Poland @FiscalPolandQuantitySale @No_Printer @AUTOMATED
  Scenario: Quantity Sale
    Given user signs on as "Poland Fiscal Sales Assistant"
    When user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter Qty" page is shown
    And user enters "3" into "Input Box" field
    And user presses "OK" button
    And "Enter Item" page is shown
    And user enters "${Product Fiscal Pl 1}" into "Input Box" field
    And user presses "Sell Item" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
