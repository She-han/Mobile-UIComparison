Feature: X Report

  @PT-610 @Fiscalisation @Poland @FiscalPolandXReport @No_Printer @AUTOMATED
  Scenario: X Report
    Given user signs on as "Poland Fiscal Sales Assistant"
    When user presses "Management" button
    And user presses "Reports" button
    And user presses "Fiscal Reports" button
    And user presses "Fiscal X Report" button and "Fiscal Poland X Report Prompt" page shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
