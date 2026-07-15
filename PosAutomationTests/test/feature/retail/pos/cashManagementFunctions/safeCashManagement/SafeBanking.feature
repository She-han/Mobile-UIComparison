Feature: Safe Banking

  @PT-650 @SafeCashManagement @MVP @Support @AUTOMATED @ManualVerification @POS @POSValidatedTest @POSSet1
  Scenario: Cash Management - Perform a Safe Banking
    Given user signs on as "Manager 2"
    And user presses "Management" button
    When user presses "Safe Cash Management" button
    And "Safe Cash Management" page is shown
    And user presses "Safe Cash Management Screen Banking Button" icon button
    And "Safe Cash Management Enter Banking Slip" page is shown
    And user enters "123" into "Input Box" field
    And user presses "OK" button
    Then "Safe Cash Management Enter Bag Reference" page is shown
    And user enters "123" into "Input Box" field
    And user presses "OK" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cheques UK" from "Selection List" list
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Complete" button and "Cash Management Enter Notes" page shown
    And user enters "Safe Banking Note" into "Cash Management Text Area" field
    When user presses "OK" button and "Safe Cash Management" page shown
    And receipt display with following details
      | text | Safe Banking            |
      | text | Cards PDQ (Auto Banked) |
      | text | Cards UK (Auto Banked)  |
      | item | Cheques UK,£1.00        |
      | text | Safe Banking Note       |
    And user presses "Cash Management Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
