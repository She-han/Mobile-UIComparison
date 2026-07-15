Feature: Safe Cash Management - Safe Spot Check

  @PT-158 @PreSales @AUTOMATED @POS @MVP @Harrods_Restaurent @Harrods_Sanity @MVP_DE @Mobile @Support @ManualVerification @SafeCashManagement @POSValidatedTest @POSSet1
  Scenario: Cash Management - Perform a Safe Spot Check
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Safe Cash Management" button and "Selection State" page shown
    And user presses "Safe Cash Management Screen Spot Check" icon button
    And "Cash Management Select Tender Reason" page is shown
    When user selects "Cheques UK" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "ENT" button
    And user presses "Complete" button and "Enter Notes" page shown
    And user enters "This is a safe spot check" into "Cash Management Text Area" field
    And user presses "OK" button and "Cash Management Session Summary Prompt" page shown
    And user presses "OK" button and "Selection State" page shown
    And user presses "Safe Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    Then receipt display with following details
      | text | Safe Spot Check       |
      | text | Safe ${Safe ID}       |
      | item | Cheques UK,£10.00     |
      | text | ${Manager 2 Username} |
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-17958 @AUTOMATED @POS @SafeCashManagement
  Scenario: Safe Cash Management - Void a Safe Spot Check
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Safe Cash Management" button and "Selection State" page shown
    And user presses "Safe Cash Management Screen Spot Check" icon button
    And "Cash Management Select Tender Reason" page is shown
    When user selects "Cash" from "Selection List" list
    And user enters "200.00" into "Input Box" field
    And user presses "ENT" button
    And user presses "Void" button and "Selection State" page shown
    And user presses "Safe Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    Then receipt display with following details
      | text | VOIDED                |
      | text | Safe Spot Check       |
      | text | Safe ${Safe ID}       |
      | item | Cash,?200.00          |
      | text | ${Manager 2 Username} |
    And user presses "SignOff" button
    And "Enter User" page is shown
