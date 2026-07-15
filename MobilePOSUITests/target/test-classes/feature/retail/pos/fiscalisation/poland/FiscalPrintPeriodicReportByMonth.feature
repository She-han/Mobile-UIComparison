Feature: Fiscal Print Periodic Report by Month

  @PT-728 @Fiscalisation @Poland @FiscalPolandPrintPeriodicReportByMonth @No_Printer @AUTOMATED
  Scenario: Fiscal Print Periodic Report by month
    Given user signs on as "Poland Fiscal Sales Assistant"
    When user presses "Management" button
    And user presses "Reports" button
    And user presses "Fiscal Reports" button
    And user presses "Fiscal Print Periodic" button
    Then "Fiscal Print Periodic" page is shown
    When user selects "Report By Month" from "Report Type" combobox
    And user selects "${Poland Fiscal Print Periodic Start Date Day}" from "Date Of Month Day Field" combobox
    And user selects "${Poland Fiscal Print Periodic Start Date Month}" from "Date Of Month Month Field" combobox
    And user enters "${Poland Fiscal Print Periodic Start Date Year}" into "Date Of Month Year Field" field
    And user presses "OK" button
    Then "Fiscal Poland X Report Prompt" page is shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
