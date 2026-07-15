Feature: Print Cumulated Receipt

  @PT-638 @Fiscal_Cumulated_Receipt @No_Printer @Austria @AUTOMATED @Fiscalisation @FiscalAustria
  Scenario: Print Cumulated Receipt
    Given user signs on as "Austria Fiscal Sales Assistant"
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Fiscalisation" button
    And user presses "Cumulated Receipt" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
