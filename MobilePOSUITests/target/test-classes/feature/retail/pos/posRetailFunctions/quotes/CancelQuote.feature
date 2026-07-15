Feature: Cancel a quote

  @PT-2022 @CancelQuote @Quote @DevelopmentInProgress @ToBeFixedAutTest
  Scenario: Cancel a quote
    Given user signs on as "Pos Operator"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Quotes" button and "Sell Style Colour Item" page shown
    And user presses "Search Quotes" button and "Search Quote" page shown
    When user selects "Open" from "Status" combobox
    And user presses "OK" button and "Quote Listing" page shown
    And "Open" is displayed in "Quote" list
    And user selects "Open" from "Quote List" list
    And user presses "OK" button and "Quote Details" page shown
    And user presses "Cancel Quote" button
    Then "Cancel Quote Prompt" page is shown
    And user presses "Yes" button
    And "Quote was succesufully Cancelled prompt" page is shown
    And user presses "OK" button and "Search Quote" page shown
    When user selects "Cancel" from "Status" combobox
    And user presses "OK" button and "Quote Listing" page shown
    And user presses "OK" button and "Quote Details" page shown
    Then "Cancelled" is displayed in "Quote Details Header" panel
    And user presses "Back" button and "Quote Listing" page shown
    And user presses "Cancel" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
