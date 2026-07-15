
Feature: Cancel from Search Quote screen

  @PT-2019 @CancelFromSearchQuote @Quote @POS @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Cancel from Search Quote screen
    Given user signs on as "Pos Operator"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Quotes" button
    And user presses "Search Quotes" button and "Search Quote" page shown
    And user presses "Cancel" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
