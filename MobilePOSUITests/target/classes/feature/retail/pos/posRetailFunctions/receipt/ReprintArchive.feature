Feature: Reprint Archive

  @PT-12134 @PreSales @AUTOMATED @POS
  Scenario: Reprint Archive
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    Then "Transaction Basket" page is shown
    And user presses "Receipts" button and "Transaction Basket" page shown
    And user presses "Reprint Archive" button and "Enter Original Transaction ID" page shown
    And user presses "Search" button and "Enter Original Transaction Details" page shown
    And user presses "Search" button and "Select Transaction Details" page shown
	And user waits "2" seconds
    And user presses "Select" button and "Confirm Print Transaction" page shown
    And user presses "Print" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
