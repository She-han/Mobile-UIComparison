
Feature: Edit Item Page 

	@PT-13022 @INVENTORY @POS @AUTOMATED
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
		Then user enters "${Product 123as3y-11 Selling Code}" into "Input Box" field
		And user presses "ENT" icon button and "Adjust Stock Add Item" page shown
		And user presses "Add" button and "Adjustment Items" page shown
		
		# Field validation
		And user presses "Edit Item" button and "Adjust Stock Edit Item" page shown
		And "Product Id" field displays the text "${Product 123as3y-11}"
		And "Style Id" field displays the text "${Product 123as3y}"
		And "Size Id" field displays the text "${Product 123as3y-11 Size}"
		And "Color Id" field displays the text "${Product 123as3y-11 Color}"
		And "MMG Group Id" field displays the text "${Product 123as3y-11 MMG Group}"
		And "Quantity Id" field displays the text "${Product 123as3y-11 Quantity}"
		
		# Remove adjustment created
		And user presses "Cancel" button and "Adjustment Items" page shown
		And user presses "Remove" button and "Adjustment Items Confirm Void" page shown
		And user presses "OK" button and "Select Stock Adjustment Request" page shown
		
		# Signoff
		And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button and "Transaction Basket" page shown
        Then user presses "SignOff" button and "Enter User" page shown
    	
    @PT-13023 @INVENTORY @POS @AUTOMATED
    Scenario: Update button saves the quantity entered and navigates back to Adjustment Items Page 
    	
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
		Then user enters "${Product 123as3y-11 Selling Code}" into "Input Box" field
		And user presses "ENT" icon button and "Adjust Stock Add Item" page shown
		And user presses "Add" button and "Adjustment Items" page shown
		
		# Change quantity and Update
		And user presses "Edit Item" button and "Adjust Stock Edit Item" page shown
		And user enters "${Unsubmitted Adjustment Quantity Remove}" into "Enter Quantity" field
		And user presses "Update" button and "Adjustment Items" page shown
		
		# Validate change
		And "${Unsubmitted Adjustment Quantity Remove}" is displayed in "Adjustment Items List" list
		
		# Remove adjustment Created
		And user presses "Remove" button and "Adjustment Items Confirm Void" page shown
		And user presses "OK" button and "Select Stock Adjustment Request" page shown
		
		# Signoff
		And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button and "Transaction Basket" page shown
        Then user presses "SignOff" button and "Enter User" page shown
		
	@PT-13024 @INVENTORY @POS @AUTOMATED
	Scenario: Cancel button goes back to Adjustment Items Page with no changes
		
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
		Then user enters "${Product 123as3y-11 Selling Code}" into "Input Box" field
		And user presses "Add Item" button and "Adjust Stock Add Item" page shown
		And user enters "1" into "Enter Quantity" field
		And user presses "Add" button and "Adjustment Items" page shown
		
		# Edit item and cancel and verify no changes
		And user presses "Edit Item" button and "Adjust Stock Edit Item" page shown
		And user enters "${Unsubmitted Adjustment Quantity Remove}" into "Enter Quantity" field
		And user presses "Cancel" button and "Adjustment Items" page shown
		And "${Unsubmitted Adjustment Quantity Remove}" is not displayed in "Adjustment Items List" list
		
		# Remove adjustment Created
		And user presses "Remove" button and "Adjustment Items Confirm Void" page shown
		And user presses "OK" button and "Select Stock Adjustment Request" page shown
		
		# Signoff
		And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button and "Transaction Basket" page shown
        Then user presses "SignOff" button and "Enter User" page shown
		
		