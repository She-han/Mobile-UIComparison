Feature: Item Return with Gift Card

  @PT-16570 @AUTOMATED @POS @ToBeFixedAutTest
  Scenario: Return item with gift card - verify 'Refund to New Card Only' option
    Given user signs on as "Sales Assistant"
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    When user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Gift Card" button and "Get Gift Card Number" page shown
    Then user enters "${Gift Card number 16}" into "Input Box" field
    And user presses "OK" button and "Select Gift Card Type" page shown
    And user selects "Gift Card UK Test 2" from "Selection List" list
    And user presses "OK" button and "Only For New Card Message State" page shown
    And user presses "OK" button and "Refund Item" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-20231 @AUTOMATED @POS
  Scenario: Validate Capture Name and Address For Return transaction with Gift Card Type tenders
    Given user signs on as "Sales Assistant"
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    When user selects "${Return Damaged Reason}" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "More" button and "Refund Item" page shown
    And user presses "Gift Card 1" button and "Get Gift Card Number" page shown
    Then user enters "${Gift Card number 17}" into "Input Box" field
    And user presses "OK" button and "Employee Account Tender Amount" page shown
    And user presses "OK" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 1 Name}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button
    And user waits "2" seconds 
    And "Transaction Signature Verification" page is shown
    And user presses "Signature OK" button 
    And "Transaction Basket" page is shown
    And receipt display with following details
      | text      | Refund                                                                                                                                                                              |
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | text      | Customer: ${Customer 1 Name Without Title}                                      |
      | text      | Tel: ${Customer 1 Phone No}                                                     |
      | text      | Refund Gift Card UK                                                                                                                                           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown