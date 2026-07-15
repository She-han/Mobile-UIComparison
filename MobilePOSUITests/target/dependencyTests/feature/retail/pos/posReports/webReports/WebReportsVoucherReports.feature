Feature: Display Voucher Web Reports

  @PT-7583 @PreSales @VoucherWebReports @POS @AUTOMATED @WebReports @VoucherOutstandingBalancesReport
  Scenario: Generate Voucher Outstanding Balances - Voucher Reports
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "More Reports" button
    And user presses "Voucher Reports" button
    And user presses "Voucher Outstanding Balances" button
    When "Web Report Criteria Form" page is shown
    And user enters "#{today-10}" into "Voucher Outstanding Balances Issue Date From" field
    And user enters "#{today}" into "Voucher Outstanding Balances Issue Date To" field
    And user enters "#{today}" into "Voucher Outstanding Balances Expiry Date From" field
    And user enters "#{today+10}" into "Voucher Outstanding Balances Expiry Date To" field
    And user selects "10% off" from "Voucher Outstanding Balances Voucher Type" combobox
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title     | Voucher Outstanding Balances |
      | Voucher Type     | 10% off                      |
      | Issue Date From  | #{today-10}                  |
      | Issue Date To    | #{today}                     |
      | Expiry Date From | #{today}                     |
      | Expiry Date To   | #{today+10}                  |
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
