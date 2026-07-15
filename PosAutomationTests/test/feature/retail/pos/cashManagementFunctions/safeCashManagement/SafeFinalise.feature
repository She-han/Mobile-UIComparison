Feature: Safe Cash Management - Safe Finalise

  @PT-652 @AUTOMATED @POS @MVP @ManualVerification @SafeCashManagement @POSValidatedTest @POSSet1
  Scenario: Cash Management - Safe Finalise
    Given user signs on as "Manager 2"
    And "Transaction Basket" page is shown
    And user presses "Management" button
    And user presses "Safe Cash Management" button and "Cash Management Safe Cash Management" page shown
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Safe Cash Management Screen Cashup Button" icon button
    And "Multiple Sessions" page is shown
    And user presses "OK" button and "Cash Management Select Tender Reason" page shown
    And "Cash Management Select Tender Reason" page is shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Cash Management Edit Denomination By Value" page shown
    And user enters "10.00" into "Input Box" field
    And user presses "ENT" button
    Then user presses "Confirm" button and "Cash Management Select Tender Reason" page shown
    And user presses "Complete" button and "Enter Notes" page shown
    And user enters "This is a cashup" into "Cash Management Text Area" field
    And user presses "OK" button and "Cash Management Safe Cash Management" page shown
    And user presses "Clear" button on external "Primary Printer" window
    And user presses "Safe Cash Management Screen Finalise Button" icon button
    And "Safe Cash Management Finalise Confirm" page is shown
    And user presses "Yes" button and "Enter Notes" page shown
    And user enters "This is a safe finalise" into "Cash Management Text Area" field
    And user presses "OK" button and "Cash Management Safe Cash Management" page shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    Then receipt display with following details
      | text | Safe Finalise           |
      | item | Cash UK,£10.00          |
      | text | Total                   |
      | text | This is a safe finalise |
      | text | ${Manager 2 Username}   |
    And user presses "Logout Button" icon button
