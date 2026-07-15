Feature: Terminal Cash Float

  @PT-1007 @Fiscalisation @Bosnia @FiscalBosniaTerminalFloat @No_Printer @AUTOMATED
  Scenario: Terminal Cash Float in a Bosnia Fiscal POS
    Given user signs on as "Bosnia Fiscal Sales Assistant"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button
    And "Terminal Cash Management" page is shown
    When user presses "Float" button
    And "Cash Management Select Tender Reason" page is shown
    And user enters "100.50" into "Input Box" field
    And user presses "OK" button
    And user presses "Complete" button
    And "Await Drawer Closed" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    And user presses "Back" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
