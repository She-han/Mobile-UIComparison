Feature: Transfer In

  @PT-1855 @MVP @POS @AUTOMATED
  Scenario: Verify container details on Verify Container page for an Expected Transfer
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Receive" icon button
    And user presses "Transfer In" icon button
    And "Select Receipt Prompt" page is shown
    And user presses "Expected" button and "Select Delivery" page shown
    And user selects "DISPATCH_TO_CONFIRM" from "Expected Transfer In Requests List" list
    And user presses "Select" button and "Delivery Header Summary" page shown
    And user presses "Edit Items" button and "Transfer In Edit Items" page shown
    And "CONTAINER_1000" is displayed in "Transfer In Edit Field" list
    And "${SKU Product 6}" is displayed in "Transfer In Edit Field" list
    When user presses "Verify Container" button and "Transfer In Verify Container" page shown
    #bug: display wrong details in the fields
    #And "Dispatch Id" field displays the text "TI00000018"
    #And "Request Id" field displays the text "DIST_ORD_TO_CONFIRM"
    And "Container Id" field displays the text "CONTAINER_1000"
    #bug: displaying container id instead container name
    #And "Container Name" field displays the text "CONTAINER_1000"
    And user presses "Done" button
    Then "Transfer In Edit Items" page is shown
    And user presses "Done" button and "Delivery Header Summary" page shown
    And user presses "Back" button and "Select Delivery" page shown
    And user presses "Back" button and "Select Receipt Prompt" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1846 @MVP @POS @AUTOMATED
  Scenario: Verify Containers Only checkbox in Items screen via Expected Transfer In list
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Receive" icon button
    And user presses "Transfer In" icon button
    And "Select Receipt Prompt" page is shown
    And user presses "Expected" button and "Select Delivery" page shown
    And user selects "DISPATCH_TO_CONFIRM" from "Expected Transfer In Requests List" list
    And user presses "Select" button and "Delivery Header Summary" page shown
    And user presses "Edit Items" button and "Transfer In Edit Items" page shown
    #bug: container id displayed instead container name
    And "CONTAINER_1000" is displayed in "Transfer In Edit Field" list
    #counts are verified in one instructions in reverse order
    And "1 10 10" is displayed in "Transfer In Edit Field" list
    And "No Container" is displayed in "Transfer In Edit Field" list
    And "1 5 5" is displayed in "Transfer In Edit Field" list
    And "${SKU Product 6}" is displayed in "Transfer In Edit Field" list
    When user presses "Containers Only" checkbox
    #bug: container id displayed instead container name
    Then "CONTAINER_1000" is displayed in "Transfer In Edit Field" list
    #counts are verified in one instructions in reverse order
    And "10 10 1" is displayed in "Transfer In Edit Field" list
    And "- No Container" is displayed in "Transfer In Edit Field" list
    And "5 5 1" is displayed in "Transfer In Edit Field" list
    And "${SKU Product 6}" is not displayed in "Transfer In Edit Field" list
    And user waits "1" seconds
    # REVERSE VERIFICATION
    When user presses "Containers Only" checkbox
    Then "1 10 10" is displayed in "Transfer In Edit Field" list
    And "No Container" is displayed in "Transfer In Edit Field" list
    And "1 5 5" is displayed in "Transfer In Edit Field" list
    And "${SKU Product 6}" is displayed in "Transfer In Edit Field" list
    And user presses "Done" button and "Delivery Header Summary" page shown
    And user presses "Back" button and "Select Delivery" page shown
    And user presses "Back" button and "Select Receipt Prompt" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1843 @MVP @POS @AUTOMATED
  Scenario: Verify Container details in Transfer In Confirmation page of an Expected Transfer In
   Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button 
    And user presses "Receive" icon button
    And user presses "Transfer In" icon button
    And "Select Receipt Prompt" page is shown
    And user presses "Expected" button and "Select Delivery" page shown
    And user selects "DISPATCH_TO_CONFIRM" from "Expected Transfer In Requests List" list
    And user presses "Select" button and "Delivery Header Summary" page shown
    When user presses "Continue" button
    Then "Transfer In Confirmation" page is shown
    #bug: container id displayed instead container name
    And "(CONTAINER_1000)" is displayed in "Transfer In Confirmation List" list
    #counts are verified in one instructions in reverse order
    And "1 10 10" is displayed in "Transfer In Confirmation List" list
    And "No Container" is displayed in "Transfer In Confirmation List" list
    And "1 5 5" is displayed in "Transfer In Confirmation List" list
    And user presses "Back" button and "Delivery Header Summary" page shown
    And user presses "Back" button and "Select Delivery" page shown
    And user presses "Back" button
    And user waits "5" seconds 
    And "Select Receipt Prompt" page is shown   
    And user presses "Cancel" button and "Administration Screen" page shown    
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1856 @MVP @POS @AUTOMATED
  Scenario: Verify a Transfer In confirmation when adding a new container through POS - via Expected Transfer In list
    Given user signs on as "Sales Assistant Tr"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Receive" icon button
    And user presses "Transfer In" icon button
    And "Select Receipt Prompt" page is shown
    And user presses "Expected" button and "Select Delivery" page shown
    When user selects "DISPATCH_TO_CONFIR_1" from "Expected Transfer In Requests List" list
    And user presses "Select" button and "Delivery Header Summary" page shown    
    And user presses "Edit Items" button and "Transfer In Edit Items" page shown
    And user presses "Add Container" button and "Transfer In Container" page shown
    And user enters "CONTAINER_1243" into "Input Box" field
    And user presses "Add" button and "Transfer In Add Container" page shown
    And user enters "Container 1243" into "Name" field
    And user presses "Edit Items" button and "Transfer In Container Items" page shown
    And user enters "${SKU Product 1}" into "Input Box" field
    And user presses "Add Item" button and "Transfer In Quantify Item" page shown
    And user enters "7" into "Enter Quantity" field
    And user enters "notes" into "NOTES" field
    And user presses "Add" button and "Transfer In Container Items" page shown
    And "${SKU Product 1}" is displayed in "Items List" list
    And "${SKU Product 1 Description} 0 7" is displayed in "Items List" list
    And user presses "Done" button and "Transfer In Edit Items" page shown
    And "Container 1243" is displayed in "Transfer In Edit Field" list
    #counts are verified in one instructions in reverse order
    And "1 0 7" is displayed in "Transfer In Edit Field" list
    And "${SKU Product 1}" is displayed in "Transfer In Edit Field" list
    And user presses "Done" button and "Delivery Header Summary" page shown
    And user presses "Continue" button and "Transfer In Confirmation" page shown
    And "Container 1243" is displayed in "Transfer In Confirmation List" list
    #counts are verified in one instructions in reverse order
    And "1 0 7" is displayed in "Transfer In Confirmation List" list
    # Submit
    And user presses "Confirm" button and "Transfer In Confirm" page shown
    And user presses "OK" button
    And "Select Delivery" page is shown
    And user presses "Back" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1845 @MVP @POS @AUTOMATED
  Scenario: Verify receiving (to confirm) an Expected Transfer that has a Container
    Given user signs on as "Sales Assistant Tr"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Receive" icon button
    And user presses "Transfer In" icon button
    And "Select Receipt Prompt" page is shown
    And user presses "Expected" button and "Select Delivery" page shown
    And user selects "DISPATCH_TO_CONFIRM" from "Expected Transfer In Requests List" list
    And user presses "Select" button and "Delivery Header Summary" page shown
    # Add Items to the Container    
    And user presses "Edit Items" button and "Transfer In Edit Items" page shown
    And "CONTAINER_1000" is displayed in "Transfer In Edit Field" list
    And "${SKU Product 6}" is displayed in "Transfer In Edit Field" list
    When user presses "Verify Container" button and "Transfer In Verify Container" page shown
    And user presses "Done" button and "Transfer In Edit Items" page shown
    And user presses "Done" button and "Delivery Header Summary" page shown
    And user presses "Continue" button and "Transfer In Confirmation" page shown
    # Submit
    And user presses "Confirm" button and "Transfer In Confirm" page shown
    And user presses "OK" button
    And "Select Delivery" page is shown
    And user presses "Back" button and "Administration Screen" page shown  
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown    
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1857 @MVP @POS @AUTOMATED
  Scenario: Verify whether the user can proceed an unsubmitted Expected Transfer In when container is available
    Given user signs on as "Sales Assistant Tr"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Receive" icon button
    And user presses "Transfer In" icon button
    And "Select Receipt Prompt" page is shown
    And user presses "Expected" button and "Select Delivery" page shown
    And user selects "DISPATCH_RESU_TEST_1" from "Expected Transfer In Requests List" list
    And user presses "Select" button and "Delivery Header Summary" page shown
    And user presses "Continue" button and "Transfer In Confirmation" page shown
    And user presses "Back" button and "Delivery Header Summary" page shown
    And user presses "Back" button and "Select Delivery" page shown
    And user presses "Back" button and "Select Receipt Prompt" page shown
    When user selects "DISPATCH_RESU_TEST_1" from "Unsubmitted Transfer In List" list
    And user presses "Select" button and "Transfer In Summary" page shown
    # RESUME THE TRANSACTION
    And "Transfer In Order Id" field displays the text "DO_RESUME_TEST_1"
    And "Transfer In Source" field displays the text "Estate Manager"
    And "Transfer In Dispatch Id" field displays the text "DISPATCH_RESU_TEST_1"
    # Verify Items
    And user presses "Edit Items" button and "Transfer In Edit Items" page shown
    #bug: container id displayed instead container name
    And "CONTAINER_2000" is displayed in "Item List" list
    #counts are verified in one instructions in reverse order
    # | Container 1 | Dispatched 10 | Received 10 |
    And "1 10 10" is displayed in "Item List" list
    And "${SKU Product 6}" is displayed in "Item List" list
    And "${SKU Product 6 Description}" is displayed in "Item List" list
    # | Dispatched 10 | Received 10 |
    And "10 10" is displayed in "Item List" list
    And user presses "Verify Container" button and "Transfer In Verify Container" page shown
    #bug: display wrong details in the fields
    #And "Dispatch Id" field displays the text "TI00000018"
    #And "Request Id" field displays the text "DIST_ORD_TO_CONFIRM"
    And "Container Id" field displays the text "CONTAINER_2000"
    #bug: container id displayed instead container name
    And "Container Name" field displays the text "CONTAINER_2000"
    And "${SKU Product 6}" is displayed in "Items List" list
    And "${SKU Product 6 Description}" is displayed in "Items List" list
    # | Dispatched 10 | Received 10 |
    And "10 10" is displayed in "Items List" list
    And user presses "Back" button and "Transfer In Edit Items" page shown
    And user presses "Done" button and "Transfer In Summary" page shown
    And user presses "Continue" button and "Transfer In Confirmation" page shown
    And "${SKU Product 6}" is displayed in "Transfer In Confirmation List" list
    And "${SKU Product 6 Description}" is displayed in "Transfer In Confirmation List" list
    And "10 10" is displayed in "Transfer In Confirmation List" list
    # Submit
    And user presses "Confirm" button and "Transfer In Confirm" page shown
    And user presses "OK" button
    And "Select Receipt Prompt" page is shown
    And user presses "Cancel" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown    
    
  @PT-284 @MVP @POS @POSSet1 @AUTOMATED
  Scenario: Verify whether the user can proceed an unsubmitted Expected transfer-in - no container
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Receive" icon button    
    And user presses "Transfer In" icon button
    And "Select Receipt Prompt" page is shown    
    And user presses "Expected" button and "Select Delivery" page shown
    And user selects "DISPATCH_RESUME_TEST" from "Expected Transfer In Requests List" list
    And user presses "Select" button and "Delivery Header Summary" page shown
    And user presses "Continue" button and "Transfer In Confirmation" page shown
    And user presses "Back" button and "Delivery Header Summary" page shown
    And user presses "Back" button and "Select Delivery" page shown
    And user presses "Back" button and "Select Receipt Prompt" page shown
    When user selects "DISPATCH_RESUME_TEST" from "Unsubmitted Transfer In List" list
    And user presses "Select" button and "Transfer In Summary" page shown
    And user presses "Continue" button and "Transfer In Confirmation" page shown
    And "${SKU Product 6}" is displayed in "Transfer In Confirmation List" list   
    # Submit
    And user presses "Confirm" button and "Transfer In Confirm" page shown
    And user presses "OK" button
    And "Select Receipt Prompt" page is shown
    And user presses "Cancel" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown     
    And user presses "SignOff" button
    And "Enter User" page is shown       

  @PT-287 @MVP @POS @POSSet1 @AUTOMATED
  Scenario: Transfer In - Verify whether the user can reject the dispatch using POS (Order Flow)
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Receive" icon button
    When user presses "Transfer In" icon button
    And "Unsubmited Transfer In" page is shown
    And user presses "Expected" button and "Select Expected Transfer In" page shown
    And user selects "DISPATCH_TO_REJECT" from "Expected Transfer In List" list
    And user presses "Select" button
    And "Transfer In Summary" page is shown
    And user presses "Continue" button and "Transfer In Confirmation" page shown
    And user presses "Reject" button and "Confirm Reject" page shown
    And user presses "OK" button and "Unsubmited Transfer In" page shown
    And user presses "Cancel" button
    And "Administration Screen" page is shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  # UNSUBMITTED TRANSFER IN TESTS
  @DUNE-1312 @MVP @POS @AUTOMATED
  Scenario: Validate that user can create LOCATION ad-hoc transfer in
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Receive" icon button
    And user presses "Transfer In" icon button
    And "Unsubmited Transfer In" page is shown
    And user presses "Expected" button and "Select Expected Transfer In" page shown
    When user presses "Ad Hoc" button and "Expected Transfer In Select Delivery" page shown
    And user presses "Location Ad Hoc" button and "Transfer In Summary" page shown
    And user enters "LOC_ADHOC_TRANSFER" into "Transfer In Order Id" field
    # Select Source Location
    And user presses "Select Location" icon button
    And "Select Transfer In Location" page is shown
    And user selects "Enactor Store" from "Source Location List" list
    And user presses "Select" button and "Transfer In Summary" page shown
    And user presses "Edit Items" button and "Transfer In Edit Items" page shown
    And user presses "Add Container" button and "Transfer In Container" page shown
    And user enters "LOC_TRANSFER_IN_CON" into "Input Box" field
    And user presses "Add" button and "Transfer In Add Container" page shown
    And user enters "Loc Adhoc Cont" into "name" field
    # Add Items   
    And user presses "Edit Items" button and "Transfer In Container Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "Add Item" button and "Transfer In Quantify Item" page shown
    And user enters "10" into "Enter Quantity" field
    And user enters "Test last" into "NOTES" field
    And user presses "Add" button and "Transfer In Container Items" page shown
    And "${SKU Product 6}" is displayed in "Items List" list
    # | Dispatched 0| Received 10|
    And "${SKU Product 6 Description} 0 10" is displayed in "Items List" list
    And user presses "Done" button and "Transfer In Edit Items" page shown
    And "10 0 1 Loc Adhoc Cont (LOC_TRANSFER_IN_CON)" is displayed in "Item List" list
    And "10 0 ${SKU Product 6 Description} ${SKU Product 6}" is displayed in "Item List" list
    And user presses "Done" button and "Transfer In Summary" page shown
    And user presses "Continue" button and "Transfer In Confirmation" page shown
    And "10 0 1 Loc Adhoc Cont (LOC_TRANSFER_IN_CON)" is displayed in "Transfer In Confirmation List" list
    And "10 0 ${SKU Product 6 Description} ${SKU Product 6}" is displayed in "Transfer In Confirmation List" list
    # Submit
    And user presses "Confirm" button and "Transfer In Confirm" page shown
    And user presses "OK" button
    Then "Transfer In Failed To Print Document" page is shown
    And user presses "OK" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @DUNE-1313 @MVP @POS @AUTOMATED
  Scenario: Validate that user can create SUPPLIER Ad-hoc transfer in
    Given user signs on as "Sales Assistant"
    And user presses "Management" button    
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Receive" icon button
    When user presses "Transfer In" icon button
    And "Unsubmited Transfer In" page is shown
    And user presses "Expected" button and "Select Expected Transfer In" page shown
    And user presses "Ad Hoc" button and "Expected Transfer In Select Delivery" page shown
    And user presses "Supplier Ad Hoc" button and "Transfer In Summary" page shown
    And user enters "SUP_ADHOC_TRANSFER" into "Transfer In Order Id" field
    # Select Supplier    
    And user presses "Select Supplier" icon button
    And "Select Transfer In Supplier" page is shown
    And user selects "Brand 1 Supplier" from "Supplier List" list
    And user presses "Select" button and "Transfer In Summary" page shown
    # Add Items    
    And user presses "Edit Items" button and "Transfer In Supplier Receipt Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "Add Item" button and "Transfer In Quantify Item" page shown
    And user enters "10" into "Enter Quantity" field
    And user enters "notes" into "NOTES" field
    And user presses "Add" button and "Transfer In Supplier Receipt Items" page shown
    And "${SKU Product 6}" is displayed in "Item List" list
    And "${SKU Product 6 Description}" is displayed in "Item List" list   
    # | Dispatched 0| Received 10|
    And "10 0" is displayed in "Item List" list
    And user selects "${SKU Product 6}" from "Transfer In Edit Field" list
    And user presses "Modify Item" button and "Transfer In Quantify Item" page shown
    And user enters "20" into "Enter Quantity" field
    And user enters "notes modified" into "NOTES" field
    And user presses "Update" button and "Transfer In Supplier Receipt Items" page shown
    # | Dispatched 0| Received 20|
    And "20 0" is displayed in "Item List" list
    And "${SKU Product 6 Description} ${SKU Product 6}" is displayed in "Item List" list
    And user presses "Done" button and "Transfer In Summary" page shown
    And user presses "Continue" button and "Transfer In Confirmation" page shown
    And "20 0 ${SKU Product 6 Description} ${SKU Product 6}" is displayed in "Transfer In Confirmation List" list
    # Submit    
    And user presses "Confirm" button and "Transfer In Confirm" page shown
    And user presses "OK" button
    Then "Transfer In Failed To Print Document" page is shown
    And user presses "OK" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-9317 @MVP @POS @AUTOMATED
  Scenario: Validate a user can submit an unsubmitted Ad Hoc Transfer In
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Receive" icon button
    And user presses "Transfer In" icon button
    And "Unsubmited Transfer In" page is shown
    And user presses "Expected" button and "Select Expected Transfer In" page shown
    And user presses "Ad Hoc" button and "Expected Transfer In Select Delivery" page shown
    And user presses "Location Ad Hoc" button and "Transfer In Summary" page shown
    And user enters "TRANSFER_RESUMED" into "Transfer In Order Id" field
    # Select Source Location
    And user presses "Select Location" icon button
    And "Select Transfer In Location" page is shown
    And user selects "Enactor Store" from "Source Location List" list
    And user presses "Select" button and "Transfer In Summary" page shown
    And user presses "Edit Items" button and "Transfer In Edit Items" page shown
    And user presses "Add Container" button and "Transfer In Container" page shown
    And user enters "TRANSFER_IN_CON_1" into "Input Box" field
    And user presses "Add" button and "Transfer In Add Container" page shown
    And user enters "Container 1" into "name" field
    # Add Items
    And user presses "Edit Items" button and "Transfer In Container Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "Add Item" button and "Transfer In Quantify Item" page shown
    And user enters "10" into "Enter Quantity" field
    And user enters "Test last" into "NOTES" field
    And user presses "Add" button and "Transfer In Container Items" page shown
    And user presses "Done" button and "Transfer In Edit Items" page shown
    And user presses "Done" button and "Transfer In Summary" page shown
    And user presses "Continue" button and "Transfer In Confirmation" page shown
    # Cancel Submission
    And user presses "Back" button and "Transfer In Summary" page shown
    And user presses "Back" button and "Select Receipt Prompt" page shown
    #bug: Order Id is not saved when suspending an Ad Hoc Location Transfer In
    #When user selects "TRANSFER_RESUMED" from "Unsubmitted Transfer In List" list
    When user presses "Select" button and "Transfer In Summary" page shown
    # RESUME THE TRANSACTION
    #bug: Delivery Id and Source values are not restored when resuming a Loc Ad Hoc Transfer In
    #And "Transfer In Order Id" field displays the text "TRANSFER_RESUMED"
    #And "Transfer In Source" field displays the text "TRANSFER_RESUMED"
    # Verify Items
    And user presses "Edit Items" button and "Transfer In Edit Items" page shown
    And "TRANSFER_IN_CON_1" is displayed in "Item List" list
    #counts are verified in one instructions in reverse order
    # | Container 1 | Dispatched 0 | Received 10 |
    And "1 0 10" is displayed in "Item List" list
    And "${SKU Product 6}" is displayed in "Item List" list
    And "${SKU Product 6 Description}" is displayed in "Item List" list
    # | Dispatched 0 | Received 10 |
    And "1 10" is displayed in "Item List" list
    And user presses "Verify Container" button and "Transfer In Verify Container" page shown
    #bug: display wrong details in the fields
    #And "Dispatch Id" field displays the text "TI00000018"
    #And "Request Id" field displays the text "DIST_ORD_TO_CONFIRM"
    And "Container Id" field displays the text "TRANSFER_IN_CON_1"
    And "Container Name" field displays the text "Container 1"
    And "${SKU Product 6}" is displayed in "Items List" list
    And "${SKU Product 6 Description}" is displayed in "Items List" list
    # | Dispatched 0 | Received 10 |
    And "0 10" is displayed in "Items List" list
    And user presses "Back" button and "Transfer In Edit Items" page shown
    And user presses "Done" button and "Transfer In Summary" page shown
    And user presses "Select Location" icon button
    And "Select Transfer In Location" page is shown
    And user selects "Enactor Store" from "Source Location List" list
    And user presses "Select" button and "Transfer In Summary" page shown
    And user presses "Continue" button and "Transfer In Confirmation" page shown
    And "${SKU Product 6}" is displayed in "Transfer In Confirmation List" list
    And "${SKU Product 6 Description}" is displayed in "Transfer In Confirmation List" list
    And "0 10" is displayed in "Transfer In Confirmation List" list
    # Submit
    And user presses "Confirm" button and "Transfer In Confirm" page shown
    And user presses "OK" button
    And "Select Receipt Prompt" page is shown
    And user presses "Cancel" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-8632 @MVP @POS @AUTOMATED
  Scenario: Validate Style Description displays for the product in Transfer In Edit items Page
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Receive" icon button
    When user presses "Transfer In" icon button
    And "Unsubmited Transfer In" page is shown
    And user presses "Expected" button and "Select Expected Transfer In" page shown
    And user presses "Ad Hoc" button and "Expected Transfer In Select Delivery" page shown
    And user presses "Location Ad Hoc" button and "Delivery Header Summary" page shown
    And user presses "Select Location" icon button
    And "Select Transfer In Location" page is shown
    And user presses "Select" button and "Delivery Header Summary" page shown
    And user presses "Edit Items" button and "Transfer In Edit Items" page shown
    And user enters "${SKU_PRODUCT_1}" into "Input Box" field
    And user presses "Add Item" button and "Transfer In Edit Quantity Enter Items" page shown
    Then "${SKU_PRODUCT_1_STYLE_DESCRIPTION}" is displayed in "Transfer In Style Description Dialog Panel" panel
    And user presses "Cancel" button and "Transfer In Edit Items" page shown
    And user presses "Done" button and "Delivery Header Summary" page shown
    And user presses "Back" button and "Expected Transfer In Select Delivery" page shown
    And user presses "Back" button and "Select Expected Transfer In" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-4137 @MVP @POS @AUTOMATED
  Scenario: Validate that user Can Create SUPPLIER Ad-hoc Transfer In
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Receive" icon button
    When user presses "Transfer In" icon button
    And "Unsubmited Transfer In" page is shown
    And user presses "Expected" button and "Select Expected Transfer In" page shown
    And user presses "Ad Hoc" button and "Expected Transfer In Select Delivery" page shown
    And user presses "Supplier Ad Hoc" button and "Transfer In Summary" page shown
    And user enters "SUP_ADHOC_TRANSFER" into "Transfer In Order ID" field
    And user presses "Select Supplier" icon button
    And "Select Transfer In Supplier" page is shown
    And user selects "Brand 1 Supplier" from "Supplier List" list
    And user presses "Select" button and "Transfer In Summary" page shown
    And user presses "Edit Items" button and "Transfer In Supplier Receipt Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "Add Item" button and "Transfer In Edit Quantity Enter Items" page shown
    And user enters "10" into "Enter Quantity" field
    And user enters "Test last" into "NOTES" field
    And user presses "Add" button and "Transfer In Supplier Receipt Items" page shown
    And user presses "Done" button and "Transfer In Summary" page shown
    And user presses "Continue" button and "Transfer In Confirmation" page shown
    And user presses "Confirm" button and "Transfer In Confirm" page shown
    Then user presses "OK" button and "Unsubmited Transfer In" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-4091 @MVP @POS @AUTOMATED @Sprint41-Week4
  Scenario: Verify whether User is Able to Create a Location Ad-hoc Request in Transfer In and Complete the Dispatch
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Receive" icon button
    When user presses "Transfer In" icon button
    And "Unsubmited Transfer In" page is shown
    And user presses "Expected" button and "Select Expected Transfer In" page shown
    And user presses "Ad Hoc" button and "Expected Transfer In Select Delivery" page shown
    And user presses "Location Ad Hoc" button and "Transfer In Summary" page shown
    And user enters "LOC_ADHOC_TRANSFER" into "Transfer In Order ID" field
    #Select Source Location
    And user presses "Select Location" icon button
    And "Select Transfer In Location" page is shown
    And user selects "${Transfer In Location}" from "Source Location List" list
    And user presses "Select" button and "Transfer In Summary" page shown
    #Add Items
    And user presses "Edit Items" button and "Transfer In Edit Items" page shown
    And user presses "Add Container" button and "Transfer In Container" page shown
    And user enters "TC_LOC_TRANSFER_IN" into "Input Box" field
    And user presses "Add" button and "Transfer In Add Container" page shown
    And user enters "Loc Adhoc Cont" into "name" field
    And user presses "Edit Items" button and "Transfer In Container Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "Add Item" button and "Transfer In Quantify Item" page shown
    And user enters "10" into "Enter Quantity" field
    And user enters "Test last" into "NOTES" field
    And user presses "Add" button and "Transfer In Container Items" page shown
    And "${SKU Product 6}" is displayed in "Transfer In Container Items List" list
    And "${SKU Product 6 Description} 0 10" is displayed in "Transfer In Container Items List" list
    And user presses "Done" button and "Transfer In Edit Items" page shown
    And "TC_LOC_TRANSFER_IN" is displayed in "Item List" list
    And "1 0 10" is displayed in "Item List" list
    And "${SKU Product 6}" is displayed in "Item List" list
    And "${SKU Product 6 Description}" is displayed in "Item List" list
    And "0 10" is displayed in "Item List" list
    And user presses "Done" button and "Transfer In Summary" page shown
    And user presses "Continue" button and "Transfer In Confirmation" page shown
    And "1 0 10" is displayed in "Transfer In Confirmation List" list
    And "(TC_LOC_TRANSFER_IN)" is displayed in "Transfer In Confirmation List" list
    And "${SKU Product 6}" is displayed in "Transfer In Confirmation List" list
    And "${SKU Product 6 Description}" is displayed in "Transfer In Confirmation List" list
    And "0 10" is displayed in "Transfer In Confirmation List" list
    And user presses "Confirm" button and "Transfer In Confirm" page shown
    Then user presses "OK" button and "Unsubmited Transfer In" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
