Feature: View Tasks

  @PT-9292 @AUTOMATED @Regression
  Scenario: Viewing the Tasks using View Tasks button
    Given user signs on as "Sales Assistant"
    And "Transaction Basket" page is shown
    And user presses "Transaction Basket Tasks Button" icon button 
    And "View Tasks Screen" page is shown
    When user presses "Back Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown