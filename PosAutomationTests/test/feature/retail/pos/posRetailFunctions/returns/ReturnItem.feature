Feature: Return With NonMerchandise Item using Item Return
  
  @PT-13458 @AUTOMATED @POS @POSValidatedTest @POSSet4 @ToBeFixedAutTest
  Scenario: Perform a complete NonMerchandise Item Return
    Given user signs on as "POS Operator"
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    When user enters "${Product Non Merchandise}" into "Input Box" field
    And user presses "Return Item" button and "Select Reason" page shown
    And user selects "${Return Damaged Reason}" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "No" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And "${Product Non Merchandise Description}" is displayed in "Receipt" list
    And "Ret Reason: ${Return Damaged Reason}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then the receipt displayed on "Primary Printer" printer with following details
      | text | Refund 																	|
      | text | R ${Product Non Merchandise Description} |
      | text | ${Product Non Merchandise Refund Price} 	|
      | text | Refund Cash UK 													|
      | text | ${Product Non Merchandise Price} 				|
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
    @PT-14165 @AUTOMATED @POS @ToBeFixedAutTest
   Scenario: Item Return using Product Search when the price of the item is not configured 
    Given user signs on as "POS Operator 9"
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user presses "Product Search" button and "Select Product" page shown
    When user enters "${Product 92}" into "Input Box" field
    And "${Product 92}" is displayed in "Selection List" list
    And user selects "${Product 92}" from "Selection List" list
    And user presses "Return" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Enter Coded Price" page shown
    And user enters "5000" into "Input Box" field
    And user presses "ENT" button
    And user presses "No" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And "${Product 92 Description}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then the receipt displayed on "Primary Printer" printer with following details
      | text | Refund 																	|
      | text | R ${Product 92 Description}                       -£50.00 |
      | text | Refund Cash UK 													|
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

	@PT-14288 @AUTOMATED @POS 
   Scenario: Verify that State field is available in address capture screen when doing a item return for a customer belongs to USA
    Given user signs on as "Sales Assistant"
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "Return Item" button and "Select Reason" page shown
    And user selects "Change of Mind - Capture Details" from "Selection List" list
    And user presses "OK" button and "Capture Customer Name" page shown
    When user enters "Cust_Forename" into "Customer Forename Text" field
    And user enters "Cust_Surname" into "Customer Surname Text" field
    And user enters "Enactor" into "Customer Organisation Text" field
    And user selects "Mr" from "Customer Title Dropdown" combobox
    And user enters "KC" into "Customer Initials Text" field
    And user selects "Male" from "Customer Sex Dropdown" combobox
    And user enters "25/04/87" into "Customer Date of Birth Text" field
    And user presses "OK" button
    Then "Capture Customer Address" page is shown
    When user enters "Cambridge House" into "Customer Address Line1 Text" field
    And user enters "Bluecoats Avenue" into "Customer Address Line2 Text" field
    And user enters "Oak Grove" into "Customer Address Line3 Text" field
    And user enters "Hertford" into "Customer Town Text" field
    And user enters "Herts" into "Customer County Text" field
    And user selects "USA" from "Customer Address Country Dropdown" combobox
    And user selects "California" from "Customer Address Province" combobox
    And user enters "SG13 8AT" into "Customer Postcode" field
    And user presses "OK" button
    Then "Capture Customer Phone Email" page is shown
    And user enters "testcustomer@enactor.co.uk" into "Customer Email Text Optional" field
    When user enters "321654987" into "Customer Phone1 Text" field
    And user enters "987456321" into "Customer Phone2 Text" field
    And user enters "654123987" into "Customer Mobile Text" field
    And user enters "789654123" into "Customer Fax Text" field
    And user waits "Button 1" to display
    And user presses "Skip" button
    Then "Capture Return Original Tender" page shown
    And user enters "Test Capture Tender and Return Information " into "Notes Text" field
    And user presses "OK" button and "Capture Return Original Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "No" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And "Mr Cust_Forename Cust_Surname" is displayed in "Receipt" list
    And "Cambridge House Bluecoats Avenue" is displayed in "Receipt" list
    And "Oak Grove" is displayed in "Receipt" list
    And "Hertford CA SG13 8AT" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "Ret Reason: Change of Mind - Capture Details" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Customer: Cust_Forename Cust_Surname                  |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
   @PT-16643 @AUTOMATED @POS  
   Scenario: Returning an item through Product Search
    Given user signs on as "Sales Assistant"
    And user presses "Returns" button
    And user presses "Return Item" button  
    And "Enter Return Item" page is shown
    When user presses "ENT" button
    Then "Invalid Product Code" page is shown
    When user presses "OK" button
    Then "Enter Return Item" page is shown
    When user presses "Product Search" button
    Then "Select Product" page is shown
    When user enters "${Product 80}" into "Input Box" field
    Then "${Product 80}" is displayed in "Selection List" list
    When user selects "${Product 80 Description}" from "Selection List" list	
    And user presses "View" button
    Then "Display Product Details" page is shown
    When user presses "RETURN" button
    Then "Select Reason" page is shown
    When user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown  
    And user presses "No" button and "Transaction Basket" page shown
    Then "Refund" is displayed in "Receipt" list
    And "Return" is displayed in "Receipt" list  
    And "${Product 80 Description}" is displayed in "Receipt" list
    And "-${Product 80 Price}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Refund Item" page shown
    When user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

   @PT-16644 @AUTOMATED @POS  
   Scenario: Return item Product search additional filters   
    Given user signs on as "Sales Assistant"
    And user presses "Returns" button
    And user presses "Return Item" button
    And "Enter Return Item" page is shown    
    When user presses "ENT" button
    Then "Invalid Product Code" page is shown
    When user presses "OK" button
    Then "Enter Return Item" page is shown
    When user presses "Product Search" button 
    Then "Select Product" page is shown		
    And user presses "Additional Filters" button and "Product Filters" page shown
    And user enters "${Product 3 Description}" into "Product Search Description Filter" field
    And user presses "OK" button
    Then "Select Product" page is shown
    Then "${Product 3}" is displayed in "Selection List" list
    When user selects "${Product 3 Description}" from "Selection List" list  
    And user presses "View" button
    And "Display Product Details" page is shown
    When user presses "Return Button" icon button
    Then "Select Reason" page is shown
    When user selects "Returned Unwanted" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Return" is displayed in "Receipt" list
    And "-${Product 3 Price}" is displayed in "Receipt" list
    And "Ret Reason: Returned Unwanted" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Refund Item" page shown
    When user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
     | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
     | telephone | Tel: ${Store Phone 1}                                 |
     | text      | Refund                                                |
     | item 		 | R ${Product 3 Description},-${Product 3 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

   @PT-16645 @AUTOMATED @POS
   Scenario: Verify a user is able to cancel a return          
    Given user signs on as "POS Operator"
    And user presses "Returns" button
    And user presses "Return Item" button
    And "Enter Return Item" page is shown        
    And user presses "Cancel" button
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown    
    
   @PT-16773 @AUTOMATED @POS 
   Scenario: Item Return Reasons - with Capture Original Tender and Capture Return Information flags
   	Given user signs on as "POS Operator"
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    When user enters "${Product Non Merchandise}" into "Input Box" field
    And user presses "Return Item" button and "Select Reason" page shown
    And user selects "Capture Tender and Return Information" from "Selection List" list
    And user presses "OK" button and "Return Information" page shown
    And user enters "Test Capture Tender and Return Information " into "Notes Text" field
    And user presses "OK" button and "Capture Return Original Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "No" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And "${Product Non Merchandise Description}" is displayed in "Receipt" list
    And "Ret Reason: Capture Tender and Return Information" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Refund 																	|
      | text | ${Product Non Merchandise Refund Price} 	|
      | text | Refund Cash UK 													|
      | text | ${Product Non Merchandise Price} 				|
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

   @PT-16638 @AUTOMATED @POS
   Scenario: Item Return capture Customer - Search by phone    
    Given user signs on as "POS Operator"
    And user presses "Returns" button
    And user presses "Return Item" button
    And "Enter Return Item" page is shown
    When user presses "ENT" button
    Then "Invalid Product Code" page is shown
    When user presses "OK" button
    Then "Enter Return Item" page is shown
    When user presses "Product Search" button
    Then "Select Product" page is shown
    When user enters "${Product 3 Description}" into "Input Box" field
    Then "${Product 3 Description}" is displayed in "Selection List" list
    And user selects "${Product 3 Description}" from "Selection List" list
    And user presses "View" button
    And "Display Product Details" page is shown
    When user presses "RETURN" button
    Then "Select Reason" page is shown
    When user selects "${Return Capture Details Reason}" from "Selection List" list
    Then user presses "OK" button and "Capture Customer Name" page shown   
    And user presses "Search By Phone Number" button
    And "Enter Phone" page is shown    
    And user enters "${Customer 1 Phone No}" into "Input Box" field
    And user presses "OK" button and "Select Customer Phone" page shown
    And user presses "OK" button
    And "Confirm Customer" page is shown
    And user presses "Confirm" button and "Return Information" page shown
    And user presses "OK" button and "Capture Return Original Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "No" button and "Transaction Basket" page shown    
    And "Transaction Basket" page is shown
    And "Return" is displayed in "Receipt" list
    And "Customer: ${Customer 1 Full Name}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

   @PT-16641 @AUTOMATED @POS
   Scenario: Item Return capture Customer - Search by postcode    
    Given user signs on as "POS Operator"
    And user presses "Returns" button
    And user presses "Return Item" button
    And "Enter Return Item" page is shown
    When user presses "ENT" button
    Then "Invalid Product Code" page is shown
    When user presses "OK" button
    Then "Enter Return Item" page is shown
    When user presses "Product Search" button
    Then "Select Product" page is shown
    When user enters "${Product 3 Description}" into "Input Box" field
    Then "${Product 3 Description}" is displayed in "Selection List" list
    And user selects "${Product 3 Description}" from "Selection List" list
    And user presses "View" button
    And "Display Product Details" page is shown
    When user presses "RETURN" button
    Then "Select Reason" page is shown
    When user selects "${Return Capture Details Reason}" from "Selection List" list
    Then user presses "OK" button and "Capture Customer Name" page shown   
    And user presses "Search By Postcode" button
    And "Enter Post Code" page is shown    
    And user enters "${Customer 1 Address Postcode}" into "Input Box" field
    And user presses "OK" button and "Select Customer Postcode" page shown
    And user presses "OK" button
    And "Confirm Customer" page is shown
    And user presses "Confirm" button and "Return Information" page shown
    And user presses "OK" button and "Capture Return Original Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "No" button and "Transaction Basket" page shown    
    And "Transaction Basket" page is shown
    And "Return" is displayed in "Receipt" list
    And "Customer: ${Customer 1 Full Name}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

    @PT-16640 @AUTOMATED @POS
    Scenario: Item Return Capture Customer - Search by Capture Loyalty Card Number    
    Given user signs on as "POS Operator"
    And user presses "Returns" button
    And user presses "Return Item" button
    And "Enter Return Item" page is shown
    When user presses "ENT" button
    Then "Invalid Product Code" page is shown
    When user presses "OK" button
    Then "Enter Return Item" page is shown
    When user presses "Product Search" button
    Then "Select Product" page is shown
    When user enters "${Product 3 Description}" into "Input Box" field
    Then "${Product 3 Description}" is displayed in "Selection List" list
    And user selects "${Product 3 Description}" from "Selection List" list
    And user presses "View" button
    And "Display Product Details" page is shown
    When user presses "RETURN" button
    Then "Select Reason" page is shown
    When user selects "${Return Capture Details Reason}" from "Selection List" list
    Then user presses "OK" button and "Capture Customer Name" page shown   
    And user presses "Capture Loyalty" button
    And "Loyalty Account Enquiry" page is shown    
    And user enters "${Customer 1 Loyalty No}" into "Input Box" field
    And user presses "OK" button and "Loyalty Account Details" page shown
    And user presses "OK" button
    And "Confirm Use Customer Name Address" page is shown
    And user presses "OK" button and "Return Information" page shown
    And user presses "OK" button and "Capture Return Original Tender" page shown
    And user selects "${Return Tender Cash UK}" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "No" button and "Transaction Basket" page shown    
    And "Transaction Basket" page is shown
    And "Return" is displayed in "Receipt" list
    And "Customer: ${Customer 1 Full Name}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user selects "${Return Tender Cash UK}" from "Selection List" list
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-16639 @AUTOMATED @POS
  Scenario: Item Return capture Customer - Search by email    
    Given user signs on as "POS Operator"
    And user presses "Returns" button
    And user presses "Return Item" button
    And "Enter Return Item" page is shown
    When user presses "ENT" button
    Then "Invalid Product Code" page is shown
    When user presses "OK" button
    Then "Enter Return Item" page is shown
    When user presses "Product Search" button
    Then "Select Product" page is shown
    When user enters "${Product 3 Description}" into "Input Box" field
    Then "${Product 3 Description}" is displayed in "Selection List" list
    And user selects "${Product 3 Description}" from "Selection List" list
    And user presses "View" button
    And "Display Product Details" page is shown
    When user presses "RETURN" button
    Then "Select Reason" page is shown
    When user selects "${Return Capture Details Reason}" from "Selection List" list
    Then user presses "OK" button and "Capture Customer Name" page shown   
    And user presses "Search By Email" button
    And "Capture Email Address" page is shown    
    And user enters "${Customer 1 Email}" into "Input Box" field
    And user presses "OK" button and "Select Email Customer" page shown
    And user presses "OK" button
    And "Confirm Customer" page is shown
    And user presses "Confirm" button and "Return Information" page shown
    And user presses "OK" button and "Capture Return Original Tender" page shown
    And user selects "${Return Tender Cash UK}" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "No" button and "Transaction Basket" page shown    
    And "Transaction Basket" page is shown
    And "Return" is displayed in "Receipt" list
    And "Customer: ${Customer 1 Full Name}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user selects "${Return Tender Cash UK}" from "Selection List" list
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown                 