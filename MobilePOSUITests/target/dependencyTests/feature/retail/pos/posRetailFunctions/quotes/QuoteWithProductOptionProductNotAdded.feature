Feature: Add product where 'No' is selected from a product option prompt and convert it to an order

  @PT-2017 @QuoteProductOptionProductNotAdded @Quote @DevelopmentInProgress
  Scenario: Add product where 'No' is selected from a product option prompt and convert it to an order
    Given user signs on as "Pos Operator"
    When user enters "${Sku Product 5}" into "Input Box" field
    And user presses "ENT" button and "Product Option" page shown
    And user presses "No" button and "Transaction Basket" page shown
    Then "${Sku Product 5}" is displayed in "Receipt" list
    And "${Fee Product 1}" is not displayed in "Receipt" list
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Quotes" button
    And user presses "Quote" button and "Quote Sale" page shown
    And user presses "Complete" button
    Then "Transaction Basket" page is shown
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Search Quote" button and "Search Quote" page shown
    And user selects "Open" from "Status" combobox
    And user presses "OK" button and "Quote Listing" page shown
    And user presses "OK" button and "Quote Details" page shown
    Then "${Sku Product 5}" is displayed in "Receipt" list    
    And user presses "Convert to Order" button and "Product Option" page shown
    And user presses "No" button and "Transaction Basket" page shown
    And "${Sku Product 5}" is displayed in "Receipt" list
    And "${Fee Product 1}" is not displayed in "Receipt" list
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
    And receipt display with following details
      | item | ${Sku Product 5 Description},£50.00 |      
    And user presses "Close" button on external "Cash Drawer" window
    When "Transaction Basket" page is shown
    Then user presses "SignOff" button
    And "Enter User" page is shown
