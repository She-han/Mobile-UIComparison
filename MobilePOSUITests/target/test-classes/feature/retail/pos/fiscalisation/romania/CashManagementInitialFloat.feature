Feature: Cash Management - Initial Float

  @PT-963 @RomaniaFiscalInitialFloat @No_Printer @AUTOMATED @Romania @Fiscalisation @FiscalRomania
  Scenario: Verify the Fiscal Receipt for Cash Management Initial Float on Romania Fiscal Printer
    Given user signs on as "Romania Fiscal Supervisor"
    When user presses "Management" button
    When user presses "Admin" button and "Administration Screen" page shown
    And user presses "Daily Operation" icon button
    And user presses "Day Start" icon button
    And "Confirm Run Screen" page is shown
    When user presses "OK" button and "Cash Management Select Tender Reason" page shown
    And user selects "Cash RO" from "Selection List" list
    And user enters "100.00" into "Input Box" field
    When user presses "OK" button
    And user presses "Complete" button
    Then "Await Drawer Closed" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Day Start Acknowledge Prompt" page is shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    And "Enter User" page is shown
