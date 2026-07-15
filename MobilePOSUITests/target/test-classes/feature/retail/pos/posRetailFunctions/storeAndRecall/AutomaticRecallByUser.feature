Feature: Automatic Recall Transaction by User

  @PT-386 @Dune @JYSK @MVP @POS @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Store transaction by User and Automatic Recall
    Given user signs on as "Manager 2"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    Then user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Store by User" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    When user signs on as "Manager 2"
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 1 Price}" is displayed in "Receipt" list
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | *** TRANSACTION VOID ***                              |
      | text      | Manager signature                                     |
      | text      | £0.00                                                 |
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-387 @Dune @JYSK @MVP @RI @POS @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Automatically Recall transaction when there are multiple stored transactions by user
    Given user signs on as "Manager 2"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    Then user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Store by User" button and "Transaction Basket" page shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    Then user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Store by User" button and "Store By User Already Exists" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    When user enters "${Manager 2 Username}" into "User Name Text" field
    And user enters "${Manager 2 Password}" into "Password Text" field
    And user presses "ENT" button
    Then "Automatic Recall Transaction By User" page is shown
    # select transaction with product 1
    When user selects "£18.00" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 1 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | item      | ${Product 1 Description},${Product 1 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    When user signs on as "Manager 2"
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "${Product 2 Price}" is displayed in "Receipt" list
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | text      | *** TRANSACTION VOID ***                              |
      | text      | Manager signature                                     |
      | text      | £0.00                                                 |
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
