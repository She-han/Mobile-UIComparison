Feature: Show warning if quote search returns more than 100 results

  @PT-2039 @MoreThanHundredQuotes @Quote @AUTOMATED
  Scenario: Show warning if quote search returns more than 100 results
    #Over 100 quotes should be imported as Historic Data for this prompt to appear
    Given user signs on as "Pos Operator"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Quotes" button
    And user presses "Search Quotes" button and "Search Quote" page shown
    When user selects "Open" from "Quote Status" combobox
    And user presses "OK" button
    Then "Enable More Filters" page is shown
    And user presses "OK" button and "Quote Listing" page shown
    And user presses "Cancel" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
