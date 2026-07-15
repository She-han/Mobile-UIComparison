Feature: UnKnown Product Sale
		
  @PT-1788 @POS @AUTOMATED @Regression
  Scenario: Verify Full Listing Of Select MMG is not displayed when the enactor.pos.AllowFullListingOfSelectMMG privilege is disabled
  	Given user signs on as "Sales Assistant"
  	And user presses "Dept Sale" button
  	And "Select Reason" page is shown
  	And user selects "Faulty Barcode" from "Selection List" list
		And user presses "OK" button
		And "Filtered MMG" page is shown
		And user presses "Toggle Alpha Keyboard" icon button
    And "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter e button" icon button
    And user waits "1" seconds
    And "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter y button" icon button
    And user waits "1" seconds
    And user presses "Keyboard Letter e button" icon button
    And user waits "2" seconds
    And user selects "${MMG Product 1 Description With Region}" from "MMG Group List" list
    And user presses "Alpha Keyboard Enter" icon button
    And "Enter Item Price" page is shown
		And user enters "$17.99" into "Input Box" field 
		And user presses "Alpha Keyboard Enter" icon button		
		And "Transaction Basket" page is shown
		And user presses "TOTAL" button 
		And "Select Tender" page is shown
		And user presses "Cash" button 
		And "Enter Tender Amount" page is shown
		And user presses "OK" button 
		And "Await Drawer Closed" page is shown
		And user presses "Close" button on external "Cash Drawer" window
		And "Transaction Basket" page is shown
		When user presses "SignOff" button
		Then "Enter User" page is shown
		
  @PT-1790 @POS @AUTOMATED @Regression
  Scenario: Verify Full Listing Of Select MMG is displayed when the enactor.pos.AllowFullListingOfSelectMMG privilege is enabled
  	Given user signs on as "Allow Full Listing Of Select MMG Privilage User"
  	And user presses "Dept Sale" button
  	And "Select Reason" page is shown
  	And user selects "Faulty Barcode" from "Selection List" list
		And user presses "OK" button
		And "Filtered MMG" page is shown
		And user presses "Toggle Alpha Keyboard" icon button
    And "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter s button" icon button
    And user waits "1" seconds
    And "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter t button" icon button
    And user waits "1" seconds
    And user presses "Keyboard Letter a button" icon button
    And user waits "2" seconds
    And user presses "Keyboard Letter t button" icon button
    And user waits "1" seconds
    And user selects "Stationary (All Regions)" from "MMG Group List" list
    And user presses "Alpha Keyboard Enter" icon button
    And "Enter Item Price" page is shown
		And user enters "$10.00" into "Input Box" field 
		And user presses "Alpha Keyboard Enter" icon button		
		And "Transaction Basket" page is shown
		And user presses "TOTAL" button 
		And "Select Tender" page is shown
		And user presses "Cash" button 
		And "Enter Tender Amount" page is shown
		And user presses "OK" button 
		And "Await Drawer Closed" page is shown
		And user presses "Close" button on external "Cash Drawer" window
		And "Transaction Basket" page is shown
		When user presses "SignOff" button
		Then "Enter User" page is shown
		
	@PT-16522 @POS @AUTOMATED @Regression
  Scenario: Sell an unknown product item with multiple quantity and change the quantity again
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    And user presses "QTY Sale" button
    Then "Enter QTY" page is shown
    And user enters "3" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "${Unknown Product 1}" into "Input Box" field
    And user presses "ENT" icon button 
    And "Confirm Unknown Product Sale" page is shown
    And user presses "Sell" button and "Select Reason" page shown
    And user selects "${MMG Sale Reason 1}" from "Selection List" list
    And user presses "OK" button and "Filtered MMG" page shown
    And user presses "Toggle Alpha Keyboard" icon button
    And "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter E button" icon button
    And user waits "1" seconds
    And "Enter User With Keyboard" page is shown
    And user presses "Keyboard Letter l button" icon button
    And user waits "1" seconds
    And user presses "Keyboard Letter e button" icon button
    And user waits "2" seconds
    And user presses "Toggle Alpha Keyboard" icon button
    And "Keyboard Hidden Screen" page is shown  
    And user selects "Electronics (All Regions)" from "MMG Group List" list
    And user presses "Select" button and "Enter Item Price" page shown
    And user enters "£17.99" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user selects "${Unknown Product 1 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Change Quantity" button and "Modify Quantity" page shown
    And user enters "4" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
                
  @PT-16565 @POS @AUTOMATED @Regression
  Scenario: Verify Price Override to an Unknown Product
    Given user signs on as "Sales Assistant"
    And user enters "${Unknown Product 1}" into "Input Box" field
    And user presses "ENT" icon button 
    And "Confirm Unknown Product Sale" page is shown
    And user presses "Sell" button and "Select Reason" page shown
    And user selects "${MMG Sale Reason 1}" from "Selection List" list
    And user presses "OK" button and "Filtered MMG" page shown
    And user presses "Toggle Alpha Keyboard" icon button
    And "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter E button" icon button
    And user waits "1" seconds
    And "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter l button" icon button
    And user waits "1" seconds
    And user presses "Keyboard Letter e button" icon button
    And user waits "2" seconds
    And user presses "Toggle Alpha Keyboard" icon button
    And "Keyboard Hidden Screen" page is shown 
    And user selects "Electronics (All Regions)" from "MMG Group List" list
    And user presses "Select" button and "Enter Item Price" page shown
    And user enters "12.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user selects "${Unknown Product 1 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Price Override" button and "Select Reason" page shown
    And user selects "Price Override Up" from "Selection List" list
    And user presses "OK" button and "Enter Price Override Amount" page shown
    And user enters "14.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Price Override Up" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown