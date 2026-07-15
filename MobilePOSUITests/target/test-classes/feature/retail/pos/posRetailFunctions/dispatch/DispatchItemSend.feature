Feature: Dispatch Item - Send

  @PT-4461 @PreSales @DispatchItemSend @POS @AUTOMATED @ReactPos
  Scenario: Dispatch item to customer by selecting 'Send', and the delivery method as 'Express'
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    When user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Dispatch Functions" button
    And user presses "Dispatch" button and "Enter Reference" page shown
    And user presses "OK" button and "Capture Customer Name" page shown
    And user enters "${Customer 1 Name}" into "Customer Forename Text" field
    And user presses "Search By Name" button and "Select Customer" page shown
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Dispatch Address Confirmation" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Item For Dispatch" page shown
    Then "Send" is displayed in "Selection List" list
    When user presses "Complete" button and "Dispatch Delivery Type" page shown
    And user selects "Express" from "Selection List" list
    And user presses "OK" button and "Confirm Delivery Charge" page shown
    And user presses "Continue" button and "Dispatch Instruction" page shown
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-4462 @PreSales @DispatchItemSend @POS @AUTOMATED @ReactPos
  Scenario: Dispatch item to customer by selecting 'Back Order', and the delivery method as 'Volumetric Weight'
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    When user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Dispatch Functions" button
    And user presses "Dispatch" button and "Enter Reference" page shown
    And user presses "OK" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    And user enters "${Customer 1 Name}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Dispatch Address Confirmation" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Item For Dispatch" page shown
    Then "Send" is displayed in "Selection List" list
    When user presses "Back Order" button
    And user presses "Complete" button and "Dispatch Delivery Type" page shown
    And user selects "By Volumetric Weight" from "Selection List" list
    And user presses "OK" button and "Select Delivery Package" page shown
    And user presses "Add Custom" button and "Package Dimension" page shown
    And user enters "10" into "Package Height" field
    And user enters "10" into "Package Depth" field
    And user enters "10" into "Package Width" field
    And user presses "OK" button and "Confirm Packages" page shown
    And user presses "Continue" button and "Get Delivery Charges" page shown
    And user presses "OK" button and "Get Quoted Delivery Charge Amount" page shown
    And user presses "OK" button and "Enter Reference Number" page shown
    And user presses "OK" button and "Dispatch Instruction" page shown
    And user presses "OK" button and "Enter Number Of Chits" page shown
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-19958 @Complete @POS @AUTOMATED
  Scenario: Validate dispatch address confirmation prompt is displayed after a dispatch cancellation
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    When user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Dispatch Functions" button
    And user presses "Dispatch" button and "Enter Reference" page shown
    And user presses "OK" button and "Capture Customer Name" page shown
    And user enters "${Customer 5 Name}" into "Customer Forename Text" field
    And user presses "Search By Name" button and "Select Customer" page shown
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Dispatch Address Confirmation" page shown
    And user presses "Yes" button and "Use Inhouse Forwarder" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    When user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Dispatch Functions" button
    And user presses "Cancel Dispatch" button and "Confirm Dispatch Cancel" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Dispatch Functions" button
    And user presses "Dispatch" button and "Enter Reference" page shown
    And user presses "OK" button and "Confirm Use Customer Name Address" page shown
    And user presses "OK" button and "Dispatch Address Confirmation" page shown
    And user presses "Yes" button and "Use Inhouse Forwarder" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Item For Dispatch" page shown
    When user presses "Complete" button and "Dispatch Delivery Type" page shown
    And user selects "Enactor USA Test" from "Selection List" list
    And user presses "OK" button and "Confirm Delivery Charge" page shown
    And user presses "Continue" button and "Dispatch Instruction" page shown
    And user presses "OK" button and "Enter Number Of Chits" page shown
    And user presses "OK" button and "Select Tender" page shown
    And "${Delivery Charge Product Price}" is displayed in "Receipt" list
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown    
  @PT-16153 @PreSales @Complete @POS @AUTOMATED @ReactPos
  Scenario: Complete the dispatch by selecting complete and the delivery method as Enactor USA Test
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    When user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Dispatch Functions" button
    And user presses "Dispatch" button and "Enter Reference" page shown
    And user presses "OK" button and "Capture Customer Name" page shown
    And user enters "${Customer 5 Name}" into "Customer Forename Text" field
    And user presses "Search By Name" button and "Select Customer" page shown
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Dispatch Address Confirmation" page shown
    And user presses "Yes" button and "Use Inhouse Forwarder" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Item For Dispatch" page shown
    When user presses "Complete" button and "Dispatch Delivery Type" page shown
    And user selects "Enactor USA Test" from "Selection List" list
    And user presses "OK" button and "Confirm Delivery Charge" page shown
    And user presses "Continue" button and "Dispatch Instruction" page shown
    And user presses "OK" button and "Enter Number Of Chits" page shown
    And user presses "OK" button and "Select Tender" page shown
    And "${Delivery Charge Product Price}" is displayed in "Receipt" list
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
