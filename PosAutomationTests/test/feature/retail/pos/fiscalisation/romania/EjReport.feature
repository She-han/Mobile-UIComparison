Feature: Print X Report - Romania

  @PT-973 @RomaniaFiscalEJReportByDate @No_Printer @AUTOMATED @Romania @Fiscalisation @FiscalRomania
  Scenario: Romania EJ Report - Print By Date
    Given user signs on as "Romania Fiscal Supervisor"
    When user presses "Management" button
    When user presses "Reports" button
    And user presses "Fiscal Reports" button
    When user presses "EJ Report" button and "Romania Select EJ Report Type" page shown
    And user selects "Fiscal Sales Receipt With Tax Id" from "RO EJ Report Ticket Type" combobox
    When user presses "OK" button
    And "Fiscal Romania Select Report Input Type" page is shown
    And user presses "Report By Date" button and "Romania Fiscal Report Enter Date Time" page shown
    And user selects "${Romania Report Start Date}" from "Start Date Day Field" combobox
    And user selects "${Romania Report Start Month}" from "Start Date Month Field" combobox
    And user enters "${Romania Report Start Year}" into "Start Date Year Field" field
    And user enters "${Romania Report Start Time Hour}" into "Start Date Hour Field" field
    And user enters "${Romania Report Start Time Minute}" into "Start Date Minute Field" field
    And user selects "${Romania Report End Date}" from "End Date Day Field" combobox
    And user selects "${Romania Report End Month}" from "End Date Month Field" combobox
    And user enters "${Romania Report End Year}" into "End Date Year Field" field
    And user enters "${Romania Report End Time Hour}" into "End Date Hour Field" field
    And user enters "${Romania Report End Time Minute}" into "End Date Minute Field" field
    And user presses "OK" button
    And "Romania Print Report Soft Copy" page is shown
    And user presses "Cancel" button and "Fiscal Romania Print Report" page shown
    Then "Fiscal Romania Report Success Prompt" page is shown
    When user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1177 @RomaniaFiscalEJReportByFiscalNo @No_Printer @AUTOMATED @Romania @Fiscalisation
  Scenario: Romania EJ Report -Print By Fiscal Number
    Given user signs on as "Romania Fiscal Supervisor"
    When user presses "Management" button
    When user presses "Reports" button
    And user presses "Fiscal Reports" button
    When user presses "EJ Report" button and "Romania Select EJ Report Type" page shown
    And user selects "Fiscal Sales Receipt With Tax Id" from "RO EJ Report Ticket Type" combobox
    When user presses "OK" button
    And "Fiscal Romania Select Report Input Type" page is shown
    And user presses "Report By Fiscal Number" button and "Romania Fiscal Enter Z Numbers" page shown
    When user enters "${Romania Report Starting Fiscal Day Number}" into "Romania Report Start Fiscal Number" field
    And user enters "${Romania Report Ending Fiscal Day Number}" into "Romania Report End Fiscal Number" field
    And user presses "OK" button and "Romania Enter Ticket Range" page shown
    When user enters "${Romania Report Starting Ticket Number}" into "Romania Report Start Fiscal Number" field
    And user enters "${Romania Report Ending Ticket Number}" into "Romania Report End Fiscal Number" field
    And user presses "OK" button and "Romania Print Report Soft Copy" page shown
    And user presses "Cancel" button and "Fiscal Romania Print Report" page shown
    Then "Fiscal Romania Report Success Prompt" page is shown
    When user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
