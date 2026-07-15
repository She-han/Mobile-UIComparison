Feature: Maximum amount paid by cash in one transaction on Croatia Fiscal POS

  @PT-2269 @Fiscalisation @Croatia @FiscalCroatiaRepublicMaxAmount @AUTOMATED @ManualVerification
  Scenario: Verify Max Cash limit for domestic customer is 75.000,00 Kn on Croatia Fiscal POS
    Given user signs on as "Croatia Fiscal Sales Assistant"
    And user presses "Sales" button
    When user presses "QTY Sale" button
    And "Enter Qty" page is shown
    And user enters "10" into "Input Box" field
    And user presses "OK" button
    And "Enter Item" page is shown
    And user enters "${Product Fiscal HR 3}" into "Input Box" field    
    And user presses "Sell Item" button
    Then "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Croatia Basket Total Validation Msg" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown	


    
    
