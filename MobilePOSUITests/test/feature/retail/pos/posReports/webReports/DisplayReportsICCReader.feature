Feature: Display ICC Reader Web Reports

  @PT-7580 @PreSales @ICCReader @POS @AUTOMATED @WebReports @DuplicatedICCReadersReport @NotForRC1
  Scenario: Generate Duplicated ICC Reader Report - ICC Reader Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "ICC Reader Reports" button
    And user presses "Duplicated ICC Readers" button
    When "Web Report Criteria Form" page is shown
    And user selects "${Web Report Readers Region}" from "Duplicated ICC Readers Region" combobox
    And user selects "${Web Report Readers Location}" from "Duplicated ICC Readers Location" combobox
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Duplicated ICC Reader |
      | Region       | United Kingdom        |
      | Location     | Enactor Store         |
      | Generated on | #{today}              |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-7581 @PreSales @ICCReader @POS @AUTOMATED @WebReports @ICCReaderConnectionsReport @NotForRC1
  Scenario: Generate ICC Reader Connections Report - ICC Reader Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "ICC Reader Reports" button
    And user presses "ICC Reader Connections" button
    When "Web Report Criteria Form" page is shown
    And user selects "${Web Report Readers Region}" from "ICC Reader Connections Region" combobox
    And user selects "${Web Report Readers Location}" from "ICC Reader Connections Location" combobox
    And user selects "Date Range" from "ICC Reader Connections Date Range" combobox
    And user enters "#{today-2}" into "ICC Reader Connections Date From" field
    And user enters "#{today}" into "ICC Reader Connections Date To" field
    And user selects "Device ID" from "ICC Reader Connections Order By" combobox
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | ICC Reader Connections |
      | Region       | United Kingdom         |
      | Location     | Enactor Store          |
      | Order By     | Device ID              |
      | Generated on | #{today}               |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-7582 @PreSales @ICCReader @POS @AUTOMATED @WebReports @UnexpectedICCReadersReport @NotForRC1
  Scenario: Generate Unexpected ICC Readers Connected Report - ICC Reader Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "ICC Reader Reports" button
    And user presses "Unexpected ICC Readers" button
    When "Web Report Criteria Form" page is shown
    And user selects "${Web Report Readers Region}" from "Unexpected ICC Readers Region" combobox
    And user selects "${Web Report Readers Location}" from "Unexpected ICC Readers Location" combobox
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Unexpected ICC Readers Connected |
      | Region       | United Kingdom                   |
      | Location     | Enactor Store                    |
      | Generated on | #{today}                         |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
