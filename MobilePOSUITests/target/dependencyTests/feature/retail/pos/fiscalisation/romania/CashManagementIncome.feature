Feature: Cash Management - Income

  @PT-967 @RomaniaFiscalIncome @No_Printer @AUTOMATED @Romania @Fiscalisation @FiscalRomania
  Scenario: Verify the Fiscal Receipt for Cash Management Income on Romania Fiscal Printer
    Given user signs on as "Romania Fiscal Supervisor"
    When user presses "Management" button
    When user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Income" button and "Cash Management Select Tender Reason" page shown
    And user selects "Cash RO" from "Selection List" list
    And user enters "100.00" into "Input Box" field
    When user presses "OK" button
    And user presses "Complete" button and "Terminal Cash Management Attach Documents" page shown
    And user presses "OK" button
    Then "Await Drawer Closed" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    When user presses "Back" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    And "Enter User" page is shown
