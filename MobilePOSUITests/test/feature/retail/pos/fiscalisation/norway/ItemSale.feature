Feature: Sale with one item

  @PT-851 @Fiscalisation @Norway @FiscalNorwaySaleWithOneItem @No_Printer @AUTOMATED
  Scenario: Sale with one item
    Given user signs on as "Norway Fiscal Sales Assistant"
    And user enters "${Product Fiscal No 1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
