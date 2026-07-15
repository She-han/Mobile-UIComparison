Feature: Transaction search

  @PT-8658 @POS @AUTOMATED
  Scenario: Verify Transaction Search functionality on POS with 4 digits branch number
    Given user signs on as "Manager 2"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user presses "Search" button and "Enter Original Transaction Details" page shown
    And user enters "9999" into "Branch Field" field
    And user presses "Search" button
    And "Transaction Not Founded" page is shown
    When user presses "OK" button
    Then "Enter Original Transaction Details" page is shown
    And user presses "Cancel" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-8660 @POS @AUTOMATED
  Scenario: Verify Transaction Search functionality on POS with more than 4 digits branch number
    Given user signs on as "Manager 2"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user presses "Search" button and "Enter Original Transaction Details" page shown
    And user enters "9999999999" into "Branch Field" field
    And user presses "Search" button
    And user presses "Cancel" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-8659 @POS @AUTOMATED
  Scenario: Verify Transaction Search functionality on POS with less than 4 digits branch number
    Given user signs on as "Manager 2"
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user presses "Search" button and "Enter Original Transaction Details" page shown
    And user enters "1" into "Branch Field" field
    And user presses "Search" button
    And "Select Transaction Details" page is shown
    And user presses "Cancel" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
