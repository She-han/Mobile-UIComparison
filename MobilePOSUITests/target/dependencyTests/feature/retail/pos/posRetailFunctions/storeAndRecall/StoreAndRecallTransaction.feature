Feature: Store/Recall Transaction

  @PT-169 @PreSales @AUTOMATED @Dune @HOF @JYSK @MVP @Mobile @RI @StoreTransactionByReceipt @POS @Smoke @ReactPOS @POSValidatedTest @POSSet3
  Scenario: To test the store transaction by receipt functionality.
    Given user signs on as "POS Operator"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Store by Receipt" button and "Transaction Basket" page shown
    Then receipt display with following details
      | item | ${Product 1 Description},${Product 1 Price} |
      | text | TRANSACTION STORED                          |
    And user presses "Clear" button on external "Primary Printer" window
    When user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Recall by Receipt" button and "Recall Transaction By Transaction Id" page shown
    And user presses "Recall" button and "Select Stored Transaction" page shown
    And user selects "${retrieveTransactionNumber(1)}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Product 1 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | text      | ${retrieveTransaction(1)}                             |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-170 @AUTOMATED @Dune @HOF @JYSK @MVP @Mobile @RI @RecallTransactionByReceipt @POS @Smoke @POSValidatedTest @POSSet3
  Scenario: To test the recall transaction by receipt functionality.
    Given user signs on as "POS Operator"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Store by Receipt" button and "Transaction Basket" page shown
    Then receipt display with following details
      | item | ${Product 1 Description},${Product 1 Price} |
      | text | TRANSACTION STORED                          |
    And user presses "Clear" button on external "Primary Printer" window
    When user presses "Sales" button and "Transaction Basket" page shown
    And user presses "Store / Recall Options" button
    And user presses "Recall by Receipt" button and "Recall Transaction By Transaction Id" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "Recall" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | text      | ${retrieveTransaction(1)}                             |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1153 @AUTOMATED @RecallTransactionByReceiptFromList @POS @POSValidatedTest @POSSet3
  Scenario: To test the recall transaction by receipt from list.
    Given user signs on as "POS Operator"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Store by Receipt" button and "Transaction Basket" page shown
    Then receipt display with following details
      | item | ${Product 1 Description},${Product 1 Price} |
      | text | TRANSACTION STORED                          |
    And user presses "SignOff" button
    And user presses "Clear" button on external "Primary Printer" window
    When user signs on as "POS Operator"
    And user presses "Sales" button and "Transaction Basket" page shown
    And user presses "Store / Recall Options" button
    And user presses "Recall by Receipt" button and "Recall Transaction By Transaction Id" page shown
    And user presses "Recall" button and "Select Stored Transaction" page shown
    And user selects "${retrieveTransactionNumber(1)}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | text      | ${retrieveTransaction(1)}                             |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-5527 @AUTOMATED @POS
  Scenario: To test Store and Recall Transaction By Customer Id
    Given user signs on as "Manager 2"
    And user enters "1" into "Input Box" field
    And user presses "ENT" button
    And user enters "2" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button and "Transaction Basket" page shown
    And user presses "Store / Recall Options" button
    And user presses "Store by Customer" button and "Loyalty Account Enquiry" page shown
    And user enters "${Loyalty Card Number 1}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Account Details" page is shown
    And "Customer Loyalty Details Forname" field displays the text "${Loyalty Card Number 1 Forname}"
    And "Customer Loyalty Details Surname" field displays the text "${Loyalty Card Number 1 Surname}"
    And "Customer Loyalty Details Account Number" field displays the text "${Loyalty Card Number 1 Account Number}"
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    # Recall scenario
    And user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Recall by Customer" button and "Loyalty Account Enquiry" page shown
    And user enters "${Loyalty Card Number 1}" into "Input Box" field
    And user presses "OK" button and "Loyalty Account Details" page shown
    And user presses "OK" button and "Transaction Selection Prompt" page shown
    And user presses "OK" button
    And user waits "5" seconds
    And "Transaction Basket" page is shown
        And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-17745 @AUTOMATED @POS
  Scenario: Store and Recall Transaction by Transaction ID
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button
    And user presses "Store / Recall Options" button
    When user presses "Store by Receipt" button and "Transaction Basket" page shown
    Then receipt display with following details
      | item | ${Product 1 Description},${Product 1 Price} |
      | item | ${Product 2 Description},${Product 2 Price} |
      | item | ${Product 3 Description},${Product 3 Price} |
      | text | TRANSACTION STORED                          |
    And user presses "Clear" button on external "Primary Printer" window
    And "Transaction Basket" page is shown
    # Recall scenario
    And user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Recall by Receipt" button and "Recall Transaction By Transaction Id" page shown
    And user enters "12345" into "Input Box" field
    And user presses "ENT" button and "Invalid Transaction Id Error" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Recall by Receipt" button and "Recall Transaction By Transaction Id" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "${Product 3 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | ${Product 3 Description},${Product 3 Price}           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
   @PT-23344 @Regression @POS @Automated
  Scenario: To test Store and Recall Transaction By Customer Id
    Given user signs on as "Manager 2"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button and "Transaction Basket" page shown
    And user presses "Store / Recall Options" button
    And user presses "Store by Customer" button and "Loyalty Account Enquiry" page shown
    And user enters "${Loyalty Card Number 1}" into "Input Box" field
    When user presses "OK" button
    Then "Loyalty Account Details" page is shown
    And "Customer Loyalty Details Forname" field displays the text "${Loyalty Card Number 1 Forname}"
    And "Customer Loyalty Details Surname" field displays the text "${Loyalty Card Number 1 Surname}"
    And "Customer Loyalty Details Account Number" field displays the text "${Loyalty Card Number 1 Account Number}"
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    # Recall scenario
    And user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Recall by Customer" button and "Loyalty Account Enquiry" page shown
    And user enters "Invalid Loyalty Card Number" into "Input Box" field
    And user presses "ENT" button and "Invalid Loyalty Account" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Recall by Customer" button and "Loyalty Account Enquiry" page shown
    And user enters "${Loyalty Card Number 1}" into "Input Box" field
    And user presses "OK" button and "Loyalty Account Details" page shown
    And user presses "OK" button and "Transaction Selection Prompt" page shown
    And user presses "OK" button
    And user waits "5" seconds
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-19381 @Regression @POS @Automated
  Scenario: Verify that a stored transaction basket can be recalled by its Basket ID
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button and "Transaction Basket" page shown
    And user presses "Store / Recall Options" button
    And user presses "Store by Customer Basket" button and "Loyalty Account Enquiry" page shown
    And user enters "${Loyalty Card Number 1}" into "Input Box" field
    When user presses "OK" button
    Then "Loyalty Account Details" page is shown
    And "Customer Loyalty Details Forname" field displays the text "${Loyalty Card Number 1 Forname}"
    And "Customer Loyalty Details Surname" field displays the text "${Loyalty Card Number 1 Surname}"
    And "Customer Loyalty Details Account Number" field displays the text "${Loyalty Card Number 1 Account Number}"
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    # Recall scenario
    And user presses "Sales" button
    And user presses "Store / Recall Options" button
    And user presses "Recall by Customer Basket" button and "Basket Id Selection Prompt" page shown
    And user presses "View" button and "Display Transaction With MSG Config" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
