Feature: Print Fiscal Receipt Copy

  @PT-957 @RomaniaFiscalPrintReceiptCopy @Romania @Automated @No_Printer @Fiscalisation @FiscalRomania
  Scenario: Print Fiscal Receipt Copy on Romania POS
    Given user signs on as "Romania Fiscal Sales Assistant"
    When user presses "Sales" button
    When user presses "Receipts" button
    And user presses "Fiscal Receipt" button
    And user presses "Fiscal Receipt Copy" button and "Romania Enter Receipt Number" page shown
    When user enters "${Fiscal Day Number}" into "Fiscal Day Number" field
    And user enters "${Receipt Number}" into "Receipt Number" field
    And user presses "OK" button and "Fiscal Romania Print Report" page shown
    Then "Fiscal Romania Report Success Prompt" page is shown
    When user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
