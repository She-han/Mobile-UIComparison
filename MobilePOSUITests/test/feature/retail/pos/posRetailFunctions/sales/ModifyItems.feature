Feature: Modify Items

  @PT-6434 @AUTOMATED @POS @SCnotReady @ToBeFixedAutTest
  Scenario: Verify Add Text to Item
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button
    And "transaction basket" page is shown
    And user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Add Text" button and "Select Basket Item For Item Text" page shown
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "New note on Product 1" into "Notes Text" field
    When user presses "OK" button and "Transaction Basket" page shown
    Then "New note on Product 1" is displayed in "Receipt List" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | text      | New note on Product 1                                 |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-16360 @AUTOMATED @POS
  Scenario: Verify item modify menu appears for items with promotion
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user selects "${Product 1 Description}" from "Receipt" list
    And "Modify Item" page is shown
    When user presses "Cancel" button
    Then "Transaction Basket" page is shown
    Then user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    When user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-16361 @AUTOMATED @POS
  Scenario: Verify item modify menu appears for unknown products
    Given user signs on as "Sales Assistant"
    When user enters "unknown2" into "Input Box" field
    And user presses "ENT" icon button 
    And "Confirm Unknown Product Sale" page is shown
    And user presses "Sell" button and "Select Reason" page shown
    Then user selects "Faulty Barcode" from "Selection List" list
    And user presses "OK" button and "Filtered MMG" page shown 
    And user presses "Toggle Alpha Keyboard" icon button
	When "Enter User with Keyboard" page is shown
		Then user presses "Keyboard Letter c button" icon button
		And user waits "1" seconds
		And "Filtered MMG" page is shown
		And user presses "Keyboard Letter h button" icon button
		And user waits "2" seconds
	    And user selects "Children (All Regions)" from "MMG Group List" list
	When user presses "Select" button and "Enter Item Price" page shown
	And user enters "£50.00" into "Input Box" field
	Then user presses "OK" button and "Transaction Basket" page shown
    And user selects "Children" from "Receipt" list
    And "Modify Item" page is shown
    When user presses "Cancel" button
    Then "Transaction Basket" page is shown
    Then user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    When user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown