Feature: Display Exception Web Reports

  @PT-7576 @ExceptionWebReports @POS @AUTOMATED @WebReports @TerminalExceptionsReport
  Scenario: Generate Terminal Exceptions Report - Exception Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Exception Reports" button
    And user presses "Terminal Exceptions" button
    When "Web Report Criteria Form" page is shown
    And user selects "United Kingdom" from "Terminal Exceptions Region" combobox
    And user selects "Enactor Store" from "Terminal Exceptions Location" combobox
    And user selects "POS 1 @ Enactor" from "Terminal Exceptions Terminal" combobox
    And user selects "Browne, Michael" from "Terminal Exceptions User" combobox
    And user selects "Browne, Michael" from "Terminal Exceptions Auth User" combobox
    And user selects "Transaction Void" from "Terminal Exceptions Exception Type" combobox
    And user selects "Customer Left Store" from "Terminal Exceptions Exception Reason" combobox
    And user selects "Cash UK" from "Terminal Exceptions Tender" combobox
    And user selects "Date Range" from "Terminal Exceptions Date Range" combobox
    And user enters "#{today-2}" into "Terminal Exceptions Date From" field
    And user enters "#{today}" into "Terminal Exceptions Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title     | Terminal Exceptions |
      | Region           | United Kingdom      |
      | Location         | Enactor Store       |
      | User             | Michael Browne      |
      | Auth User        | Michael Browne      |
      | Terminal         | POS 1 @ Enactor     |
      | Exception Reason | Customer Left Store |
      | Exception Type   | Transaction Void    |
      | Tender           | Cash UK             |
      | Date From        | #{today-2}          |
      | Date To          | #{today}            |
      | Generated on     | #{today}            |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-10631 @ExceptionWebReports @POS @AUTOMATED @WebReports @Sprint40-Week3 @TerminalExceptionsReport @NotForRC1
  Scenario: Verify that user can generate Terminal Exception report without selecting Exception Type
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Exception Reports" button
    And user presses "Terminal Exceptions" button
    When "Web Report Criteria Form" page is shown
    And user selects "${Web Report Terminal Exceptions Region}" from "Terminal Exceptions Region" combobox
    And user selects "${Web Report Terminal Exceptions Location}" from "Terminal Exceptions Location" combobox
    And user selects "${Web Report Terminal Exceptions Terminal}" from "Terminal Exceptions Terminal" combobox
    And user selects "${Web Report Terminal Exceptions User}" from "Terminal Exceptions User" combobox
    And user selects "${Web Report Terminal Exceptions Auth User}" from "Terminal Exceptions Auth User" combobox
    And user selects "${Web Report Terminal Exceptions Exception Type}" from "Terminal Exceptions Exception Type" combobox
    And user selects "${Web Report Terminal Exceptions Exception Reason}" from "Terminal Exceptions Exception Reason" combobox
    And user selects "${Web Report Terminal Exceptions Tender}" from "Terminal Exceptions Tender" combobox
    And user selects "Date Range" from "Terminal Exceptions Date Range" combobox
    And user enters "#{today-2}" into "Terminal Exceptions Date From" field
    And user enters "#{today}" into "Terminal Exceptions Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title     | Terminal Exceptions                                   |
      | Region           | ${Web Report Terminal Exceptions Region}              |
      | Location         | ${Web Report Terminal Exceptions Location}            |
      | User             | ${Web Report Terminal Exceptions User In Report}      |
      | Auth User        | ${Web Report Terminal Exceptions Auth User In Report} |
      | Terminal         | ${Web Report Terminal Exceptions Terminal}            |
      | Exception Reason | ${Web Report Terminal Exceptions Exception Reason}    |
      | Exception Type   | ${Web Report Terminal Exceptions Exception Type}      |
      | Tender           | ${Web Report Terminal Exceptions Tender}              |
      | Date From        | #{today-2}                                            |
      | Date To          | #{today}                                              |
      | Generated on     | #{today}                                              |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-7577 @ExceptionWebReports @POS @AUTOMATED @WebReports @UserExceptionAnalysisReport
  Scenario: Generate User Exception Analysis Report - Exception Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Exception Reports" button
    And user presses "User Exception Analysis" button
    When "Web Report Criteria Form" page is shown
    And user selects "United Kingdom" from "User Exception Analysis Region" combobox
    And user selects "Enactor Store" from "User Exception Analysis Location" combobox
    And user selects "POS 1 @ Enactor" from "User Exception Analysis Terminal" combobox
    And user selects "Browne, Michael" from "User Exception Analysis User" combobox
    And user selects "Browne, Michael" from "User Exception Analysis Auth User" combobox
    And user selects "Transaction Void" from "User Exception Analysis Exception Type" combobox
    And user selects "Customer Left Store" from "User Exception Analysis Exception Reason" combobox
    And user enters "1" into "User Exception Analysis Min Total Exceptions" field
    And user selects "Date Range" from "User Exception Analysis Date Range" combobox
    And user enters "#{today-2}" into "User Exception Analysis Date From" field
    And user enters "#{today}" into "User Exception Analysis Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title         | User Exception Analysis |
      | Region               | United Kingdom          |
      | Location             | Enactor Store           |
      | User                 | Michael Browne          |
      | Auth User            | Michael Browne          |
      | Terminal             | POS 1 @ Enactor         |
      | Exception Reason     | Customer Left Store     |
      | Exception Type       | Trans Voids             |
      | Min Total Exceptions |                       1 |
      | Date From            | #{today-2}              |
      | Date To              | #{today}                |
      | Generated on         | #{today}                |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-10632 @ExceptionWebReports @POS @AUTOMATED @WebReports @Sprint40-Week3 @UserExceptionAnalysisReport @NotForRC1
  Scenario: Generate User Exception Analysis Report - Exception Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Exception Reports" button
    And user presses "User Exception Analysis" button
    When "Web Report Criteria Form" page is shown
    And user selects "${Web Report User Exception Analysis Region}" from "User Exception Analysis Region" combobox
    And user selects "${Web Report User Exception Analysis Location}" from "User Exception Analysis Location" combobox
    And user selects "${Web Report User Exception Analysis Terminal}" from "User Exception Analysis Terminal" combobox
    And user selects "${Web Report User Exception Analysis User}" from "User Exception Analysis User" combobox
    And user selects "${Web Report User Exception Analysis Auth User}" from "User Exception Analysis Auth User" combobox
    And user selects "${Web Report User Exception Analysis Exception Type}" from "User Exception Analysis Exception Type" combobox
    And user selects "${Web Report User Exception Analysis Exception Reason}" from "User Exception Analysis Exception Reason" combobox
    And user enters "${Web Report User Exception Analysis Min Total Exceptions}" into "User Exception Analysis Min Total Exceptions" field
    And user selects "Date Range" from "User Exception Analysis Date Range" combobox
    And user enters "#{today-2}" into "User Exception Analysis Date From" field
    And user enters "#{today}" into "User Exception Analysis Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title         | User Exception Analysis                                    |
      | Region               | ${Web Report User Exception Analysis Region}               |
      | Location             | ${Web Report User Exception Analysis Location}             |
      | User                 | ${Web Report User Exception Analysis User In Report}       |
      | Auth User            | ${Web Report User Exception Analysis Auth User In Report}  |
      | Terminal             | ${Web Report User Exception Analysis Terminal}             |
      | Exception Reason     | ${Web Report User Exception Analysis Exception Reason}     |
      | Exception Type       | ${Web Report User Exception Analysis Exception Type}       |
      | Min Total Exceptions | ${Web Report User Exception Analysis Min Total Exceptions} |
      | Date From            | #{today-2}                                                 |
      | Date To              | #{today}                                                   |
      | Generated on         | #{today}                                                   |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown  

  @PT-7578 @ExceptionWebReports @POS @AUTOMATED @WebReports @ReasonCodeByWeekdayReport @NotForRC1
  Scenario: Generate Reason Code by Weekday Report - Exception Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Exception Reports" button
    And user presses "Reason Code by Weekday" button
    When "Web Report Criteria Form" page is shown
    And user selects "United Kingdom" from "Reason Code by Weekday Region" combobox
    And user selects "Enactor Store" from "Reason Code by Weekday Location" combobox
    And user selects "POS 1 @ Enactor" from "Reason Code by Weekday Terminal" combobox
    And user selects "Browne, Michael" from "Reason Code by Weekday User" combobox
    And user selects "Transaction Void" from "Reason Code by Weekday Reason Type" combobox
    And user selects "Customer Left Store" from "Reason Code by Weekday Reason" combobox
    And user selects "Date Range" from "Reason Code by Weekday Date Range" combobox
    And user enters "#{today-2}" into "Reason Code by Weekday Date From" field
    And user enters "#{today}" into "Reason Code by Weekday Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Reason Code by Weekday |
      | Region       | United Kingdom         |
      | Location     | Enactor Store          |
      | Terminal     | POS 1 @ Enactor        |
      | User         | Michael Browne         |
      | Reason Type  | Transaction Void       |
      | Reason       | Customer Left Store    |
      | Date From    | #{today-2}             |
      | Date To      | #{today}               |
      | Generated on | #{today}               |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
