Feature: Display Cash Management Web Reports

  @PT-6258 @CashManagementWebReports @POS @AUTOMATED @WebReports @CashOnHandReport @NotForRC1
  Scenario: Generate Cash On Hand Report - Cash Management Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Cash Management Reports" button
    And user presses "Cash on Hand" button
    When "Web Report Criteria Form" page is shown
    And user selects "Enactor Store" from "Cash On Hand Transactions Location" combobox
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Cash On Hand  |
      | Location     | Enactor Store |
      | Generated on | #{today}      |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-6259 @PreSales @CashManagementWebReports @POS @AUTOMATED @WebReports @BankingTransactionReport
  Scenario: Generate Banking Transactions Report - Cash Management Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Cash Management Reports" button
    And user presses "Banking Transactions" button
    When "Web Report Criteria Form" page is shown
    And user selects "Enactor Store" from "Banking Transactions Location" combobox
    And user selects "Store Safe" from "Banking Transactions Safe" combobox
    And user enters "#{today-2}" into "Banking Transactions Date From" field
    And user enters "#{today}" into "Banking Transactions Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Banking Transactions |
      | Location     | Enactor Store        |
      | Safe         | Store Safe           |
      | Date From    | #{today-2}           |
      | Date To      | #{today}             |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-6260 @CashManagementWebReports @POS @AUTOMATED @WebReports @IncomeExpenseTransactionReport
  Scenario: Generate Income Expense Transactions Report - Cash Management Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Cash Management Reports" button
    And user presses "Income Expense Transactions" button
    And user waits "3" seconds
    When "Web Report Criteria Form" page is shown
    And user selects "Enactor Store" from "Income Expense Transactions Location" combobox
    And user selects "Browne, Michael" from "Income Expense Transactions User" combobox
    And user selects "Store Safe" from "Income Expense Transactions Safe" combobox
    And user selects "Store Expence" from "Income Expense Transactions Reason" combobox
    And user selects "Date Range" from "Income Expense Transactions Date Range" combobox
    And user enters "#{today-2}" into "Income Expense Transactions Date From" field
    And user enters "#{today}" into "Income Expense Transactions Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title    | Income Expense Transactions |
      | Location        | Enactor Store               |
      | Safe / Terminal | Store Safe                  |
      | User            | Michael Browne              |
      | Date From       | #{today-2}                  |
      | Date To         | #{today}                    |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-7481 @CashManagementWebReports @POS @AUTOMATED @WebReports @SafeDiscrepanciesReport
  Scenario: Generate Safe Discrepancies Report - Cash Management Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Cash Management Reports" button
    And user presses "Safe Discrepancies" button
    When "Web Report Criteria Form" page is shown
    And user selects "Enactor Store" from "Safe Discrepancies Location" combobox
    And user selects "Date Range" from "Safe Discrepancies Date Range" combobox
    And user enters "#{today-2}" into "Safe Discrepancies Date From" field
    And user enters "#{today}" into "Safe Discrepancies Date To" field
    And user selects "Store Safe" from "Safe Discrepancies Safe" combobox
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Safe Discrepancies |
      | Location     | Enactor Store      |
      | Safe         | Store Safe         |
      | Date From    | #{today-2}         |
      | Date To      | #{today}           |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-7483 @Regression @CashManagementWebReports @POS @AUTOMATED @WebReports @TerminalDiscrepanciesReport @Regression
  Scenario: Generate Terminal Discrepancies Report - Cash Management Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Cash Management Reports" button
    And user presses "Terminal Discrepancies" button
    When "Web Report Criteria Form" page is shown
    And user selects "Enactor Store" from "Terminal Discrepancies Location" combobox
    And user selects "Date Range" from "Terminal Discrepancies Date Range" combobox
    And user enters "#{today-2}" into "Terminal Discrepancies Date From" field
    And user enters "#{today}" into "Terminal Discrepancies Date To" field
    And user selects "POS 1 @ Enactor" from "Terminal Discrepancies Session Owner" combobox
    And user enters "1" into "Terminal Discrepancies Minimum Discrepancy Threshold" field
    And user presses "OK" button and "Wait for Report" page shown
    And user waits "3" seconds
    Then "View Web Report" page is shown
    And user waits "3" seconds
    And Following report details display in Web Report
      | Report Title          | Terminal Discrepancies |
      | Location              | Enactor Store          |
      | Session Owner         | POS 1 @ Enactor        |
      | Date From             | #{today-2}             |
      | Date To               | #{today}               |
      | Discrepancy Threshold | £0.01                  |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
