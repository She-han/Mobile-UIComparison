Feature: Quantity sale paid with cash

  @PT-980 @Fiscalisation @Bosnia @FiscalBosniaQuantitySale @No_Printer @AUTOMATED
  Scenario: Quantity sale paid with cash
    Given user signs on as "Bosnia Fiscal Sales Assistant"
    And user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter Qty" page is shown
    And user enters "3" into "Input Box" field
    And user presses "OK" button
    And "Enter Item" page is shown
    And user enters "${Product Fiscal Ba 1}" into "Input Box" field
    When user presses "Sell Item" button
    Then "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
