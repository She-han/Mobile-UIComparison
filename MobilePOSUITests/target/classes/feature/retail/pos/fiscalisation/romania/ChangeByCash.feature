Feature: Give Change amount by Cash

  @PT-962 @RomaniaFiscalChangeByCash @No_Printer @AUTOMATED @Romania @Fiscalisation @FiscalRomania
  Scenario: Give Change amount by Cash and Complete the Transaction
    Given user signs on as "Romania Fiscal Sales Assistant"
    And user enters "${Product Fiscal RO 6}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user enters "510.00" into "Input Box" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "Change (Cash RO)" is displayed in "Receipt" list
    And "RON10.00" is displayed in "Receipt List" list
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
