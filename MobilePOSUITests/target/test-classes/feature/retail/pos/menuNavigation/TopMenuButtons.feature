 Feature: Top Menu Buttons

  @PT-1767 @POS @AUTOMATED @Dune @Regression @POSValidatedTest @POSSet1
  Scenario: Clicking Home button returns user to the Transaction basket
    Given user signs on as "Pos Operator"
    When user presses "CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
 
  @PT-1768 @POS @AUTOMATED @Dune @Regression @POSValidatedTest @POSSet1
  Scenario: Click Home button with items in the Transaction basket
    Given user signs on as "Pos Operator"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "Home Button" icon button 
    And "Return Home Void Transaction" page is shown
    And user presses "OK" button
    And "Select Reason" page is shown 
    And user selects "Item Faulty" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-1769 @POS @AUTOMATED @Dune @Regression @POSValidatedTest @POSSet1
  Scenario: Clicking Bag button returns user to the Transaction basket
   Given user signs on as "Pos Operator"
   When user presses "CRM button" icon button
   Then "CRM Menu Screen" page is shown
   When user presses "BAG Button" icon button
   Then "Transaction Basket" page is shown
   When user presses "SignOff" button
   Then "Enter User" page is shown 
   
  @PT-24375 @TerminalCashManagement @AUTOMATED @POS @Terminal_Cash_Management
  Scenario: Check Terminal Cash Management button available in the header
    Given user signs on as "Manager 2"
    When user presses "Header Terminal Cash Management button" icon button
    Then "Terminal Cash Management Menu Screen" page is shown
    And user presses "Terminal Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    And user signs on as "Pos Operator 2"
    And button with label "Cash Management" is not displayed
    And user presses "SignOff" button
    And "Enter User" page is shown
    
   @PT-24383 @Inventory @AUTOMATED @POS 
   Scenario: Check Inventory button available in the header
    Given user signs on as "Manager 2"
    When user presses "Header Inventory button" icon button
    Then "Inventory Menu Screen" page is shown
    And user presses "Inventory Screen Header Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    And user signs on as "Pos Operator 2"
    And button with label "Inventory" is not displayed
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-24388 @TerminalCashManagement @AUTOMATED @POS @Terminal_Cash_Management
  Scenario: Check Terminal Cash Management button available in header of the different pages
    #Validate Terminal Cash Management Button after logging to the POS
    Given user signs on as "Manager 2"
    When user presses "Header Terminal Cash Management button" icon button
    Then "Terminal Cash Management Menu Screen" page is shown
    And user presses "Terminal Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    
    #Validate the Terminal Cash Management Button while doing the transaction
    And user enters "${PRODUCT_1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Header Terminal Cash Management button" icon button
    And user presses "Message Prompt Ok Button" icon button
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And button with label "Cash Management" is not displayed
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And button with label "Cash Management" is not displayed
    And user presses "Ok" icon button
    And user waits "2" seconds
    And button with label "Cash Management" is not displayed
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    
    #Validate the cash management button in Rich Product Search
    And user presses "Product Button" icon button
    And "Rich Product Search" page is shown
    And user enters "${Product 4}" into "Product Search Input" field
    And button with label "Cash Management" is not displayed
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And user presses "Header Terminal Cash Management button" icon button
    And "Terminal Cash Management Menu Screen" page is shown
    And user presses "Terminal Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    
    #Validate the cash management button in Management Menu button flow
    And user presses "Management" button
    And user presses "Header Terminal Cash Management button" icon button
    And "Terminal Cash Management Menu Screen" page is shown
    And user presses "Terminal Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    
    #Validate the cash management button in CRM flow
    And user presses "Transaction Basket CRM button" icon button
    And user presses "Header Terminal Cash Management button" icon button
    And "Terminal Cash Management Menu Screen" page is shown
    And user presses "Terminal Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-24401 @Inventory @AUTOMATED @POS
  Scenario: Check Inventory button available in header of the different pages
    #Validate Inventory Button after logging to the POS
    Given user signs on as "Manager 2"
    When user presses "Header Inventory button" icon button
    Then "Inventory Menu Screen" page is shown
    And user presses "Inventory Screen Header Back Button" icon button
    And "Transaction Basket" page is shown
    
    #Validate the Inventory Button while doing the transaction
    And user enters "${PRODUCT_1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Header Inventory button" icon button
    And "Inventory Menu Screen" page is shown
    And user presses "Inventory Screen Header Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And button with label "Inventory" is not displayed
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And button with label "Inventory" is not displayed
    And user presses "Ok" icon button
    And user waits "2" seconds
    And button with label "Inventory" is not displayed
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    
    #Validate the Inventory button in Rich Product Search
    And user presses "Product Button" icon button
    And "Rich Product Search" page is shown
    And user enters "${Product 4}" into "Product Search Input" field
    And button with label "Inventory" is not displayed
    And user presses "Product Search Button" icon button
    And "Rich Product Search Result" page is shown
    And user presses "Header Inventory button" icon button
    And "Inventory Menu Screen" page is shown
    And user presses "Inventory Screen Header Back Button" icon button
    And "Transaction Basket" page is shown
    
    #Validate the Inventory button in Management Menu button flow
    And user presses "Management" button
    And user presses "Header Inventory button" icon button
    And "Inventory Menu Screen" page is shown
    And user presses "Inventory Screen Header Back Button" icon button
    And "Transaction Basket" page is shown
    
    #Validate the Inventory button in CRM flow
    And user presses "Transaction Basket CRM button" icon button
    And user presses "Header Inventory button" icon button
    And "Inventory Menu Screen" page is shown
    And user presses "Inventory Screen Header Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

