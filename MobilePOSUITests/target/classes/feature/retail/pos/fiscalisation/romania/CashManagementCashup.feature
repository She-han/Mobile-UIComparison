Feature: Cash Management - Cashup

  @PT-966 @RomaniaFiscalCashup @No_Printer @AUTOMATED @Romania @Fiscalisation @FiscalRomania
  Scenario: Verify the Fiscal Receipt for Cash Management Cash up on Romania Fiscal Printer
    Given user signs on as "Romania Fiscal Supervisor"
    When user presses "Management" button
    When user presses "Admin" button and "Administration Screen" page shown
    And user presses "Daily Operation" icon button
    And user presses "Day End" icon button
    And "Confirm Day End" page is shown
    When user presses "OK" button and "Cash Management Select Tender Reason" page shown
    And user selects "Cash RO" from "Selection List" list
    And user enters "100.00" into "Input Box" field
    When user presses "OK" button
    And user presses "Complete" button
    Then "Await Drawer Closed" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Confirm Day End Message" page is shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    And "Enter User" page is shown
