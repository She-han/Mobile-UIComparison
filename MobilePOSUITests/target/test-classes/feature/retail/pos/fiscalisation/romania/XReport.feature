Feature: Print X Report - Romania

  @PT-970 @RomaniaFiscalXReport @No_Printer @AUTOMATED @Fiscalisation @FiscalRomania
  Scenario: Romania - Print X Report
    Given user signs on as "Romania Fiscal Supervisor"
    When user presses "Management" button
    When user presses "Reports" button
    And user presses "Fiscal Reports" button
    When user presses "Fiscal X Report" button and "Fiscal Romania Print Report" page shown
    Then "Fiscal Romania Report Success Prompt" page is shown
    When user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
