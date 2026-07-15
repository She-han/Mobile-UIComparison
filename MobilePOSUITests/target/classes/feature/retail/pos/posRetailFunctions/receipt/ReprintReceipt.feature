Feature: Reprint Recent

  @PT-805 @PreSales @AUTOMATED @POS
  Scenario: Reprint Return Receipts
    Given template "POS_TEMPLATE_WITH_RECEIPT_LOCALE" is set for the current POS terminal
    When user signs on as "Sales Assistant"
    Then user presses "Returns" button
    And "Transaction Basket" page is shown
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Returned Unwanted" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Select Receipt Locale" page shown
    And user selects "English (UK)" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "Sales" button
    And "Transaction Basket" page is shown
    And user presses "Receipts" button and "Transaction Basket" page shown
    And user presses "Reprint Recent" button and "Reprint Recent  Select Transaction" page shown
    And user presses "OK" button and "Confirm Print Transaction" page shown
    And user presses "Print" button and "Select Receipt Locale" page shown
    And user selects "English (UK)" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-803 @AUTOMATED @Dune @Dunelm @ReprintReceipt @POS @ReactPOS @POSValidatedTest @POSSet3
  Scenario: Perform a sale transaction and reprint the recent transaction receipt
    Given user signs on as "Sales Assistant"
    Then user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    Then user enters "${Product 4}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    Then "Transaction Basket" page is shown
    And user presses "Sales" button and "Transaction Basket" page shown
    And user presses "Receipts" button and "Transaction Basket" page shown
    When user presses "Reprint Recent" button and "Reprint Recent  Select Transaction" page shown
    And user presses "OK" button and "Confirm Print Transaction" page shown
    When "${Product 4 Price}" is displayed in "Receipt" list
    Then "${Product 4 Description}" is displayed in "Receipt" list
    And user presses "Print" button and "Transaction Basket" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | DUPLICATE                                             |
      | item      | ${Product 4 Description},${Product 4 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-933 @Dunelm @POS @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Reprint Receipt with Voucher
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Gift Voucher" button and "Select Voucher Type" page shown
    When user selects "Gift Voucher Test UK" from "Selection List" list
    And user presses "OK" button and "Select Voucher Sub Type" page shown
    And user selects "£10" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "Gift Voucher Test UK" is displayed in "Receipt" list
    When user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Gift Voucher Test UK                                  |
      | item      | Cash UK ,-£10.00                                      |
      | item      | Issue Date :,#{today}                                 |
      | text      | Serial No. :                                          |
      | text      | Value :                                               |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "Clear" button on external "Primary Printer" window
    Then "Transaction Basket" page is shown
    And user presses "Sales" button
    And user presses "Receipts" button
    When user presses "Reprint Recent" button and "Reprint Recent  Select Transaction" page shown
    And user presses "OK" button and "Confirm Print Transaction" page shown
    And "Gift Voucher Test UK" is displayed in "Receipt" list
    And "£10" is displayed in "Receipt" list
    And user presses "Print" button and "Transaction Basket" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | DUPLICATE                                             |
      | text      | Gift Voucher Test UK                                  |
      | item      | Cash UK ,-£10.00                                      |
    Then following details are not displayed on the receipt
      | item | Issue Date :,#{today} |
      | text | Serial No. :          |
      | text | Value :               |
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-5205 @Dunlem_Specific @AUTOMATED
  Scenario: Verify reprint Receipt after a Promotion Sale that Triggers a Promo Voucher
    Given user signs on as "Sales Assistant"
    Then user enters "${Product 12}" into "Input Box" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button
    Then "Select Tender" page is shown
    And user presses "Cash" button
    Then "Enter Cash Tender Amount" page is shown
    And user presses "OK" button
    Then "Select Voucher Sub Type" page is shown
    And user presses "OK" button
    Then "Await Drawer Closed" page is shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | item | ${Product 12 Description},${Product 12 Price} |
      | text | Gift Voucher UK                               |
      | text | Serial No. :                                  |
      | text | Value :                                       |
      | text | £5.00                                         |
    And user presses "Clear" button on external "Primary Printer" window
    And user presses "Sales" button and "Transaction Basket" page shown
    And user presses "Receipts" button and "Transaction Basket" page shown
    When user presses "Reprint Recent" button and "Reprint Recent Select Transaction" page shown
    And user presses "OK" button and "Confirm Print Transaction" page shown
    And "${Product 12 Description}" is displayed in "Receipt" list
    And user presses "Print" button and "Transaction Basket" page shown
    And receipt display with following details
      | text | Sale                                          |
      | text | DUPLICATE                                     |
      | item | ${Product 12 Description},${Product 12 Price} |
      | text | Gift Voucher UK                               |
      | text | Free Voucher Promo                            |
    Then following details are not displayed on the receipt
      | text | Serial No. : |
      | text | Value :      |
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-804 @AUTOMATED @POS @NotForWeeklyRegression
  Scenario: Perform a sale transaction with a tax configured product and reprint the recent Tax Receipt
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "Receipts" button
    And user presses "VAT Receipt" button and "Tax Printed Message" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    Then user presses "OK" button and "Transaction Basket" page shown
    When user presses "Close" button on external "Cash Drawer" window
    And user presses "Clear" button on external "Primary Printer" window
    And user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Reprint Recent" button and "Reprint Recent Select Transaction" page shown
    And user presses "OK" button and "Confirm Print Transaction" page shown
    And user presses "Print Tax Receipt" button and "Transaction Basket" page shown
    And receipt display with following details
      | text | Sale                                        |
      | text | DUPLICATE                                   |
      | item | ${Product 1 Description},${Product 1 Price} |
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-806 @PreSales @AUTOMATED @POS
  Scenario: Reprint Gift  Receipts
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Request Gift Receipt" button
    And "Gift Receipt Requested" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Request Gift Receipt Total" page shown
    When user presses "Individual Receipts" button and "Select Tender" page shown
    And "Gift" is displayed in "Receipt" list
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | item      | ${Product 1 Description},${Product 1 Price}           |
    And receipt display with following details
      | text | Gift Receipt                  |
      | item | ${Product 1 Description},BAQK |
    And receipt display with following details
      | item | ${Product 2 Description},OUZ |
    And receipt display with following details
      | item | ${Product 3 Description},HKR |
    And user presses "Clear" button on external "Primary Printer" window
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Reprint Recent" button and "Reprint Recent Select Transaction" page shown
    And user presses "OK" button and "Confirm Print Transaction" page shown
    And user presses "Print Gift Receipt" button and "Request Gift Receipt Total" page shown
    And user presses "Individual Receipts" button and "Transaction Basket" page shown
    And receipt display with following details
      | text | Gift Receipt                  |
      | item | ${Product 1 Description},BAQK |
    When user presses "SignOff" button
    Then "Enter User" page is shown
