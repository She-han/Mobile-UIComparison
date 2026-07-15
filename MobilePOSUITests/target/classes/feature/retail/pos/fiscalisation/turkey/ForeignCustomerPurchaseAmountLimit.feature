Feature: Foreign Customer purchase amount limit on Turkey Fiscal POS

  @PT-10690 @Fiscalisation @Turkey @FiscalTurkeyFCPurchaseAmountLimit @AUTOMATED @ManualVerification
  Scenario: Verify the Minimum purchase amount for foreign customers: 108 TRY for VAT rate 8%
    Given user signs on as "Turkey Fiscal Sales Assistant"
    And user presses "Sales" button
    And user presses "Receipts" button
    And user presses "Foreign Customer" button and "Transaction Basket" page shown
    And user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter Qty" page is shown
    And user enters "300" into "Input Box" field
    And user presses "OK" button
    And "Enter Item" page is shown
    And user enters "${Product Fiscal TR 2}" into "Input Box" field
    When user presses "Sell Item" button
    Then "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Turkey Invoice Enforced" page shown
    And user presses "Continue" button and "Turkey Foreign Vat Rate Exceed Prompt" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    And "Enter User" page is shown
   
  @PT-10689 @Fiscalisation @Turkey @FiscalTurkeyFCPurchaseAmountLimit @AUTOMATED @ManualVerification
  Scenario: Verify the Minimum purchase amount for foreign customers: 118 TRY for VAT rate 18%
  Given user signs on as "Turkey Fiscal Sales Assistant"
  And user presses "Sales" button
  And user presses "Receipts" button
  And user presses "Foreign Customer" button and "Transaction Basket" page shown
  And user presses "Sales" button
  And user presses "QTY Sale" button
  And "Enter Qty" page is shown
  And user enters "300" into "Input Box" field
  And user presses "OK" button
  And "Enter Item" page is shown
  And user enters "${Product Fiscal TR 1}" into "Input Box" field
  When user presses "Sell Item" button
  Then "Transaction Basket" page is shown
  And user presses "TOTAL" button and "Turkey Invoice Enforced" page shown
  And user presses "Continue" button and "Turkey Foreign Vat Rate Exceed Prompt" page shown
  And user presses "OK" button and "Transaction Basket" page shown
  And user presses "Voids" button
  And user presses "Void Transaction" button and "Transaction Basket" page shown
  When user presses "SignOff" button
  And "Enter User" page is shown