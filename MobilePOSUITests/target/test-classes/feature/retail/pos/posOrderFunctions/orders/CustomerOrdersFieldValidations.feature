Feature: Check field validations in customer capture screen
 
  @PT-8697 @MVP @AUTOMATED @POS @POSValidatedTest @POSSet1 @Regression
  Scenario: Customer Orders flow - Verify validation message when clicking on OK button without entering the Postcode in the Address Capture screen
	 Given user signs on as "Manager 2"
   And user presses "Sales" button
   And user presses "Rich Product Search" button
   And "Rich Product Search" page is shown
   When user enters "${Style Colour Size Product 2}" into "Product Search Input" field
   And user presses "Product Search Button" icon button
   Then "Rich Product Search Result" page is shown
   And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
   And user waits "Product Search Result Item 1" to display
   And user waits "3" seconds
   And user waits "Product Search Result Item 1" to display
   And user presses "Product Search Result Item 1" icon button
   And "Rich Product Details" page is shown
   And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
   And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
   And "Product Price Field" field displays the text "${Style Colour Size Product 2 Price}"
   And user waits "5" seconds
   And user presses "Product Size 1 Button" icon button
   Then user presses "Product Order Product" icon button
   And "Transaction Basket" page is shown
   And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
   And "${Style Colour Size Product 2 Price}" is displayed in "Receipt" list
   And user presses "TOTAL" button and "Capture Customer Name" page shown
   When user enters "Cust_Forename" into "Customer Forename Text" field
   And user enters "Cust_Surname" into "Customer Surname Text" field
   And user enters "Enactor" into "Customer Organisation Text" field
   And user selects "Mr" from "Customer Title Dropdown" combobox
   And user enters "KC" into "Customer Initials Text" field
   And user selects "Male" from "Customer Sex Dropdown" combobox
   And user enters "250487" into "Customer Date of Birth Text" field
   And user presses "OK" button
   Then "Capture Customer Address" page is shown
   And user presses "OK" button
   And "Customer Postcode Error" label displays the text "Required"
   And "Capture Customer Address" page is shown
   And user presses "Cancel" button
   And "Transaction Basket" page is shown
   When user presses "SignOff" button
   Then "Enter User" page is shown
   
  @PT-12275 @AUTOMATED @POS
  Scenario: Place an order which is started from POS. - Single Delivery Options
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    And "Transaction Basket" page is shown
    And user enters "M7JTTH9-11" into "Input Box" field
    And user presses "ENT" button
    And user enters "M7JTTH9-11" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "Mark" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Address Delivery Whole Order" icon button
    And user waits "5" seconds
    And user presses "Collect Whole At Store" icon button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Back" button and "Order Delivery Option Panel" page shown
    And user presses "Address Delivery Whole Order" icon button
    And user waits "5" seconds
    And user presses "Collect Whole At Store" icon button
    And user presses "Address Delivery Whole Order" icon button
    And user presses "Continue" button and "Select Reason" page shown
    And user selects "${Reason 10% Plus Preauth}" from "Selection List" list 
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    And user presses "Skip" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-18208 @AUTOMATED @POS
  Scenario: Validate Default 'Mr.' Title Assigned When Title is Undefined During Customer Details Capture and Delivery Location Change and complete the transaction
	Given user signs on as "Manager 2"
  	And user presses "Sales" button
  	When user presses "More" button
  	And user presses "Customers" button
  	And user presses "Order Functions" button
  	And user presses "Order" button
  	Then "Transaction Basket" page is shown
  	And user presses "Sales" button
  	And user presses "Rich Product Search" button	
	And "Rich Product Search" page is shown
	When user enters "${Style Colour Size Product 2}" into "Product Search Input" field
	And user presses "Product Search Button" icon button
	Then "Rich Product Search Result" page is shown
	And "Product Search Results Input" field displays the text "${Style Colour Size Product 2}"
	And user waits "Product Search Result Item 1" to display
	And user waits "3" seconds
	And user waits "Product Search Result Item 1" to display
	And user presses "Product Search Result Item 1" icon button
	And "Rich Product Details" page is shown
	And "Product Description Field" field displays the text "${Style Colour Size Product 2 Description}"
	And "Product ID Field" field displays the text "PRODUCT NO ${Style Colour Size Product 2}"
	And user presses "Product Size 1 Button" icon button
	Then user presses "Product Order Product" icon button
  	And user waits "2" seconds
  	And "Transaction Basket" page is shown  
  	And "${Style Colour Size Product 2 Description}" is displayed in "Receipt" list
	And user presses "TOTAL" button and "Capture Customer Name" page shown
	And user waits "3" seconds
	And "-" is selected in "Customer Title Dropdown" combobox		
	And user enters "testF" into "Customer Forename Text" field
	And user enters "testS" into "Customer Surname Text" field
	And user enters "Enactor" into "Customer Organisation Text" field
	And user presses "OK" button
  	Then "Capture Customer Address" page is shown
  	And user enters "lane 1" into "Customer Address Line1 Text" field
  	And user enters "${Customer 1 Address Town}" into "Customer Town Text" field
  	And user enters "1234" into "Customer Postcode Field" field
  	And user presses "OK" button   
  	Then "Capture Customer Phone Email" page is shown
  	And user presses "OK" button
  	Then "Order Delivery Option Panel" page is shown
	And user presses "Change address" icon button
	Then "Capture Customer Name Contact" page is shown
	And "-" is selected in "Customer Title" combobox	
  	And "Customer Forename" field displays the text "testF"
	And "Customer Surname" field displays the text "testS"
	And user selects "Mr" from "Customer Title" combobox
	And user presses "OK" button
  	Then "Capture Customer Address" page is shown
  	And user presses "OK" button   
  	Then "Order Delivery Option Panel" page is shown	
  	And user presses "Collect at store" button
  	And user presses "Continue" button and "Get Delivery Notifications" page shown
  	And user presses "Skip" button and "Get Delivery Instructions" page shown
  	And user presses "OK" button and "Select Reason" page shown
  	And user selects "10% plus preauth" from "Selection List" list
  	And user presses "OK" button and "Select Tender" page shown
  	And user presses "Cash" button and "Enter Cash Tender Amount" page shown
  	And user presses "OK" button and "Tender Pre Auth Prompt" page shown
  	Then user presses "Skip" button
  	And receipt display with following details
    	| address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
    	| telephone | Tel: ${Store Phone 1}                                                           |
    	| text      | Store Collection Details                                                        |
    	| item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
    	| text      | On Order                                                                        |
    	| text      | Deposit                                                                         |
  	When user presses "Close" button on external "Cash Drawer" window
  	Then "Transaction Basket" page is shown
  	And user presses "SignOff" button
  	And "Enter User" page is shown         

  @PT-18180 @POSCustomerOrders @POS
  Scenario: Validate Customer order change of Delivery Address and Place the order
  	Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    And user waits "3" seconds
    Then "Transaction Basket" page is shown
    When user enters "${Sku Product 6}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Sku Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user waits "1" seconds
    And "${Sku Product 1 Description}" is displayed in "Receipt" list
    Then "${Sku Product 6 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 1 Name}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user waits "3" seconds
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button
  	And "Order Delivery Option Panel" page is shown
    When user presses "Change address" icon button
    Then "Capture Customer Name Contact" page is shown
		When user presses "OK" button
  	Then "Capture Customer Address" page is shown
		And user presses "Clear Address" button
		When user presses "Postcode Lookup" button and "Address Search by Postcode" page shown
    Then user enters "${Buy From Customer 1 Address Postcode}" into "Input Box" field
    When user presses "OK" button and "Select Address by Postcode" page shown
    And user presses "OK" button
    And user waits "5" seconds
  	Then "Capture Customer Address Prompt" page is shown
  	When user presses "OK" button
  	And "Order Delivery Option Panel" page is shown
    And user presses "Address Delivery Whole Order" icon button
  	And user presses "Continue" button
  	And "Get Delivery Notifications" page is shown
    And user presses "Skip" button and "Get Delivery Instructions" page shown
  	And "Get Delivery Instructions" page is shown
  	And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And "Customer: ${Customer 1 Full Name}" is displayed in "Receipt" list
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    And user presses "Skip" button
    And the receipt displayed on "Primary Printer" printer with following details
      | address   | ${Buy From Customer 1 Address} |
      | telephone | Tel: ${Store Phone 1}          |
      | text      | Home Delivery Details          |
      | text      | Tel: ${Customer 1 Phone No}    |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-22917 @POSCustomerOrders @POS
  Scenario: Verify transaction XML excludes contact information when both consent flags are off and OK is pressed for same address delivery
  	Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    And user waits "3" seconds
    Then "Transaction Basket" page is shown
    When user enters "${Sku Product 6}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Sku Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user waits "1" seconds
    And "${Sku Product 1 Description}" is displayed in "Receipt" list
    Then "${Sku Product 6 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 3 Surname}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user waits "3" seconds
    And user selects "${Customer 3 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button
  	And "Order Delivery Option Panel" page is shown
  	And user presses "Address Delivery Whole Order" icon button
  	And user presses "Continue" button 
  	And "Get Delivery Notifications" page is shown
  	And user presses "Send Email Notifications" checkbox
    And user waits "1" seconds
  	And user presses "Send SMS Notifications" checkbox
    And user waits "1" seconds
  	And user presses "OK" button
  	And "Get Delivery Instructions" page is shown
  	And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # And "" is saved as notificationEmailAddress in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as notificationMobilePhone in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as deliveryStatusRecipientEmail in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as deliveryStatusRecipientMobilePhone in ${retrieveTransaction(1)} transaction XML
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-22918 @POSCustomerOrders @POS
  Scenario: Verify transaction XML excludes contact information when both consent flags are off and Skip is pressed for same address delivery
  	Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    And user waits "3" seconds
    Then "Transaction Basket" page is shown
    When user enters "${Sku Product 6}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Sku Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user waits "1" seconds
    And "${Sku Product 1 Description}" is displayed in "Receipt" list
    Then "${Sku Product 6 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 3 Surname}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user waits "3" seconds
    And user selects "${Customer 3 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button
  	And "Order Delivery Option Panel" page is shown
  	And user presses "Address Delivery Whole Order" icon button
  	And user presses "Continue" button 
  	And "Get Delivery Notifications" page is shown
  	And user presses "Send Email Notifications" checkbox
    And user waits "1" seconds
  	And user presses "Send SMS Notifications" checkbox
    And user waits "1" seconds
  	And user presses "Skip" button
  	And "Get Delivery Instructions" page is shown
  	And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # And "" is saved as notificationEmailAddress in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as notificationMobilePhone in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as deliveryStatusRecipientEmail in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as deliveryStatusRecipientMobilePhone in ${retrieveTransaction(1)} transaction XML
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-22919 @POSCustomerOrders @POS
  Scenario: Verify only email address is added to transaction XML when email is captured and OK is pressed for same address delivery
  	Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    And user waits "3" seconds
    Then "Transaction Basket" page is shown
    When user enters "${Sku Product 6}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Sku Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user waits "1" seconds
    And "${Sku Product 1 Description}" is displayed in "Receipt" list
    Then "${Sku Product 6 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 3 Surname}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user waits "3" seconds
    And user selects "${Customer 3 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button
  	And "Order Delivery Option Panel" page is shown
  	And user presses "Address Delivery Whole Order" icon button
  	And user presses "Continue" button 
  	And "Get Delivery Notifications" page is shown
  	And user enters "notificationmail@encator.co" into "Notification Consent Sender Email" field
  	And user presses "Send SMS Notifications" checkbox
    And user waits "1" seconds
  	And user presses "OK" button
  	And "Get Delivery Instructions" page is shown
  	And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # And "notificationmail@encator.co" is saved as notificationEmailAddress in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as notificationMobilePhone in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as deliveryStatusRecipientEmail in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as deliveryStatusRecipientMobilePhone in ${retrieveTransaction(1)} transaction XML
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-22920 @POSCustomerOrders @POS
  Scenario: Verify transaction XML excludes contact information when email is captured and Skip is pressed for same address delivery
  	Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    And user waits "3" seconds
    Then "Transaction Basket" page is shown
    When user enters "${Sku Product 6}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Sku Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user waits "1" seconds
    And "${Sku Product 1 Description}" is displayed in "Receipt" list
    Then "${Sku Product 6 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 3 Surname}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user waits "3" seconds
    And user selects "${Customer 3 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button
  	And "Order Delivery Option Panel" page is shown
  	And user presses "Address Delivery Whole Order" icon button
  	And user presses "Continue" button 
  	And "Get Delivery Notifications" page is shown
  	And user enters "notificationmail@encator.co" into "Notification Consent Sender Email" field
  	And user presses "Send SMS Notifications" checkbox
    And user waits "1" seconds
  	And user presses "Skip" button
  	And "Get Delivery Instructions" page is shown
  	And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # And "" is saved as notificationEmailAddress in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as notificationMobilePhone in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as deliveryStatusRecipientEmail in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as deliveryStatusRecipientMobilePhone in ${retrieveTransaction(1)} transaction XML
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-22921 @POSCustomerOrders @POS
  Scenario: Verify only phone number is added to transaction XML when phone number is captured and OK is pressed for same address delivery
  	Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    And user waits "3" seconds
    Then "Transaction Basket" page is shown
    When user enters "${Sku Product 6}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Sku Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user waits "1" seconds
    And "${Sku Product 1 Description}" is displayed in "Receipt" list
    Then "${Sku Product 6 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 3 Surname}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user waits "3" seconds
    And user selects "${Customer 3 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button
  	And "Order Delivery Option Panel" page is shown
  	And user presses "Address Delivery Whole Order" icon button
  	And user presses "Continue" button 
  	And "Get Delivery Notifications" page is shown
  	And user presses "Send Email Notifications" checkbox
    And user waits "1" seconds
  	And user enters "789456130" into "Notification Consent Sender Phone" field
  	And user presses "OK" button
  	And "Get Delivery Instructions" page is shown
  	And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # And "" is saved as notificationEmailAddress in ${retrieveTransaction(1)} transaction XML
    # And "789456130" is saved as notificationMobilePhone in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as deliveryStatusRecipientEmail in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as deliveryStatusRecipientMobilePhone in ${retrieveTransaction(1)} transaction XML
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-22922 @POSCustomerOrders @POS
  Scenario: Verify transaction XML excludes contact information when phone number is captured and Skip is pressed for same address delivery
  	Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    And user waits "3" seconds
    Then "Transaction Basket" page is shown
    When user enters "${Sku Product 6}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Sku Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user waits "1" seconds
    And "${Sku Product 1 Description}" is displayed in "Receipt" list
    Then "${Sku Product 6 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 3 Surname}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user waits "3" seconds
    And user selects "${Customer 3 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button
  	And "Order Delivery Option Panel" page is shown
  	And user presses "Address Delivery Whole Order" icon button
  	And user presses "Continue" button 
  	And "Get Delivery Notifications" page is shown
  	And user presses "Send Email Notifications" checkbox
    And user waits "1" seconds
  	And user enters "${Customer 1 Phone No}" into "Notification Consent Sender Phone" field
  	And user presses "Skip" button
  	And "Get Delivery Instructions" page is shown
  	And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # And "" is saved as notificationEmailAddress in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as notificationMobilePhone in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as deliveryStatusRecipientEmail in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as deliveryStatusRecipientMobilePhone in ${retrieveTransaction(1)} transaction XML
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-22923 @POSCustomerOrders @POS
  Scenario: Verify both email and phone number are added to transaction XML when both are captured and OK is pressed for same address delivery
  	Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    And user waits "3" seconds
    Then "Transaction Basket" page is shown
    When user enters "${Sku Product 6}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Sku Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user waits "1" seconds
    And "${Sku Product 1 Description}" is displayed in "Receipt" list
    Then "${Sku Product 6 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 3 Surname}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user waits "3" seconds
    And user selects "${Customer 3 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button
  	And "Order Delivery Option Panel" page is shown
  	And user presses "Address Delivery Whole Order" icon button
  	And user presses "Continue" button 
  	And "Get Delivery Notifications" page is shown
  	And user enters "notificationmail@encator.co" into "Notification Consent Sender Email" field
  	And user enters "789456130" into "Notification Consent Sender Phone" field
  	And user presses "OK" button
  	And "Get Delivery Instructions" page is shown
  	And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # And "notificationmail@encator.co" is saved as notificationEmailAddress in ${retrieveTransaction(1)} transaction XML
    # And "789456130" is saved as notificationMobilePhone in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as deliveryStatusRecipientEmail in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as deliveryStatusRecipientMobilePhone in ${retrieveTransaction(1)} transaction XML
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-22924 @POSCustomerOrders @POS
  Scenario: Verify transaction XML excludes contact information when both email and phone number are captured and Skip is pressed for same address delivery
  	Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    And user waits "3" seconds
    Then "Transaction Basket" page is shown
    When user enters "${Sku Product 6}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Sku Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user waits "1" seconds
    And "${Sku Product 1 Description}" is displayed in "Receipt" list
    Then "${Sku Product 6 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 3 Surname}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user waits "3" seconds
    And user selects "${Customer 3 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button
  	And "Order Delivery Option Panel" page is shown
  	And user presses "Address Delivery Whole Order" icon button
  	And user presses "Continue" button 
  	And "Get Delivery Notifications" page is shown
  	And user enters "notificationmail@encator.co" into "Notification Consent Sender Email" field
  	And user enters "789456130" into "Notification Consent Sender Phone" field
  	And user presses "Skip" button
  	And "Get Delivery Instructions" page is shown
  	And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # And "" is saved as notificationEmailAddress in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as notificationMobilePhone in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as deliveryStatusRecipientEmail in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as deliveryStatusRecipientMobilePhone in ${retrieveTransaction(1)} transaction XML
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-22925 @POSCustomerOrders @POS
  Scenario: Verify only courier contact information is added to transaction XML when both consent flags are off and OK is pressed for different address delivery
  	Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    And user waits "3" seconds
    Then "Transaction Basket" page is shown
    When user enters "${Sku Product 6}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Sku Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user waits "1" seconds
    And "${Sku Product 1 Description}" is displayed in "Receipt" list
    Then "${Sku Product 6 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 1 Name}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user waits "3" seconds
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button
  	And "Order Delivery Option Panel" page is shown
    When user presses "Change address" icon button
    Then "Capture Customer Name Contact" page is shown
		When user presses "OK" button
  	Then "Capture Customer Address" page is shown
		And user presses "Clear Address" button
		When user presses "Postcode Lookup" button and "Address Search by Postcode" page shown
    Then user enters "${Buy From Customer 1 Address Postcode}" into "Input Box" field
    When user presses "OK" button and "Select Address by Postcode" page shown
    And user presses "OK" button
    And user waits "5" seconds
  	Then "Capture Customer Address Prompt" page is shown
  	When user presses "OK" button
  	And "Order Delivery Option Panel" page is shown
  	And user presses "Address Delivery Whole Order" icon button
  	And user presses "Continue" button
	  And "Order Country from Postcode" page is shown
	  And user presses "OK" button
  	And "Get Delivery Notifications" page is shown
  	And user presses "Send Email Notifications" checkbox
    And user waits "1" seconds
  	And user presses "Send SMS Notifications" checkbox
    And user waits "1" seconds
  	And user enters "courierupdates@enactor.co" into "Notification Consent Recipient Email" field
  	And user enters "7891234560" into "Notification Consent Recipient Phone" field
  	And user presses "OK" button
  	And "Get Delivery Instructions" page is shown
  	And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # And "" is saved as notificationEmailAddress in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as notificationMobilePhone in ${retrieveTransaction(1)} transaction XML
    # And "courierupdates@enactor.co" is saved as deliveryStatusRecipientEmail in ${retrieveTransaction(1)} transaction XML
    # And "7891234560" is saved as deliveryStatusRecipientMobilePhone in ${retrieveTransaction(1)} transaction XML
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-22926 @POSCustomerOrders @POS
  Scenario: Verify transaction XML excludes all contact information when both consent flags are off and Skip is pressed for different address delivery
  	Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    And user waits "3" seconds
    Then "Transaction Basket" page is shown
    When user enters "${Sku Product 6}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Sku Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user waits "1" seconds
    And "${Sku Product 1 Description}" is displayed in "Receipt" list
    Then "${Sku Product 6 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 1 Name}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user waits "3" seconds
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button
  	And "Order Delivery Option Panel" page is shown
    When user presses "Change address" icon button
    Then "Capture Customer Name Contact" page is shown
		When user presses "OK" button
  	Then "Capture Customer Address" page is shown
		And user presses "Clear Address" button
		When user presses "Postcode Lookup" button and "Address Search by Postcode" page shown
    Then user enters "${Buy From Customer 1 Address Postcode}" into "Input Box" field
    When user presses "OK" button and "Select Address by Postcode" page shown
    And user presses "OK" button
    And user waits "5" seconds
  	Then "Capture Customer Address Prompt" page is shown
  	When user presses "OK" button
  	And "Order Delivery Option Panel" page is shown
  	And user presses "Address Delivery Whole Order" icon button
  	And user presses "Continue" button
	  And "Order Country from Postcode" page is shown
	  And user presses "OK" button
  	And "Get Delivery Notifications" page is shown
  	And user presses "Send Email Notifications" checkbox
    And user waits "1" seconds
  	And user presses "Send SMS Notifications" checkbox
    And user waits "1" seconds
  	And user presses "Skip" button
  	And "Get Delivery Instructions" page is shown
  	And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # And "" is saved as notificationEmailAddress in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as notificationMobilePhone in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as deliveryStatusRecipientEmail in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as deliveryStatusRecipientMobilePhone in ${retrieveTransaction(1)} transaction XML
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-22927 @POSCustomerOrders @POS
  Scenario: Verify email address and courier contact information are added to transaction XML when email is captured and OK is pressed for different address delivery
  	Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    And user waits "3" seconds
    Then "Transaction Basket" page is shown
    When user enters "${Sku Product 6}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Sku Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user waits "1" seconds
    And "${Sku Product 1 Description}" is displayed in "Receipt" list
    Then "${Sku Product 6 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 1 Name}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user waits "3" seconds
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button
  	And "Order Delivery Option Panel" page is shown
    When user presses "Change address" icon button
    Then "Capture Customer Name Contact" page is shown
		When user presses "OK" button
  	Then "Capture Customer Address" page is shown
		And user presses "Clear Address" button
		When user presses "Postcode Lookup" button and "Address Search by Postcode" page shown
    Then user enters "${Buy From Customer 1 Address Postcode}" into "Input Box" field
    When user presses "OK" button and "Select Address by Postcode" page shown
    And user presses "OK" button
    And user waits "5" seconds
  	Then "Capture Customer Address Prompt" page is shown
  	When user presses "OK" button
  	And "Order Delivery Option Panel" page is shown
  	And user presses "Address Delivery Whole Order" icon button
  	And user presses "Continue" button
	  And "Order Country from Postcode" page is shown
	  And user presses "OK" button
  	And "Get Delivery Notifications" page is shown
  	And user enters "notificationmail@encator.co" into "Notification Consent Sender Email" field
  	And user presses "Send SMS Notifications" checkbox
    And user waits "1" seconds
  	And user enters "courierupdates@enactor.co" into "Notification Consent Recipient Email" field
  	And user enters "7891234560" into "Notification Consent Recipient Phone" field
  	And user presses "OK" button
  	And "Get Delivery Instructions" page is shown
  	And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # And "notificationmail@encator.co" is saved as notificationEmailAddress in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as notificationMobilePhone in ${retrieveTransaction(1)} transaction XML
    # And "courierupdates@enactor.co" is saved as deliveryStatusRecipientEmail in ${retrieveTransaction(1)} transaction XML
    # And "7891234560" is saved as deliveryStatusRecipientMobilePhone in ${retrieveTransaction(1)} transaction XML
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-22928 @POSCustomerOrders @POS
  Scenario: Verify email address and courier contact information are added to transaction XML when email is captured and Skip is pressed for different address delivery
  	Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    And user waits "3" seconds
    Then "Transaction Basket" page is shown
    When user enters "${Sku Product 6}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Sku Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user waits "1" seconds
    And "${Sku Product 1 Description}" is displayed in "Receipt" list
    Then "${Sku Product 6 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 1 Name}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user waits "3" seconds
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button
  	And "Order Delivery Option Panel" page is shown
    When user presses "Change address" icon button
    Then "Capture Customer Name Contact" page is shown
		When user presses "OK" button
  	Then "Capture Customer Address" page is shown
		And user presses "Clear Address" button
		When user presses "Postcode Lookup" button and "Address Search by Postcode" page shown
    Then user enters "${Buy From Customer 1 Address Postcode}" into "Input Box" field
    When user presses "OK" button and "Select Address by Postcode" page shown
    And user presses "OK" button
    And user waits "5" seconds
  	Then "Capture Customer Address Prompt" page is shown
  	When user presses "OK" button
  	And "Order Delivery Option Panel" page is shown
  	And user presses "Address Delivery Whole Order" icon button
  	And user presses "Continue" button
	  And "Order Country from Postcode" page is shown
	  And user presses "OK" button
  	And "Get Delivery Notifications" page is shown
  	And user enters "notificationmail@encator.co" into "Notification Consent Sender Email" field
  	And user presses "Send SMS Notifications" checkbox
    And user waits "1" seconds
  	And user enters "courierupdates@enactor.co" into "Notification Consent Recipient Email" field
  	And user enters "7891234560" into "Notification Consent Recipient Phone" field
  	And user presses "Skip" button
  	And "Get Delivery Instructions" page is shown
  	And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # And "" is saved as notificationEmailAddress in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as notificationMobilePhone in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as deliveryStatusRecipientEmail in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as deliveryStatusRecipientMobilePhone in ${retrieveTransaction(1)} transaction XML
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-22929 @POSCustomerOrders @POS
  Scenario: Verify phone number and courier contact information are added to transaction XML when phone number is captured and OK is pressed for different address delivery
  	Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    And user waits "3" seconds
    Then "Transaction Basket" page is shown
    When user enters "${Sku Product 6}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Sku Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user waits "1" seconds
    And "${Sku Product 1 Description}" is displayed in "Receipt" list
    Then "${Sku Product 6 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 1 Name}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user waits "3" seconds
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button
  	And "Order Delivery Option Panel" page is shown
    When user presses "Change address" icon button
    Then "Capture Customer Name Contact" page is shown
		When user presses "OK" button
  	Then "Capture Customer Address" page is shown
		And user presses "Clear Address" button
		When user presses "Postcode Lookup" button and "Address Search by Postcode" page shown
    Then user enters "${Buy From Customer 1 Address Postcode}" into "Input Box" field
    When user presses "OK" button and "Select Address by Postcode" page shown
    And user presses "OK" button
    And user waits "5" seconds
  	Then "Capture Customer Address Prompt" page is shown
  	When user presses "OK" button
  	And "Order Delivery Option Panel" page is shown
  	And user presses "Address Delivery Whole Order" icon button
  	And user presses "Continue" button
	  And "Order Country from Postcode" page is shown
	  And user presses "OK" button
  	And "Get Delivery Notifications" page is shown
  	And user presses "Send Email Notifications" checkbox
    And user waits "1" seconds
  	And user enters "789456130" into "Notification Consent Sender Phone" field
  	And user enters "courierupdates@enactor.co" into "Notification Consent Recipient Email" field
  	And user enters "7891234560" into "Notification Consent Recipient Phone" field
  	And user presses "OK" button
  	And "Get Delivery Instructions" page is shown
  	And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # And "" is saved as notificationEmailAddress in ${retrieveTransaction(1)} transaction XML
    # And "789456130" is saved as notificationMobilePhone in ${retrieveTransaction(1)} transaction XML
    # And "courierupdates@enactor.co" is saved as deliveryStatusRecipientEmail in ${retrieveTransaction(1)} transaction XML
    # And "7891234560" is saved as deliveryStatusRecipientMobilePhone in ${retrieveTransaction(1)} transaction XML
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-22930 @POSCustomerOrders @POS
  Scenario: Verify transaction XML excludes contact information when phone number is captured and Skip is pressed for different address delivery
  	Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    And user waits "3" seconds
    Then "Transaction Basket" page is shown
    When user enters "${Sku Product 6}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Sku Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user waits "1" seconds
    And "${Sku Product 1 Description}" is displayed in "Receipt" list
    Then "${Sku Product 6 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 1 Name}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user waits "3" seconds
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button
  	And "Order Delivery Option Panel" page is shown
    When user presses "Change address" icon button
    Then "Capture Customer Name Contact" page is shown
		When user presses "OK" button
  	Then "Capture Customer Address" page is shown
		And user presses "Clear Address" button
		When user presses "Postcode Lookup" button and "Address Search by Postcode" page shown
    Then user enters "${Buy From Customer 1 Address Postcode}" into "Input Box" field
    When user presses "OK" button and "Select Address by Postcode" page shown
    And user presses "OK" button
    And user waits "5" seconds
  	Then "Capture Customer Address Prompt" page is shown
  	When user presses "OK" button
  	And "Order Delivery Option Panel" page is shown
  	And user presses "Address Delivery Whole Order" icon button
  	And user presses "Continue" button
	  And "Order Country from Postcode" page is shown
	  And user presses "OK" button
  	And "Get Delivery Notifications" page is shown
  	And user presses "Send Email Notifications" checkbox
    And user waits "1" seconds
  	And user enters "789456130" into "Notification Consent Sender Phone" field
  	And user enters "courierupdates@enactor.co" into "Notification Consent Recipient Email" field
  	And user enters "7891234560" into "Notification Consent Recipient Phone" field
  	And user presses "Skip" button
  	And "Get Delivery Instructions" page is shown
  	And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # And "" is saved as notificationEmailAddress in ${retrieveTransaction(1)} transaction XML
    # And "789456130" is saved as notificationMobilePhone in ${retrieveTransaction(1)} transaction XML
    # And "courierupdates@enactor.co" is saved as deliveryStatusRecipientEmail in ${retrieveTransaction(1)} transaction XML
    # And "7891234560" is saved as deliveryStatusRecipientMobilePhone in ${retrieveTransaction(1)} transaction XML
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-22931 @POSCustomerOrders @POS
  Scenario: Verify both email and phone number with courier contact information are added to transaction XML when both are captured and OK is pressed for different address delivery
  	Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    And user waits "3" seconds
    Then "Transaction Basket" page is shown
    When user enters "${Sku Product 6}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Sku Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user waits "1" seconds
    And "${Sku Product 1 Description}" is displayed in "Receipt" list
    Then "${Sku Product 6 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 1 Name}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user waits "3" seconds
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button
  	And "Order Delivery Option Panel" page is shown
    When user presses "Change address" icon button
    Then "Capture Customer Name Contact" page is shown
		When user presses "OK" button
  	Then "Capture Customer Address" page is shown
		And user presses "Clear Address" button
		When user presses "Postcode Lookup" button and "Address Search by Postcode" page shown
    Then user enters "${Buy From Customer 1 Address Postcode}" into "Input Box" field
    When user presses "OK" button and "Select Address by Postcode" page shown
    And user presses "OK" button
    And user waits "5" seconds
  	Then "Capture Customer Address Prompt" page is shown
  	When user presses "OK" button
  	And "Order Delivery Option Panel" page is shown
  	And user presses "Address Delivery Whole Order" icon button
  	And user presses "Continue" button
	  And "Order Country from Postcode" page is shown
	  And user presses "OK" button
  	And "Get Delivery Notifications" page is shown
  	And user enters "notificationmail@encator.co" into "Notification Consent Sender Email" field
  	And user enters "789456130" into "Notification Consent Sender Phone" field
  	And user enters "courierupdates@enactor.co" into "Notification Consent Recipient Email" field
  	And user enters "7891234560" into "Notification Consent Recipient Phone" field
  	And user presses "OK" button
  	And "Get Delivery Instructions" page is shown
  	And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # And "notificationmail@encator.co" is saved as notificationEmailAddress in ${retrieveTransaction(1)} transaction XML
    # And "789456130" is saved as notificationMobilePhone in ${retrieveTransaction(1)} transaction XML
    # And "courierupdates@enactor.co" is saved as deliveryStatusRecipientEmail in ${retrieveTransaction(1)} transaction XML
    # And "7891234560" is saved as deliveryStatusRecipientMobilePhone in ${retrieveTransaction(1)} transaction XML
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-22932 @POSCustomerOrders @POS
  Scenario: Verify transaction XML excludes contact information when both email and phone number are captured and Skip is pressed for different address delivery
  	Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    And user waits "3" seconds
    Then "Transaction Basket" page is shown
    When user enters "${Sku Product 6}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Sku Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user waits "1" seconds
    And "${Sku Product 1 Description}" is displayed in "Receipt" list
    Then "${Sku Product 6 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 1 Name}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user waits "3" seconds
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button
  	And "Order Delivery Option Panel" page is shown
    When user presses "Change address" icon button
    Then "Capture Customer Name Contact" page is shown
		When user presses "OK" button
  	Then "Capture Customer Address" page is shown
		And user presses "Clear Address" button
		When user presses "Postcode Lookup" button and "Address Search by Postcode" page shown
    Then user enters "${Buy From Customer 1 Address Postcode}" into "Input Box" field
    When user presses "OK" button and "Select Address by Postcode" page shown
    And user presses "OK" button
    And user waits "5" seconds
  	Then "Capture Customer Address Prompt" page is shown
  	When user presses "OK" button
  	And "Order Delivery Option Panel" page is shown
  	And user presses "Address Delivery Whole Order" icon button
  	And user presses "Continue" button
	  And "Order Country from Postcode" page is shown
	  And user presses "OK" button
  	And "Get Delivery Notifications" page is shown
  	And user enters "notificationmail@encator.co" into "Notification Consent Sender Email" field
  	And user enters "789456130" into "Notification Consent Sender Phone" field
  	And user enters "courierupdates@enactor.co" into "Notification Consent Recipient Email" field
  	And user enters "7891234560" into "Notification Consent Recipient Phone" field
  	And user presses "Skip" button
  	And "Get Delivery Instructions" page is shown
  	And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # And "" is saved as notificationEmailAddress in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as notificationMobilePhone in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as deliveryStatusRecipientEmail in ${retrieveTransaction(1)} transaction XML
    # And "" is saved as deliveryStatusRecipientMobilePhone in ${retrieveTransaction(1)} transaction XML
    When user presses "SignOff" button
    Then "Enter User" page is shown  
    
  @PT-17472 @POS @AUTOMATED @Regression
  Scenario: Verify that Product which is selected to deliver as Take Now is not visible in the transaction basket
  when clicking the Back button of the "Would the customer like to receive Delivery Status Message?" page
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    And user enters "${SKU Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${SKU Product 8}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${SKU Product 1 Description}" is displayed in "Receipt" list
    And "${SKU Product 1 Price}" is displayed in "Receipt" list
    And "${SKU Product 6 Description}" is displayed in "Receipt" list
    And "${SKU Product 6 Price}" is displayed in "Receipt" list
    And "${SKU Product 8 Description}" is displayed in "Receipt" list
    And "${SKU Product 8 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 1 Name}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user waits "2" seconds
    And user presses "Item 1 Collect At Store" icon button
    And user presses "Item 2 Delivery to Home" icon button
    And user presses "Item 3 Take Now" icon button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user presses "Back" button and "Order Delivery Option Panel" page shown
    #Verify that Product which is selected to deliver as Take Now is not visible
    And user confirms "Delivery Option Item 3 Description" not display
    And user presses "Cancel" button and "Transaction Basket" page shown
    And user waits "2" seconds
    Then user presses "TOTAL" button and "Order Delivery Option Panel" page shown
    And user presses "Address Delivery Whole Order" icon button
    Then user presses "Continue" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    Then user presses "OK" button and "Tender Pre Auth Prompt" page shown
    Then user presses "Skip" button and "Transaction Basket" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown