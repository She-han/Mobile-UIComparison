Feature: Safe Cash Management - Safe Close Session

  @PT-651 @AUTOMATED @POS @MVP @ManualVerification @SafeCashManagement @POSValidatedTest @POSSet1
  Scenario: Cash Management - Safe Close Session
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Safe Cash Management" button and "Selection State" page shown
    And user presses "Safe Cash Management Screen More Button" icon button
    When user presses "Safe Cash Management Screen Close Button" icon button
    And "Close Terminal" page is shown
    And user presses "OK" button and "Selection State" page shown
    Then receipt display with following details
      | text | Safe Close Session    |
      | text | Safe ${Safe ID}       |
      | text | ${Manager 2 Username} |
    And user presses "Safe Cash Management Screen Back Button" icon button
    And user presses "Safe Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
