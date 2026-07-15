Feature: Terminal Cash Management History

  @PT-153 @TerminalCashManagement @MVP @Support @AUTOMATED @ManualVerification @POS @POSValidatedTest @POSSet1
  Scenario: Terminal Cash Management - History
    Given user signs on as "Manager 2"
    And user presses "Management" button
    When user presses "Terminal Cash Management" button
    And "Terminal Cash Management" page is shown
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Screen History Button" icon button
    And "Terminal Cash Management Select Session" page is shown
    And user selects "Open" from "Selection List" list
    And user presses "OK" button
    And "Terminal Cash Management Select Transaction" page is shown
    And "Terminal Open" is displayed in "Selection List" list
    And user presses "Back" button
    And "Terminal Cash Management Select Session" page is shown
    And user presses "Cancel" button
    Then "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
