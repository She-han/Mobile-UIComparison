Feature: Transaction void on Czech Fiscal POS

  @PT-2213 @CzechRepublicFiscalTransactionVoid @AUTOMATED @CzechRepublic @Fiscalisation @ManualVerification
  Scenario: Verify Transaction void on Czech Fiscal POS
    Given user signs on as "Czech Republic Fiscal Sales Assistant"
    And user enters "${Product Fiscal CZ 1}" into "Input Box" field
    When user presses "ENT" button
    And user enters "${Product Fiscal CZ 3}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    And "Enter User" page is shown
