Feature: Display Employee Web Reports

  @PT-7573 @EmployeeWebReports @POS @AUTOMATED @WebReports @EmployeeReport
  Scenario: Generate Employee Balance Report - Employee Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Employee Reports" button
    And user presses "Employee Balance" button
    When "Web Report Criteria Form" page is shown
    And user selects "${Web Report Employee Balance Region}" from "Employee Balance Region" combobox
    And user selects "${Web Report Employee Balance Location}" from "Employee Balance Location" combobox
    And user enters "#{today-2}" into "Employee Balance Date From" field
    And user enters "#{today}" into "Employee Balance Date To" field
    And user selects "${Web Report Employee Balance Account Type}" from "Employee Balance Account Type" combobox
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Employee Balance                            |
      | Region       | ${Web Report Employee Balance Region}       |
      | Location     | ${Web Report Employee Balance Location}     |
      | Date From    | #{today-2}                                  |
      | Date To      | #{today}                                    |
      | Account Type | ${Web Report Employee Balance Account Type} |
      | Generated on | #{today}                                    |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
