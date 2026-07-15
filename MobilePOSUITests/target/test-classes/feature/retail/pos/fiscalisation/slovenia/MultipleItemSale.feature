Feature: Do a Transaction with Multiple Items Slovenia

  @PT-2804 @SloveniaMultipleItemSale @No_Printer @AUTOMATED @Slovenia @Fiscalisation @FiscalSlovenia
  Scenario: Multiple Item Sale By Cash Tender Slovenia
    Given user signs on as "Slovenia Fiscal Sales Assistant"
    And user enters "${Product Fiscal SI 1}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${Product Fiscal SI 2}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${Product Fiscal SI 3}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
