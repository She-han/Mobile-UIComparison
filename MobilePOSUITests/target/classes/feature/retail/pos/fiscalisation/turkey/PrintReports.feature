@Fiscalisation @Turkey @AUTOMATED @TurekyFiscalReports
Feature: Print Fiscal Reports - Turkey

  @PT-10625 @TurkeyFiscalEJReport @Fiscalisation @Turkey @AUTOMATED @TurekyFiscalReports @ManualVerification
  Scenario: Verify EJ Report
    Given user signs on as "Turkey Fiscal Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Fiscal Reports" button
    And user presses "Fiscal EJ Report" button and "Turkey Enter Ej Report Details" page shown
    And user selects "${Turkey Report Start Date}" from "Start Date Day Field" combobox
    And user selects "${Turkey Report Start Month}" from "Start Date Month Field" combobox
    And user enters "${Turkey Report Start Year}" into "Start Date Year Field" field
    And user selects "${Turkey Report End Date}" from "End Date Day Field" combobox
    And user selects "${Turkey Report End Month}" from "End Date Month Field" combobox
    And user enters "${Turkey Report End Year}" into "End Date Year Field" field
    And user presses "OK" button and "Fiscal Turkey Print Report" page shown
    Then "Fiscal Turkey Report Success Prompt" page is shown
    When user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-10624 @TurkeyFiscalPeriodicReport @Fiscalisation @Turkey @AUTOMATED @TurekyFiscalReports @ManualVerification
  Scenario: Verify Monthly Report
    Given user signs on as "Turkey Fiscal Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Fiscal Reports" button
    And user presses "Fiscal Periodic Report" button and "Turkey Enter Periodic Report Details" page shown
    And user selects "${Turkey Report End Year}" from "Turkey Year" combobox
    And user selects "${Turkey Report End Month}" from "Turkey Month" combobox
    And user presses "OK" button and "Fiscal Turkey Print Report" page shown
    Then "Fiscal Turkey Report Success Prompt" page is shown
    When user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-10623 @TurkeyFiscalZReport @Fiscalisation @Turkey @AUTOMATED @TurekyFiscalReports @ManualVerification
  Scenario: Verify Z Report
    Given user signs on as "Turkey Fiscal Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Fiscal Reports" button
    And user presses "Fiscal Z Report" button and "Turkey Z Report Confirm Prompt" page shown
    Then user presses "OK" button and "Fiscal Turkey Print Report" page shown
    Then "Fiscal Turkey Report Success Prompt" page is shown
    When user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-10622 @TurkeyFiscalXReport @Fiscalisation @Turkey @AUTOMATED @TurekyFiscalReports @ManualVerification
  Scenario: Verify X Report
    Given user signs on as "Turkey Fiscal Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Fiscal Reports" button
    And user presses "Fiscal X Report" button and "Fiscal Turkey Print Report" page shown
    Then "Fiscal Turkey Report Success Prompt" page is shown
    When user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-10626 @TurkeyFiscalAuditReport @Fiscalisation @Turkey @AUTOMATED @TurekyFiscalReports @ManualVerification
  Scenario: Verify Audit Report
    Given user signs on as "Turkey Fiscal Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Fiscal Reports" button
    And user presses "Audit Report" button and "Fiscal Turkey Print Report" page shown
    Then "Fiscal Turkey Report Success Prompt" page is shown
    When user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown