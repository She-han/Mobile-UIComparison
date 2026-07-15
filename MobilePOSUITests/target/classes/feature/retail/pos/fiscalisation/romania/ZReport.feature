Feature: Print Z Report - Romania

  @PT-969 @RomaniaFiscalZReport @No_Printer @Fiscalisation @FiscalRomania @AUTOMATED
  Scenario: Romania - Print Z Report
    Given user signs on as "Romania Fiscal Supervisor"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Fiscal Reports" button
    When user presses "Fiscal Z Report" button and "Fiscal Romania Print Report" page shown
    Then "Fiscal Romania Report Success Prompt" page is shown
    When user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
