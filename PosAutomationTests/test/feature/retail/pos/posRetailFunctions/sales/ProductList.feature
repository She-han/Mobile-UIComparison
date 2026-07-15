Feature: Product List

  @PT-10805 @POS @AUTOMATED @ToBeFixedAutTest 
  Scenario: Verify selling products using product list
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Product Lists" button
    And "Product List Page" page is shown
    And user presses "Tile Print Shorts" icon button
    And user presses "George Shirt" icon button
    And user presses "Wool Trousers" icon button
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | Tile Print Shorts                                     |
      | item      | George Shirt                                          |
      | item      | Wool Trousers                                         |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-23039 @POS @AUTOMATED @TobeFixedAutTest 
  Scenario: Validate Products with Prompt for Quantity
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Product Lists" button and "Product List Page" page shown
    And user presses "A-9" icon button and "Enter Quantity" page shown
    And user enters "1" into "Input Box" field
    And user presses "OK" button and "Product List Page" page shown
    And user presses "A-1" icon button
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | A-9                                                   |
      | item      | A-1                                                   |     
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    