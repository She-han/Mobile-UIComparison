Feature: Fiscal Receipt Copy

  @PT-619 @Fiscalisation @Poland @FiscalPolandReceiptCopy @No_Printer @AUTOMATED
  Scenario: Fiscal Receipt Copy
    Given user signs on as "Poland Fiscal Sales Assistant"
    When user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Fiscal Receipts" button
    And user presses "Fiscal Receipt Copy" button
    Then "Receipt Copy" page is shown
    When user enters "${Fiscal Day Number}" into "Fiscal Day Number" field
    And user enters "${Receipt Number}" into "Receipt Number" field
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
