Feature: Safe Cashup

  @PT-649 @SafeCashManagement @Harrods @MVP @MObile @Support @AUTOMATED @ManualVerification @POS @POSValidatedTest	@POSSet1
  Scenario: Cash Management - Perform a Safe Cashup
    Given user signs on as "Manager 2"
    And user presses "Management" button
    When user presses "Safe Cash Management" button
    And "Safe Cash Management" page is shown
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Safe Cash Management Screen Cashup Button" icon button
    Then "Terminal Cash Management Select Tender" page is shown
    And user selects "Cheques UK" from "Selection List" list
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Complete" button and "Cash Management Enter Notes" page shown
    And user enters "Safe Cashup Note" into "Cash Management Text Area" field
    And user presses "OK" button
    Then "Safe Cash Management" page is shown
    And receipt display with following details
      | text | Safe Cashup      |
      | item | Cheques UK,£1.00 |
      | text | Expected         |
      | text | Discrepancy      |
      | text | Safe Cashup Note |
    #Finalize the Safe Cashup
    And user presses "Safe Cash Management Screen Finalise Button" icon button
    And "Safe Cash Management Finalise Confirm" page is shown
    And user presses "Yes" button and "Cash Management Enter Notes" page shown
    And user enters "Safe Finalize Note" into "Cash Management Text Area" field
    And user presses "OK" button
    And "Safe Cash Management" page is shown
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    