Feature: Reprint Fiscal Sale Receipts - Lithuania
    
  @PT-15086 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @SaleReceipt @ReprintReceipt @DuplicateLable @ManualVerification
  Scenario: Lithuania - Verify reprinted sale receipt is printing with the Duplicate label
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    Then user enters "${Product Fiscal LT 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "Sales" button and "Transaction Basket" page shown
    And user presses "Receipts" button and "Transaction Basket" page shown
    When user presses "Reprint Recent" button and "Reprint Recent  Select Transaction" page shown
    And user presses "OK" button and "Confirm Print Transaction" page shown
    And user presses "Print" button and "Transaction Basket" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button