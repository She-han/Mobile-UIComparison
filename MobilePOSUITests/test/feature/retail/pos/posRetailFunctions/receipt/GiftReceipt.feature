Feature: Gift Receipt

  @PT-512 @GiftReceipt @POS @Dune @MVP @Mobile @AUTOMATED @Smoke @ReactPOS
  Scenario: Issue a Gift Receipt - All items on a single gift receipt
    Given user signs on as "Sales Assistant"
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Gift Receipt" button
    Then "Mark Gift Receipt Item" page is shown
    When user presses "Down" button
    And user presses "Select" button
    Then "Gift" is displayed in "Selection List" list
    When user selects "${Product 3 Description}" from "Selection List" list
    And user presses "Un-select" button
    Then "Gift" is not displayed in "Selection List" list
    When user presses "Up" button
    And user presses "Up" button
    When user presses "Select" button
    Then "Gift" is displayed in "Selection List" list
    When user presses "Down" button
    And user presses "Select" button
    Then "Gift" is displayed in "Selection List" list
    When user presses "Complete" button
    Then "Transaction Basket" page is shown
    And "Gift" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | text      | Gift Receipt                                          |
      | item      | 2 - ${Product 2 Description},OUZ                      |
      | item      | 1 - ${Product 1 Description},BAQK                     |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-807 @GiftReceipt @POS @Dune @AUTOMATED @ReactPOS @Regression @POSValidatedTest @POSSet4
  Scenario: Issue a Gift Receipt - All items on separate gift receipts
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
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1811 @GiftReceipt @POS @Dune @AUTOMATED @ReactPOS @Regression @POSValidatedTest @POSSet4
  Scenario: Issue a Gift Receipt - Items granularly assigned to gift receipts
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Request Gift Receipt" button
    And "Gift Receipt Requested" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Request Gift Receipt Total" page shown
    When user presses "Selected Receipts" button and "Mark Gift Receipt Item" page shown
    And user presses "Select" button
    And user presses "Select" button
    And user presses "Complete" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | Cash UK,-£34.00                                       |
    And receipt display with following details
      | text | Gift Receipt                  |
      | item | ${Product 1 Description},BAQK |
    And receipt display with following details
      | text | Gift Receipt                 |
      | item | ${Product 2 Description},OUZ |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-9950 @PreSales @AUTOMATED @POS
  Scenario: Verifying the Request gift receipt
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Request Gift Receipt" button
    And "Gift Receipt Requested" is displayed in "Receipt" list
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Request Gift Receipt Total" page shown
    When user presses "Individual Receipts" button and "Select Tender" page shown
    And "Gift" is displayed in "Receipt" list
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | Cash UK,-£18.00                                       |
    And receipt display with following details
      | text | Gift Receipt                  |
      | item | ${Product 1 Description},BAQK |
    And user presses "Clear" button on external "Primary Printer" window
    And user presses "Close" button on external "Cash Drawer" window
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-13549 @AUTOMATED @POS
  Scenario: Request single gift receipt for quantity Sale transaction
  Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter QTY" page is shown
    And user enters "5" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "A-5" into "Input Box" field
    And user presses "ENT" button and "Select Size" page shown
    And user selects "Medium" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "5 @ £15.00" is displayed in "Receipt" list
    And user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Request Gift Receipt" button
    And "Gift Receipt Requested" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Request Gift Receipt Total" page shown
    When user presses "One Receipt" button and "Select Tender" page shown
    And "Gift" is displayed in "Receipt" list
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Style Size Product 1 Description},5 @,${Style Size Product 1 Price} |
      | item | Cash UK,-£60.00                              |
    And receipt display with following details
      | text | Gift Receipt                  |
      | item | ${Style Size Product 1 Description} |
      | item | Quantity:5 |    
    And user presses "Clear" button on external "Primary Printer" window
    And user presses "Close" button on external "Cash Drawer" window
    When user presses "SignOff" button
    Then "Enter User" page is shown
  