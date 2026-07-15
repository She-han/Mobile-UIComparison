Feature: Search a quote giving criteria for each field

  @PT-2018 @SearchQuote @Quote @Automated
  Scenario: Search Quote - enter criteria for all fields to return a result
    Given user signs on as "Pos Operator"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Quotes" button and "Sell Style Colour Item" page shown
    And user presses "Search Quotes" button and "Search Quotes" page shown
    When user enters "Sally" into "Forename" field
    And user enters "Sanders" into "Lastname" field
    And user enters "SG14PB " into "Postcode" field
    And user enters "${Quote Id}" into "Quote Id" field
    And user enters "19/03/20" into "Quote Date Range Start Date" field
    And user enters "19/03/20" into "Quote Date Range End Date" field
    And user enters "po1" into "Store User" field
    And user selects "Open" from "Status" list
    And user presses "OK" button and "Quote Listing" page shown
    Then "${Quote Id}" is displayed in "Quote list" list
    And "Sally Sanders" is displayed in "Quote list" list
    And "19/03/20" is displayed in "Quote list" list
    And "SG14PB" is displayed in "Quote list" list
    And "Pos Operator 1" is displayed in "Quote list" list
    And "Open" is displayed in "Quote list" list
    And "£50.00" is displayed in "Quote list" list
    And user presses "Cancel" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
