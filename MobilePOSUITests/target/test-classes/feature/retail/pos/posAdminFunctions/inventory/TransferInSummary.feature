Feature: Transfer In Summary

  @PT-9319 @POS @POSSet1 @MVP @AUTOMATED @Sprint41-Week5
  Scenario: Verify the number of containers are displaying in the transfer in Summary via expected path
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Receive" icon button
    And user presses "Transfer In" icon button
    And "Unsubmited Transfer In" page is shown
    And user presses "Expected" button and "Select Expected Transfer In" page shown
    And user selects "ID_VIEW_TEST_3" from "Expected Transfer In Requests List" list
    When user presses "Select" button
    And "Transfer In Summary" page is shown
    And user presses "Edit Items" button and "Transfer In Edit Items" page shown
    And user presses "Add Container" button and "Transfer In Container" page shown
    And user presses "Add" button and "Transfer In Add Container" page shown
    And user enters "Test_Container_41" into "Name" field
    And user enters "TC41" into "Container Id" field
    And user presses "Edit Items" button and "Transfer In Container Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button
    And "Transfer Out Quantity Entry" page is shown
    And user enters "5" into "Enter Quantity" field
    And user presses "Add" button
    And "Transfer In Container Items" page is shown
    And user presses "Done" button and "Transfer In Edit Items" page shown
    And user presses "Add Container" button and "Transfer In Container" page shown
    And user presses "Add" button and "Transfer In Add Container" page shown
    And user enters "Test_Container_42" into "Name" field
    And user enters "TC42" into "Container Id" field
    And user presses "Edit Items" button and "Transfer In Container Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button
    And "Transfer Out Quantity Entry" page is shown
    And user enters "5" into "Enter Quantity" field
    And user presses "Add" button
    And "Transfer In Container Items" page is shown
    And user presses "Done" button and "Transfer In Edit Items" page shown
    And user presses "Add Container" button and "Transfer In Container" page shown
    And user presses "Add" button and "Transfer In Add Container" page shown
    And user enters "Test_Container_43" into "Name" field
    And user enters "TC43" into "Container Id" field
    And user presses "Edit Items" button and "Transfer In Container Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button
    And "Transfer Out Quantity Entry" page is shown
    And user enters "5" into "Enter Quantity" field
    And user presses "Add" button
    And "Transfer In Container Items" page is shown
    And user presses "Done" button and "Transfer In Edit Items" page shown
    And "(TC41)" is displayed in "item list" list
    And "(TC42)" is displayed in "item list" list
    And "(TC43)" is displayed in "item list" list
    And user presses "Done" button
    Then "Delivery Header Summary" page is shown
    And "3" is displayed in "Number of Containers Cell" panel
    And user presses "Back" button and "Select Expected Transfer In" page shown
    And user presses "Back" button and "Unsubmited Transfer In" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-9320 @POS @POSSet1 @MVP @AUTOMATED @Sprint41-Week5
  Scenario: Verify the number of containers are displaying in the transfer in Summary via unsubmitted path
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Receive" icon button
    And user presses "Transfer In" icon button
    And "Unsubmited Transfer In" page is shown
    And user presses "Expected" button and "Select Expected Transfer In" page shown
    And user presses "Ad Hoc" button and "Expected Transfer In Select Delivery" page shown
    And user presses "Location Ad Hoc" button and "Delivery Header Summary" page shown
    And user presses "Back" button and "Expected Transfer In Select Delivery" page shown
    And user presses "Back" button and "Select Expected Transfer In" page shown
    And user presses "Back" button and "Unsubmited Transfer In" page shown
    When user presses "Select" button
    And "Transfer In Summary" page is shown
    And user presses "Edit Items" button and "Transfer In Edit Items" page shown
    And user presses "Add Container" button and "Transfer In Container" page shown
    And user presses "Add" button and "Transfer In Add Container" page shown
    And user enters "Test_Container_41" into "Name" field
    And user enters "TC41" into "Container Id" field
    And user presses "Edit Items" button and "Transfer In Container Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button
    And "Transfer Out Quantity Entry" page is shown
    And user enters "5" into "Enter Quantity" field
    And user presses "Add" button
    And "Transfer In Container Items" page is shown
    And user presses "Done" button and "Transfer In Edit Items" page shown
    And user presses "Add Container" button and "Transfer In Container" page shown
    And user presses "Add" button and "Transfer In Add Container" page shown
    And user enters "Test_Container_42" into "Name" field
    And user enters "TC42" into "Container Id" field
    And user presses "Edit Items" button and "Transfer In Container Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button
    And "Transfer Out Quantity Entry" page is shown
    And user enters "5" into "Enter Quantity" field
    And user presses "Add" button
    And "Transfer In Container Items" page is shown
    And user presses "Done" button and "Transfer In Edit Items" page shown
    And user presses "Add Container" button and "Transfer In Container" page shown
    And user presses "Add" button and "Transfer In Add Container" page shown
    And user enters "Test_Container_43" into "Name" field
    And user enters "TC43" into "Container Id" field
    And user presses "Edit Items" button and "Transfer In Container Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button
    And "Transfer Out Quantity Entry" page is shown
    And user enters "5" into "Enter Quantity" field
    And user presses "Add" button
    And "Transfer In Container Items" page is shown
    And user presses "Done" button and "Transfer In Edit Items" page shown
    And "(TC41)" is displayed in "item list" list
    And "(TC42)" is displayed in "item list" list
    And "(TC43)" is displayed in "item list" list
    And user presses "Done" button
    Then "Delivery Header Summary" page is shown
    And "3" is displayed in "Number of Containers Cell" panel
    And user presses "Back" button and "Unsubmited Transfer In" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-9321 @POS @POSSet1 @MVP @AUTOMATED
  Scenario: Verify the accuracy of the Date Ordered and Date Expected displayed in the Transfer In Summary via unsubmitted path
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Receive" icon button
    And user presses "Transfer In" icon button
    And "Unsubmited Transfer In" page is shown
    And user presses "Expected" button and "Select Expected Transfer In" page shown
    When user presses "Ad Hoc" button and "Expected Transfer In Select Delivery" page shown
    And user presses "Location Ad Hoc" button and "Delivery Header Summary" page shown
    And user presses "Back" button and "Expected Transfer In Select Delivery" page shown
    And user presses "Back" button and "Select Expected Transfer In" page shown
    And user presses "Back" button and "Unsubmited Transfer In" page shown
    And user presses "Select" button
    Then "Transfer In Summary" page is shown
    #unable fulfil the test requirement
    #need to support verifying current date with 'today' keyword
    And "Transfer In Created Date" field displays the text "#{today}"
    And user presses "Back" button and "Unsubmited Transfer In" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-9322 @POS @POSSet1 @MVP @AUTOMATED @Sprint41-Week5
  Scenario: Verify the accuracy of the Date Ordered and Date Dispatched displayed in the Transfer In Summary via expected path
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Receive" icon button
    And user presses "Transfer In" icon button
    And "Unsubmited Transfer In" page is shown
    When user presses "Expected" button and "Select Expected Transfer In" page shown
    And user selects "ID_VIEW_TEST_3" from "Expected Transfer In Requests List" list
    And user presses "Select" button
    Then "Transfer In Summary" page is shown
    And "Transfer In Created Date" field displays the text "17/06/21"
    And "Transfer In Dispatched Date" field displays the text "17/06/21"
    And user presses "Back" button and "Expected Transfer In Select Delivery" page shown
    And user presses "Back" button and "Unsubmited Transfer In" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
