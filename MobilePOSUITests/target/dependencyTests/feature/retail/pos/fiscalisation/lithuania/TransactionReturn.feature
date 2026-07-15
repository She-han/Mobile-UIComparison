Feature: Print Fiscal Receipt with Transaction Return - Lithuania
    
  @PT-15073 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @TransactionReturn @NegativeValues @ManualVerification
  Scenario: Lithuania - Verify transaction return receipt is containing the correct item details with the negative values
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user enters "${Product Fiscal LT 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product Fiscal LT 1 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user waits "90" seconds
    And user presses "Returns" button and "Transaction Basket" page shown
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
    When user presses "SignOff" button