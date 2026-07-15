Feature: Adjust Stock

  @PT-9981 @PreSales @AUTOMATED @POS
  Scenario: Verify that data in "Note" field will not be lost while processing with stock adjustment request
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Inventory" icon button
    And user presses "Adjust" icon button
    And user presses "Adjust Stock" icon button
    And "Select Adjustment" page is shown
    And user presses "Requested" button
    And "Select Stock Adjustment Request" page is shown
    And user presses "Ad Hoc" button
    And "Adjustment Summary" page is shown
    And user presses "Select Adjustment Reason" icon button
    And "Select Adjustment Reason" page is shown
    And user selects "Write On" from "Reason List" list
    And user presses "Select" button
    And "Adjustment Summary" page is shown
    When user enters "Test Note" into "Notes Input Text" field
    And user presses "Add or Edit Items" button
    And "Adjustment Items" page is shown
    And user enters "MB709SN-1" into "Input Box" field
    And user presses "ENT" button
    And "Adjustment Edit Quantity Enter Items" page is shown
    And user presses "Add" button
    And "Adjustment Items" page is shown
    And user presses "Done" button
    And "Adjustment Summary" page is shown
    And user presses "Continue" button
    And "Adjustment Confirmation" page is shown
    And user presses "Back" button
    And "Adjustment Summary" page is shown
    Then "Notes Input Text" field displays the text "Test Note"
    And user presses "Suspend" button
    And "Select Adjustment" page is shown
    And user presses "Cancel" button
    And "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "Log Out Button" icon button
    And "Enter User" page is shown

