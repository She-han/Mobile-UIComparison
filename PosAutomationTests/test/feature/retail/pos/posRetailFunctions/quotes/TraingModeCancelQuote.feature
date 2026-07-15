Feature: Training Mode - Cancel a Quote

  @PT-2052 @TrainingmodeCancelQuote @Quote @DevelopmentInProgress
  Scenario: Training Mode - Cancel a Quote
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    When user presses "Training Mode" button
    And "Enter Authorising User" page is shown
    And user enters "${Sales Assistant Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Sales Assistant Password}" into "Input Box" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
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
    When user presses "Yes" button and "Search Quote" page shown
    And user enters "${Quote Id}" into "Quote Id" field
    And user presses "OK" button and "Quote Listing" page shown
    And user presses "OK" button and "Quote Details" page shown
    And "Open" is displayed in "Quote Details Header" panel
    And user presses "Back" button and "Quote Listing" page shown
    And user presses "Cancel" button
    Then "Transaction Basket" page is shown
    And user presses "Management" button
    When user presses "Training Mode" button
    And "Enter Authorising User" page is shown
    And user enters "${Sales Assistant Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Sales Assistant Password}" into "Input Box" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
