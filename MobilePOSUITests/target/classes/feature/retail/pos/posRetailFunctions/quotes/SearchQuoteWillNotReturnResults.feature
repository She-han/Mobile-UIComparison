Feature: Search quote which will not return any results

  @PT-2032 @SearchLeavingFieldsEmpty @Quote @POS @AUTOMATED
  Scenario: Search for a quote without entering search criteria
    Given user signs on as "Pos Operator"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Quotes" button
    And user presses "Search Quotes" button and "Search Quote" page shown
    And user presses "OK" button
    Then "Enter Criteria Prompt" page is shown
    And user presses "OK" button and "Search Quote" page shown
    And user presses "Cancel" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2033 @TobeFixedAutTest @ValidSearchNoResult @Quote @POS @AUTOMATED
  Scenario: Enter valid search criteria which will not return results
    Given user signs on as "Pos Operator"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Quotes" button
    And user presses "Search Quotes" button and "Search Quote" page shown
    And user enters "aa1" into "Quote Store User" field
    And user presses "OK" button
    Then "No Result Found Prompt" page is shown
    And user presses "OK" button and "Search Quote" page shown
    And user presses "Cancel" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2035 @TobeFixedAutTest @InvalidCriteriaSearch @Quote @POS @AUTOMATED
  Scenario: Enter invalid criteria for the search
    Given user signs on as "Pos Operator"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Quotes" button
    And user presses "Search Quotes" button and "Search Quote" page shown
    And user enters "123" into "Quote Forename" field
    And user enters "456" into "Quote Surname" field
    And user enters "123%" into "Quote Postcode" field
    And user enters "456%" into "Quote Id" field
    And user enters "test%" into "Quote Store User" field
    And user presses "OK" button
    Then "No Result Found Prompt" page is shown
    And user presses "OK" button and "Search Quote" page shown
    And user enters "33/33/33" into "Quote Start Date" field
    And user presses "OK" button
    # Support text verification on Quote Search screen PLAT-14986
    #And "Quote Start Invalid Date" label displays the text "Invalid date"
    When user enters "55/55/55" into "Quote End Date" field
    And user presses "OK" button
    # Support text verification on Quote Search screen PLAT-14986
    #Then "Quote End Invalid Date" label displays the text "Invalid date"
    And user presses "Cancel" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
