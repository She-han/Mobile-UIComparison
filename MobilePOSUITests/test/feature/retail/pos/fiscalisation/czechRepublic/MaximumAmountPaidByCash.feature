Feature: Maximum amount paid by cash in one transaction on Czech Fiscal POS

  @PT-2237 @Fiscalisation @CzechRepublic @FiscalCzechRepublicMaxAmount @AUTOMATED @ManualVerification
  Scenario: Verify Maximum amount paid by cash in one transaction on Czech Fiscal POS
    Given user signs on as "Czech Republic Fiscal Sales Assistant"
    And user presses "Sales" button
    When user presses "QTY Sale" button
    And "Enter Qty" page is shown
    And user enters "350" into "Input Box" field
    And user presses "OK" button
    And "Enter Item" page is shown
    And user enters "${Product Fiscal CZ 2}" into "Input Box" field    
    And user presses "Sell Item" button
    Then "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Czech Basket Total Validation Msg" page shown
		When user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown	


    
    
