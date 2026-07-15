Feature: Transfer Out

  @PT-1429 @MVP @POS @AUTOMATED @ManualVerification @POSValidatedTest @POSSet1 @Sprint41-Week4
  Scenario: Verify voiding a Transfer Out functionality
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad Hoc" button and "Transfer Out Data Capture" page shown
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user selects "Enactor (Demo Room)" from "Destination Location List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    And user presses "Add Container" button and "Transfer Out Containers" page shown
    And user presses "Add" button and "Add Containers" page shown
    And user enters "C_00011" into "Transfer Out Container ID" field
    And user presses "Edit Items" button and "Container Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    # Note: Unable to verify with the Add Item  button but the button works
    And user presses "ENT" button and "Add Item" page shown
    And user enters "5" into "Enter Quantity" field
    And user presses "Add" button and "Container Items" page shown
    And user presses "Done" button and "Transfer Out Items" page shown
    When user presses "Remove Container" button and "Void Confirmation" page shown
    And user presses "OK" button and "Transfer Out Items" page shown
    And user presses "Remove" button and "Confirm Remove" page shown
    And user presses "OK" button
    Then "Administration Screen" page is shown
    # Mannual Verification: unable to check whether the transfer out is removed
    # no way to copy Transfer Out id to verify non-existent of the transfer after the removal
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1425 @MVP @POS @AUTOMATED @Sprint41-Week4
  Scenario: Verify whether the user can submit a Transfer Out without a Container
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad Hoc" button and "Transfer Out Data Capture" page shown
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user selects "${Transfer Out Destination Location 1 Id}" from "Destination Location List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button and "Add Item" page shown
    And user enters "5" into "Enter Quantity" field
    And user presses "Add" button and "Transfer Out Items" page shown
    And user presses "Done" button and "Transfer Out Data Capture" page shown
    And user presses "Continue" button and "Transfer Out Summary" page shown
    When user presses "Confirm" button and "Transfer Out Confirm Submit" page shown
    And user presses "OK" button
		Then "Select Transfer Out" page is shown
		And user presses "Cancel" button
		And "Administration Screen" page is shown
		When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
		Then "Transaction Basket" page is shown
		And user presses "SignOff" button
		And "Enter User" page is shown

  @PT-1423 @MVP @POS @AUTOMATED @POSValidatedTest @POSSet1 @Sprint41-Week4
  Scenario: Verify that user cannot submit a Transfer Out without a Destination Location
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad Hoc" button and "Transfer Out Data Capture" page shown
    And user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    When user presses "Continue" button
    # ERROR Expected
    Then "Destination Error Label" label displays the text "Cannot be blank"
    And user presses "Back" button and "Select Transfer Out" page shown
    And user presses "Cancel" button and "Administration screen" page shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
		Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1424 @MVP @POS @AUTOMATED @POSValidatedTest @POSSet1 @Sprint41-Week4
  Scenario: Verify that user cannot submit a Transfer Out without a Reason
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad Hoc" button and "Transfer Out Data Capture" page shown
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user selects "Enactor (Demo Room)" from "Destination Location List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    When user presses "Continue" button
    Then "Reason Error Label" label displays the text "Cannot be blank"
    And user presses "Back" button and "Select Transfer Out" page shown
    And user presses "Cancel" button and "Administration screen" page shown
    Then user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1405 @MVP @POS @AUTOMATED @POSValidatedTest @POSSet1 @Sprint41-Week4
  Scenario: Verify submitting Transfer Outs after editing container details
    #Precondition: Make sure that the container C1405 is removed before re-run the test
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad Hoc" button and "Transfer Out Data Capture" page shown
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user presses "Down" button
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    And user presses "Add Container" button and "Transfer Out Containers" page shown
    And user presses "Add" button and "Add Containers" page shown
    And user enters "C1405" into "Transfer Out Container ID" field
    #Below two steps would appear if the container is already involved in a transfer
    #And user presses "Edit Items" button and "Container Already Added To Transfer" page shown
    #And user presses "OK" button and "Container Items" page shown
    And user presses "Edit Items" button and "Container Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button and "Add Item" page shown
    And user enters "5" into "Enter Quantity" field
    And user presses "Add" button and "Container Items" page shown
    And user presses "Done" button and "Transfer Out Items" page shown
    When user presses "Edit Container" button and "Edit Container" page shown
    #Need to support Add Location Area - PLAT-11038
    And user enters "New C1405" into "Name" field
    And user presses "Done" button and "Transfer Out Items" page shown
    And user presses "Done" button and "Transfer Out Data Capture" page shown
    And user presses "Continue" button and "Transfer Out Summary" page shown
    And user presses "Confirm" button and "Transfer Out Confirm Submit" page shown
    And user presses "OK" button
		Then "Select Transfer Out" page is shown
		And user presses "Cancel" button
		And "Administration Screen" page is shown
		When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
		Then "Transaction Basket" page is shown
		And user presses "SignOff" button
		And "Enter User" page is shown

  @PT-1408 @MVP @POS @AUTOMATED @ManualVerification @POSValidatedTest @POSSet1 @Sprint41-Week4 @NotForWeeklyRegression
  Scenario: Verify submitting Transfer Outs after editing an Item in a container
    #Precondition: Make sure Container C1408 is removed before test re-run
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad Hoc" button and "Transfer Out Data Capture" page shown
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user presses "Down" button
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    And user presses "Add Container" button and "Transfer Out Containers" page shown
    And user presses "Add" button and "Add Containers" page shown
    And user enters "C1408" into "Transfer Out Container ID" field
    And user enters "C1408" into "Name" field
    #Below two steps appear if the container is already involved in a transfer
    #And user presses "Edit Items" button and "Container Already Added To Transfer" page shown
    #And user presses "OK" button and "Container Items" page shown
    And user presses "Edit Items" button and "Container Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button and "Add Item" page shown
    And user enters "5" into "Enter Quantity" field
    And user presses "Add" button and "Container Items" page shown
    And user presses "Done" button and "Transfer Out Items" page shown
    And user presses "Down" button
    When user presses "Edit Item" button and "Transfer Out Quantity Entry" page shown
    And user enters "8" into "Enter Quantity" field
    And user presses "Update" button and "Transfer Out Items" page shown
    And user presses "Done" button and "Transfer Out Data Capture" page shown
    And user presses "Continue" button and "Transfer Out Summary" page shown
    And user presses "Confirm" button and "Transfer Out Confirm Submit" page shown
    And user presses "OK" button
		Then "Select Transfer Out" page is shown
		And user presses "Cancel" button
		And "Administration Screen" page is shown
		And user presses "Home Button" icon button
		And "Transaction Basket" page is shown
		And user presses "SignOff" button
		And "Enter User" page is shown

  @PT-1370 @MVP @POS @AUTOMATED @ManualVerification @Sprint41-Week4
  Scenario: Verify submitting Transfer Outs when container created with  a Unique Container ID
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad Hoc" button and "Transfer Out Data Capture" page shown
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user selects "${Transfer Out Destination Location 1 Id}" from "Destination Location List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    When user presses "Add Container" button and "Transfer Out Containers" page shown
    And user presses "Add" button and "Add Containers" page shown
    #unique container ID test
    And user enters "${Container 1 ID}" into "Transfer Out Container ID" field
    And user enters "${Container 1 Name}" into "Name" field
    And user presses "Edit Items" button and "Container Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button and "Add Item" page shown
    And user enters "3" into "Enter Quantity" field
    And user presses "Add" button and "Container Items" page shown
    And user presses "Done" button and "Transfer Out Items" page shown
    And user presses "Done" button and "Transfer Out Data Capture" page shown
    And user presses "Continue" button and "Transfer Out Summary" page shown
    And user presses "Confirm" button and "Transfer Out Confirm Submit" page shown
    And user presses "OK" button
		Then "Select Transfer Out" page is shown
		And user presses "Cancel" button
		And "Administration Screen" page is shown
		When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
		And user presses "SignOff" button
		And "Enter User" page is shown

  @PT-1422 @MVP @POS @AUTOMATED @ManualVerification @Sprint41-Week4
  Scenario: Verify submitting Transfer Outs by entering an existing Container ID
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad Hoc" button and "Transfer Out Data Capture" page shown
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user selects "${Transfer Out Destination Location 1 Id}" from "Destination Location List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    When user presses "Add Container" button and "Transfer Out Containers" page shown
    And user presses "Add" button and "Add Containers" page shown
    #Existing container ID test
    And user enters "${Container 9 Id}" into "Transfer Out Container ID" field
    And user presses "Edit Items" button and "Container Items" page shown
    And "Container Edit Container Id" field displays the text "${Container 9 Id}"
    #bug: container name is not automatically fetched
    #And "Container Edit Container Name" field displays the text "${Container 9 Name}"
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button and "Add Item" page shown
    And user enters "3" into "Enter Quantity" field
    And user presses "Add" button and "Container Items" page shown
    And user presses "Done" button and "Transfer Out Items" page shown
    And user presses "Done" button and "Transfer Out Data Capture" page shown
    And user presses "Continue" button and "Transfer Out Summary" page shown
    And user presses "Confirm" button and "Transfer Out Confirm Submit" page shown
    And user presses "OK" button
		Then "Select Transfer Out" page is shown
		And user presses "Cancel" button
		And "Administration Screen" page is shown
		When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
		And user presses "SignOff" button
		And "Enter User" page is shown

  @PT-1404 @MVP @POS @AUTOMATED @ManualVerification @Sprint41-Week4
  Scenario: Verify Submitting Transfer Outs when Container is selected from Container list
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad Hoc" button and "Transfer Out Data Capture" page shown
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user selects "${Transfer Out Destination Location 1 Id}" from "Destination Location List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    When user presses "Add Container" button and "Transfer Out Containers" page shown
    # Select a container from container list
    And user selects "CONTAINER_4000" from "Items List" list
    And user presses "Select" button and "Edit Container" page shown
    And "Transfer Out Container ID" field displays the text "${Container 10 Id}"
    And "Name" field displays the text "${Container 10 Name}"
    And user presses "Edit Items" button and "Container Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button and "Add Item" page shown
    And user enters "3" into "Enter Quantity" field
    And user presses "Add" button and "Container Items" page shown
    And "${SKU Product 6}" is displayed in "Items List" list
    And "${SKU Product 6 Description}" is displayed in "Items List" list
    And "3" is displayed in "Items List" list
    And user presses "Done" button and "Transfer Out Items" page shown
    And user presses "Done" button and "Transfer Out Data Capture" page shown
    And user presses "Continue" button and "Transfer Out Summary" page shown
    And user presses "Confirm" button and "Transfer Out Confirm Submit" page shown
    And user presses "OK" button
		Then "Select Transfer Out" page is shown
		And user presses "Cancel" button
		And "Administration Screen" page is shown
		When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
		And user presses "SignOff" button
		And "Enter User" page is shown

  @PT-6373 @POS @AUTOMATED @Sprint40-Week4
  Scenario: Validate product search functionality when a valid product ID is entered for a Transfer Out-incomplete
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad Hoc" button
    And "Transfer Out Data Capture" page is shown
    And user presses "Back" button and "Select Transfer Out" page shown
    When user presses "Select" button and "Transfer Out Data Capture" page shown
    # Select Reason for Transfer Out
    And user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    # Select Destination Location
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user selects "${Transfer Out Destination Location 1 Id}" from "Destination Location List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    # Edit Items in the Order - Add Container
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button
    Then "Add Item" page is shown
    And user enters "3" into "Enter Quantity" field
    And user presses "Add" button and "Transfer Out Items" page shown
    And "${SKU Product 6}" is displayed in "Item List" list
    And "${SKU Product 6 Description}" is displayed in "Item List" list
    And "3" is displayed in "Item List" list
    # Edit Items in the Container
    And user presses "Add Container" button and "Transfer Out Containers" page shown
    And user presses "Add" button and "Add Containers" page shown
    And user enters "TC10" into "Transfer Out Container ID" field
    And user enters "Test Container 10" into "Name" field
    # Edit Items in the Container
    And user presses "Edit Items" button and "Container Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    # Test - navigated to the quantity page and the search product button is hidden in the UI
    And user presses "ENT" button
    Then "Add Item" page is shown
    And user enters "3" into "Enter Quantity" field
    And user presses "Add" button and "Container Items" page shown
    And "${SKU Product 6}" is displayed in "Items List" list
    And "${SKU Product 6 Description}" is displayed in "Items List" list
    And "3" is displayed in "Items List" list
    And user presses "Done" button and "Transfer Out Items" page shown
    And user presses "Done" button and "Transfer Out Data Capture" page shown
    And user presses "Back" button and "Select Transfer Out" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-6374 @POS @AUTOMATED @Sprint40-Week4
  Scenario: Validate product search functionality for a Transfer Out-incomplete request when no product ID is given
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad Hoc" button
    And "Transfer Out Data Capture" page is shown
    And user presses "Back" button and "Select Transfer Out" page shown
    When user presses "Select" button and "Transfer Out Data Capture" page shown
    # Select Reason for Transfer Out
    And user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    # Select Destination Location
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user selects "${Transfer Out Destination Location 1 Id}" from "Destination Location List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    # Edit Items in the Order - Add Container
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    And user presses "Add Container" button and "Transfer Out Containers" page shown
    And user presses "Add" button and "Add Containers" page shown
    And user enters "TC20" into "Transfer Out Container ID" field
    And user enters "Test Container 20" into "Name" field
    # Edit Items in the Container
    And user presses "Edit Items" button and "Container Items" page shown
    # Test - when no product id is given it is navigated to the product lookup UI
    And user presses "ENT" button
    Then "Transfer Out Unknown Product Prompt" page is shown
    And user presses "OK" button and "Container Items" page shown
    And user presses "Back" button and "Add Containers" page shown
    And user presses "Cancel" button and "Transfer Out Containers" page shown
    And user presses "Back" button and "Transfer Out Items" page shown
    And user presses "Done" button and "Transfer Out Data Capture" page shown
    And user presses "Back" button and "Select Transfer Out" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1411 @MVP @POS @AUTOMATED @POSValidatedTest @POSSet1 @Sprint40-Week4
  Scenario: Verify Remove functionality when select an Item from the list
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    When user presses "Ad Hoc" button and "Transfer Out Data Capture" page shown
    # Select Reason for Transfer Out
    And user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    # Select Destination Location
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user selects "${Transfer Out Destination Location 1 Id}" from "Destination Location List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    And user presses "Add Container" button and "Transfer Out Containers" page shown
    And user presses "Add" button and "Add Containers" page shown
    And user enters "TC30" into "Transfer Out Container ID" field
    And user enters "Test Container 30" into "Name" field
    And user presses "Edit Items" button and "Container Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button and "Add Item" page shown
    And user enters "3" into "Enter Quantity" field
    And user presses "Add" button and "Container Items" page shown
    And "${SKU Product 6}" is displayed in "Items List" list
    And "${SKU Product 6 Description}" is displayed in "Items List" list
    And "3" is displayed in "Items List" list
    And user presses "Done" button and "Transfer Out Items" page shown
    And user selects "${SKU Product 6}" from "Item List" list
    And user presses "Remove Item" button and "Void Transfer Out" page shown
    Then user presses "OK" button and "Transfer Out Items" page shown
    And "${SKU Product 6}" is not displayed in "Item List" list
    And user presses "Done" button and "Transfer Out Data Capture" page shown
    And user presses "Back" button and "Select Transfer Out" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    #And user presses "Remove" button and "Confirm Remove" page shown
    #And user presses "OK" button and "Administration Screen" page shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-4125 @POS @AUTOMATED @CreateAdHocRequest @POSWithoutPrinter @Sprint41-Week4
  Scenario: Complete a distribution order initiated from the Estate Manager after confirming that the destination cannot be changed
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user selects "DO900005" from "Transfer Out Requests" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And "Reason Field" field displays the text "Condensing"
    # Verify the visibility of the 'Select Destination Location' button
    And button with label "Select Destination Location" is not displayed
    # Verfy items in the request, Requested 10 | Dispatched 10
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    And "MB709SN-1 Rose Print Tea Dress 10 10" is displayed in "Item List" list
    And user presses "Done" button
    And "Transfer Out Data Capture" page is shown
    And user presses "Continue" button
    And "Transfer Out Summary" page is shown
    And user presses "Confirm" button and "Transfer Out Confirm Submit" page shown
    And user presses "OK" button
		Then "Select Transfer Out" page is shown
		And user presses "Cancel" button
		And "Administration Screen" page is shown
		When user presses "Administration Screen Back Button" icon button
	  Then "Administration Screen" page is shown
	  When user presses "Administration Screen Back Button" icon button
	  Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
		And "Transaction Basket" page is shown
		And user presses "SignOff" button
		And "Enter User" page is shown

  @PT-4126 @POS @AUTOMATED @CreateAdHocRequest @POSWithoutPrinter @Sprint41-Week4
  Scenario: Create an ad-hoc transfer out request with with Delivery Instructions and dispatch it
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad Hoc" button
    And "Transfer Out Data Capture" page is shown
    # Select Reason
    And user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "${Transfer Out Reason 1 ID}" from "Reason List" list
    And user presses "Select" button
    And "Transfer Out Data Capture" page is shown
    # Select Location for Destination
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user selects "${Transfer Out Destination Location 1 ID}" from "Destination Location List" list
    And user presses "Select" button
    And "Transfer Out Data Capture" page is shown
    # Add Delivery Instructions
    When user presses "Delivery Instructions" button
    And "Transfer Out Delivery Instructions" page is shown
    And user enters "Please deliver on weekdays." into "Delivery Instructions" field
    And user presses "Save" button
    And "Delivery Instructions" field displays the text "Please deliver on weekdays."
    And user enters "Morning is preferable." into "Delivery Instructions Appendant" field
    And user presses "Append" button
    #unable to verify text that contains new line
    #And "Delivery Instructions" field displays the text "Please deliver on weekdays. \\nMorning is preferable."
    And user presses "Back" button and "Transfer Out Data Capture" page shown
    # Add items to the request
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button
    And "Add Item" page is shown
    And user enters "5" into "Transfer Out Quantity" field
    And user presses "Add" button
    And "Transfer Out Items" page is shown
    # Requested 0 | Dispatched 5
    And "MB709SN-1 Rose Print Tea Dress 0 5" is displayed in "Item List" list
    And user presses "Done" button
    And "Transfer Out Data Capture" page is shown
    And user presses "Continue" button
    And "Transfer Out Summary" page is shown
    And user presses "Confirm" button and "Transfer Out Confirm Submit" page shown
    And user presses "OK" button
		Then "Select Transfer Out" page is shown
		And user presses "Cancel" button
		And "Administration Screen" page is shown
		When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
		And "Enter User" page is shown

  @PT-6369 @MVP @POS @AUTOMATED @ManualVerification @Sprint41-Week4
  Scenario: Validate that all the locations are listed in POS Transfer Out AdHoc when the selected reason has no location configured
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad Hoc" button
    And "Transfer Out Data Capture" page is shown
    When user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "TEST_REASON_2" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Select Destination Location" icon button
    Then "Select Transfer Out Location" page is shown
    # To verify some locations are missing from total cardinality
    And "estatemanager" is displayed in "Destination Location List" list
    And "0001" is displayed in "Destination Location List" list
    And "0003" is displayed in "Destination Location List" list
    And "0100" is not displayed in "Destination Location List" list
    And "3100" is not displayed in "Destination Location List" list
    And user selects "estatemanager" from "Destination Location List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    When user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "TEST_REASON_1" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Select Destination Location" icon button
    Then "Select Transfer Out Location" page is shown
    # To check random locations to verify all locations are populated
    # Mannual verification is required
    And "0001" is displayed in "Destination Location List" list
    And "0100" is displayed in "Destination Location List" list
    And "1100" is displayed in "Destination Location List" list
    And "3100" is displayed in "Destination Location List" list
    And user selects "0100" from "Destination Location List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Back" button and "Select Transfer Out" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-6371 @MVP @POS @AUTOMATED @Sprint41-Week4
  Scenario: Validate that the destination location is limited to the reason selected in POS Transfer Out AdHoc
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad Hoc" button
    And "Transfer Out Data Capture" page is shown
    When user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "TEST_REASON_2" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Select Destination Location" icon button
    Then "Select Transfer Out Location" page is shown
    And "estatemanager" is displayed in "Destination Location List" list
    And "0001" is displayed in "Destination Location List" list
    And "0003" is displayed in "Destination Location List" list
    # To check few random locations that other locations are not listed
    And "0100" is not displayed in "Destination Location List" list
    And "3100" is not displayed in "Destination Location List" list
    And user selects "estatemanager" from "Destination Location List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Back" button and "Select Transfer Out" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-6368 @POS @AUTOMATED @Sprint41-Week4
  Scenario: Verify that Source Location field is visible if the user has previlege in ad-hoc creation, transfer out
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad Hoc" button
    And "Transfer Out Data Capture" page is shown
    And "Source Location" field displays the text "0001"
    #Both steps take too long to verify text in panel
    #And "Source Location Label" label displays the text "Enactor Store"
    #And "Enactor Store" is displayed in "Source Location Label" panel
    # Select Location for Source - no step to verify visibility of the button - alternative verification
    When user presses "Select Source Location" icon button
    And "Select Transfer Out Location" page is shown
    # Prerequiste 0001 - Enactor Store should be enabled for "Allow Dispatch from this location"
    And user selects "Enactor Store" from "Source Location List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    Then "Source Location" field displays the text "0001"
    And user presses "Back" button and "Select Transfer Out" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-6372 @POS @AUTOMATED
  Scenario: Verify that Source Location field is invisible if the user does not have previlege in ad-hoc creation, transfer out
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad Hoc" button
    When "Transfer Out Data Capture" page is shown
    Then user confirms "Select Source Location" not display
    And user confirms "Source Location" not display
    And user presses "Back" button and "Select Transfer Out" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-8633 @MVP @POS @AUTOMATED @POSSet1 @Sprint41-Week4
  Scenario: Transfer Out - Edit items Page - Validate Style Description displays for the product
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad Hoc" button and "Transfer Out Data Capture" page shown
    And user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user presses "Down" button
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    When user presses "Edit Items" button and "Transfer Out Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button
    Then "Add Item" page is shown
    And "${SKU Product 6 Description}" is displayed in "Style Description Dialog Panel" panel
    And user presses "Cancel" button and "Transfer Out Items" page shown
    And user presses "Done" button and "Transfer Out Data Capture" page shown
    And user presses "Back" button and "Select Transfer Out" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-4139 @POS @AUTOMATED @POSSet1 @MVP @Sprint41-Week4
  Scenario: Verify whether user is able to suspend a transfer out
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad Hoc" button and "Transfer Out Data Capture" page shown
    And user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user presses "Down" button
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    And user enters "${Style Colour Size Product}" into "Input Box" field
    And user presses "ENT" button and "Add Item" page shown
    #113 is used as the item quantity to make it unique, thus identity in unsubmitted page
    And user enters "113" into "Enter Quantity" field
    And user presses "Add" button and "Transfer Out Items" page shown
    And user presses "Done" button and "Transfer Out Data Capture" page shown
    When user presses "Suspend" button
    Then "Select Transfer Out" page is shown
    And "113" is displayed in "Unsubmitted Transfers Out List" list
    And user presses "Cancel" button and "Administration Screen" page shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-9323 @POS @AUTOMATED @POSSet1 @MVP @NotForWeeklyRegression
  Scenario: Validate suspending a transfer out and verify that the information is saved upon suspension
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad Hoc" button
    And "Transfer Out Data Capture" page is shown
    And user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    # Select Destination Location
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user selects "0003" from "Destination Location List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    # Edit Items in the Order - Add Container
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    And user presses "Add Container" button and "Transfer Out Containers" page shown
    And user presses "Add" button and "Add Containers" page shown
    And user enters "TC30" into "Transfer Out Container ID" field
		And user enters "Test Container 30" into "Name" field
    # Edit Items in the Container
    And user presses "Edit Items" button and "Container Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button
    And "Add Item" page is shown
    And user enters "10" into "Enter Quantity" field
    And user presses "Add" button
    And "Container Items" page is shown
    And user presses "Done" button and "Transfer Out Items" page shown
    And user presses "Done" button and "Transfer Out Data Capture" page shown
    When user presses "Suspend" button and "Select Transfer Out" page shown
    And user waits "2" seconds
    # To select the lastly created AdHoc transfer out request
    And user presses "Select" button
    Then "Transfer Out Data Capture" page is shown
    And "Reason Field" field displays the text "Overstocked"
    And "Destination Location Field" field displays the text "0003"
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    And user presses "Edit Container" button and "Add Containers" page shown
    And "Transfer Out Container ID" field displays the text "TC30"
		And "Name" field displays the text "Test Container 30"
    And user presses "Edit Items" button and "Container Items" page shown
    And "Container Edit Container ID" field displays the text "TC30"
    And "Container Edit Container Name" field displays the text "Test Container 30"
    And "${SKU Product 6}" is displayed in "Items List" list
    And "${SKU Product 6 Description}" is displayed in "Items List" list
    And "10" is displayed in "Items List" list
    And user presses "Done" button and "Transfer Out Items" page shown
    And user presses "Done" button and "Transfer Out Data Capture" page shown
    And user presses "Suspend" button and "Select Transfer Out" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-9325 @POS @AUTOMATED @POSSet1 @MVP @Sprint41-Week4 @NotForWeeklyRegression
  Scenario: Validate that user can void transfer out record and verify it has removed from the list
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad Hoc" button
    And "Transfer Out Data Capture" page is shown
    And user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    # Select Destination Location
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user selects "0003" from "Destination Location List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    # Edit Items in the Order - Add Container
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    And user presses "Add Container" button and "Transfer Out Containers" page shown
    And user presses "Add" button and "Add Containers" page shown
    And user enters "TC89" into "Transfer Out Container ID" field
    And user enters "Test Container 89" into "Name" field
    # Edit Items in the Container
    And user presses "Edit Items" button and "Container Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button
    And "Add Item" page is shown
    #111 is used to be a unique quantity so we can check it does not exist in unsubmitted transfers
    And user enters "111" into "Enter Quantity" field
    And user presses "Add" button
    And "Container Items" page is shown
    And user presses "Done" button and "Transfer Out Items" page shown
    And user presses "Done" button and "Transfer Out Data Capture" page shown
    When user presses "Remove" button and "Remove Transfer" page shown
    And user presses "OK" button
    And "Select Transfer Request" page is shown
    And user presses "Back" button
    And "Select Transfer Out" page is shown
    And "111" is not displayed in "Unsubmitted Transfers Out List" list
    And user presses "Cancel" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-6370 @POS @AUTOMATED @Sprint41-Week5 
  Scenario: Verify locations that are not "Allow Dispatch from this Location" are not listed under source locations during a transfer out
    # Prerequiste: the user should be privileged to change the source location
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad Hoc" button
    And "Transfer Out Data Capture" page is shown
    And "Source Location" field displays the text "0001"
    When user presses "Select Source Location" icon button
    And "Select Transfer Out Location" page is shown
    # Prerequiste: 0003 - Enactor Store should be disabled for "Allow Dispatch from this location"
    Then "0003" is not displayed in "Source Location List" list
    And user presses "Cancel" button and "Transfer Out Data Capture" page shown
    And "Source Location" field displays the text "0001"
    And user presses "Back" button and "Select Transfer Out" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
    @PT-10071 @POS @AUTOMATED
  Scenario: Validate suspending a transfer out and verify that the information is saved upon suspension
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad Hoc" button
    And "Transfer Out Data Capture" page is shown
    And user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user selects "0003" from "Destination Location List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Delivery Instructions" button and "Transfer Out Delivery Instructions" page shown
    And user enters "Test Delivery Note" into "Delivery Instructions" field
    And user presses "Save" button
    And user waits "2" seconds
    And user enters "Test Delivery Appending Note" into "Delivery Instructions Appendant" field
    And user presses "Append" button
    #Need support to execute following commented line
    #And "Delivery Instructions" field displays the text "Test Delivery Note Test Delivery Appending Note"
    And user presses "Back" button and "Transfer Out Data Capture" page shown
    And user presses "Suspend" button and "Select Transfer Out" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "Log Out Button" icon button
    And "Enter User" page is shown
        
   @PT-17344 @POS @AUTOMATED
   Scenario: Verify the Select Container button
    #Precondition: Make sure Container TC40 is removed before test re-run
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    And user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "Requested" button and "Select Transfer Request" page shown
    And user presses "Ad Hoc" button and "Transfer Out Data Capture" page shown
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user selects "${Transfer Out Destination Location 1 Id}" from "Destination Location List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button
    And "Add Item" page is shown
    And user enters "2" into "Enter Quantity" field
    And user presses "Select Container Button" icon button and "Transfer Out Containers" page shown
    Then "Transfer Out Containers" page is shown
    And user presses "Add" button and "Add Containers" page shown
    And user enters "TC40" into "Transfer Out Container ID" field
    And user enters "Test Container 40" into "Name" field
    #Below two steps appear if the container is already involved in a transfer
    #And user presses "Done" button and "Container Already Added To Transfer" page shown
    #And user presses "OK" button and "Add Item" page shown
    And user presses "Done" button and "Add Item" page shown
    And user presses "Add" button
    And "Transfer Out Items" page is shown
    And user presses "Done" button
    And "Transfer Out Data Capture" page is shown
    And user presses "Continue" button
    And "Transfer Out Summary" page is shown
    And user presses "Confirm" button and "Transfer Out Confirm Submit" page shown
    And user presses "OK" button
    Then "Select Transfer Out" page is shown
    And user presses "Cancel" button
    And "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    