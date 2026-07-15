Feature:  Reprint Void Receipts - Lithuania
    
  @PT-15088 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @VoidReceipt @ReprintReceipt @DuplicateLable @ManualVerification
  Scenario: Lithuania - Verify reprinted void receipt is printing with the Duplicate label
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user enters "${Product Fiscal LT 1}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${Product Fiscal LT 2}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Transaction" button
    Then "Transaction Basket" page is shown
    And user presses "Sales" button
    And "Transaction Basket" page is shown
    And user presses "Receipts" button and "Transaction Basket" page shown
    And user presses "Reprint Recent" button and "Reprint Recent  Select Transaction" page shown
    And user presses "OK" button and "Confirm Print Transaction" page shown
    And user presses "Print" button 
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown