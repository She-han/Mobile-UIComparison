Feature: Return Item on Serbia fiscal Printer

  @PT-1507 @SerbiaFiscalReturnItem @No_Printer @AUTOMATED @Serbia @Fiscalisation @FiscalSerbia
  Scenario: Verify the return item on Serbia fiscal Printer
    Given user signs on as "Serbia Fiscal Sales Assistant"
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product Fiscal RS 2}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown  
    And user presses "SignOff" button
    And "Enter User" page is shown
    
    
  @PT-1508 @SerbiaFiscalReturnItem @No_Printer @AUTOMATED @Serbia @Fiscalisation @FiscalSerbia
  Scenario: Verify the return receipt option on Serbia fiscal Printer
    Given user signs on as "Serbia Fiscal Sales Assistant"
    And user presses "Returns" button
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    And user presses "Search" button and "Enter Original Transaction Details" page shown
    And user enters "111" into "Transaction Number Field" field
    And user presses "Search" button and "Extended Return Details" page shown
    And user presses "Complete Receipt" button and "Select Reason" page shown
    And user selects "Damaged / Faulty (30 Days)" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown  
    When user presses "TOTAL" button and "Select Return Tender" page shown
    And user presses "Down" button 
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown  
    And user presses "SignOff" button
    And "Enter User" page is shown
  
