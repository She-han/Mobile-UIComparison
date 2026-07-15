Feature: No Sale Function

  @PT-956 @RomaniaFiscalNoSale @No_Printer @AUTOMATED @Romania @Fiscalisation @FiscalRomania
  Scenario: Do No Sale Transaction on Romania Fiscal POS
    Given user signs on as "Romania Fiscal Supervisor"
    And user presses "Management" button
    When user presses "No Sale" button and "Select Reason" page shown
    And user selects "Add vouchers to drawer" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
