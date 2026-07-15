
Feature: Adjustment Items Page

	@PT-13012 @INVENTORY @POS @AUTOMATED
	Scenario: All the data is displaying correctly
	
		# Navigate to page
		Given user signs on as "Sales Assistant"
	    And user presses "Management" button
		And user presses "Admin" button and "Administration Screen" page shown
		And user presses "Inventory Button" icon button
		And user presses "Adjust Button" icon button
		And user presses "Adjust Stock Button" icon button and "Select Adjustment" page shown
		
		# Add adjustment with identifiable data
		And user presses "Requested" button and "Select Stock Adjustment Request" page shown
		And user presses "Ad Hoc" button and "Adjustment Summary" page shown
		And user presses "Select Adjust Reason" icon button and "Select Reason Options" page shown
		And user selects "${Reason Write On}" from "Reason List" list
		And user presses "Select" button and "Adjustment Summary" page shown
		And user presses "Add or Edit Items" button and "Adjustment Items" page shown
		Then user enters "${Product 3}" into "Input Box" field
		And user presses "ENT" icon button and "Adjust Stock Add Item" page shown
		And user enters "3" into "Enter Quantity" field
		And user presses "ENT" icon button and "Adjustment Items" page shown
		Then user enters "${Product 4}" into "Input Box" field
		And user presses "ENT" icon button and "Adjust Stock Add Item" page shown
		And user enters "2" into "Enter Quantity" field
		And user presses "ENT" icon button and "Adjustment Items" page shown
		Then user enters "${Product 2}" into "Input Box" field
		And user presses "ENT" icon button and "Adjust Stock Add Item" page shown
		And user enters "222222" into "Enter Quantity" field
		And user presses "ENT" icon button and "Adjustment Items" page shown
		And user presses "Done" button and "Adjustment Summary" page shown
		And user presses "Suspend" button and "Select Adjustment" page shown
		
		And user selects "${Unsubmitted Adjustment Quantity Remove}" from "Unsubmitted Adjustments List" list
		Then user presses "Select" button and "Adjustment Summary" page shown
		And user presses "Add or Edit Items" button and "Adjustment Items" page shown
		
		# Check list items
		And "${Product 3}" is displayed in "Adjustment Items List" list
		And "${Product 4}" is displayed in "Adjustment Items List" list
		And "${Product 2}" is displayed in "Adjustment Items List" list
		And user presses "Keyboard" icon button and "Keyboard Shown" page shown
		And "${Product 3}" is displayed in "Adjustment Items List" list
		And "${Product 4}" is displayed in "Adjustment Items List" list
		And "${Product 2}" is displayed in "Adjustment Items List" list
		And user presses "Keyboard" icon button and "Keyboard Hidden" page shown
	
		And user presses "Done" button and "Adjustment Summary" page shown
		
		# Remove adjustment with identifiable data
		And user presses "Remove" button and "Adjust Stock Confirm Void" page shown
		And user presses "OK" button and "Select Adjustment" page shown
		
		# Signoff
		And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button and "Transaction Basket" page shown
        Then user presses "SignOff" button and "Enter User" page shown
		
	@PT-13013 @INVENTORY @POS @AUTOMATED
	Scenario: Add item button acts as expected
		
		# Navigate to page
		Given user signs on as "Sales Assistant"
	    And user presses "Management" button
		And user presses "Admin" button and "Administration Screen" page shown
		And user presses "Inventory Button" icon button
		And user presses "Adjust Button" icon button
		And user presses "Adjust Stock Button" icon button and "Select Adjustment" page shown
		
		# Add adjustment to use for tests
		And user presses "Requested" button and "Select Stock Adjustment Request" page shown
		And user presses "Ad Hoc" button and "Adjustment Summary" page shown
		And user presses "Select Adjust Reason" icon button and "Select Reason Options" page shown
		And user selects "${Reason Write On}" from "Reason List" list
		And user presses "Select" button and "Adjustment Summary" page shown
		And user presses "Add or Edit Items" button and "Adjustment Items" page shown
		
		# Invalid ID
		Then user enters "${Product Invalid ID}" into "Input Box" field
		And user presses "ENT" icon button and "Invalid Item ID" page shown
		And user presses "OK" button and "Adjustment Items" page shown
		
		# Valid ID
		Then user enters "${Product 4}" into "Input Box" field
		And user presses "ENT" icon button and "Adjust Stock Add Item" page shown
		And user enters "1" into "Enter Quantity" field
		And user presses "ENT" icon button and "Adjustment Items" page shown
		
		# Valid selling code
		Then user enters "${Product 123as3y-11 Selling Code}" into "Input Box" field
		And user presses "ENT" icon button and "Adjust Stock Add Item" page shown
		And user enters "1" into "Enter Quantity" field
		And user presses "ENT" icon button and "Adjustment Items" page shown
		
		# Remove adjustment created
		And user presses "Remove" button and "Adjustment Items Confirm Void" page shown
		And user presses "OK" button and "Select Stock Adjustment Request" page shown
		
		# Signoff
		And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button and "Transaction Basket" page shown
        Then user presses "SignOff" button and "Enter User" page shown
    	
    @PT-13014 @INVENTORY @POS @AUTOMATED
    Scenario: Up and down buttons act as expected
    
    	# Navigate to page
		Given user signs on as "Sales Assistant"
	    And user presses "Management" button
		And user presses "Admin" button and "Administration Screen" page shown
		And user presses "Inventory Button" icon button
		And user presses "Adjust Button" icon button
		And user presses "Adjust Stock Button" icon button and "Select Adjustment" page shown
		
		# Add adjustment to use for tests
		And user presses "Requested" button and "Select Stock Adjustment Request" page shown
		And user presses "Ad Hoc" button and "Adjustment Summary" page shown
		And user presses "Select Adjust Reason" icon button and "Select Reason Options" page shown
		And user selects "${Reason Write On}" from "Reason List" list
		And user presses "Select" button and "Adjustment Summary" page shown
		And user presses "Add or Edit Items" button and "Adjustment Items" page shown
		
		# Add three items
		Then user enters "${Product 31}" into "Input Box" field
		And user presses "ENT" icon button and "Adjust Stock Add Item" page shown
		And user enters "1" into "Enter Quantity" field
		And user presses "ENT" icon button and "Adjustment Items" page shown
		Then user enters "${Product 32}" into "Input Box" field
		And user presses "ENT" icon button and "Adjust Stock Add Item" page shown
		And user enters "1" into "Enter Quantity" field
		And user presses "ENT" icon button and "Adjustment Items" page shown
		Then user enters "${Product 33}" into "Input Box" field
		And user presses "ENT" icon button and "Adjust Stock Add Item" page shown
		And user enters "1" into "Enter Quantity" field
		And user presses "ENT" icon button and "Adjustment Items" page shown
		
		# Test visibility
		And user selects "${Product 33}" from "Adjustment Items List" list
		And button with label "Up" is not displayed
		And user selects "${Product 31}" from "Adjustment Items List" list
		And button with label "Down" is not displayed
		
		# Remove adjustment created
		And user presses "Remove" button and "Adjustment Items Confirm Void" page shown
		And user presses "OK" button and "Select Stock Adjustment Request" page shown
		
		# Signoff
		And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button and "Transaction Basket" page shown
        Then user presses "SignOff" button and "Enter User" page shown
    	
    @PT-13015 @INVENTORY @POS @AUTOMATED
    Scenario: Voiding an item removes it from the adjustment items list
    	
    	# Navigate to page
		Given user signs on as "Sales Assistant"
	    And user presses "Management" button
		And user presses "Admin" button and "Administration Screen" page shown
		And user presses "Inventory Button" icon button
		And user presses "Adjust Button" icon button
		And user presses "Adjust Stock Button" icon button and "Select Adjustment" page shown
		
		# Add adjustment to use for tests
		And user presses "Requested" button and "Select Stock Adjustment Request" page shown
		And user presses "Ad Hoc" button and "Adjustment Summary" page shown
		And user presses "Select Adjust Reason" icon button and "Select Reason Options" page shown
		And user selects "${Reason Write On}" from "Reason List" list
		And user presses "Select" button and "Adjustment Summary" page shown
		And user presses "Add or Edit Items" button and "Adjustment Items" page shown
		
		# Add item
		Then user enters "${Product 31}" into "Input Box" field
		And user presses "ENT" icon button and "Adjust Stock Add Item" page shown
		And user enters "1" into "Enter Quantity" field
		And user presses "ENT" icon button and "Adjustment Items" page shown
		
		# Void item
		And user presses "Void Item" button and "Adjustment Items" page shown
		And "${Product 31}" is not displayed in "Adjustment Items List" list
		
		# Remove adjustment created
		And user presses "Remove" button and "Adjustment Items Confirm Void" page shown
		And user presses "OK" button and "Select Stock Adjustment Request" page shown
		
		# Signoff
		And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button and "Transaction Basket" page shown
        Then user presses "SignOff" button and "Enter User" page shown

	@PT-13016 @INVENTORY @POS @AUTOMATED
	Scenario: Editing item button goes to edit item page
		
		# Navigate to page
		Given user signs on as "Sales Assistant"
	  And user presses "Management" button
		And user presses "Admin" button and "Administration Screen" page shown
		And user presses "Inventory Button" icon button
		And user presses "Adjust Button" icon button
		And user presses "Adjust Stock Button" icon button and "Select Adjustment" page shown
		
		# Add adjustment to use for tests
		And user presses "Requested" button and "Select Stock Adjustment Request" page shown
		And user presses "Ad Hoc" button and "Adjustment Summary" page shown
		And user presses "Select Adjust Reason" icon button and "Select Reason Options" page shown
		And user selects "${Reason Write On}" from "Reason List" list
		And user presses "Select" button and "Adjustment Summary" page shown
		And user presses "Add or Edit Items" button and "Adjustment Items" page shown
		
		# Add item
		Then user enters "${Product 31}" into "Input Box" field
		And user presses "ENT" icon button and "Adjust Stock Add Item" page shown
		And user enters "1" into "Enter Quantity" field
		And user presses "ENT" icon button and "Adjustment Items" page shown
		
		# Edit item
		And user presses "Edit Item" button and "Edit Item Page" page shown
		And user presses "Cancel" button and "Adjustment Items" page shown
		
		# Remove adjustment created
		And user presses "Remove" button and "Adjustment Items Confirm Void" page shown
		And user presses "OK" button and "Select Stock Adjustment Request" page shown
		
		# Signoff
		And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button and "Transaction Basket" page shown
        Then user presses "SignOff" button and "Enter User" page shown
		
	@PT-13017 @INVENTORY @POS @AUTOMATED
	Scenario: Done button navigates back to Adjustment Summary page
		
		# Navigate to page
		Given user signs on as "Sales Assistant"
	    And user presses "Management" button
		And user presses "Admin" button and "Administration Screen" page shown
		And user presses "Inventory Button" icon button
		And user presses "Adjust Button" icon button
		And user presses "Adjust Stock Button" icon button and "Select Adjustment" page shown
		
		# Add adjustment to use for tests
		And user presses "Requested" button and "Select Stock Adjustment Request" page shown
		And user presses "Ad Hoc" button and "Adjustment Summary" page shown
		And user presses "Select Adjust Reason" icon button and "Select Reason Options" page shown
		And user selects "${Reason Write On}" from "Reason List" list
		And user presses "Select" button and "Adjustment Summary" page shown
		And user presses "Add or Edit Items" button and "Adjustment Items" page shown
		
		# Press done button 
		And user presses "Done" button and "Adjustment Summary" page shown
		
		# Remove adjustment created
		And user presses "Remove" button and "Adjust Stock Confirm Void" page shown
		And user presses "OK" button and "Select Stock Adjustment Request" page shown
		
		# Signoff
		And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button and "Transaction Basket" page shown
        Then user presses "SignOff" button and "Enter User" page shown
    	
    @PT-13018 @INVENTORY @POS @AUTOMATED
    Scenario: Remove button removes the adjustment and navigate back to page it came from
    	
        Given user signs on as "Sales Assistant"
	    And user presses "Management" button
		And user presses "Admin" button and "Administration Screen" page shown
		And user presses "Inventory Button" icon button
		And user presses "Adjust Button" icon button
		And user presses "Adjust Stock Button" icon button and "Select Adjustment" page shown
		
		# Add adjustment to be suspended
		And user presses "Requested" button and "Select Stock Adjustment Request" page shown
		And user presses "Ad Hoc" button and "Adjustment Summary" page shown
		And user presses "Select Adjust Reason" icon button and "Select Reason Options" page shown
		And user selects "${Reason Write On}" from "Reason List" list
		And user presses "Select" button and "Adjustment Summary" page shown
		And user presses "Add or Edit Items" button and "Adjustment Items" page shown
		Then user enters "${Unsubmitted Adjustment Product ID}" into "Input Box" field
		And user presses "ENT" icon button and "Adjust Stock Add Item" page shown
		And user enters "${Unsubmitted Adjustment Quantity Remove}" into "Enter Quantity" field
		And user presses "ENT" icon button and "Adjustment Items" page shown
		And user presses "Done" button and "Adjustment Summary" page shown
		And user presses "Suspend" button and "Select Adjustment" page shown
		
		And user selects "${Unsubmitted Adjustment Quantity Remove}" from "Unsubmitted Adjustments List" list
		And user presses "Select" button and "Adjustment Summary" page shown
		And user presses "Add or Edit Items" button and "Adjustment Items" page shown
		
		# Remove from Adjustment items page
		And user presses "Remove" button and "Adjustment Items Confirm Void" page shown
		And user presses "OK" button and "Select Adjustment" page shown
		
		# Create Ad Hoc adustment
		And user presses "Requested" button and "Select Stock Adjustment Request" page shown
		And user presses "Ad Hoc" button and "Adjustment Summary" page shown
		And user presses "Select Adjust Reason" icon button and "Select Reason Options" page shown
		And user selects "${Reason Write On}" from "Reason List" list
		And user presses "Select" button and "Adjustment Summary" page shown
		And user presses "Add or Edit Items" button and "Adjustment Items" page shown
		Then user enters "${Unsubmitted Adjustment Product ID}" into "Input Box" field
		And user presses "ENT" icon button and "Adjust Stock Add Item" page shown
		And user enters "1" into "Enter Quantity" field
		And user presses "ENT" icon button and "Adjustment Items" page shown
		
		# Remove from Adjustment items page
		And user presses "Remove" button and "Adjustment Items Confirm Void" page shown
		And user presses "OK" button and "Select Stock Adjustment Request" page shown
		
		# Signoff
		And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button and "Transaction Basket" page shown
        Then user presses "SignOff" button and "Enter User" page shown
	
		