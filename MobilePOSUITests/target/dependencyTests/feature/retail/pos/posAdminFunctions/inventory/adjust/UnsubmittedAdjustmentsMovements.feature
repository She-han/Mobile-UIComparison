
Feature: Unsubmitted Adjustments Page 

	@PT-12567 @INVENTORY @POS @AUTOMATED 
	Scenario: POS - Inventory - All data is displayed correctly on the Unsubmitted Adjustments Screen
	
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
		And user enters "${Unsubmitted Adjustment Test Notes}" into "Dialogpanel Select Adjust Notes" field
		And user presses "Add or Edit Items" button and "Adjustment Items" page shown
		Then user enters "${Unsubmitted Adjustment Product ID}" into "Input Box" field
		And user presses "ENT" icon button and "Adjust Stock Add Item" page shown
		And user enters "${Unsubmitted Adjustment Quantity Remove}" into "Enter Quantity" field
		And user presses "ENT" icon button and "Adjustment Items" page shown
		And user presses "Done" button and "Adjustment Summary" page shown
		And user presses "Suspend" button and "Select Adjustment" page shown
		
		# Check if test transactions show in table
		And "${Unsubmitted Adjustment Quantity Remove}" is displayed in "Unsubmitted Adjustments List" list
		And user presses "Keyboard" icon button and "Keyboard Shown" page shown
		And "${Unsubmitted Adjustment Quantity Remove}" is displayed in "Unsubmitted Adjustments List" list
		And user presses "Keyboard" icon button and "Keyboard Hidden" page shown
		
		# Create and complete adjustment
		And user presses "Requested" button and "Select Stock Adjustment Request" page shown
		And user presses "Ad Hoc" button and "Adjustment Summary" page shown
		And user presses "Select Adjust Reason" icon button and "Select Reason Options" page shown
		And user selects "${Reason Write On}" from "Reason List" list
		And user presses "Select" button and "Adjustment Summary" page shown
		And user presses "Continue" button and "Adjust Summary No Items Alert" page shown
		And user presses "OK" button and "Adjustment Summary" page shown
		And user presses "Add or Edit Items" button and "Adjustment Items" page shown
		Then user enters "${Unsubmitted Adjustment Product ID}" into "Input Box" field
		And user presses "ENT" icon button and "Adjust Stock Add Item" page shown
		And user enters "${Unsubmitted Adjustment Quantity Complete}" into "Enter Quantity" field
		And user presses "ENT" icon button and "Adjustment Items" page shown
		And user presses "Done" button and "Adjustment Summary" page shown
		And user presses "Continue" button and "Adjustment Confirmation Page" page shown
		And user presses "Confirm" button and "Adjustment Confirmation Submit" page shown
		And user presses "Yes" button and "Select Stock Adjustment Request" page shown
		
		# Check it is not shown in unsubmitted adjustments list
		And user presses "Back" button and "Select Adjustment" page shown
		And "${Unsubmitted Adjustment Quantity Complete}" is not displayed in "Unsubmitted Adjustments List" list
		
		# Create and remove transaction
		And user presses "Requested" button and "Select Stock Adjustment Request" page shown
		And user presses "Ad Hoc" button and "Adjustment Summary" page shown
		And user presses "Select Adjust Reason" icon button and "Select Reason Options" page shown
		And user selects "${Reason Write On}" from "Reason List" list
		And user presses "Select" button and "Adjustment Summary" page shown
		And user presses "Add or Edit Items" button and "Adjustment Items" page shown
		Then user enters "${Unsubmitted Adjustment Product ID}" into "Input Box" field
		And user presses "ENT" icon button and "Adjust Stock Add Item" page shown
		And user enters "${Unsubmitted Adjustment Quantity Complete}" into "Enter Quantity" field
		And user presses "ENT" icon button and "Adjustment Items" page shown
		And user presses "Done" button and "Adjustment Summary" page shown
		And user presses "Remove" button and "Adjust Stock Confirm Void" page shown
		And user presses "OK" button and "Select Stock Adjustment Request" page shown
		
		# Check it is not shown in unsubmitted adjustments list
		And user presses "Back" button and "Select Adjustment" page shown
		And "${Unsubmitted Adjustment Quantity Complete}" is not displayed in "Unsubmitted Adjustments List" list
		
		# Remove adjustment with identifiable data
		And user selects "${Unsubmitted Adjustment Quantity Remove}" from "Unsubmitted Adjustments List" list
		Then user presses "Select" button and "Adjustment Summary" page shown
		And user presses "Remove" button and "Adjust Stock Confirm Void" page shown
		And user presses "OK" button and "Select Adjustment" page shown
		
		And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button and "Transaction Basket" page shown
        Then user presses "SignOff" button and "Enter User" page shown
		
	@PT-12272 @INVENTORY @POS @AUTOMATED
	Scenario: POS - Inventory - Cancel button works correctly on Unsubmitted Adjustments Page
	
		Given user signs on as "Sales Assistant"
	    And user presses "Management" button
		And user presses "Admin" button and "Administration Screen" page shown
		And user presses "Inventory Button" icon button
		And user presses "Adjust Button" icon button
		And user presses "Adjust Stock Button" icon button and "Select Adjustment" page shown
		
		And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button and "Transaction Basket" page shown
    Then user presses "SignOff" button and "Enter User" page shown
		
	@PT-12568 @INVENTORY @POS @AUTOMATED
	Scenario: POS - Inventory - Select button on Unsubmitted Adjustments page opens up selected adjustment
	
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
		And user enters "${Unsubmitted Adjustment Test Notes}" into "Dialogpanel Select Adjust Notes" field
		And user presses "Add or Edit Items" button and "Adjustment Items" page shown
		Then user enters "${Unsubmitted Adjustment Product ID}" into "Input Box" field
		And user presses "ENT" icon button and "Adjust Stock Add Item" page shown
		And user enters "${Unsubmitted Adjustment Quantity Remove}" into "Enter Quantity" field
		And user presses "ENT" icon button and "Adjustment Items" page shown
		And user presses "Done" button and "Adjustment Summary" page shown
		And user presses "Suspend" button and "Select Adjustment" page shown
		
		# Testing select button on created transaction
		And user selects "${Unsubmitted Adjustment Quantity Remove}" from "Unsubmitted Adjustments List" list
		Then user presses "Select" button and "Adjustment Summary" page shown
		
		# Validation
		And "Reason Label" field displays the text "${Adjustment Summary Reason}"
		And "Dialogpanel Select Adjust Notes" field displays the text "${Unsubmitted Adjustment Test Notes}"
		
		# Remove adjustment with identifiable data
		And user presses "Remove" button and "Adjust Stock Confirm Void" page shown
		And user presses "OK" button and "Select Adjustment" page shown
		
		And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button and "Transaction Basket" page shown
        Then user presses "SignOff" button and "Enter User" page shown
		
	@PT-12569 @INVENTORY @POS @AUTOMATED
	Scenario: POS - Inventory - Requested button opens stock adjustment request page 

		Given user signs on as "Sales Assistant"
	    And user presses "Management" button
		And user presses "Admin" button and "Administration Screen" page shown
		And user presses "Inventory Button" icon button
		And user presses "Adjust Button" icon button
		And user presses "Adjust Stock Button" icon button and "Select Adjustment" page shown
		And user presses "Requested" button and "Select Stock Adjustment Request" page shown
		
		And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button and "Transaction Basket" page shown
        Then user presses "SignOff" button and "Enter User" page shown
		
	@PT-12570 @INVENTORY @POS @AUTOMATED
	Scenario: POS - Inventory - Numbers period and CLR do nothing and ENT returns adjustment summary page
	
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
		And user enters "${Unsubmitted Adjustment Test Notes}" into "Dialogpanel Select Adjust Notes" field
		And user presses "Add or Edit Items" button and "Adjustment Items" page shown
		Then user enters "${Unsubmitted Adjustment Product ID}" into "Input Box" field
		And user presses "ENT" icon button and "Adjust Stock Add Item" page shown
		And user enters "${Unsubmitted Adjustment Quantity Remove}" into "Enter Quantity" field
		And user presses "ENT" icon button and "Adjustment Items" page shown
		And user presses "Done" button and "Adjustment Summary" page shown
		And user presses "Suspend" button and "Select Adjustment" page shown
		
		And user presses "Numbutton 0" icon button and "Select Adjustment" page shown
		And user presses "Numbutton 1" icon button and "Select Adjustment" page shown
		And user presses "Numbutton 2" icon button and "Select Adjustment" page shown
		And user presses "Numbutton 3" icon button and "Select Adjustment" page shown
		And user presses "Numbutton 4" icon button and "Select Adjustment" page shown
		And user presses "Numbutton 5" icon button and "Select Adjustment" page shown
		And user presses "Numbutton 6" icon button and "Select Adjustment" page shown
		And user presses "Numbutton 7" icon button and "Select Adjustment" page shown
		And user presses "Numbutton 8" icon button and "Select Adjustment" page shown
		And user presses "Numbutton 9" icon button and "Select Adjustment" page shown
		And user presses "Numbutton ." icon button and "Select Adjustment" page shown
		And user presses "CLR" icon button and "Select Adjustment" page shown
		And user selects "${Unsubmitted Adjustment Quantity Remove}" from "Unsubmitted Adjustments List" list
		Then user presses "ENT" icon button and "Adjustment Summary" page shown
		And "Reason Label" field displays the text "${Adjustment Summary Reason}"
		And "Dialogpanel Select Adjust Notes" field displays the text "${Unsubmitted Adjustment Test Notes}"
		
		# Remove adjustment with identifiable data
		And user presses "Remove" button and "Adjust Stock Confirm Void" page shown
		And user presses "OK" button and "Select Adjustment" page shown
		
		And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button and "Transaction Basket" page shown
        Then user presses "SignOff" button and "Enter User" page shown
    	
    @PT-12571 @INVENTORY @POS @AUTOMATED
    Scenario: POS - Inventory - History button opens adjustment history page
    
        Given user signs on as "Sales Assistant"
	    And user presses "Management" button
		And user presses "Admin" button and "Administration Screen" page shown
		And user presses "Inventory Button" icon button
		And user presses "Adjust Button" icon button
		And user presses "Adjust Stock Button" icon button and "Select Adjustment" page shown
		And user presses "History" button and "Adjustment History" page shown
		
		And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button and "Transaction Basket" page shown
        Then user presses "SignOff" button and "Enter User" page shown
    	