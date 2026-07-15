Feature: Print Periodic Reports - Romania

  @PT-1169 @RomaniaPeriodicReportByFiscalNumber @No_Printer @AUTOMATED @Romania @Fiscalisation @FiscalRomania
  Scenario: Print Periodic Report By Fiscal Number on Romania POS
    Given user signs on as "Romania Fiscal Supervisor"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Fiscal Reports" button
    When user presses "Periodic Report" button and "Fiscal Romania Select Report Input Type" page shown
    And user presses "Report By Fiscal Number" button and "Romania Fiscal Enter Z Numbers" page shown
    When user enters "${Romania Report Starting Fiscal Day Number}" into "Romania Report Start Fiscal Number" field
    And user enters "${Romania Report Ending Fiscal Day Number}" into "Romania Report End Fiscal Number" field
    And user presses "OK" button and "Romania Print Report Soft Copy" page shown
    And user presses "Cancel" button and "Fiscal Romania Print Report" page shown
    Then "Fiscal Romania Report Success Prompt" page is shown
    When user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-971 @RomaniaPeriodicReportByDate @No_Printer @AUTOMATED @Romania @Fiscalisation @FiscalRomania
  Scenario: Print Periodic Report By Date on Romania POS
    Given user signs on as "Romania Fiscal Supervisor"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Fiscal Reports" button
    When user presses "Periodic Report" button and "Fiscal Romania Select Report Input Type" page shown
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
    And user presses "OK" button and "Romania Print Report Soft Copy" page shown
    And user presses "Cancel" button and "Fiscal Romania Print Report" page shown
    Then "Fiscal Romania Report Success Prompt" page is shown
    When user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-972 @RomaniaPeriodicTotalReport @No_Printer @AUTOMATED @Romania @Fiscalisation @FiscalRomania
  Scenario: Print Periodic Total Report on Romania POS
    Given user signs on as "Romania Fiscal Supervisor"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Fiscal Reports" button
    When user presses "Periodic Total Report" button and "Romania Fiscal Report Enter Date Time" page shown
    Then user selects "1" from "Start Date Day Field" combobox
    And user selects "November" from "Start Date Month Field" combobox
    And user enters "${Romania Report Start Year}" into "Start Date Year Field" field
    And user enters "${Romania Report Start Time Hour}" into "Start Date Hour Field" field
    And user enters "${Romania Report Start Time Minute}" into "Start Date Minute Field" field
    And user selects "2" from "End Date Day Field" combobox
    And user selects "November" from "End Date Month Field" combobox
    And user enters "${Romania Report End Year}" into "End Date Year Field" field
    And user enters "${Romania Report End Time Hour}" into "End Date Hour Field" field
    And user enters "${Romania Report End Time Minute}" into "End Date Minute Field" field
    And user presses "OK" button and "Romania Print Report Soft Copy" page shown
    And user presses "Cancel" button and "Fiscal Romania Print Report" page shown
    Then "Fiscal Romania Report Success Prompt" page is shown
    When user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
