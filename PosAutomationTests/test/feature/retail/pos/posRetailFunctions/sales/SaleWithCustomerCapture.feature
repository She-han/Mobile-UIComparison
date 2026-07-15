Feature: Sale with Customer Capture

  @PT-1061 @SaleWithCustomerCapture @POS @AUTOMATED @POSValidatedTest @POSSet3 @NotForRC1
  Scenario: Sale with customer capture
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Capture Customer" button
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
    And user waits "Button 1" to display
    And user presses "Skip" button
    Then "Transaction Basket" page is shown
    And "Mr Cust_Forename Cust_Surname" is displayed in "Receipt" list
    And "${Loyalty Customer 1 Full Address}" is displayed in "Receipt" list
    And "Oak Grove" is displayed in "Receipt" list
    And "Hertford SG13 8AT" is displayed in "Receipt" list
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

  @PT-14965 @SaleWithCustomerCapture @POS @AUTOMATED
  Scenario: Capture Customer - Search By Name and complete a transaction
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Capture Customer" button
    Then "Capture Customer Name" page is shown
    When user presses "Search By Name" button
    Then "Enter Search Name" page is shown
    And user enters "Mark" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 1 Name Without Title}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Transaction Basket" page shown
    And "Customer: Mr Mark Harrison" is displayed in "Receipt" list
    And "Address: 1 Enactor House Bluecoats Avenue" is displayed in "Receipt List" list
    And "Hertford SG141PB" is displayed in "Receipt List" list
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 3 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
	| address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
	| telephone | Tel: ${Store Phone 1}                                 |
	| text      | Customer: Mark Harrison                  |
	| item      | ${Product 3 Description},${Product 3 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown