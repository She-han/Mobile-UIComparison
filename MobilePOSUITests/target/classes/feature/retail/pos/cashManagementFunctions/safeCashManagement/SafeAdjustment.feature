Feature: Safe Cash Management - Safe Adjustment

  @PT-161 @AUTOMATED @POS @MVP @Harrods_Restaurent @Support @SafeCashManagement @POSValidatedTest @POSSet1
  Scenario: Cash Management - Perform a Safe Adjustment
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Safe Cash Management" button and "Selection State" page shown
    And user presses "Safe Cash Management Screen Adjustment" icon button
    And "Cash Management Select Tender Reason" page is shown
    And "Adjustment Tender" is displayed in "Selection List" list
    And "Amount" is displayed in "Selection List" list
    When user selects "Cards UK" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "OK" button
    And "£10.00" is displayed in "Selection List" list
    And user presses "Notes" button and "Enter Notes" page shown
    And user enters "This is a safe adjustment" into "Cash Management Text Area" field
    And user presses "OK" button and "Cash Management Select Tender Reason" page shown
    And user presses "Notes" button and "Enter Notes" page shown
    And "Cash Management Text Area" field displays the text "This is a safe adjustment"
    And user presses "OK" button and "Cash Management Select Tender Reason" page shown
    And user presses "Complete" button and "Enter Notes" page shown
    And "Cash Management Text Area" field displays the text "This is a safe adjustment"
    And user presses "OK" button and "Selection State" page shown
    Then receipt display with following details
      | text | Safe Adjustment                 |
      | item | Safe ${Safe ID} Cards UK,£10.00 |
      | text | This is a safe adjustment       |
      | text | ${Manager 2 Username}           |
    And user presses "Safe Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-14725 @AUTOMATED @POS @MVP @Harrods_Restaurent @Support @SafeCashManagement @POSValidatedTest @POSSet1 @React
  Scenario: Cash Management - Perform a Safe Adjustment
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Safe Cash Management" button and "Selection State" page shown
    And user presses "Safe Cash Management Screen Adjustment" icon button
    And "Cash Management Select Tender Reason" page is shown
    When user selects "Cards UK" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "ENT" button
    And user presses "Notes" button and "Enter Notes" page shown
    And user enters "This is a safe adjustment" into "Cash Management Text Area" field
    And user presses "OK" button and "Cash Management Select Tender Reason" page shown    
    And user presses "Notes" button and "Enter Notes" page shown
    And "Cash Management Text Area" field displays the text "This is a safe adjustment"
    And user presses "OK" button and "Cash Management Select Tender Reason" page shown
    And user presses "Complete" button and "Enter Notes" page shown
		And "Cash Management Text Area" field displays the text "This is a safe adjustment"
		And user presses "OK" button and "Safe Cash Management" page shown
    Then receipt display with following details
      | text | Safe Adjustment                 |
      | item | Safe ${Safe ID} Cards UK,£10.00 |
      | text | This is a safe adjustment       |
      | text | ${Manager 2 Username}           |
    And user presses "Safe Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-157 @Automation_E2E @MVP @MVP_DE @Support @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Safe Adjustment Add monies to the safe
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Safe Cash Management" button and "Safe Cash Management" page shown
    And user presses "Safe Cash Management Screen Adjustment" icon button
    And "Terminal Cash Management Select Tender" page is shown
    When user selects "Cards UK" from "Selection List" list
    And user enters "10.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Complete" button and "Enter Notes" page shown
    And user enters "This is a safe adjustment" into "Cash Management Text Area" field
    And user presses "OK" button and "Safe Cash Management" page shown
    Then receipt display with following details
      | text | Safe Adjustment |
      | text | Safe ${Safe ID} |
      | item | Cards UK,£10.00 |
    And user presses "Safe Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
