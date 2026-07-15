Feature: Complete Order Transaction

  @PT-637 @Fiscal_order_Delivery_To_Home @No_Printer @Austria @AUTOMATED @Fiscalisation @FiscalAustria
  Scenario: Complete Order - Delivery to home
    Given user signs on as "Austria Fiscal Sales Assistant"
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    Then "Transaction Basket" page is shown
    When user enters "${PRODUCT_FISCAL_AUS_1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    When user enters "Fiscal_Forename" into "Customer Forename Text" field
    And user enters "Fiscal_Surname" into "Customer Surname Text" field
    And user presses "OK" button and "Capture Customer Address" page shown
    Then user enters "Cambridge House" into "Customer Address Line1 Text" field
    And user enters "Bluecoats Avenue" into "Customer Address Line2 Text" field
    And user enters "SG13 8AT" into "Customer Postcode" field
    Then user presses "OK" button and "Capture Customer Phone Email" page shown
    Then user enters "321654987" into "Customer Phone1 Text" field
    And user enters "testfiscalaustria@enactor.co.uk" into "Customer Email Text Optional" field
    Then user presses "OK" button and "Order Delivery Option Panel" page shown
    Then user presses "Address Delivery" button
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
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1319 @Fiscal_order_Collect_At_Store @No_Printer @Austria @AUTOMATED @Fiscalisation @FiscalAustria
  Scenario: Complete Order - Collect At Store
    Given user signs on as "Austria Fiscal Sales Assistant"
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    Then "Transaction Basket" page is shown
    When user enters "${PRODUCT_FISCAL_AUS_1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    When user enters "Fiscal_Forename" into "Customer Forename Text" field
    And user enters "Fiscal_Surname" into "Customer Surname Text" field
    And user presses "OK" button and "Capture Customer Address" page shown
    Then user enters "Cambridge House" into "Customer Address Line1 Text" field
    And user enters "Bluecoats Avenue" into "Customer Address Line2 Text" field
    And user enters "SG13 8AT" into "Customer Postcode" field
    Then user presses "OK" button and "Capture Customer Phone Email" page shown
    Then user enters "321654987" into "Customer Phone1 Text" field
    And user enters "testfiscalaustria@enactor.co.uk" into "Customer Email Text Optional" field
    Then user presses "OK" button and "Order Delivery Option Panel" page shown
    Then user presses "Collect at store" button
    And user presses "Continue" button and "Get Delivery Notifications" page shown
    And user enters "134679852" into "Customer Mobile Text" field
    And user presses "OK" button and "Get Delivery Instructions" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth PromptT" page shown
    And user presses "Skip" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    And "Enter User" page is shown
