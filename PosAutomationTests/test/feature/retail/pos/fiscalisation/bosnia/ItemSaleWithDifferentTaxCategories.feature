Feature: Item Sale With Different Tax Categories

  @PT-1002 @Fiscalisation @Bosnia @FiscalBosniaItemSaleWithDifferentTaxCategories @No_Printer @AUTOMATED
  Scenario: Item Sale with two products of different tax categories
    Given user signs on as "Bosnia Fiscal Sales Assistant"
    When user enters "${Product Fiscal Ba 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal Ba 4}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal Ba 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
