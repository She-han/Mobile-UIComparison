Feature: Print Report of Printed Documents - Hungary

  @PT-2132 @HungaryCurrentDayPrintedDocumentsReport @No_Printer @Fiscalisation @FiscalHungary @AUTOMATED
  Scenario: Report of Printed Documents - Current Day on Hungary Fiscal Printer
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
    And user presses "List of Printed Documents" button 
    And user presses "Current Day" button
    And "Fiscal Hungary Print Report" page shown
    Then "Fiscal Hungary Report Success Prompt" page is shown
    When user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2611 @HungaryLastDayPrintedDocumentsReport @No_Printer @Fiscalisation @FiscalHungary @AUTOMATED
  Scenario: Report of Printed Documents - Last Closed Day on Hungary Fiscal Printer
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
    And user presses "List of Printed Documents" button 
    And user presses "Last Closed Day" button
    And "Fiscal Hungary Print Report" page shown
    Then "Fiscal Hungary Report Success Prompt" page is shown
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown