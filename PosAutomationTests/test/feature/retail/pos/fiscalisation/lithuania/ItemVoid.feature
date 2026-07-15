Feature: Print Fiscal Void Receipt - Lithuania
    
  @PT-14896 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @VoidReceipt @VoidItem @ManualVerification
  Scenario: Lithuania - Verify that the void receipt does not prints the voided single item in the basket and includes only other items in the basket
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user enters "${Product Fiscal LT 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal LT 2}" into "Input Box" field
    And user presses "ENT" button
    When user selects "${Product Fiscal LT 2 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Item Void" button
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button