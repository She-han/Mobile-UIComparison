Feature: Transaction Void

  @PT-10726 @AUTOMATED @POS
  Scenario: Validate Item Void, Scan Item and Transaction Void from Store/Recall Transaction
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Store by Receipt" button and "Transaction Basket" page shown
    Then receipt display with following details
      | item | ${Product 1 Description},${Product 1 Price} |
      | item | ${Product 2 Description},${Product 2 Price} |
      | item | ${Product 3 Description},${Product 3 Price} |
      | text | TRANSACTION STORED                          |
    #waits for transaction to appear &proccess in EM
    And user waits "20" seconds
    When user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Recall by Receipt" button and "Recall Transaction By Transaction Id" page shown
    And user presses "Recall" button and "Select Stored Transaction" page shown
    And user selects "${retrieveTransactionNumber(1)}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    When user selects "${Product 1 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Item Void" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "Voids" button
    And user presses "Scan Item Void" button and "Scan Item Void" page shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    Then user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    When user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-177 @PreSales @TransactionVoid @POS @Dune @HOF @Harrods @Harrods_Sanity @MVP @Mobile @RI @Support @AUTOMATED @Smoke @ReactPOS @POSValidatedTest @POSSet3
  Scenario: Attempt to void the transaction.
    Given user signs on as "Manager 2"
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    When user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | *** TRANSACTION VOID ***                              |
      | text      | Manager signature                                     |
      | text      | £0.00                                                 |
    #Commented due to failing script casued by PLAT-16360  
    #And following details are not displayed on the receipt
      #| item | ${Product 2 Description},${Product 2 Price} |
      #| item | ${Product 1 Description},${Product 1 Price} |
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-207 @PreSales @AUTOMATED @ReactPOS @Regression @HOF
  Scenario: POS -  Verify successful Transaction Void after total
    Given user signs on as "Sales Assistant"
    When user enters "${SKU Product 6}" into "Input Box" field
    Then user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | *** TRANSACTION VOID ***                              |
    When user presses "SignOff" button
    Then "Enter User" page is shown
