Feature: Cannot retreive quote while there are items in the bag

  @PT-2055 @AddItemAttemptSearch @Quote @POS @AUTOMATED
  Scenario: If there are already products in your basket & then you try to retrieve/search a quote
    Given user signs on as "Pos Operator"
    When user enters "${Sku Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Quotes" button
    Then button with label "Search Quotes" is not displayed
    And user presses "Back" button
    And user presses "Back" button
    And user presses "Back" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2046 @TobeFixedAutTest @ConvertQuoteAttempteSearch @Quote @POS @AUTOMATED
  Scenario: Convert a quote & attempt to search for & convert another quote in same the order
    Given user signs on as "Pos Operator"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Quotes" button
    And user presses "Search Quotes" button and "Search Quote" page shown
    When user selects "Open" from "Quote Status" combobox
    And user presses "OK" button and "Quote Listing" page shown
    And user presses "OK" button and "Quote Details" page shown
    And user presses "Convert to Order" button and "Convert To Order Prompt" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Quotes" button
    Then button with label "Search Quotes" is not displayed
    And user presses "Back" button
    And user presses "Back" button
    And user presses "Back" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
