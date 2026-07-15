Feature: Display Sales Summary Web Reports

  @PT-7586 @SalesSummaryWebReports @POS @AUTOMATED @WebReports @AverageTransactionReport
  Scenario: Generate Average Transaction Report - Sales Summary Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "More Reports" button
    And user presses "Sales Summary Reports" button
    And user presses "Average Transaction" button
    When "Web Report Criteria Form" page is shown
    And user selects "${Web Report Average Transaction Location}" from "Average Transaction Location" combobox 
    And user selects "${Web Report Average Transaction Terminal}" from "Average Transaction Terminal" combobox
    And user selects "Date Range" from "Average Transaction Date Range" combobox
    And user enters "#{today-2}" into "Average Transaction Date From" field
    And user enters "#{today}" into "Average Transaction Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Average Transaction                        |
      | Location     | ${Web Report Average Transaction Location} |
      | Terminal     | ${Web Report Average Transaction Terminal} |
      | Date From    | #{today-2}                                 |
      | Date To      | #{today}                                   |
      | Generated on | #{today}                                   |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-7587 @SalesSummaryWebReports @POS @AUTOMATED @WebReports @SalesAnalysisByHourReport
  Scenario: Generate Sales Analysis by Hour Report - Sales Summary Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "More Reports" button
    And user presses "Sales Summary Reports" button
    And user presses "Sales Analysis by Hour" button
    When "Web Report Criteria Form" page is shown
    And user selects "${Web Report Sales Analysis Location}" from "Sales Analysis Location" combobox
    And user selects "${Web Report Sales Analysis Terminal}" from "Sales Analysis Terminal" combobox
    And user selects "Date Range" from "Sales Analysis Date Range" combobox
    And user enters "#{today-2}" into "Sales Analysis Date From" field
    And user enters "#{today}" into "Sales Analysis Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Sales Analysis by Hour                |
      | Location     | ${Web Report Sales Analysis Location} |
      | Terminal     | ${Web Report Sales Analysis Terminal} |
      | Date From    | #{today-2}                            |
      | Date To      | #{today}                              |
      | Generated on | #{today}                              |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-7588 @SalesSumamryWebReports @POS @AUTOMATED @WebReports @UserSalesReport
  Scenario: Generate User Sales Report - Sales Summary Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "More Reports" button
    And user presses "Sales Summary Reports" button
    And user presses "User Sales" button
    When "Web Report Criteria Form" page is shown
    And user selects "${Web Report User Sales Location}" from "User Sales Location" combobox
    And user selects "${Web Report User Sales Terminal}" from "User Sales Terminal" combobox
    And user selects "${Web Report User Sales Sales Person}" from "User Sales Sales Person" combobox
    And user selects "${Web Report User Sales User Mode}" from "User Sales User Mode" combobox
    And user selects "${Web Report User Sales Customer}" from "User Sales Customer" combobox
    And user selects "Date Range" from "User Sales Date Range" combobox
    And user enters "#{today-2}" into "User Sales Date From" field
    And user enters "#{today}" into "User Sales Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | User Sales                                      |
      | Location     | ${Web Report User Sales Location}               |
      | Terminal     | ${Web Report User Sales Terminal}               |
      | Salesperson  | ${Web Report User Sales Sales Person In Report} |
      | Customer     | ${Web Report User Sales Customer In Report}     |
      | Date From    | #{today-2}                                      |
      | Date To      | #{today}                                        |
      | Generated on | #{today}                                        |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
