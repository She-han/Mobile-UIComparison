Feature: Store/Recall Transaction by User

  @PT-166 @AUTOMATED
  Scenario: Store by User
    Given user signs on as "POS Operator"
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    Then user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Store by User" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-168 @PreSales @Airport_Harrods @Dune @HOF @Harrods @Harrods_Sanity @JYSK @MVP @Mobile @Support @RecallByUser @POS @AUTOMATED
  Scenario: Store and Recall a transaction by User
    Given user signs on as "POS Operator"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    Then user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Store by User" button and "Transaction Basket" page shown
    Then user presses "Sales" button
    And user presses "Store / Recall Options" button
    When user presses "Recall by User" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    Then user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

    @PT-7866 @POS @Store/RecallByUser
  Scenario: Store and Recall a transaction by User by logging out and logging in again
    Given user signs on as "POS Operator"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    Then user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Store by User" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And user presses "Clear" button on external "Primary Printer" window
    And "Enter User" page is shown
    And user signs on as "POS Operator"
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown