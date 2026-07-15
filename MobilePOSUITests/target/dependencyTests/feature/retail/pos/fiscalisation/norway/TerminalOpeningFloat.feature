Feature: Cash Management Opening Float

  @PT-862 @FiscalNorwayTerminalOpeningFloat @No_Printer @AUTOMATED @Fiscalisation @FiscalNorway @Norway
  Scenario: Verify the Fiscal Receipt for Initial Float after a Day Start 
    Given user signs on as "Norway Fiscal Sales Assistant"
    When user presses "Management" button
    And user presses "Admin" button
    Then "Administration Screen" page is shown
    When user presses "Daily Operation" icon button
    And user presses "Day Start" icon button
    And "Confirm Run Screen" page is shown
    And user presses "OK" button
    Then "Cash Management Select Tender Reason" page is shown
    And user selects "Cash NO" from "Selection List" list
    When user enters "100,50" into "Input Box" field
    And user presses "OK" button
    And user presses "Complete" button
    And user presses "Close" button on external "Cash Drawer" window
    Then "Day Start Acknowledge Prompt" page is shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
