Feature: Cash Management - Float

  @PT-964 @RomaniaFiscalFloat @No_Printer @AUTOMATED @Romania @Fiscalisation @FiscalRomania
  Scenario: Verify the Fiscal Receipt for Cash Management Float on Romania Fiscal Printer
    Given user signs on as "Romania Fiscal Supervisor"
    When user presses "Management" button
    When user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Float" button and "Cash Management Select Tender Reason" page shown
    And user selects "Cash RO" from "Selection List" list
    And user enters "20000" into "Input Box" field
    When user presses "OK" button
    And user presses "Complete" button
    Then "Await Drawer Closed" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    When user presses "Back" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    And "Enter User" page is shown
