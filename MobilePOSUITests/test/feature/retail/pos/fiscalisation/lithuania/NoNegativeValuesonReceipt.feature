Feature: Verify No negative values printed on Fiscal Receipt  - Lithuania
    
  @PT-14890 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @NegativeValues @ManualVerification
  Scenario: Lithuania - Verify that there are no negative values printed related to the sale items on the receipts
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user enters "${Product Fiscal LT 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button