Feature: Sale with one item and Tender by cash

  @PT_906 @RomaniaFiscalSaleByCash @No_Printer @AUTOMATED @Romania @Fiscalisation @FiscalRomania
  Scenario: Single item sale - Cash Tender
    Given user signs on as "Romania Fiscal Sales Assistant"
    And user enters "${Product Fiscal RO 1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
