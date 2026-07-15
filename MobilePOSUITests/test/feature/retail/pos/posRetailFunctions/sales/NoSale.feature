Feature: No Sale
  To test the No Sale functionality.

  @PT-521 @NoSale @Dune @ReactPOS @Regression @POS @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Perform a No Sale operation
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "No Sale" button
    Then "Select Reason" page is shown
    When user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | No Sale                                               |
      | text      | Incorrect change given                                |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
   
  @PT-20440 @NoSale
  Scenario: Verify cash drawer is opening for No Sale operation
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "No Sale" button
    And "Select Reason" page is shown
    When user selects "Incorrect change given" from "Selection List" list
    Then user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | No Sale                                               |
      | text      | Incorrect change given                                |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown