Feature: CRM Manager Overview

  @PT-234 @PreSales @CRMManagerOverview @POS @CRM @Mobile @AUTOMATED @POSValidatedTest @POSSet1 @Regression
  Scenario: Verify that Manager Overview - Jobs screen is displayed
    Given user signs on as "Manager 2"
    And user presses "Transaction Basket CRM button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Manager" icon button
    Then "CRM Manager Overview" page is shown
    And user presses "CRM Manager Jobs" icon button
    And user selects "Sales Assistant - UK, Tom" from "CRM Manager Overview Associate Dropdown" combobox
    And user waits "3" seconds
    And "CRM Manager Overview Payroll No Input" field displays the text "SA1"
    And "CRM Manager Overview Affiliated Customers Input" field displays the text "0"
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-236 @PreSales @CRMManagerOverview @POS @CRM @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Verify that Manager Overview - Affiliations screen is displayed
    Given user signs on as "Manager 2"
    And user presses "Transaction Basket CRM button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Manager" icon button
    Then "CRM Manager Overview" page is shown
    And user presses "CRM Manager Overview Affiliations Tab" icon button
    And "CRM Manager Overview Affiliations" page is shown
    And user selects "Sales Assistant - UK, Tom" from "CRM Manager Overview Associate Dropdown" combobox
    And user waits "3" seconds
    And "CRM Manager Overview Payroll No Input" field displays the text "SA1"
    And "CRM Manager Overview Affiliated Customers Input" field displays the text "0"
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-237 @PreSales @CRMManagerOverview @POS @CRM
  Scenario: Verify that Manager Overview - Record Absence screen is displayed
    Given user signs on as "Manager 2"
    And user presses "Transaction Basket CRM button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Manager" icon button
    Then "CRM Manager Overview" page is shown
    And user presses "CRM Manager Overview Record Absence Tab" icon button
    And "CRM Manager Overview Record Absence" page is shown
    And user selects "Sales Assistant - UK, Tom" from "CRM Manager Overview Associate Dropdown" combobox
    And user waits "1" seconds
    And "CRM Manager Overview Payroll No Input" field displays the text "SA1"
    And "CRM Manager Overview Affiliated Customers Input" field displays the text "0"
    And user selects "Annual Leave" from "CRM Manager Overview Reason Dropdown" combobox
    And user selects "Fernando, Michael" from "CRM Manager Overview Reassign To Dropdown" combobox
    And user presses "CRM Manager Overview Record Absence Cancel Button" icon button
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
