Feature: Tax Exempt Transactions

  @PT-513 @TransactionTaxExemptWithCaptureCustomer @POS @AUTOMATED @Jockey @TaxExempt @POSValidatedTest @POSSet3 @NotForRC1
  Scenario: Exempt Tax from Transaction - With Captured Customer details
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 1 Promotion}" is displayed in "Receipt" list
    And "Total Tax" is displayed in "Receipt" list
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 1 Description}" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Transaction Tax Exempt" button and "Select Reason" page shown
    And user selects "${Reason Tax Exempt 6 Description}" from "Selection List" list
    And user presses "OK" button
    Then "Capture Customer Name" page is shown
    When user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 1 Forename First Letter}" into "Input Box" field
    And user presses "OK" button
    Then "Select Customer" page is shown
    When user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Enter Transaction Tax Exempt Id" page shown
    And user enters "${Transaction Tax Exempt Id 1}" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Tax Exempt" is displayed in "Receipt" list
    And "${Reason Tax Exempt 6 Description}" is displayed in "Receipt" list
    Then user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Customer: ${Customer 1 Name Without Title}            |
      | item      | ${Product 1 Description}, ${Product 1 Price}          |
      | text      | ${Product 1 Promotion}                                |
      | text      | Tax Breakdown                                         |
      | text      | Tax Exempt ID : ${Transaction Tax Exempt Id 1}        |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-514 @TransactionTaxExemptWithoutCaptureCustomer @POS @AUTOMATED @Jockey @TaxExempt @POSValidatedTest @POSSet3
  Scenario: Exempt Tax from Transaction - Without Captured Customer details
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 1 Promotion}" is displayed in "Receipt" list
    And "Total Tax" is displayed in "Receipt" list
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 1 Description}" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Transaction Tax Exempt" button and "Select Reason" page shown
    And user selects "${Reason Tax Exempt 7 Description}" from "Selection List" list
    And user presses "OK" button and "Enter Transaction Tax Exempt Id" page shown
    And user enters "${Transaction Tax Exempt Id 1}" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Tax Exempt" is displayed in "Receipt" list
    And "${Reason Tax Exempt 7 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description}, ${Product 1 Price}          |
      | text      | ${Product 1 Promotion}                                |
      | text      | Tax Breakdown                                         |
      | text      | Tax Exempt ID : ${Transaction Tax Exempt Id 1}        |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-515 @ItemTaxExemptWithCaptureCustomer @POS @AUTOMATED @Jockey @TaxExempt @POSValidatedTest @POSSet3 @NotForRC1
  Scenario: Exempt Tax from Item - With Captured Customer details
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 1 Promotion}" is displayed in "Receipt" list
    And "Total Tax" is displayed in "Receipt" list
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    When user presses "Discount / Overrides" button
    And user presses "Item Tax Exempt" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "${Reason Tax Exempt 6 Description}" from "Selection List" list
    And user presses "OK" button
    Then "Capture Customer Name" page is shown
    When user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 1 Forename First Letter}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Enter Tax Exempt Id" page shown
    And user enters "${Transaction Tax Exempt Id 1}" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Tax Exempt" is displayed in "Receipt" list
    And "${Reason Tax Exempt 6 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Customer: ${Customer 1 Name Without Title}            |
      | item      | ${Product 1 Description}, ${Product 1 Price}          |
      | text      | ${Product 1 Promotion}                                |
      | text      | Tax Breakdown                                         |
      | text      | Tax Exempt ID : ${Transaction Tax Exempt Id 1}        |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-516 @ItemTaxExemptWithoutCaptureCustomer @POS @AUTOMATED @Jockey @TaxExempt @POSValidatedTest @POSSet3
  Scenario: Exempt Tax from Item - Without Captured Customer details
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 1 Promotion}" is displayed in "Receipt" list
    And "Total Tax" is displayed in "Receipt" list
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 1 Description}" is displayed in "Receipt" list
    And user presses "Discount / Overrides" button
    And user presses "Item Tax Exempt" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "${Reason Tax Exempt 7 Description}" from "Selection List" list
    And user presses "OK" button and "Enter Tax Exempt Id" page shown
    And user enters "${Transaction Tax Exempt Id 1}" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Tax Exempt" is displayed in "Receipt" list
    And "${Reason Tax Exempt 7 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description}, ${Product 1 Price}          |
      | text      | ${Product 1 Promotion}                                |
      | text      | Tax Breakdown                                         |
      | text      | Tax Exempt ID : ${Transaction Tax Exempt Id 1}        |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-517 @TaxExemptBySelectingItemWithCaptureCustomer @POS @AUTOMATED @Jockey @TaxExempt @POSValidatedTest @POSSet3 @NotForRC1
  Scenario: Exempt Tax by selecting Item - With Captured Customer details
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 1 Description}" is displayed in "Receipt" list
    When user selects "${Product 1 Description}" from "Receipt List" list
    Then "Modify Item" page is shown
    And user presses "Tax Exempt" button and "Select Reason" page shown
    And user selects "${Reason Tax Exempt 6 Description}" from "Selection List" list
    And user presses "OK" button
    Then "Capture Customer Name" page is shown
    When user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 1 Forename First Letter}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Enter Tax Exempt Id" page shown
    And user enters "${Transaction Tax Exempt Id 1}" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Tax Exempt" is displayed in "Receipt" list
    And "${Reason Tax Exempt 6 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Customer: ${Customer 1 Name Without Title}            |
      | item      | ${Product 1 Description}, ${Product 1 Price}          |
      | text      | ${Product 1 Promotion}                                |
      | text      | Tax Breakdown                                         |
      | text      | Tax Exempt ID : ${Transaction Tax Exempt Id 1}        |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1150 @AUTOMATED @TaxExemptTransactionsReceipt1_SingleTaxProduct @TaxExempt @POS @TaxExemptTransactionReceipts @POSValidatedTest @POSSet3
  Scenario: Tax Exempt Transactions for Single Tax Product when Receipt Copy is Set to 1
    Given user signs on as "Sales Assistant"
    When user enters "${Product Tax Exempt Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product Tax Exempt Product 1 Description}" is displayed in "Receipt" list
    And "${Product Tax Exempt Product 1 Price}" is displayed in "Receipt" list
    When user selects "${Product Tax Exempt Product 1 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Tax Exempt" button and "Select Reason" page shown
    When user selects "${Reason Tax Exempt 1 Description}" from "Selection List" list
    When user presses "OK" button
    Then "Enter Tax Exempt Id" page is shown
    Then user enters "${Transaction Tax Exempt Id 2}" into "Input Box" field
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And "${Product Tax Exempt Product 1 Description}" is displayed in "Receipt" list
    And "${Reason Tax Exempt 1 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                             |
      | telephone | Tel: ${Store Phone 1}                                                             |
      | text      | Sale                                                                              |
      | item      | ${Product Tax Exempt Product 1 Description},${Product Tax Exempt Product 1 Price} |
      | text      | Tax Breakdown                                                                     |
      | text      | VAT                                                                               |
      | text      | ${Product Tax Exempt Product 1 Price}                                             |
      | text      | £0.00                                                                             |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1292 @AUTOMATED @TaxExemptTransactionsReceipt1_ProductDisallowTaXExempt @TaxExempt @POS @TaxExemptTransactionReceipts @POSValidatedTest @POSSet3
  Scenario: Tax Exempt Transactions for Product that Disallow Tax Exempt when Receipt Copy is Set to 1
    Given user signs on as "Sales Assistant"
    When user enters "${Product Tax Exempt Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product Tax Exempt Product 2 Description}" is displayed in "Receipt" list
    And "${Product Tax Exempt Product 2 Price}" is displayed in "Receipt" list
    When user selects "${Product Tax Exempt Product 2 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Tax Exempt" button
    Then "Tax Exempted Prohibited" page is shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                             |
      | telephone | Tel: ${Store Phone 1}                                                             |
      | text      | Sale                                                                              |
      | item      | ${Product Tax Exempt Product 2 Description},${Product Tax Exempt Product 2 Price} |
      | text      | Tax Breakdown                                                                     |
      | text      | VAT                                                                               |
      | text      | ${Product Tax Exempt Product 2 Price}                                             |
      | text      | ${Product Tax Exempt Product 2 Tax Price}                                         |
    Then following details are not displayed on the receipt
      | text | Copy 1 |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1293 @AUTOMATED @NoTaxExemptTransactionsReceipt1_ProductDisallowTaxExempt @TaxExempt @POS @TaxExemptTransactionReceipts @POSValidatedTest @POSSet3
  Scenario: Normal Transactions without Tax Exempt for Product that Disallow Tax Exempt when Receipt Copy is Set to 1
    Given user signs on as "Sales Assistant"
    When user enters "${Product Tax Exempt Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product Tax Exempt Product 1 Description}" is displayed in "Receipt" list
    And "${Product Tax Exempt Product 1 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                             |
      | telephone | Tel: ${Store Phone 1}                                                             |
      | text      | Sale                                                                              |
      | item      | ${Product Tax Exempt Product 1 Description},${Product Tax Exempt Product 1 Price} |
      | text      | ${Product Tax Exempt Product 1 Tax Price}                                         |
      | text      | ${Product Tax Exempt Product 1 Price With Tax}                                    |
      | text      | Tax Breakdown                                                                     |
      | text      | VAT                                                                               |
    Then following details are not displayed on the receipt
      | text | Copy 1 |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1294 @AUTOMATED @TaxExemptTransactionsReceipt0_SingleTaxProduct @TaxExempt @POS @TaxExemptTransactionReceipts @POSValidatedTest @POSSet3
  Scenario: Tax Exempt Transactions for Single Tax Product when Receipt Copy is Set to 0
    Given user signs on as "Sales Assistant"
    When user enters "${Product Tax Exempt Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product Tax Exempt Product 1 Description}" is displayed in "Receipt" list
    And "${Product Tax Exempt Product 1 Price}" is displayed in "Receipt" list
    When user selects "${Product Tax Exempt Product 1 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Tax Exempt" button and "Select Reason" page shown
    When user selects "${Reason Tax Exempt 0 Description}" from "Selection List" list
    When user presses "OK" button
    Then "Enter Tax Exempt Id" page is shown
    Then user enters "${Transaction Tax Exempt Id 2}" into "Input Box" field
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And "${Product Tax Exempt Product 1 Description}" is displayed in "Receipt" list
    And "${Reason Tax Exempt 0 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                             |
      | telephone | Tel: ${Store Phone 1}                                                             |
      | text      | Sale                                                                              |
      | item      | ${Product Tax Exempt Product 1 Description},${Product Tax Exempt Product 1 Price} |
      | text      | Tax Breakdown                                                                     |
      | text      | VAT                                                                               |
      | text      | ${Product Tax Exempt Product 1 Price}                                             |
      | text      | £0.00                                                                             |
    Then following details are not displayed on the receipt
      | text | Copy 1 |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1295 @AUTOMATED @TaxExemptEmployeeTransactionsReceipt1_SingleTaxProduct @TaxExempt @POS @TaxExemptTransactionReceipts @POSValidatedTest @POSSet3
  Scenario: Tax Exempt Employee Transactions for Single Tax Product when Receipt Copy is Set to 1
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "${Employee Sale Reason}" from "Selection List" list
    And user presses "OK" button and "Enter Employee" page shown
    And user presses "Name Search" button and "Search Employee Name" page shown
    Then user enters "${Employee 303 Forename}" into "Input Box" field
    When user presses "Search" button
    Then "Confirm Employee" page is shown
    Then "Employee ID" field displays the text "${Employee 303 Id}"
    And "Employee Name" field displays the text "${Employee 303 Name}"
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Employee Transaction" is displayed in "Receipt" list
    And "Employee Number" is displayed in "Receipt" list
    And "${Employee 303 ID}" is displayed in "Receipt" list
    And "${Employee 303 Name}" is displayed in "Receipt" list
    #And "(Employee Sale)" is displayed in "Receipt" list
    When user enters "${Product Tax Exempt Product}" into "Input Box" field
    And user presses "ENT" button
    And "${Product Tax Exempt Product Description}" is displayed in "Receipt" list
    And "${Product Tax Exempt Product Price}" is displayed in "Receipt" list
    When user selects "${Product Tax Exempt Product Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Tax Exempt" button and "Select Reason" page shown
    When user selects "${Reason Tax Exempt 1 Employee Description}" from "Selection List" list
    When user presses "OK" button
    Then "Enter Tax Exempt Id" page is shown
    Then user enters "${Transaction Tax Exempt Id 2}" into "Input Box" field
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And "${Product Tax Exempt Product Description}" is displayed in "Receipt" list
    And "${Reason Tax Exempt 1 Employee Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "EMP Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                             |
      | telephone | Tel: ${Store Phone 1}                                                             |
      | text      | Employee Sale                                                                     |
      | item      | ${Product Tax Exempt Product Description},${Product Tax Exempt Product 1 Price} |
      | text      | Tax Breakdown                                                                     |
      | text      | VAT                                                                               |
      | text      | Copy 1                                                                            |
      | text      | ${Product Tax Exempt Product Price}                                               |
      | text      | £0.00                                                                             |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1298 @AUTOMATED @TaxExemptTransactionsReceipt5_SingleTaxProduct @TaxExempt @POS @TaxExemptTransactionReceipts @POSValidatedTest @POSSet3
  Scenario: Tax Exempt Transactions for Single Tax Product when Receipt Copy is Set to 5
    Given user signs on as "Sales Assistant"
    When user enters "${Product Tax Exempt Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product Tax Exempt Product 1 Description}" is displayed in "Receipt" list
    And "${Product Tax Exempt Product 1 Price}" is displayed in "Receipt" list
    When user selects "${Product Tax Exempt Product 1 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Tax Exempt" button and "Select Reason" page shown
    When user selects "${Reason Tax Exempt 5 Description}" from "Selection List" list
    When user presses "OK" button
    Then "Enter Tax Exempt Id" page is shown
    Then user enters "${Transaction Tax Exempt Id 2}" into "Input Box" field
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And "${Product Tax Exempt Product 1 Description}" is displayed in "Receipt" list
    And "${Reason Tax Exempt 5 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                             |
      | telephone | Tel: ${Store Phone 1}                                                             |
      | text      | Sale                                                                              |
      | item      | ${Product Tax Exempt Product 1 Description},${Product Tax Exempt Product 1 Price} |
      | text      | Tax Breakdown                                                                     |
      | text      | VAT                                                                               |
      | text      | ${Product Tax Exempt Product 1 Price}                                             |
      | text      | £0.00                                                                             |
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                             |
      | telephone | Tel: ${Store Phone 1}                                                             |
      | text      | Sale                                                                              |
      | text      | Copy 1                                                                            |
      | item      | ${Product Tax Exempt Product 1 Description},${Product Tax Exempt Product 1 Price} |
      | text      | Tax Breakdown                                                                     |
      | text      | VAT                                                                               |
      | text      | ${Product Tax Exempt Product 1 Price}                                             |
      | text      | £0.00                                                                             |
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                             |
      | telephone | Tel: ${Store Phone 1}                                                             |
      | text      | Sale                                                                              |
      | text      | Copy 2                                                                            |
      | item      | ${Product Tax Exempt Product 1 Description},${Product Tax Exempt Product 1 Price} |
      | text      | Tax Breakdown                                                                     |
      | text      | VAT                                                                               |
      | text      | ${Product Tax Exempt Product 1 Price}                                             |
      | text      | £0.00                                                                             |
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                             |
      | telephone | Tel: ${Store Phone 1}                                                             |
      | text      | Sale                                                                              |
      | text      | Copy 3                                                                            |
      | item      | ${Product Tax Exempt Product 1 Description},${Product Tax Exempt Product 1 Price} |
      | text      | Tax Breakdown                                                                     |
      | text      | VAT                                                                               |
      | text      | ${Product Tax Exempt Product 1 Price}                                             |                                                                            
      | text      | £0.00                                                                             |
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                             |
      | telephone | Tel: ${Store Phone 1}                                                             |
      | text      | Sale                                                                              |
      | text      | Copy 4                                                                            |
      | item      | ${Product Tax Exempt Product 1 Description},${Product Tax Exempt Product 1 Price} |
      | text      | Tax Breakdown                                                                     |
      | text      | VAT                                                                               |
      | text      | ${Product Tax Exempt Product 1 Price}                                             |                                                                            
      | text      | £0.00                                                                             |
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                             |
      | telephone | Tel: ${Store Phone 1}                                                             |
      | text      | Sale                                                                              |
      | text      | Copy 5                                                                            |
      | item      | ${Product Tax Exempt Product 1 Description},${Product Tax Exempt Product 1 Price} |
      | text      | Tax Breakdown                                                                     |
      | text      | VAT                                                                               |
      | text      | ${Product Tax Exempt Product 1 Price}                                             |
      | text      | £0.00                                                                             |
    Then following details are not displayed on the receipt
      | text | Copy 6 |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1299 @AUTOMATED @TaxExemptTransactionsReceipt1_ProductWithMultipleTaxes @TaxExempt @POS @TaxExemptTransactionReceipts @POSValidatedTest @POSSet3
  Scenario: Tax Exempt Transactions for Product with Multiple Taxes when Receipt Copy is Set to 1
    Given user signs on as "Sales Assistant"
    When user enters "${Product Tax Exempt Product 4}" into "Input Box" field
    And user presses "ENT" button
    And "${Product Tax Exempt Product 4 Description}" is displayed in "Receipt" list
    And "${Product Tax Exempt Product 4 Price}" is displayed in "Receipt" list
    And "${Product Tax Exempt Product 4 Tax Price}" is displayed in "Receipt" list
    When user selects "${Product Tax Exempt Product 4 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Tax Exempt" button and "Select Reason" page shown
    When user selects "${Reason Tax Exempt 1 Description}" from "Selection List" list
    When user presses "OK" button
    Then "Enter Tax Exempt Id" page is shown
    Then user enters "${Transaction Tax Exempt Id 2}" into "Input Box" field
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And "${Product Tax Exempt Product 4 Description}" is displayed in "Receipt" list
    And "${Reason Tax Exempt 1 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                             |
      | telephone | Tel: ${Store Phone 1}                                                             |
      | text      | Sale                                                                              |
      | item      | ${Product Tax Exempt Product 4 Description},${Product Tax Exempt Product 4 Price} |
      | text      | Tax Breakdown                                                                     |
      | text      | VAT                                                                               |
      | text      | ${Product Tax Exempt Product 4 Price}                                             |
      | text      | £0.00                                                                             |
      | text      | Standard VAT                                                                      |
      | text      | ${Product Tax Exempt Product 4 Price}                                             |
      | text      | £0.00                                                                             |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
