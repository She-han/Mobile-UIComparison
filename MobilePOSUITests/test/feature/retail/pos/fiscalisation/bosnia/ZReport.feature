Feature: Z Report

  @PT-985 @Fiscalisation @Bosnia @FiscalBosniaZReport @No_Printer @AUTOMATED
  Scenario: Z Report
    Given user signs on as "Bosnia Fiscal Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Fiscal Reports" button
    And user presses "Fiscal Z Report" button and "Bosnia Print Report Prompt" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
