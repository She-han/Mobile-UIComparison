Feature: Z Report

  @PT-611 @Fiscalisation @Poland @FiscalPolandZReport @No_Printer @AUTOMATED
  Scenario: Z Report
    Given user signs on as "Poland Fiscal Sales Assistant"
    And user presses "Management" button
    When user presses "Reports" button
    And user presses "Fiscal Reports" button
    And user presses "Fiscal Z Report" button and "Fiscal Poland Z Report Prompt" page shown
    And user presses "OK" button
    And "Fiscal Poland Z Report Prompt Status" page is shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
