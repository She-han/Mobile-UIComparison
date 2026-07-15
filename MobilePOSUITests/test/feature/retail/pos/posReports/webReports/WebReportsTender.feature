Feature: Display Tender Web Reports

  @PT-7589 @TenderWebReports @WebReports @CardTransactionReport
  Scenario: Generate Card Transaction Report - Tender Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "More Reports" button
    And user presses "Tender Reports" button
    And user presses "Card Transactions" button
    When "Web Report Criteria Form" page is shown
    And user selects "United Kingdom" from "Card Transactions Region" combobox
    And user selects "Enactor Store" from "Card Transactions Location" combobox
    And user selects "POS 1 @ Enactor" from "Card Transactions Terminal" combobox
    And user selects "Browne, Michael" from "Card Transactions User" combobox
    And user selects "Date Range" from "Card Transactions Date Range" combobox
    And user enters "#{today-2}" into "Card Transactions Date From" field
    And user enters "#{today}" into "Card Transactions Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Card Transactions |
      | Region       | United Kingdom    |
      | Location     | Enactor Store     |
      | Terminal     | POS 1 @ Enactor   |
      | User         | Michael Browne    |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-7591 @TenderWebReports @WebReports @CreditNoteOutstandingBalancesReport
  Scenario: Generate Credit Note Outstanding Balances Report - Tender Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "More Reports" button
    And user presses "Tender Reports" button
    And user presses "Credit Note Outstanding Balances" button
    When "Web Report Criteria Form" page is shown
    And user selects "Active" from "Credit Note Outstanding Balances Status" combobox
    And user enters "#{today-2}" into "Credit Note Outstanding Balances Start expiry date" field
    And user enters "#{today}" into "Credit Note Outstanding Balances End expiry date" field
    And user enters "#{today-2}" into "Credit Note Outstanding Balances Start date created" field
    And user enters "#{today}" into "Credit Note Outstanding Balances End date created" field
    And user enters "#{today-2}" into "Credit Note Outstanding Balances Start date closed" field
    And user enters "#{today}" into "Credit Note Outstanding Balances End date closed" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title       | Credit Note Outstanding Balances |
      | Status             | Active                           |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-7592 @TenderWebReports @WebReports @GiftCardOutstandingBalancesReport
  Scenario: Generate Gift Card Outstanding Balances Report - Tender Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "More Reports" button
    And user presses "Tender Reports" button
    And user presses "Gift Card Outstanding Balances" button
    When "Web Report Criteria Form" page is shown
    And user selects "Enactor Store" from "Gift Card Outstanding Balances Location" combobox
    And user selects "Gift Card UK" from "Gift Card Outstanding Balances Gift Card Type" combobox
    And user selects "Date Range" from "Gift Card Outstanding Balances Last Transaction Date" combobox
    And user enters "#{today-2}" into "Gift Card Outstanding Balances Date From" field
    And user enters "#{today}" into "Gift Card Outstanding Balances Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title   | Gift Card Outstanding Balances |
      | Location       | Enactor Store                  |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-7596 @TenderWebReports @WebReports @TenderTotalsPieChartReport
  Scenario: Generate Tender Totals Pie Chart Report - Tender Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "More Reports" button
    And user presses "Tender Reports" button
    And user presses "Tender Totals Pie Chart" button
    When "Web Report Criteria Form" page is shown
    And user selects "United Kingdom" from "Tender Totals Pie Chart Region" combobox
    And user selects "Enactor Store" from "Tender Totals Pie Chart Location" combobox
    And user selects "POS 1 @ Enactor" from "Tender Totals Pie Chart Terminal" combobox
    And user selects "Browne, Michael" from "Tender Totals Pie Chart User" combobox
    And user selects "Date Range" from "Tender Totals Pie Chart Date Range" combobox
    And user enters "#{today-2}" into "Tender Totals Pie Chart Date From" field
    And user enters "#{today}" into "Tender Totals Pie Chart Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Tender Totals Pie Chart |
      | Region       | United Kingdom          |
      | Location     | Enactor Store           |
      | Terminal     | POS 1 @ Enactor         |
      | User         | Michael Browne          |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-7601 @TenderWebReports @WebReports @TenderTotalsReport
  Scenario: Generate Tender Totals Report - Tender Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "More Reports" button
    And user presses "Tender Reports" button
    And user presses "Tender Totals" button
    When "Web Report Criteria Form" page is shown
    And user selects "United Kingdom" from "Tender Totals Region" combobox
    And user selects "Enactor Store" from "Tender Totals Location" combobox
    And user selects "POS 1 @ Enactor" from "Tender Totals Terminal" combobox
    And user selects "Browne, Michael" from "Tender Totals User" combobox
    And user selects "Date Range" from "Tender Totals Date Range" combobox
    And user enters "#{today-2}" into "Tender Totals  Date From" field
    And user enters "#{today}" into "Tender Totals Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title           | Tender Totals   |
      | Region                 | United Kingdom  |
      | Location               | Enactor Store   |
      | Terminal               | POS 1 @ Enactor |
      | User                   | Michael Browne  |
      | Show Card Type Details | false           |
      | Show Card Entry        | false           |
      | Show Card Entry        | false           |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
