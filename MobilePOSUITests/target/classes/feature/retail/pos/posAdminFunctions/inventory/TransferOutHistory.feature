Feature: Transfer Out History

  @PT-4134 @POS @POSSet1 @MVP @AUTOMATED @ManualVerification @Sprint41-Week4
  Scenario: Verify Transfer out history and view branch copy
    #Transfer Out branch copy PDF is created at first
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
    And user enters "5" into "Enter Quantity" field
    And user presses "Add" button and "Transfer Out Items" page shown
    And user presses "Done" button and "Transfer Out Data Capture" page shown
    And user presses "Continue" button and "Transfer Out Summary" page shown
    And user presses "Confirm" button and "Transfer Out Confirm Submit" page shown
    And user presses "OK" button
    And "Select Transfer Out" page is shown
    When user presses "History" button and "Select Transfer Out History" page shown
    And user presses "Select" button and "Transfer Out Summary" page shown
    # Mannual Verification: to check whether the PDF is displayed
    And user presses "View Branch Copy" button and "Transfer Out Pdf Viewer Launched" page shown
    And user waits "15" seconds
    And user presses "OK" button
    And "Transfer Out Summary" page is shown
    And user presses "Back" button and "Select Transfer Out History" page shown
    And user presses "Back" button and "Select Transfer Out" page shown
    And user presses "Cancel" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-11823 @POS @AUTOMATED
  Scenario: Visibility of Up and Down buttons in Transfer Out History
    Given user signs on as "Manager 2"
    When user presses "Management" button and "Transaction Basket" page shown
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    Then user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "History" button
    And "Select Transfer Out History" page is shown
    Then user presses "Down" button
    And user presses "Up" button
    When user presses "Cancel" button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
    @PT-24125 @POS @AUTOMATED @Inventory @Inventory-TransferOut
    Scenario: Validating the searching fields once after a search in the Transfer out history
    Given user signs on as "Manager 2"
    When user presses "Management" button and "Transaction Basket" page shown
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Dispatch" icon button
    Then user presses "Transfer Out" icon button
    And "Select Transfer Out" page is shown
    And user presses "History" button and "Select Transfer Out History" page shown
    And user enters "TO01" into "Dispatch Id" field
    And user enters "1" into "Request Id" field
    And user enters "18/09/22" into "Start Date" field
    And user enters "30/10/25" into "End Date" field
    And user selects "SUBMITTED" from "Container Status" combobox
    And user presses "Search" icon button
    And "Request Id" field displays the text "1"
    Then "Dispatch Id" field displays the text "TO01"
    And "SUBMITTED" is selected in "Container Status" combobox		
    When user presses "Cancel" button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
