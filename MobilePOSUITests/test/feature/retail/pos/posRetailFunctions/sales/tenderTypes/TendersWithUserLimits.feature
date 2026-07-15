Feature: Tender Transactions with User tender limits

  @PT-1859 @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Transaction OVER user tender limit
   Given user signs on as "Sales Assistant"
   When user enters "${Product 24}" into "Input Box" field
   And user presses "ENT" icon button
   And "Await Drawer Closed" page is shown
   And user waits "1" seconds  
   When user presses "Close" button on external "Cash Drawer" window
   Then "Transaction Basket" page is shown
   When user presses "TOTAL" button and "Select Tender" page shown
   And user presses "Cash" button and "Enter Cash Tender Amount" page shown
   When user enters "£200,000.00" into "Input Box" field
   And user presses "ENT" button
   Then "Debit Amount Over Limit" page is shown   
   When user presses "Cancel" button and "Select Tender" page shown
   And user presses "Cash" button and "Enter Cash Tender Amount" page shown
   When user enters "£80,000.00" into "Input Box" field
   And user presses "ENT" button and "Await Drawer Closed" page shown
   And user presses "Close" button on external "Cash Drawer" window
   And "Transaction Basket" page is shown
   And user presses "SignOff" button
   And "Enter User" page is shown   
  
  @PT-1861 @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Transaction UNDER user tender limit
   Given user signs on as "Sales Assistant"
   When user enters "${Product 24}" into "Input Box" field
   And user presses "ENT" icon button
   And "Await Drawer Closed" page is shown
   And user waits "1" seconds 
   When user presses "Close" button on external "Cash Drawer" window
   Then "Transaction Basket" page is shown
   When user presses "TOTAL" button and "Select Tender" page shown
   And user presses "Cash" button and "Enter Cash Tender Amount" page shown   
   When user enters "£90,000.00" into "Input Box" field
   And user presses "ENT" button and "Await Drawer Closed" page shown
   And user presses "Close" button on external "Cash Drawer" window
   And "Transaction Basket" page is shown
   And user presses "SignOff" button
   And "Enter User" page is shown
   
  @PT-1860 @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Transaction SAME AS user tender limit
   Given user signs on as "Sales Assistant"
   When user enters "${Product 24}" into "Input Box" field
   And user presses "ENT" icon button
   And "Await Drawer Closed" page is shown
   And user waits "1" seconds
   When user presses "Close" button on external "Cash Drawer" window
   Then "Transaction Basket" page is shown
   When user presses "TOTAL" button and "Select Tender" page shown
   And user presses "Cash" button and "Enter Cash Tender Amount" page shown   
   When user enters "£100,000.00" into "Input Box" field
   And user presses "ENT" button and "Await Drawer Closed" page shown
   And user presses "Close" button on external "Cash Drawer" window
   And "Transaction Basket" page is shown
   And user presses "SignOff" button
   And "Enter User" page is shown