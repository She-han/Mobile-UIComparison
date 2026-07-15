Feature: Fiscal Receipt Copy

  @PT-994 @Fiscalisation @Bosnia @FiscalBosniaReceiptCopy @No_Printer @AUTOMATED
  Scenario: Fiscal Receipt Copy by specifying receipt number (Reprint Receipt)
    Given user signs on as "Bosnia Fiscal Sales Assistant"
    And user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Fiscal Receipts" button
    When user presses "Fiscal Receipt Copy" button
    And "Bosnia Receipt Copy" page is shown
    And user enters "${Bosnia Receipt Number}" into "Receipt Number" field
    And user presses "OK" button
    And "Bosnia Print Report Prompt" page is shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
