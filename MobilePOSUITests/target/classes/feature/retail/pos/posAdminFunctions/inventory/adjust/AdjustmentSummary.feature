
Feature: Adjustment Summary Page 

	@PT-13005 @INVENTORY @POS @AUTOMATED
	Scenario: All the data is displaying correctly
		
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
		
		# Navigate and validate via the "Select Adjustment" page
		And user selects "${Unsubmitted Adjustment Quantity Remove}" from "Unsubmitted Adjustments List" list
		Then user presses "Select" button and "Adjustment Summary" page shown
		And "Reason Label" field displays the text "${Adjustment Summary Reason}"
		And "DialogPanel Select Adjust Notes" field displays the text "${Unsubmitted Adjustment Test Notes}"
		And user presses "Keyboard" icon button and "Keyboard Shown" page shown
		And "Reason Label" field displays the text "${Adjustment Summary Reason}"
		And "DialogPanel Select Adjust Notes" field displays the text "${Unsubmitted Adjustment Test Notes}"
		And user presses "Keyboard" icon button and "Keyboard Hidden" page shown
		
		# Remove adjustment with identifiable data
		And user presses "Remove" button and "Adjust Stock Confirm Void" page shown
		And user presses "OK" button and "Select Adjustment" page shown
		
		# Navigate and validate via the "Select Stock Adjustment Request" page
		And user presses "Requested" button and "Select Stock Adjustment Request" page shown
		And user selects "${Summary Via Requested Page ID}" from "Stock Adjustments Movements List" list
		Then user presses "Select" button and "Adjustment Summary" page shown
		And "Adjustment ID Label" field displays the text "${Summary Via Requested Page ID}"
		And "Reason Label" field displays the text "${Reason Test Add Ava Description}"
		And user presses "Keyboard" icon button and "Keyboard Shown" page shown
		And "Adjustment ID Label" field displays the text "${Summary Via Requested Page ID}"
		And "Reason Label" field displays the text "${Reason Test Add Ava Description}"
		And user presses "Keyboard" icon button and "Keyboard Hidden" page shown
		And user presses "Remove" button and "Adjust Stock Confirm Void" page shown
		And user presses "OK" button and "Select Stock Adjustment Request" page shown
		
		# Signoff
		And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button and "Transaction Basket" page shown
        Then user presses "SignOff" button and "Enter User" page shown
		
	@PT-13006 @INVENTORY @POS @AUTOMATED @ToBeFixedAutTest
	Scenario: Select Reason button
	
		Given user signs on as "Sales Assistant"
	    And user presses "Management" button
		And user presses "Admin" button and "Administration Screen" page shown
		And user presses "Inventory Button" icon button
		And user presses "Adjust Button" icon button
		And user presses "Adjust Stock Button" icon button and "Select Adjustment" page shown
		And user presses "Requested" button and "Select Stock Adjustment Request" page shown
		And user presses "Ad Hoc" button and "Adjustment Summary" page shown
		
		And user presses "Select Adjust Reason" icon button and "Select Reason Options" page shown
		
		And user presses "Back" button and "Adjustment Summary" page shown
		And user presses "Back" button and "Select Stock Adjustment Request" page shown
		And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button and "Transaction Basket" page shown
        Then user presses "SignOff" button and "Enter User" page shown
	
	@PT-13007 @INVENTORY @POS @AUTOMATED
	Scenario: Continue button  
	
		Given user signs on as "Sales Assistant"
	    And user presses "Management" button
		And user presses "Admin" button and "Administration Screen" page shown
		And user presses "Inventory Button" icon button
		And user presses "Adjust Button" icon button
		And user presses "Adjust Stock Button" icon button and "Select Adjustment" page shown
		And user presses "Requested" button and "Select Stock Adjustment Request" page shown
		And user presses "Ad Hoc" button and "Adjustment Summary" page shown
		
		# Button with no reason selected
		And user presses "Continue" button and "Adjustment Summary" page shown
		
		# Button with reason but no items
		And user presses "Select Adjust Reason" icon button and "Select Reason Options" page shown
		And user selects "Write Off" from "Reason List" list
		And user presses "Select" button and "Adjustment Summary" page shown
		Then user presses "Continue" button and "Adjust Summary No Items Alert" page shown
		And user presses "OK" button and "Adjustment Summary" page shown
		Then user presses "Add or Edit Items" button and "Adjustment Items" page shown
		And user presses "Done" button and "Adjustment Summary" page shown
		
		# Button with reason and items selected but no stock available
		Then user presses "Add or Edit Items" button and "Adjustment Items" page shown
		Then user enters "2" into "Input Box" field
		And user presses "ENT" icon button and "Adjust Stock Add Item" page shown
		And user enters "999999" into "Enter Quantity" field
		And user presses "ENT" icon button and "Adjustment Items" page shown
		And user presses "Done" button and "Adjustment Summary" page shown
		Then user presses "Continue" button and "Insufficient Stock Level Message" page shown
		And user presses "OK" button and "This Function Not Allowed" page shown
		And user presses "OK" button and "Enter Authorising User" page shown
		And user presses "Cancel" button and "Adjustment Summary" page shown
	
		# Button with reason and sufficient stock
		Then user presses "Add or Edit Items" button and "Adjustment Items" page shown
		And user presses "Edit Item" button and "Adjust Stock Add Item" page shown
		And user enters "5" into "Enter Quantity" field
		###########################################
		# CURRENTLY THIS UPDATE BUTTON DOESN'T WORK CORRECTLY, TEST WILL HANG HERE, PLAT-30858
		Then user presses "Update" button and "Adjustment Items" page shown
		###########################################
		And user presses "Done" button and "Adjustment Summary" page shown
		And user presses "Continue" button and "Adjustment Confirmation Page" page shown
		And user presses "Remove" button and "Confirmation Confirm Void" page shown
		And user presses "OK" button and "Select Stock Adjustment Request" page shown
		
		And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button and "Transaction Basket" page shown
        Then user presses "SignOff" button and "Enter User" page shown
		
	@PT-13008 @INVENTORY @POS @AUTOMATED @ToBeFixedAutTest
	Scenario: Add or Edit Items button 
		
		Given user signs on as "Sales Assistant"
	    And user presses "Management" button
		And user presses "Admin" button and "Administration Screen" page shown
		And user presses "Inventory Button" icon button
		And user presses "Adjust Button" icon button
		And user presses "Adjust Stock Button" icon button and "Select Adjustment" page shown
		And user presses "Requested" button and "Select Stock Adjustment Request" page shown
		And user presses "Ad Hoc" button and "Adjustment Summary" page shown
		
		# No reason selected
		And user presses "Add or Edit Items" button and "No Reason Selected Alert" page shown
		Then user presses "OK" button and "Adjustment Summary" page shown
		
		And user presses "Select Adjust Reason" icon button and "Select Reason Options" page shown
		And user selects "Write On" from "Reason List" list
		And user presses "Select" button and "Adjustment Summary" page shown
		
		# With reason that allows picking
		Then user presses "Add or Edit Items" button and "Adjustment Items" page shown
		And user presses "Done" button and "Adjustment Summary" page shown
		
		# Button disappears with a non item amendment reason 
		And user presses "Select Adjust Reason" icon button and "Select Reason Options" page shown
		And user selects "Customer Reservation" from "Reason List" list
		And user presses "Select" button and "Adjustment Summary" page shown
		
		And button with label "Add or Edit Items" is not displayed
		
		Then user presses "Back" button and "Select Adjustment" page shown
		And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button and "Transaction Basket" page shown
        Then user presses "SignOff" button and "Enter User" page shown
    	
    @PT-13009 @INVENTORY @POS @AUTOMATED
    Scenario: Suspend button
		
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
		
		And user selects "${Unsubmitted Adjustment Quantity Remove}" from "Unsubmitted Adjustments List" list
		And user presses "Select" button and "Adjustment Summary" page shown
		
		# From Unsubmitted adjustments page
		And user presses "Suspend" button and "Select Adjustment" page shown
		And "${Unsubmitted Adjustment Quantity Remove}" is displayed in "Unsubmitted Adjustments List" list
		
		# Remove adjustment with identifiable data
		And user selects "${Unsubmitted Adjustment Quantity Remove}" from "Unsubmitted Adjustments List" list
		Then user presses "Select" button and "Adjustment Summary" page shown
		And user presses "Remove" button and "Adjust Stock Confirm Void" page shown
		And user presses "OK" button and "Select Adjustment" page shown
		
		# From Requested Adjustments page
		And user presses "Requested" button and "Select Stock Adjustment Request" page shown
		And user selects "${Stock Adjustment 2 ID}" from "Stock Adjustments Movements List" list
		Then user presses "Select" button and "Adjustment Summary" page shown
		
		And "Adjustment ID Label" field displays the text "${Stock Adjustment 2 ID}"
		And "Reason Label" field displays the text "${Reason Test Add Ava Description}"
		And user presses "Suspend" button and "Select Adjustment" page shown
		
		# Remove unsubmitted requested transaction
		And user selects "${Reason Test Add Ava Description}" from "Unsubmitted Adjustments List" list
		Then user presses "Select" button and "Adjustment Summary" page shown
		And user presses "Remove" button and "Adjust Stock Confirm Void" page shown
		And user presses "OK" button and "Select Adjustment" page shown

		And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button and "Transaction Basket" page shown
        Then user presses "SignOff" button and "Enter User" page shown
		
	@PT-13010 @INVENTORY @POS @AUTOMATED @ToBeFixedAutTest
    Scenario: Back button
		
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
		And user presses "Select" button and "Adjustment Summary" page shown
		
		# From Unsubmitted adjustments page
		And user presses "Back" button and "Select Adjustment" page shown
		
		# Remove adjustment with identifiable data
		And user selects "${Unsubmitted Adjustment Quantity Remove}" from "Unsubmitted Adjustments List" list
		Then user presses "Select" button and "Adjustment Summary" page shown
		And user presses "Remove" button and "Adjust Stock Confirm Void" page shown
		And user presses "OK" button and "Select Adjustment" page shown
		
		# From Requested Adjustments page
		And user presses "Requested" button and "Select Stock Adjustment Request" page shown
		And user selects "${Stock Adjustment 2 ID}" from "Stock Adjustments Movements List" list
		Then user presses "Select" button and "Adjustment Summary" page shown
		And user presses "Back" button and "Select Stock Adjustment Request" page shown
		
		# Remove unsubmitted adjustment created from requested adjustment
		And user presses "Back" button and "Select Adjustment" page shown
		And user selects "${Stock Adjustment 2 Quantity}" from "Unsubmitted Adjustments List" list
		Then user presses "Select" button and "Adjustment Summary" page shown
		And user presses "Remove" button and "Adjust Stock Confirm Void" page shown
		And user presses "OK" button and "Administration Screen" page shown
		
		#And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button and "Transaction Basket" page shown
        Then user presses "SignOff" button and "Enter User" page shown
    
    @PT-13011 @INVENTORY @POS @AUTOMATED
    Scenario: Remove button
		
		Given user signs on as "Sales Assistant"
	    And user presses "Management" button
		And user presses "Admin" button and "Administration Screen" page shown
		And user presses "Inventory Button" icon button
		And user presses "Adjust Button" icon button
		And user presses "Adjust Stock Button" icon button and "Select Adjustment" page shown
		Then user presses "Requested" button and "Select Stock Adjustment Request" page shown								
		And user presses "Ad Hoc" button and "Adjustment Summary" page shown
		
		# From Ad Hoc
		And user presses "Remove" button and "Adjust Stock Confirm Void" page shown
		And user presses "OK" button and "Select Stock Adjustment Request" page shown
		
		# From suspended adjustment								
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
		Then user presses "Select" button and "Adjustment Summary" page shown
		And user presses "Remove" button and "Adjust Stock Confirm Void" page shown
		And user presses "OK" button and "Select Adjustment" page shown
		And "${Unsubmitted Adjustment Quantity Remove}" is not displayed in "Unsubmitted Adjustments List" list
		
		And user presses "Cancel" button and "Administration Screen" page shown
		And user presses "Home Button" icon button and "Transaction Basket" page shown
        Then user presses "SignOff" button and "Enter User" page shown
    	