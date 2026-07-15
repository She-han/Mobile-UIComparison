Feature: Item sale paid with cash

  @PT-988 @Fiscalisation @Bosnia @FiscalBosniaItemSale @No_Printer @AUTOMATED
  Scenario: Item sale paid with cash
    Given user signs on as "Bosnia Fiscal Sales Assistant"
    And user enters "${Product Fiscal Ba 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
