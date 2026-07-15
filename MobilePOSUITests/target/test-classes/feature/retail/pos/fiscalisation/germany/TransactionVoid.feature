Feature: Transaction Void on German Fiscal POS

  @PT-2159 @GermanyFiscalTransactionVoid @AUTOMATED @Germany @Fiscalisation @FiscalGermany @ManualVerification
  Scenario: Verify Transaction Void on German Fiscal POS
    Given user signs on as "Germany Fiscal Sales Assistant"
    And user enters "${Product Fiscal De 1}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${Product Fiscal De 2}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    And "Enter User" page is shown
