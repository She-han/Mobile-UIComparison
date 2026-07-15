Feature: Cash Management Spot Check

  @PT-617 @Fiscalisation @Poland @FiscalPolandSpotCheck @No_Printer @AUTOMATED
  Scenario: To test that a Spot Check receipt is printed on the fiscal printer as a non fiscal receipt
    Given user signs on as "Poland Fiscal Sales Assistant"
    When user presses "Management" button
    And user presses "Terminal Cash Management" button
    Then "Terminal Cash Management" page is shown
    When user presses "Spot Check" button
    Then "Cash Management Select Tender Reason" page is shown
    When user enters "100.50" into "Input Box" field
    And user presses "OK" button
    And user presses "Complete" button
    Then "Cash Management Session Summary Prompt" page is shown
    When user presses "OK" button
    And user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    When user presses "Back" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
