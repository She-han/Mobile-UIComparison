Feature: Add Note button should not be available for quotes in Cancelled and Converted state

  @PT-2024 @TobeFixedAutTest @AddNoteButtonNotVisible @Quote @POS @AUTOMATED
  Scenario: Add Note button should not be available for quotes in Cancelled and Converted state
    Given user signs on as "Pos Operator"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Quotes" button
    And user presses "Search Quotes" button and "Search Quote" page shown
    #PLAT-14695 Cannot retrieve Cancelled quote using the status drop down
    When user selects "Cancelled" from "Quote Status" combobox
    And user presses "OK" button and "Quote Listing" page shown    
    And user presses "OK" button and "Quote Details" page shown
    And user confirms "Add Note" not display
    And user presses "Back" button and "Quote Listing" page shown
    And user presses "Back" button and "Search Quote" page shown
    And user selects "Converted" from "Quote Status" combobox
    And user presses "OK" button and "Quote Listing" page shown
    And user presses "OK" button and "Quote Details" page shown
    And user confirms "Add Note" not display
    And user presses "Back" button and "Quote Listing" page shown
    And user presses "Cancel" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
