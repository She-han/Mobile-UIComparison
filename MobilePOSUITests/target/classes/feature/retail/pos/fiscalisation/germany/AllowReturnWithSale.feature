Feature: Allow Return an Item with Normal Retail Sale on German Fiscal POS

  @PT-2169  @Fiscalisation @Germany @AUTOMATED @ManualVerification
  Scenario: Verify return function is allowed to mix with an Item sale on German Fiscal POS
  	Given user signs on as "Germany Fiscal Sales Assistant"
    And user enters "${Product Fiscal De 2}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product Fiscal De 2}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button 
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
    

