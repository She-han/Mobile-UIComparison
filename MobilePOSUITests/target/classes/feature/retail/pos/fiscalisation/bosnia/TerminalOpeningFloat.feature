Feature: Terminal Opening/Initial Float

  @PT-1006 @Fiscalisation @Bosnia @FiscalBosniaTerminalOpeningFloat @No_Printer @AUTOMATED
  Scenario: Terminal Opning Cash Float in a Bosnia Fiscal POS
    Given user signs on as "Bosnia Fiscal Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Daily Operation" icon button
    And user presses "Day Start" icon button
    And "Confirm Run Screen" page is shown
    When user presses "OK" button and "Cash Management Select Tender Reason" page shown
    And user selects "Cash BA" from "Selection List" list
    And user enters "100.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Complete" button
    And "Await Drawer Closed" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Day Start Acknowledge Prompt" page is shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
