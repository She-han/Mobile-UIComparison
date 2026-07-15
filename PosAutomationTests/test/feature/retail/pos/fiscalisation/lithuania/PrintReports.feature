
@Fiscalisation @Lithuania @AUTOMATED @LithuaniaFiscalReports
Feature: Print Fiscal Reports - Lithuania

@PT-14837 @LithuaniaFiscalZReport @Fiscalisation @Lithuania @AUTOMATED @LithuaniaFiscalReports @ManualVerification
  Scenario: Lithuania - Verify Z report can be generated during the day end 
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Fiscal Reports" button
    And user presses "Fiscal Z Report" button and "Lithuania Z Report Confirm Prompt" page shown
    Then user presses "OK" button 
    Then "Fiscal Lithuania Report Success Prompt" page is shown
    When user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-14840 @LithuaniaFiscalXReport @Fiscalisation @Lithuania @AUTOMATED @LithuaniaFiscalReports @ManualVerification
  Scenario: Lithuania - Verify X report can be generated 
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Fiscal Reports" button
    And user presses "Fiscal X Report" button 
    Then "Fiscal Lithuania Report Success Prompt" page is shown
    When user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-14841 @LithuaniaFiscalXReport @Fiscalisation @Lithuania @AUTOMATED @LithuaniaFiscalReports @ManualVerification
  Scenario: Lithuania - Verify X report does not have any transaction detail when it is generated right after generating the Z report
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Fiscal Reports" button
    And user presses "Fiscal Z Report" button and "Lithuania Z Report Confirm Prompt" page shown
    Then user presses "OK" button
    Then "Fiscal Lithuania Report Success Prompt" page is shown
    When user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Fiscal Reports" button
    And user presses "Fiscal X Report" button 
    Then "Fiscal Lithuania Report Success Prompt" page is shown
    When user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

    
      @PT-14847 @Fiscalisation @Lithuania @AUTOMATED @LithuaniaFiscalReports @ManualVerification
  Scenario: Lithuania - Periodic Report - Verify enter incorrect day value in the field that is there to enter the day number in periodic report
     Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Fiscal Reports" button
    When user presses "Fiscal Periodic Report By Date" button and "Lithuania Fiscal Report Enter Date Time" page shown
    And user enters "${Lithuania Report Start Date Incorrect}" from "Start Date Day Field" combobox
    And user enters "${Lithuania Report Start Month Incorrect}" from "Start Date Month Field" combobox
    And user enters "${Lithuania Report Start Year Incorrect}" into "Start Date Year Field" field
    And user enters "${Lithuania Report End Date Incorrect}" from "End Date Day Field" combobox
    And user enters "${Lithuania Report End Month Incorrect}" from "End Date Month Field" combobox
    And user enters "${Lithuania Report End Year Incorrect}" into "End Date Year Field" field
    And user presses "OK" button
    Then "Fiscal Lithuania Report Date Incorrect Prompt" page is shown
    When user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

    
    @PT-14846 @Fiscalisation @Lithuania @AUTOMATED @LithuaniaFiscalReports @ManualVerification
  Scenario: Lithuania - Periodic Report - By Date 
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Fiscal Reports" button
    When user presses "Fiscal Periodic Report By Date" button and "Lithuania Fiscal Report Enter Date Time" page shown
    And user enters "${Lithuania Report Start Date}" from "Start Date Day Field" combobox
    And user enters "${Lithuania Report Start Month}" from "Start Date Month Field" combobox
    And user enters "${Lithuania Report Start Year}" into "Start Date Year Field" field
    And user enters "${Lithuania Report End Date}" from "End Date Day Field" combobox
    And user enters "${Lithuania Report End Month}" from "End Date Month Field" combobox
    And user enters "${Lithuania Report End Year}" into "End Date Year Field" field
    And user presses "OK" button
    Then "Fiscal Lithuania Report Success Prompt" page is shown
    When user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown