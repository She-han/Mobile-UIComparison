Feature: POS - Transfer In

  @PT-11825 @POS @AUTOMATED
  Scenario: Visibility of Up and Down buttons in Transfer In History
    Given user signs on as "Manager 2"
    When user presses "Management" button and "Transaction Basket" page shown
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Receive" icon button
    Then user presses "Transfer In" icon button
    And "Unsubmited Transfer In" page is shown
    And user presses "History" button
    And "Submitted Receipts" page is shown
    Then user presses "Down" button
    And user presses "Up" button
    When user presses "Cancel" button
    Then "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
