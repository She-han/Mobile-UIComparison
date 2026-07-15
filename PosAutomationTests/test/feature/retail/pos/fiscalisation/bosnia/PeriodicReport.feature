Feature: Periodic Report

  @PT-986 @Fiscalisation @Bosnia @No_Printer @AUTOMATED
  Scenario: Periodic Report - Prints only the number, date and time
    Given user signs on as "Bosnia Fiscal Sales Assistant"
    When user presses "Management" button
    When user presses "Reports" button
    And user presses "Fiscal Reports" button
    When user presses "Periodic Report" button and "Bosnia Fiscal Reports" page shown
    And user presses "Report By Fiscal Number" button and "Bosnia Enter Fiscal Number" page shown
    When user enters "${Bosnia Report Starting Fiscal Day Number}" into "Report Start Fiscal Number" field
    And user enters "${Bosnia Report Ending Fiscal Day Number}" into "Report End Fiscal Number" field
    And user selects "Prints only the number and date time for each Z report" from "Periodic Type" combobox
    And user presses "OK" button and "Bosnia Print Report Prompt" page shown
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1012 @Fiscalisation @Bosnia @No_Printer @AUTOMATED
  Scenario: Periodic Report - Prints total number of issued receipts for each Z report
    Given user signs on as "Bosnia Fiscal Sales Assistant"
    When user presses "Management" button
    When user presses "Reports" button
    And user presses "Fiscal Reports" button
    When user presses "Periodic Report" button and "Bosnia Fiscal Reports" page shown
    And user presses "Report By Fiscal Number" button and "Bosnia Enter Fiscal Number" page shown
    When user enters "${Bosnia Report Starting Fiscal Day Number}" into "Report Start Fiscal Number" field
    And user enters "${Bosnia Report Ending Fiscal Day Number}" into "Report End Fiscal Number" field
    And user selects "Prints total number of issued receipts for each Z report" from "Periodic Type" combobox
    And user presses "OK" button and "Bosnia Print Report Prompt" page shown
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1372 @Fiscalisation @Bosnia @No_Printer @AUTOMATED
  Scenario: Periodic Report - Prints the total sum of each tax group for each Z report
    Given user signs on as "Bosnia Fiscal Sales Assistant"
    When user presses "Management" button
    When user presses "Reports" button
    And user presses "Fiscal Reports" button
    When user presses "Periodic Report" button and "Bosnia Fiscal Reports" page shown
    And user presses "Report By Fiscal Number" button and "Bosnia Enter Fiscal Number" page shown
    When user enters "${Bosnia Report Starting Fiscal Day Number}" into "Report Start Fiscal Number" field
    And user enters "${Bosnia Report Ending Fiscal Day Number}" into "Report End Fiscal Number" field
    And user selects "Prints the total sum for each tax group for each Z report" from "Periodic Type" combobox
    And user presses "OK" button and "Bosnia Print Report Prompt" page shown
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1373 @Fiscalisation @Bosnia @No_Printer @AUTOMATED
  Scenario: Periodic Report - By Date
    Given user signs on as "Bosnia Fiscal Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Fiscal Reports" button
    When user presses "Periodic Report" button and "Bosnia Fiscal Reports" page shown
    And user presses "Report By Date" button and "Bosnia Enter Date Time" page shown
    And user selects "${Bosnia Report Start Date}" from "Start Date Day Field" combobox
    And user selects "${Bosnia Report Start Month}" from "Start Date Month Field" combobox
    And user enters "${Bosnia Report Start Year}" into "Start Date Year Field" field
    And user selects "${Bosnia Report End Date}" from "End Date Day Field" combobox
    And user selects "${Bosnia Report End Month}" from "End Date Month Field" combobox
    And user enters "${Bosnia Report End Year}" into "End Date Year Field" field
    And user presses "OK" button and "Bosnia Print Report Prompt" page shown
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
