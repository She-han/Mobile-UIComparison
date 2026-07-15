Feature: Display Saved Web Reports

  @PT-12558 @SavedWebReports @POS @AUTOMATED @WebReports @ThisUserSavedReport
  Scenario: Display This User Saved Web Reports
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Product Reports" button
    When user presses "Product Sales" button
    And "Web Report Criteria Form" page is shown
    And user selects "Enactor Store" from "Product Sales Location" combobox
    And user selects "POS 1 @ Enactor" from "Product Sales Terminal" combobox
    And user selects "ALL" from "Product Sales MM Group" combobox
    And user selects "Date Range" from "Product Sales Date Range" combobox
    And user enters "#{today-2}" into "Product Sales Date From" field
    And user enters "#{today}" into "Product Sales Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Product Sales   |
      | Location     | Enactor Store   |
      | Terminal     | POS 1 @ Enactor |
      | MM Group     | ALL             |
      | Date From    | #{today-2}      |
      | Date To      | #{today}        |
      | Generated on | #{today}        |
    And user presses "Save As This User" button and "Report Saved Success Message" page shown
    And user presses "OK" button and "View Web Report" page shown
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    When user presses "Saved Reports" button
    And "Select User Saved Web Report" page is shown
    And user selects "Product/ProductSales" from "Saved Report List" list
    And user presses "View" button and "Wait for Report Loading" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Product Sales   |
      | Location     | Enactor Store   |
      | Terminal     | POS 1 @ Enactor |
      | MM Group     | ALL             |
      | Date From    | #{today-2}      |
      | Date To      | #{today}        |
      | Generated on | #{today}        |
    And user presses "Back" button and "Select User Saved Web Report" page shown
    And user selects "Product/ProductSales" from "Saved Report List" list
    And user presses "Remove" button and "Confirm Remove Selected User Web Report" page shown
    And user presses "OK" button and "Select User Saved Web Report" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-12559 @SavedWebReports @POS @AUTOMATED @WebReports @ThisLocationSavedReport
  Scenario: Display This Location Saved Web Reports
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Product Reports" button
    When user presses "Product Sales" button
    And "Web Report Criteria Form" page is shown
    And user selects "Enactor Store" from "Product Sales Location" combobox
    And user selects "POS 1 @ Enactor" from "Product Sales Terminal" combobox
    And user selects "ALL" from "Product Sales MM Group" combobox
    And user selects "Date Range" from "Product Sales Date Range" combobox
    And user enters "#{today-2}" into "Product Sales Date From" field
    And user enters "#{today}" into "Product Sales Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Product Sales   |
      | Location     | Enactor Store   |
      | Terminal     | POS 1 @ Enactor |
      | MM Group     | ALL             |
      | Date From    | #{today-2}      |
      | Date To      | #{today}        |
      | Generated on | #{today}        |
    And user presses "Save To This Location" button and "Report Saved Success Message" page shown
    And user presses "OK" button and "View Web Report" page shown
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    When user presses "Saved Reports" button
    And "Select User Saved Web Report" page is shown
    And user presses "This Location Reports" button and "Select Location Saved Web Report" page shown
    And user selects "Product/ProductSales" from "Saved Report List" list
    And user presses "View" button and "Wait for Report Loading" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Product Sales   |
      | Location     | Enactor Store   |
      | Terminal     | POS 1 @ Enactor |
      | MM Group     | ALL             |
      | Date From    | #{today-2}      |
      | Date To      | #{today}        |
      | Generated on | #{today}        |
    And user presses "Back" button and "Select Location Saved Web Report" page shown
    And user selects "Product/ProductSales" from "Saved Report List" list
    And user presses "Remove" button and "Confirm Remove Selected Location Web Report" page shown
    And user presses "OK" button and "Select Location Saved Web Report" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-12560 @SavedWebReports @POS @AUTOMATED @WebReports @AllLocationsSavedReport
  Scenario: Display All Locations Saved Web Reports
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Web Reports" button and "Web Reports Select" page shown
    And user presses "Product Reports" button
    When user presses "Product Sales" button
    And "Web Report Criteria Form" page is shown
    And user selects "Enactor Store" from "Product Sales Location" combobox
    And user selects "POS 1 @ Enactor" from "Product Sales Terminal" combobox
    And user selects "ALL" from "Product Sales MM Group" combobox
    And user selects "Date Range" from "Product Sales Date Range" combobox
    And user enters "#{today-2}" into "Product Sales Date From" field
    And user enters "#{today}" into "Product Sales Date To" field
    And user presses "OK" button and "Wait for Report" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Product Sales   |
      | Location     | Enactor Store   |
      | Terminal     | POS 1 @ Enactor |
      | MM Group     | ALL             |
      | Date From    | #{today-2}      |
      | Date To      | #{today}        |
      | Generated on | #{today}        |
    And user presses "Save To Any Location" button and "Select Location To Save Report" page shown
    And user selects "Enactor Store" from "Report Save Location Dropdown" combobox
    And user presses "Report Save Location Ok" icon button
    And "Report Saved Success Message" page is shown
    And user presses "OK" button and "View Web Report" page shown
    And user presses "Back" button and "Web Report Criteria Form" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    When user presses "Saved Reports" button
    And "Select User Saved Web Report" page is shown
    And user presses "All Locations Reports" button and "Select All Location Saved Web Report" page shown
    And user selects "Product/ProductSales" from "Saved Report List" list
    And user presses "View" button and "Wait for Report Loading" page shown
    Then "View Web Report" page is shown
    And Following report details display in Web Report
      | Report Title | Product Sales   |
      | Location     | Enactor Store   |
      | Terminal     | POS 1 @ Enactor |
      | MM Group     | ALL             |
      | Date From    | #{today-2}      |
      | Date To      | #{today}        |
      | Generated on | #{today}        |
    And user presses "Back" button and "Select All Location Saved Web Report" page shown
    And user selects "Product/ProductSales" from "Saved Report List" list
    And user presses "Remove" button and "Confirm Remove Selected All Location Web Report" page shown
    And user presses "OK" button and "Select All Location Saved Web Report" page shown
    And user presses "Back" button and "Web Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
