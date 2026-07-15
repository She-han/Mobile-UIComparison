Feature: Verify Cash Drawer Open In Cash Payments - Lithuania
    
  @PT-15062 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @CashDrawer @ManualVerification
  Scenario: Lithuania - Verify cash drawer is opening when do the sale with the cash payment
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user enters "${Product Fiscal LT 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button