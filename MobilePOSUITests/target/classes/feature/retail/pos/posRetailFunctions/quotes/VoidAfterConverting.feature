Feature: Convert a quote & before completing, void transaction and verify the status

  @PT-2045 @VoidQuoteAfterConverting @Quote @POS @AUTOMATED @ManualVerification @TobeFixedAutTest
  Scenario: Convert a quote & before completing, void transaction and verify the status
    Given user signs on as "Pos Operator"
    When user enters "${Sku Product 6}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Capture Customer" button and "Capture Customer Name" page shown
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
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Quotes" button
    And user presses "Quote" button and "Quote Sale" page shown
    And user presses "Complete" button
    And "Transaction Basket" page is shown
    # waits for transaction to appear and proccess in EM
    And user waits "90" seconds
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Quotes" button
    And user presses "Search Quotes" button and "Search Quote" page shown
    #Temporary step to filter by Open status until search by Quote ID is made possible PLAT-14933
    And user selects "Open" from "Quote Status" combobox
    #And user enters "246" into "Input Box" field
    And user presses "OK" button and "Quote Listing" page shown
    Then user presses "OK" button and "Quote Details" page shown
    When user presses "Convert to Order" button and "Convert To Order Prompt" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Quotes" button
    And user presses "Search Quotes" button and "Search Quote" page shown    
    #Temporary step to filter by Open status until search by Quote ID is made possible PLAT-14933
    And user selects "Open" from "Quote Status" combobox   
    #And user enters "246" into "Input Box" field
    And user presses "OK" button and "Quote Listing" page shown    
    Then "Open" is displayed in "Selection List" list
    And user presses "Cancel" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
