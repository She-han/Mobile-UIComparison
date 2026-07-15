Feature: Verify Warning Message triggering when the drawer is opened and closed- Lithuania
    
  @PT-15066 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @WarningMessage @CashDrawer @ManualVerification
  Scenario: Lithuania - Verify warning message triggering functionality on the POS screen when the drawer is opened and closed
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user enters "${Product Fiscal LT 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button