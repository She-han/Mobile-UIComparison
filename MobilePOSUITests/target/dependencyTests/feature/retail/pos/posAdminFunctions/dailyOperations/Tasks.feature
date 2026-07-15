Feature: Tasks in POS

  @PT-17508 @POS @AUTOMATED
  Scenario: Load Task Page
    Given user signs on as "Admin"
    And user presses "Tasks" icon button
    And "Tasks" page is shown
    And user presses "Back" button and "Transaction Basket" page shown
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown