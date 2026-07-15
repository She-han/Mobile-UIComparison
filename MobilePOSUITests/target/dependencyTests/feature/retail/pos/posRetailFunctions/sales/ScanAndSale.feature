Feature: Scan and Sale

  @PT-1765 @ScanAndSale @POS @AUTOMATED @POSValidatedTest @POSSet3 @Regression
  Scenario: Scan and Add Item to Basket and Complete Transaction in Cash tender
    Given user signs on as "Sales Assistant"
    Then "Transaction Basket" page is shown
    And "Scanner" page is shown
    And user enters "${Product 2}" into "Scan Text" field
    When user presses "Test Scanner Scan Button" icon button
    Then "Transaction Basket" page is shown
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
   @PT-203 @Automated @Regression
   Scenario: Sale by scanning a selling code
   	Given user signs on as "Sales Assistant"
    Then "Transaction Basket" page is shown
    And "Scanner" page is shown
    And user enters "${SKU Product 11 Selling Code}" into "Scan Text" field
    When user presses "Test Scanner Scan Button" icon button
    Then "Transaction Basket" page is shown
    And "${SKU Product 11 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${SKU Product 11 Description}           							|
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
