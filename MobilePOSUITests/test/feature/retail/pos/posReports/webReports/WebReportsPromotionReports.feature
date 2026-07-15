Feature: Display Promotion Web Reports

  @PT-7584 @PromotionWebReports @POS @AUTOMATED @WebReports @PromotionSummaryReport
  Scenario: Generate Promotion Summary Report - Promotion Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "More Reports" button
    And user presses "Promotion Reports" button
    And user presses "Promotion Summary" button
    When "Web Report Criteria Form" page is shown
    And user selects "${Web Report Promotion Summary Region}" from "Promotion Summary Region" combobox
    And user selects "${Web Report Promotion Summary Location}" from "Promotion Summary Location" combobox
    And user selects "${Web Report Promotion Summary Terminal}" from "Promotion Summary Terminal" combobox
    And user selects "${Web Report Promotion Summary Promotion}" from "Promotion Summary Promotion" combobox
    And user selects "Date Range" from "Promotion Summary Date Range" combobox
    And user enters "#{today-2}" into "Promotion Summary Date From" field
    And user enters "#{today}" into "Promotion Summary Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Promotion Summary                         |
      | Region       | ${Web Report Promotion Summary Region}    |
      | Location     | ${Web Report Promotion Summary Location}  |
      | Terminal     | ${Web Report Promotion Summary Terminal}  |
      | Promotion    | ${Web Report Promotion Summary Promotion} |
      | Date From    | #{today-2}                                |
      | Date To      | #{today}                                  |
      | Generated on | #{today}                                  |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-13617 @PromotionWebReports @POS @AUTOMATED @WebReports @PromotionSummaryReport @Regression
  Scenario: Verify that the Date filters function correctly when generating a report for the second time
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "More Reports" button
    And user presses "Promotion Reports" button
    And user presses "Promotion Summary" button
    When "Web Report Criteria Form" page is shown
    And user selects "United Kingdom" from "Promotion Summary Region" combobox
    And user selects "Enactor Store" from "Promotion Summary Location" combobox
    And user selects "POS 1 @ Enactor" from "Promotion Summary Terminal" combobox
    And user selects "Date Range" from "Promotion Summary Date Range" combobox
    And user enters "#{today-2}" into "Promotion Summary Date From" field
    And user enters "#{today}" into "Promotion Summary Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Promotion Summary |
      | Region       | United Kingdom    |
      | Location     | Enactor Store     |
      | Terminal     | POS 1 @ Enactor   |
      | Date From    | #{today-2}        |
      | Date To      | #{today}          |
      | Generated on | #{today}          |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user selects "Month In Year" from "Promotion Summary Date Range" combobox
    And user selects "Date Range" from "Promotion Summary Date Range" combobox
    And user enters "#{today-2}" into "Promotion Summary Date From" field
    And user enters "#{today}" into "Promotion Summary Date To" field
    And user selects "United Kingdom" from "Promotion Summary Region" combobox
    And user selects "Enactor Store" from "Promotion Summary Location" combobox
    And user selects "POS 1 @ Enactor" from "Promotion Summary Terminal" combobox
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Promotion Summary |
      | Region       | United Kingdom    |
      | Location     | Enactor Store     |
      | Terminal     | POS 1 @ Enactor   |
      | Date From    | #{today-2}        |
      | Date To      | #{today}          |
      | Generated on | #{today}          |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown