Feature: Order Product with Layaway Future Sale

  @PT-14168 @POS @AUTOMATED @POSValidatedTest @Layaway @Regression
  Scenario: Layaway - Validate Layaway Creation
    Given user signs on as "Manager 2"
    And privilege "enactor.pos.AuthorisesCreateLayaway" is added to the current user
    And privilege "enactor.pos.CreateLayawayAllowed" is added to the current user
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Layaway Functions" button
    And user presses "Create Layaway" button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    And user enters "MB709SN-1" into "Input Box" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
    And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Postcode" button and "Enter Post Code" page shown
    And user enters "sg" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Postcode" page is shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-14171 @POS @AUTOMATED @POSValidatedTest @Layaway @Regression
  Scenario: Validate that Return,Item discount and Price override is blocked when creating a Layaway
    Given user signs on as "Manager 2"
    And privilege "enactor.pos.AuthorisesCreateLayaway" is added to the current user
    And privilege "enactor.pos.CreateLayawayAllowed" is added to the current use
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Layaway Functions" button
    And user presses "Create Layaway" button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    And user enters "MB709SN-1" into "Input Box" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
    Then user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "20% Item Discount" from "Selection List" list    
    And user presses "OK" button and "Not Layaway Item" page shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    Then user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "20% Transaction Discount" from "Selection List" list
	  And user presses "OK" button and "Not Layaway Item" page shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Postcode" button and "Enter Post Code" page shown
    And user enters "sg" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Postcode" page is shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
    
  @PT-14199 @POS @AUTOMATED @POSValidatedTest @Layaway @Regression
  Scenario: Validate Layaway Conversion - Convert functionality
    Given user signs on as "Manager 2"
    And privilege "enactor.pos.AuthorisesConvertLayaway" is added to the current user
    And privilege "enactor.pos.ConvertLayawayAllowed" is added to the current user
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Layaway Functions" button
    And user presses "Convert Layaway" button 
  	And "Search Layaway" page is shown
    And user presses "Search" button
	  And "Search Criteria Layaway" page is shown
	  And user presses "OK" button
	  And "Select Layaway" page is shown
	  And user presses "OK" button  
	  And "Layaway Details" page is shown
	  And user presses "Convert" button and "Transaction Basket" page shown
	  And user presses "TOTAL" button and "Transaction Basket" page shown
	  When user presses "SignOff" button
	  Then "Enter User" page is shown
    
    
  @PT-14299 @POS @AUTOMATED @POSValidatedTest @Layaway @ToBeFixedAutTest
  Scenario: Validate Layaway Cancel functionality
    Given user signs on as "Manager 2"
    And privilege "enactor.pos.AuthorisesCancelLayaway" is added to the current user
    And privilege "enactor.pos.CancelLayawayAllowed" is added to the current user
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Layaway Functions" button
    And user presses "Cancel Layaway" button 
  	And "Search Layaway" page is shown
    And user presses "Search" button
   	And "Search Criteria Layaway" page is shown
	  And user presses "OK" button
	  And "Select Layaway" page is shown
	  And user presses "OK" button 
	  And "Layaway Details" page is shown 
    And user presses "Discard" button 
    And "Cancel Layaway" page is shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    