Feature: Quote Listing - Test the buttons Down, Up, Back and Cancel

  @PT-2021 @ToBeFixedAutTest @QuoteListButtons @Quote @POS @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Quote Listing - Test the buttons Down, Up, Back and Cancel
    Given user signs on as "Pos Operator"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Quotes" button
    And user presses "Search Quotes" button and "Search Quote" page shown
    And user selects "Open" from "Quote Status" combobox
    And user presses "OK" button and "Quote Listing" page shown
    When user presses "Down" button
    And user presses "Up" button
    And user presses "Back" button and "Search Quote" page shown
    And user selects "Open" from "Quote Status" combobox
    And user presses "OK" button and "Quote Listing" page shown
    And user presses "Cancel" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
