Feature: Create quote with multiple items and convert it

  @PT-1978 @QuoteWithMultipleItems @Quote @DevelopmentInProgress
  Scenario: Create quote with multiple items and convert it
    Given user signs on as "Pos Operator"
    When user presses "Sales" button
    And user presses "QTY Sale" button
    Then "Enter Qty" page is shown
    When user enters "3" into "Input Box" field
    And user presses "OK" button
    And "Enter Item" page is shown
    And user enters "${Sku Product 1}" into "Input Box" field
    And user presses "Sell Item" button
    Then "Transaction Basket" page is shown
    When user enters "${Sku Product 2}" into "Input Box" field
    And user presses "ENT" button
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
    Then "Transaction Basket" page is shown
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Quotes" button and "Sell Style Colour Item" page shown
    And user presses "Search Quotes" button and "Search Quotes" page shown
    And user selects "Open" from "Status" list
    And user presses "OK" button and "Quote Listing" page shown
    And user presses "OK" button and "Quote Details" page shown
    Then "${Sku Product 1 Description}" is displayed in "Receipt" list
    And "${Sku Product 2 Description}" is displayed in "Receipt" list
    When user presses "Covert to Order" button and "Covert to Order prompt" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user enters "Cust_Forename" into "Customer Forename Text" field
    And user enters "Cust_Surname" into "Customer Surname Text" field
    And user presses "OK" button
    And "Capture Customer Address" page is shown
    And user enters "Cambridge House" into "Customer Address Line1 Text" field
    And user enters "Bluecoats Avenue" into "Customer Address Line2 Text" field
    And user enters "SG13 8AT" into "Customer Postcode" field
    And user presses "OK" button
    And "Capture Customer Phone Email" page is shown
    And user enters "321654987" into "Customer Phone1 Text" field
    And user enters "testcustomer@enactor.co.uk" into "Customer Email Text Optional" field
    And user presses "OK" button and "Order Delivery Option Panel" page shown
    And user presses "Address Delivery" button
    And user presses "Continue" button and "Capture Customer Name Contact" page shown
    And user presses "OK" button and "Capture Customer Address" page shown
    And user presses "OK" button and "Get Delivery Notifications" page shown
    And user presses "OK" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
    | item      | Sku Product 1 Description},${Sku Product 1 Price}           |
    | item      | Sku Product 2 Description},${Sku Product 2 Price}           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
