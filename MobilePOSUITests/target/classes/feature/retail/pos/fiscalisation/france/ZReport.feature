Feature: Printing Z Report

  @PT-17379 @Fiscalisation @France @FiscalFranceZReport @No_Printer @AUTOMATED
  Scenario: Printing Z Report
    Given user signs on as "France Fiscal Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Fiscal Reports" button
    When user presses "Fiscal Z Report" button and "Fiscal France Print Report" page shown
    Then "Fiscal France Report Success Prompt" page is shown
    When user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown