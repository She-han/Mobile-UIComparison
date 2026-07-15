Feature: Print TIll Check Report - Hungary

  @PT-1734 @HungaryTillCheckReport @No_Printer @Fiscalisation @FiscalHungary @AUTOMATED
  Scenario: Print Till Check Report on Hungary Fiscal Printer
    Given "Enter User" page is shown
    And user enters "${Hungary Fiscal Sales Assistant Username}" into "User Name Text" field
    When user enters "${Hungary Fiscal Sales Assistant Password}" into "Password Text" field
    And user presses "ENT" button
    And "Fiscal Hungary VAT Rates Sync in Progress" page is shown
    And "Fiscal Hungary VAT Rates Up to Date Prompt" page is shown
    And user presses "OK" button 
    And "Transaction Basket" page is shown
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Fiscal Reports" button
    And user presses "Till Check Report" button and "Fiscal Hungary Print Report" page shown
    Then "Fiscal Hungary Report Success Prompt" page is shown
    When user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
