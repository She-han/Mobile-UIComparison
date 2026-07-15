Feature: Customer Credit Account Sale Test
    
  @PT-9213 @POS @AUTOMATED @POSValidatedTest @Sprint40-Week4 @CreditAccountSale @NotForRC1
  Scenario: Perform a Customer Account Sale by Name Search
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Customers" button
    And user presses "Credit Account" button and "Customer Search" page shown
    When user presses "Search By Name" button and "Customer Search By Name" page shown
    And user enters "${Customer 1 Surname}" into "Input Box" field
    And user presses "OK" button and "Select Customer Search By Name" page shown
    And user presses "OK" button and "Enter Payment Service Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    Then the receipt displayed on "Primary Printer" printer with following details
      | text	  	| Customer: ${Customer 1 Name Without Title}           |
      | address   | ${Customer 1 Address}                  		          |
      | text      | Tel: ${Customer 1 Phone No}                           |
    And user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-9214 @POS @AUTOMATED @POSValidatedTest @CreditAccountSale
  Scenario: Perform a Customer Account Sale by Account Search
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Customers" button
    And user presses "Credit Account" button and "Customer Search" page shown
    When user presses "Account Search" icon button 
    And "Customer Account Search" page is shown
    And user enters "${Customer 1 Surname}" into "Customer Account Search Details Surname" field
    And user enters "${Customer 1 Address Postcode}" into "Customer Details Postcode" field
    And user presses "OK" button and "Select Customer Account Search" page shown
    And user presses "OK" button and "Enter Payment Service Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    Then the receipt displayed on "Primary Printer" printer with following details
      | text	  | Customer: ${Customer 1 Name Without Title}            |
      | address   | ${Customer 1 Address}                  		          |
      | text      | Tel: ${Customer 1 Phone No}                         |
    And user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-9215 @POS @AUTOMATED @POSValidatedTest @CreditAccountSale @NotForRC1
  Scenario: Perform a Customer Account Sale by Phone Search
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Customers" button
    And user presses "Credit Account" button and "Customer Search" page shown
    When user presses "Search By Phone Number" button and "Customer Search By Phone" page shown
    And user enters "${Customer 1 Phone No}" into "Input Box" field
    And user presses "OK" button and "Select Customer Search By Phone" page shown
    And user presses "OK" button and "Enter Payment Service Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    Then the receipt displayed on "Primary Printer" printer with following details
      | text	  | Customer: ${Customer 1 Name Without Title}           |
      | address   | ${Customer 1 Address}                  		          |
      | text      | Tel: ${Customer 1 Phone No}                           |
    And user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-9216 @POS @AUTOMATED @POSValidatedTest @CreditAccountSale @NotForRC1
  Scenario: Perform a Customer Account Sale by Postcode Search
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Customers" button
    And user presses "Credit Account" button and "Customer Search" page shown
	And user presses "More" button
    When user presses "Search By Postcode" button and "Customer Search By Postcode" page shown
    And user enters "${Customer 1 Address Postcode}" into "Input Box" field
    And user presses "OK" button and "Select Customer Search By Postcode" page shown
    And user presses "OK" button and "Enter Payment Service Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    Then the receipt displayed on "Primary Printer" printer with following details
      | text	  | Customer: ${Customer 1 Name Without Title}           |
      | address   | ${Customer 1 Address}                  		          |
      | text      | Tel: ${Customer 1 Phone No}                           |
    And user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-9217 @POS @AUTOMATED @POSValidatedTest @CreditAccountSale @NotForRC1
  Scenario: Perform a Customer Account Sale by Email Search 
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Customers" button
    And user presses "Credit Account" button and "Customer Search" page shown
	And user presses "More" button
    When user presses "Search By Email" button and "Customer Search By Email" page shown
    And user enters "${Customer 1 Email}" into "Input Box" field
    And user presses "OK" button and "Select Customer Search By Email" page shown
    And user presses "OK" button and "Enter Payment Service Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    Then the receipt displayed on "Primary Printer" printer with following details
      | text	  | Customer: ${Customer 1 Name Without Title}           |
      | address   | ${Customer 1 Address}                  		          |
      | text      | Tel: ${Customer 1 Phone No}                           |
    And user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-17924 @POS @AUTOMATED @POSValidatedTest @CreditAccountSale @CreditAccountCustomerCapture
  Scenario: Perform a Customer Account Sale and prompted to capture customer details
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Customers" button
    And user presses "Credit Account" button
    And user enters "${Customer Credit Card Number 1}" into "Input Box" field
    And user presses "OK" button
    Then "Capture Customer Name" page is shown
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
    And user enters "SG13 8AT" into "Customer Postcode" field
    And user presses "OK" button
    Then "Capture Customer Phone Email" page is shown
    And user enters "testcustomer@enactor.co.uk" into "Customer Email Text Optional" field
    When user enters "321654987" into "Customer Phone1 Text" field
    And user enters "987456321" into "Customer Phone2 Text" field
    And user enters "654123987" into "Customer Mobile Text" field
    And user enters "789654123" into "Customer Fax Text" field
    And user presses "OK" button and "Enter Payment Service Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

	@PT-20059 @POS @AUTOMATED
   Scenario: Performing void during the customer credit account sale
   	Given user signs on as "Sales Assistant"
   	And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Customer AC" button
    When user presses "Credit Account Payment" button and "Customer Search" page shown
    Then user enters "${Customer Credit Card Number 1}" into "Input Box" field
    And user presses "OK" button and "Enter Payment Amount" page shown
    And user enters "${Customer Credit Card Number 1 Amount}" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "Voids" button
    And user presses "Item Void" button and "Cannot Void Last Item" page shown
    And user presses "Yes" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} 																	|
      | telephone | Tel: ${Store Phone 1}                                 																	|
      | item      | ${Customer Credit Card Number 1 Name},${Customer Credit Card Number 1 Amount}           |
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
    
    