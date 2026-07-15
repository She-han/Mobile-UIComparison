
Feature: Adjustment Confirmation Page 
	
	@PT-13025 @INVENTORY @POS @AUTOMATED @ToBeFixedAutTest
	Scenario: All the data is displaying correctly 
		
		Given user signs on as "Sales Assistant"
	    And user presses "Management" button
		And user presses "Admin" button and "Administration Screen" page shown
		And user presses "Inventory Button" icon button
		And user presses "Adjust Button" icon button
		And user presses "Adjust Stock Button" icon button 
		And "Select Adjustment" page is shown
		
		# Add adjustment with identifiable data
		And user presses "Requested" button and "Select Stock Adjustment Request" page shown
		And user presses "Ad Hoc" button and "Adjustment Summary" page shown
		And user presses "Select Adjust Reason" icon button 
		And "Select Reason Options" page is shown
		And user selects "${Reason Write On}" from "Reason List" list
		And user presses "Select" button and "Adjustment Summary" page shown
		And user presses "Add or Edit Items" button and "Adjustment Items" page shown
		Then user enters "${Unsubmitted Adjustment Product ID}" into "Input Box" field
		And user presses "ENT" icon button 
		And "Adjust Stock Add Item" page is shown
		And user enters "1" into "Enter Quantity" field
		And user presses "ENT" icon button 
		And "Adjustment Items" page is shown
		Then user enters "${Product 2}" into "Input Box" field
		And user presses "ENT" icon button 
		And "Adjust Stock Add Item" page is shown
		And user enters "3" into "Enter Quantity" field
		And user presses "ENT" icon button 
		And "Adjustment Items" page is shown
		And user presses "Done" button and "Adjustment Summary" page shown
		
		# Select created adjustment and navigate to confirmation page
		And user presses "Continue" button and "Adjustment Confirmation Page" page shown
		
		# Field validation
		And "Adjust Stock Confirmation Reason" field displays the text "${Reason Write On}"
		And "Adjust Stock Confirmation Number Lines" field displays the text "2"
		And "Adjust Stock Confirmation Total Adjusted" field displays the text "4"
		And "1" is displayed in "Adjust Stock Confirmation List" list
		And "3" is displayed in "Adjust Stock Confirmation List" list
		And "${Product 2 Description}" is displayed in "Adjust Stock Confirmation List" list
		And "${Style Colour Size Product 1}" is displayed in "Adjust Stock Confirmation List" list
		
		# Remove adjustment created
		And user presses "Remove" button and "Confirmation Confirm Void" page shown
		And user presses "OK" button and "Select Stock Adjustment Request" page shown
		
		# Signoff
		And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button 
		And "Transaction Basket" page is shown
        Then user presses "SignOff" button and "Enter User" page shown
    	
    	
	@PT-13026 @INVENTORY @POS @AUTOMATED
	Scenario: Confirm button and pop up window behave correctly 
		
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
		Then user enters "${Unsubmitted Adjustment Product ID}" into "Input Box" field
		And user presses "ENT" icon button and "Adjust Stock Add Item" page shown
		And user enters "222224" into "Enter Quantity" field
		And user presses "ENT" icon button and "Adjustment Items" page shown
		Then user enters "${Product 2}" into "Input Box" field
		And user presses "ENT" icon button and "Adjust Stock Add Item" page shown
		And user enters "3" into "Enter Quantity" field
		And user presses "ENT" icon button and "Adjustment Items" page shown
		And user presses "Done" button and "Adjustment Summary" page shown
		
		# Navigate to confirmation page
		And user presses "Continue" button and "Adjustment Confirmation Page" page shown
		
		# Confirm Button option No stays at confirmation page
		And user presses "Confirm" button and "Adjustment Confirmation Submit" page shown
		And user presses "No" button and "Adjustment Confirmation Page" page shown
		
		# Confirm Button option Yes
		And user presses "Confirm" button and "Adjustment Confirmation Submit" page shown
		And user presses "Yes" button and "Select Stock Adjustment Request" page shown
		And user presses "Back" button and "Select Adjustment" page shown
		And "${Unsubmitted Adjustment Quantity Remove}" is not displayed in "Unsubmitted Adjustments List" list
		
		# Renamed to Submit pick for picking task
		And user presses "Requested" button and "Select Stock Adjustment Request" page shown
		And user selects "${Stock Adjustment 2 ID}" from "Stock Adjustments Movements List" list
		And user presses "Select" button and "Adjustment Summary" page shown
		And user presses "Continue" button and "Adjustment Confirmation Page" page shown
		And button with label "Confirm" is not displayed
		And user presses "Submit Pick" button and "Adjustment Confirmation Submit" page shown
		And user presses "No" button and "Adjustment Confirmation Page" page shown
		And user presses "Remove" button and "Adjustment Confirmation Remove" page shown
		And user presses "OK" button and "Select Stock Adjustment Request" page shown
		
		# Renamed to Approve for picking task
		And user selects "${Stock Adjustment 1 ID}" from "Stock Adjustments Movements List" list
		And user presses "Select" button and "Adjustment Summary" page shown
		And user presses "Continue" button and "Adjustment Confirmation Page" page shown
		And button with label "Confirm" is not displayed
		And user presses "Approve" button and "Adjustment Confirmation Submit" page shown
		And user presses "No" button and "Adjustment Confirmation Page" page shown
		And user presses "Remove" button and "Adjustment Confirmation Remove" page shown
		And user presses "OK" button and "Select Stock Adjustment Request" page shown		
		
		# Signoff
		And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button and "Transaction Basket" page shown
        Then user presses "SignOff" button and "Enter User" page shown
    	
    @PT-13027 @INVENTORY @POS @AUTOMATED
	Scenario: Reject button and pop up window behave correctly 	
    	
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
		Then user enters "${Unsubmitted Adjustment Product ID}" into "Input Box" field
		And user presses "ENT" icon button and "Adjust Stock Add Item" page shown
		And user enters "222224" into "Enter Quantity" field
		And user presses "ENT" icon button and "Adjustment Items" page shown
		Then user enters "${Product 2}" into "Input Box" field
		And user presses "ENT" icon button and "Adjust Stock Add Item" page shown
		And user enters "3" into "Enter Quantity" field
		And user presses "ENT" icon button and "Adjustment Items" page shown
		And user presses "Done" button and "Adjustment Summary" page shown
		
		# Navigate to confirmation page
		And user presses "Continue" button and "Adjustment Confirmation Page" page shown
		
		# Reject button is not shown for a non-Requested adjustment
		And button with label "Reject" is not displayed
		
		# Remove adjustment created
		And user presses "Remove" button and "Confirmation Confirm Void" page shown
		And user presses "OK" button and "Select Stock Adjustment Request" page shown
		
		# Reject button for Requested adjustmentStock Adjustment 1 ID
		And user selects "SA999013" from "Stock Adjustments Movements List" list
		And user presses "Select" button and "Adjustment Summary" page shown
		And user presses "Continue" button and "Adjustment Confirmation Page" page shown
		And user presses "Reject" button and "Adjustment Confirmation Reject" page shown
		And user presses "No" button and "Adjustment Confirmation Page" page shown
		
		###########################################
		# CURRENTLY THIS DOESN'T UPDATE THE ADJUSTMENTS LISTED, TEST WILL HANG HERE, PLAT-31405
		And user presses "Reject" button and "Adjustment Confirmation Reject" page shown
		And user presses "Yes" button and "Select Stock Adjustment Request" page shown
		#And "${Stock Adjustment 1 ID}" is not displayed in "Stock Adjustments Movements List" list
		###########################################
		
		# Signoff
		And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button and "Transaction Basket" page shown
        Then user presses "SignOff" button and "Enter User" page shown
		