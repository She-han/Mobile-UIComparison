Feature: Safe Currency Purchase

  @PT-156 @Automation_E2E @MVP @MVP_DE @Mobile @Support @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Add Currency to safe
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Safe Cash Management" button and "Safe Cash Management" page shown
    And user presses "Cash Management Currency Purchase Button" icon button
    And "Cash Management Select Tender Reason" page is shown
    When user selects "United States Dollar UK" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Complete" button and "Enter Notes" page shown
    And user enters "This is a currency purchase" into "Cash Management Text Area" field
    And user presses "OK" button and "Safe Cash Management" page shown
    And "Safe Cash Management" page is shown
    Then receipt display with following details
      | text | Safe Currency Purchase   |
      | text | Safe ${Safe ID}          |
      | item | Cash UK,£0.00            |
      | item | Euro Cash UK,€0.00       |
      | item | Swedish Krona UK,SEK0.00 |
      | text | United States Dollar UK  |
    #TODO: Investigate Dollar Sign receipt verification issue
    #| text | $10.00                   |
    And user presses "Safe Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
