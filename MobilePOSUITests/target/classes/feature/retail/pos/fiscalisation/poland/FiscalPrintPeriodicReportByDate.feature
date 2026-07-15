Feature: Fiscal Print Periodic Report by Date

  @PT-618 @Fiscalisation @Poland @FiscalPolandPrintPeriodicReportByDate @No_Printer @AUTOMATED
  Scenario: Print the Fiscal Print Periodic Report by date
    Given user signs on as "Poland Fiscal Sales Assistant"
    When user presses "Management" button
    And user presses "Reports" button
    And user presses "Fiscal Reports" button
    And user presses "Fiscal Print Periodic" button
    Then "Fiscal Print Periodic" page is shown
    When user selects "Report By Date" from "Report Type" combobox
    And user selects "${Poland Fiscal Print Periodic Start Date Day}" from "Start Date Day Field" combobox
    And user selects "${Poland Fiscal Print Periodic Start Date Month}" from "Start Date Month Field" combobox
    And user enters "${Poland Fiscal Print Periodic Start Date Year}" into "Start Date Year Field" field
    And user selects "${Poland Fiscal Print Periodic End Date Day}" from "End Date Day Field" combobox
    And user selects "${Poland Fiscal Print Periodic End Date Month}" from "End Date Month Field" combobox
    And user enters "${Poland Fiscal Print Periodic End Date Year}" into "End Date Year Field" field
    And user presses "OK" button
    Then "Fiscal Poland X Report Prompt" page is shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
