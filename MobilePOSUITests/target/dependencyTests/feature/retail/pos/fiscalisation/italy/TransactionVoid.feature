Feature: Transaction Void on Italy Fiscal POS

  @PT-5753 @Fiscalisation @Italy @FiscalItalyTransactionVoid @AUTOMATED @ManualVerification
  Scenario: Verify Transaction void on Italy Fiscal POS
    Given user signs on as "Italy Fiscal Sales Assistant"
    And user enters "${Product Fiscal IT 1}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${Product Fiscal IT 2}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    And "Enter User" page is shown
