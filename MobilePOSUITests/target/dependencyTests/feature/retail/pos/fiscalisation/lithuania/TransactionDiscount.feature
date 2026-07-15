Feature: Print Fiscal Receipt with Transaction Discount - Lithuania
    
  @PT-15071 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @TransactionDiscount @ManualVerification
  Scenario: Lithuania - Verify receipt is displaying the added transaction discount correctly
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user enters "${Product Fiscal LT 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "10 % Off" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "Transaction Discount (10 % Off 10%)" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button