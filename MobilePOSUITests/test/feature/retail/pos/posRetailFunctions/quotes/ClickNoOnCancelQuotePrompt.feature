Feature: Click No on Cancel Quote Prompt

  @PT-2026 @TobeFixedAutTest @ClickNoOnCancelQuote @POS @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Click No on Cancel Quote Prompt
    Given user signs on as "Pos Operator"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Quotes" button
    And user presses "Search Quotes" button and "Search Quote" page shown
    When user selects "Open" from "Quote Status" combobox
    And user presses "OK" button and "Quote Listing" page shown
    And user presses "OK" button and "Quote Details" page shown
    And user presses "Cancel Quote" button
    Then "Cancel Quote Prompt" page is shown
    And user presses "No" button
    And "Quote Details" page is shown
    And user presses "Back" button and "Quote Listing" page shown
    And user presses "Cancel" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
