Feature: Transfer Out Print Message

  @PT-8454 @POS @POSSet1 @MVP @NotForWeeklyRegression @ManualVerification @Sprint41-Week4
  Scenario: Verify that the Transfer Out save document prompt is displayed when enactor.inventoryManagement.pos.TransferOut.AllowSaveToFileOnPrintFailure  privilege  is enabled
    Given user signs on as "Sales Assistant 6"
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
    And user enters "5" into "Enter Quantity" field
    And user presses "Add" button and "Transfer Out Items" page shown
    And user presses "Done" button and "Transfer Out Data Capture" page shown
    And user presses "Continue" button and "Transfer Out Summary" page shown
    When user presses "Confirm" button and "Transfer Out Confirm Submit" page shown
    And user presses "Message Prompt Ok Button" icon button
    Then "Transfer Out Printer Missing Save Document Promt" page is shown
    And user presses "Save to File" icon button
    And "Transfer Out Document Saved" page is shown
    And user presses "OK" button
    And "Select Transfer Out" page is shown
    And user presses "Cancel" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-8455 @POS @POSSet1 @MVP @NotForWeeklyRegression @NotForAutomation @ManualVerification @Sprint41-Week4
  Scenario: Verify that the Transfer Out retry skip prompt is displayed when the enactor.inventoryManagement.pos.TransferOut.AllowSaveToFileOnPrintFailure privilege is disabled
    Given user signs on as "Inventory Manager 1"
    And user presses "Other Functions" button
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
    And user enters "5" into "Enter Quantity" field
    And user presses "Add" button and "Transfer Out Items" page shown
    And user presses "Done" button and "Transfer Out Data Capture" page shown
    And user presses "Continue" button and "Transfer Out Summary" page shown
    When user presses "Confirm" button and "Transfer Out Confirm Submit" page shown
    And user presses "Message Prompt Ok Button" icon button
    Then "Transfer Out Printer Missing Retry Skip Prompt" page is shown
    And user presses "Message Prompt Skip Button" icon button
    And "Select Transfer Out" page is shown
    And user presses "Cancel" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "Log Out Button" icon button
    And "Enter User" page is shown
    
    