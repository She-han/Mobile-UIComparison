Feature: Discount Void

  @PT-1151 @DiscountVoid @POS @AUTOMATED @POSValidatedTest @POSSet3 @Regression
  Scenario: Void a discount from the basket
    Given user signs on as "Manager 2"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 1}" is displayed in "Receipt" list
    And "${Product 2}" is displayed in "Receipt" list
    When user selects "${Product 1 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Item Discount" button and "Select Reason" page shown
    And user selects "Manager Item Discount (Amount)" from "Selection List" list
    And user presses "OK" button
    Then "Enter Item Discount Amount" page is shown
    When user enters "2.00" into "Input Box" field
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "Manager Item Discount (Amount)" is displayed in "Receipt" list
    And "-£2.00" is displayed in "Receipt" list
    When user selects "Manager Item Discount (Amount)" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Item Void" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    And following details are not displayed on the receipt
      | text | Manager Item Discount (Amount) |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
   @PT-1944  @DiscountVoid @AUTOMATED @POS @POSValidatedTest @POSSet3
   Scenario: Void a transaction discount
   Given user signs on as "POS Operator"
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "20% Transaction Discount" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (20% Transaction Discount 20%)" is displayed in "Receipt" list
    And user selects "Transaction Discount (20% Transaction Discount 20%) " from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Item Void" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown 
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
 		Then following details are not displayed on the receipt
 		 | text | Transaction Discount (20% Transaction Discount) |
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
     
  @PT-11565 @DiscountVoid @AUTOMATED @POS
  Scenario: Void a transaction discount with 'Include Subsequent Items' allowed
    Given user signs on as "POS Operator"
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "Trans Discount% - Include Subsequent Items" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Trans Discount% - Include Subsequent Items 20%)" is displayed in "Receipt" list
    And user selects "Transaction Discount (Trans Discount% - Include Subsequent Items 20%) " from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Item Void" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then following details are not displayed on the receipt
      | text | Discount (Trans Discount% - Include Subsequent Items) |
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
