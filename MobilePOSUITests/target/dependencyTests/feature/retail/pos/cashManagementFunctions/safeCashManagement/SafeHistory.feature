Feature: Safe History

  @PT-653 @SafeCashManagement @MVP @Support @AUTOMATED @ManualVerification @POS @POSValidatedTest @POSSet1
  Scenario: Cash Management - Perform a Safe History
    Given user signs on as "Manager 2"
    And user presses "Management" button
    When user presses "Safe Cash Management" button
    And "Safe Cash Management" page is shown
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Safe Cash Management Screen History Button" icon button
    And "Safe Cash Management Select Session" page is shown
    And user selects "Open" from "Selection List" list
    And user presses "OK" button
    And "Safe Cash Management Select Transaction" page is shown
    And "Safe Open" is displayed in "Selection List" list
    And user presses "Back" button
    And "Safe Cash Management Select Session" page is shown
    And user presses "Cancel" button
    Then "Safe Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown