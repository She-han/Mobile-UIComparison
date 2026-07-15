Feature: Quote Listing - verify the details

  @PT-2037 @VerifyQuoteListing @Quote @DevelopmentInProgress
  Scenario: Quote Listing - verify the details
    Given user signs on as "Pos Operator"
    When user enters "${Sku Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button
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
    And user enters "250487" into "Customer Date of Birth Text" field
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
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Quotes" button and "Sell Style Colour Item" page shown
    And user presses "Quote" button and "Quote Sale" page shown
    And user presses "Complete" button
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Quotes" button and "Sell Style Colour Item" page shown
    And user presses "Search Quotes" button and "Search Quotes" page shown
    And user enters "QuoteID" into "QuoteID" field
    When user presses "OK" button and "Quote Listing" page shown
    Then "${Quote Id}" is displayed in "Quote" list
    And "Cust_Forename" is displayed in "Quote" list
    And "Cust_Surname" is displayed in "Quote" list
    And "${Quote Create Date}" is displayed in "Quote" list
    And "SG13 8AT" is displayed in "Quote" list
    And "Pos Operator" is displayed in "Quote" list
    And "Open" is displayed in "Quote" list
    And "£50.00" is displayed in "Quote" list
    And user presses "Cancel" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
