Feature: Quote Details - Add Notes and verify it. Cancel from the Add Notes screen

  @PT-2023 @TobeFixedAutTest @AddNotes @Quote @POS @AUTOMATED
  Scenario: Quote Details - Add Notes and verify it. Cancel from the Add Notes screen
    Given user signs on as "Pos Operator"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Quotes" button
    And user presses "Search Quotes" button and "Search Quote" page shown
    When user selects "Open" from "Quote Status" combobox
    And user presses "OK" button and "Quote Listing" page shown
    And user presses "OK" button and "Quote Details" page shown
    And user presses "Add Note" button and "Retreived Quote Note" page shown
    And user enters "Testing Notes 123456" into "Quote Note" field
    And user presses "OK" button and "Quote Details" page shown
    Then "Quote Note Created By" label displays the text "Pos Operator 1 (PO1)"
    #Text verification support is required in the Quote Details screen and is raised under PLAT-14723
    #And "Quote Note Description" label displays the text "Testing Notes 123456"
    When user presses "Add Note" button and "Retreived Quote Note" page shown
    And user presses "Cancel" button and "Quote Details" page shown
    And user presses "Back" button and "Quote Listing" page shown
    And user presses "Cancel" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
