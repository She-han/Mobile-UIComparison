Feature: Safe Cash Management - Safe Income

  @PT-159 @ManualVerification @MVP @POS @AUTOMATED @SafeCashManagement @POSValidatedTest @POSSet1
  Scenario: Cash Management - Perform a Safe Income
    Given user signs on as "Manager 2"
    And "Transaction Basket" page is shown
    And user presses "Management" button
    And user presses "Safe Cash Management" button and "Cash Management Safe Cash Management" page shown
    And user presses "Cash Management Screen Income Button" icon button
    Then "Cash Management Select Income Reason" page is shown
    When user selects "Store Income" from "Selection List" list
    And user presses "OK" button
    And "Cash Management Select Tender Reason" page is shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button and "Cash Management Edit Denomination By Value" page shown
    And user enters "10.00" into "Input Box" field
    And user presses "ENT" button
    And user enters "20.00" into "Input Box" field
    And user presses "ENT" button
    And user enters "30.00" into "Input Box" field
    And user presses "ENT" button
    And user enters "40.00" into "Input Box" field
    And user presses "ENT" button
    And user enters "50.00" into "Input Box" field
    And user presses "ENT" button
    And user enters "60.00" into "Input Box" field
    And user presses "ENT" button
    And user enters "70.00" into "Input Box" field
    And user presses "ENT" button
    And user enters "80.00" into "Input Box" field
    And user presses "ENT" button
    And user enters "90.00" into "Input Box" field
    And user presses "ENT" button
    And user enters "100.00" into "Input Box" field
    When user presses "ENT" button
    Then user presses "Confirm" button and "Cash Management Select Tender Reason" page shown
    And user presses "Notes" button and "Cash Management Add Notes" page shown
    And user enters "This is Safe Income" into "Cash Management Text Area" field
    And user presses "OK" button and "Cash Management Select Tender Reason" page shown
    #Minimum Captured Documents set to zero. Hence Attach Documents screen not displayed.
    And user presses "Complete" button and "Cash Management Add Notes" page shown
    And user presses "OK" button and "Cash Management Safe Cash Management" page shown
    And receipt display with following details
      | text | Safe Income           |
      | text | Safe ${Safe ID}       |
      | text | Cash UK               |
      | item | Cash UK,£550.00       |
      | item | Pence,£10.00          |
      | item | 2 Pence,£20.00        |
      | item | 5 Pence,£30.00        |
      | item | 10 Pence,£40.00       |
      | item | 20 Pence,£50.00       |
      | item | 1 Pound,£60.00        |
      | item | 2 Pounds,£70.00       |
      | item | 5 Pounds,£80.00       |
      | item | 10 Pounds,£90.00      |
      | item | 20 Pounds,£100.00     |
      | text | This is Safe Income   |
      | text | ${Manager 2 Username} |
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
