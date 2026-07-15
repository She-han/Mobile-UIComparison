Feature: Transfer Out Container

  @PT-9326 @POS @POSSet1 @MVP @AUTOMATED @Sprint41-Week4
  Scenario: Validate that user can Remove containers in a transfer out
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
    # Select Reason for Transfer Out
    And user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    # Select Destination Location
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user selects "${Transfer Out Destination Location}" from "Destination Location List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    # Add Container
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    And user presses "Add Container" button and "Transfer Out Containers" page shown
    And user presses "Add" button and "Add Containers" page shown
    And user enters "TC55" into "Transfer Out Container ID" field
    And user enters "Test Container 55" into "Name" field
    # Edit Items in the Container
    And user presses "Edit Items" button and "Container Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button
    And "Add Item" page is shown
    And user enters "10" into "Enter Quantity" field
    And user presses "Add" button and "Container Items" page shown
    And user presses "Done" button and "Transfer Out Items" page shown
    And user presses "Done" button and "Transfer Out Data Capture" page shown
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    # Verify cancel not removing the container
    And "Test Contain... (TC55)" is displayed in "Item List" list
    When user presses "Remove Container" button and "Void Confirmation" page shown
    And user presses "Cancel" button and "Transfer Out Items" page shown
    Then "Test Contain... (TC55)" is displayed in "Item List" list
    # Verify confirm the prompt removes the container
    When user presses "Remove Container" button and "Void Confirmation" page shown
    And user presses "OK" button and "Transfer Out Items" page shown
    Then "Test Container... (TC55)" is not displayed in "Item List" list
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

  @PT-9327 @POS @POSSet1 @MVP @AUTOMATED @Sprint41-Week4
  Scenario: Validate that user can edit container names in transfer out
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
    # Select Reason for Transfer Out
    And user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    # Select Destination Location
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user selects "${Transfer Out Destination Location}" from "Destination Location List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    # Add Container
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    And user presses "Add Container" button and "Transfer Out Containers" page shown
    And user presses "Add" button and "Add Containers" page shown
    And user enters "TC56" into "Transfer Out Container ID" field
    And user enters "Test Container 56" into "Name" field
    # Edit Items in the Container
    And user presses "Edit Items" button and "Container Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button
    And "Add Item" page is shown
    And user enters "10" into "Enter Quantity" field
    And user presses "Add" button and "Container Items" page shown
    And user presses "Done" button and "Transfer Out Items" page shown
    And user presses "Done" button and "Transfer Out Data Capture" page shown
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    # Verify user can edit container name
    And "Test Contain... (TC56)" is displayed in "Item List" list
    When user presses "Edit Container" button and "Add Containers" page shown
    And user enters "New Container" into "Name" field
    And user presses "Done" button and "Transfer Out Items" page shown
    Then "New Containe... (TC56)" is displayed in "Item List" list
    # Removing the container to prevent 'container already added in another transfer prompt' when running the automation again
    And user presses "Remove Container" button and "Void Confirmation" page shown
    And user presses "OK" button and "Transfer Out Items" page shown
    # Going back and sign-off
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

  @PT-9328 @POS @POSSet1 @MVP @AUTOMATED @Sprint41-Week4
  Scenario: Validate that an item can be removed from a container
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
    # Select Reason for Transfer Out
    And user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    # Select Destination Location
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user selects "${Transfer Out Destination Location}" from "Destination Location List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    # Add Container
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    And user presses "Add Container" button and "Transfer Out Containers" page shown
    And user presses "Add" button and "Add Containers" page shown
    And user enters "TC57" into "Transfer Out Container ID" field
    And user enters "Test Container 57" into "Name" field
    # Edit Items in the Container
    And user presses "Edit Items" button and "Container Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button
    And "Add Item" page is shown
    And user enters "10" into "Enter Quantity" field
    And user presses "Add" button and "Container Items" page shown
    And user presses "Done" button and "Transfer Out Items" page shown
    # Verify user can edit container items
    And "${SKU Product 6}" is displayed in "Item List" list
    And user selects "${SKU Product 6}" from "Item List" list
    When user presses "Remove Item" button and "Void Transfer Out" page shown
    And user presses "OK" button and "Transfer Out Items" page shown
    Then "${SKU Product 6}" is not displayed in "Item List" list
    # Going back and sign-off
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

  @PT-9329 @POS @POSSet1 @MVP @AUTOMATED @Sprint41-Week4
  Scenario: Validate that user can update quantity of items in a container
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
    # Select Reason for Transfer Out
    And user presses "Select Reason" icon button
    And "Select Transfer Out Reason" page is shown
    And user selects "Overstocked" from "Reason List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    # Select Destination Location
    And user presses "Select Destination Location" icon button
    And "Select Transfer Out Location" page is shown
    And user selects "${Transfer Out Destination Location}" from "Destination Location List" list
    And user presses "Select" button and "Transfer Out Data Capture" page shown
    # Add Container
    And user presses "Edit Items" button and "Transfer Out Items" page shown
    And user presses "Add Container" button and "Transfer Out Containers" page shown
    And user presses "Add" button and "Add Containers" page shown
    And user enters "TC58" into "Transfer Out Container ID" field
    And user enters "Test Container 58" into "Name" field
    # Edit Items in the Container
    And user presses "Edit Items" button and "Container Items" page shown
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button
    And "Add Item" page is shown
    And user enters "10" into "Enter Quantity" field
    And user presses "Add" button and "Container Items" page shown
    And user presses "Done" button and "Transfer Out Items" page shown
    # Verify user can edit container item quantity
    And "10" is displayed in "Item List" list
    When user selects "${SKU Product 6}" from "Item List" list
    And user presses "Edit Item" button and "Transfer Out Quantity Entry" page shown
    And user enters "20" into "Enter Quantity" field
    And user presses "Update" button and "Transfer Out Items" page shown
    Then "20" is displayed in "Item List" list
    # Removing the container to prevent 'container already added in another transfer prompt' when running the automation again
    And user presses "Remove Container" button and "Void Confirmation" page shown
    And user presses "OK" button and "Transfer Out Items" page shown
    # Going back and sign-off
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
