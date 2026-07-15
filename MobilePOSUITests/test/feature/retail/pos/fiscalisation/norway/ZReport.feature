Feature: Z Report

  @PT-864 @Fiscalisation @Norway @FiscalNorwayZReport @No_Printer @AUTOMATED
  Scenario: Z Report
    Given user signs on as "Norway Fiscal Sales Assistant"
    And user presses "Management" button
    And user presses "Fiscalisation" button
    And user presses "Fiscal Reports" button
    When user presses "Z Report" button
    Then "Fiscal Norway Print Report Prompt" page is shown
    When user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
