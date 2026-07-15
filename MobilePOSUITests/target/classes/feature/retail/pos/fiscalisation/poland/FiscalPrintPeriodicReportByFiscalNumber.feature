Feature: Fiscal Print Periodic Report by Fiscal Day Number

  @PT-727 @Fiscalisation @Poland @FiscalPolandPrintPeriodicReportByFiscalNumber @No_Printer @AUTOMATED
  Scenario: Fiscal Print Periodic Report by Fiscal Day Number
    Given user signs on as "Poland Fiscal Sales Assistant"
    When user presses "Management" button
    And user presses "Reports" button
    And user presses "Fiscal Reports" button
    And user presses "Fiscal Print Periodic" button
    Then "Fiscal Print Periodic" page is shown
    When user selects "Report By Fiscal Number" from "Report Type" combobox
    And user enters "${POLAND_FISCAL_PRINT_PERIODIC_STARTING_FISCAL_DAY_NUMBER}" into "Report Start Fiscal Day Number" field
    And user enters "${POLAND_FISCAL_PRINT_PERIODIC_ENDING_FISCAL_DAY_NUMBER}" into "Report End Fiscal Day Number" field
    And user presses "OK" button
    Then "Fiscal Poland X Report Prompt" page is shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
