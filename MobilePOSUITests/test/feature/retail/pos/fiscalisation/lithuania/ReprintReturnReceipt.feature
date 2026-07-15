Feature: Reprint Fiscal Receipts - Lithuania
    
  @PT-15087 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @ReturnReceipt @ReprintReceipt @DuplicateLable @ManualVerification
  Scenario: Lithuania - Verify reprinted return receipt is printing with the Duplicate label
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    When user presses "Returns" button
    Then "Transaction Basket" page is shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user presses "More Search Options" button and "Enter Transaction Archive Search Data" page shown
    And user presses "OK" button and "Select Transaction Details" page shown
    And user presses "Select" button and "Extended Return Details" page shown
    And user presses "Return Entire Receipt" button
    And user presses "ENT" button and "Select Reason" page shown
    When user selects "Damaged / Faulty (30 Days) all regions" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    Then user selects "Cash LT" from "Selection List" list
    And user presses "OK" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "${Product Fiscal LT 1 Description}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty (30 Days) all regions" is displayed in "Receipt" list
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown   
    And user presses "Sales" button
    And user presses "Receipts" button and "Transaction Basket" page shown
    And user presses "Reprint Recent" button and "Reprint Recent  Select Transaction" page shown
    And user presses "OK" button and "Confirm Print Transaction" page shown
    And user presses "Print" button 
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown