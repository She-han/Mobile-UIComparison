Feature: Negative Amounts are allowed for Void Receipts on German Fiscal POS

  @PT-2161 @GermanyFiscalReturnItem @AUTOMATED @Germany @Fiscalisation @FiscalGermany @ManualVerification
  Scenario: Negative Amounts are allowed for Void Receipts on German Fiscal POS
    Given user signs on as "Germany Fiscal Sales Assistant"
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product Fiscal DE 3}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "Voids" button
    And user presses "Void Item" button and "Scan Item Void" page shown
    Given user enters "${Product Fiscal De 3}" into "Input Box" field
    When user presses "ENT" button and "Void Last Item" page shown
    And user presses "Yes" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown