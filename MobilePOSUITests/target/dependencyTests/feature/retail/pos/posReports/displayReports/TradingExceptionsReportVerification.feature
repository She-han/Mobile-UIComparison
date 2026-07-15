Feature: Trading Exceptions Report Verification
    
  @PT-2847 @ManualVerification @Regression @Reports @AUTOMATED
  Scenario: Display Trading Exceptions Report for a Selected Single Date
    Given user signs on as "Sales Assistant"
    #***********************ITEM DISCOUNTS*************************
    Then user enters "${Product 47}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Manager Item Discount (%)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    And user enters "50%" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown    
    And "Manager Item Discount (%) 50% -£5.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown             
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown  
    #***********************TRANSACTION DISCOUNTS******************
    When user enters "${Product 24}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown   
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Transaction Discount (Amount)" from "Selection List" list
    And user presses "OK" button and "Enter Transaction Discount Amount" page shown
    When user enters "24.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Transaction Discount (Amount)) -£24.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown    
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #***********************PRICE OVERRIDES************************
    Then user enters "${Product 24}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Price Override" button and "Select Basket Item" page shown
    When user selects "${Product 24 Description}" from "Selection List" list
    And user presses "OK" button and "Select Reason" page shown   
    And user selects "Fixed Price" from "Selection List" list   
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Fixed Price ( £34.00 to £10.00 )" is displayed in "Receipt" list    
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown         
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #***********************ITEM VOIDS*****************************
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    And user presses "Item Void" button
    Then "Select Basket Item" page is shown
    When user presses "Up" button
    And user presses "OK" button
    Then "Select Reason" page is shown
    When user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown                                                
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #***********************TRANSACTION VOIDS**********************
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    When user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown 
    #***********************NO SALES*******************************
    And user presses "Management" button
    And user presses "No Sale" button
    And "Select Reason" page is shown
    And user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown   
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown    
    When user presses "SignOff" button
    Then "Enter User" page is shown     
    
  @PT-2848 @ManualVerification @Regression @Reports @AUTOMATED
  Scenario: Display Trading Exceptions Report for a Selected Period - Current Fiscal Period
    Given user signs on as "Sales Assistant"
    #***********************ITEM DISCOUNTS*************************
    Then user enters "${Product 47}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Manager Item Discount (%)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    And user enters "50%" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown    
    And "Manager Item Discount (%) 50% -£5.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown             
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown  
    #***********************TRANSACTION DISCOUNTS******************
    When user enters "${Product 24}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown   
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Transaction Discount (Amount)" from "Selection List" list
    And user presses "OK" button and "Enter Transaction Discount Amount" page shown
    When user enters "24.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Transaction Discount (Amount)) -£24.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown    
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #***********************PRICE OVERRIDES************************
    Then user enters "${Product 24}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Price Override" button and "Select Basket Item" page shown
    When user selects "${Product 24 Description}" from "Selection List" list
    And user presses "OK" button and "Select Reason" page shown   
    And user selects "Fixed Price" from "Selection List" list   
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Fixed Price ( £34.00 to £10.00 )" is displayed in "Receipt" list    
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown         
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #***********************ITEM VOIDS*****************************
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    And user presses "Item Void" button
    Then "Select Basket Item" page is shown
    When user presses "Up" button
    And user presses "OK" button
    Then "Select Reason" page is shown
    When user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown                                                
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #***********************TRANSACTION VOIDS**********************
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    When user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown 
    #***********************NO SALES*******************************
    And user presses "Management" button
    And user presses "No Sale" button
    And "Select Reason" page is shown
    And user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown   
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown    
    When user presses "SignOff" button
    Then "Enter User" page is shown  
  
  @PT-2849 @ManualVerification @Regression @Reports @AUTOMATED
  Scenario: Display Trading Exceptions Report for a Selected Month
    Given user signs on as "Sales Assistant"
    #***********************ITEM DISCOUNTS*************************
    Then user enters "${Product 47}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Manager Item Discount (%)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    And user enters "50%" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown    
    And "Manager Item Discount (%) 50% -£5.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown             
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown  
    #***********************TRANSACTION DISCOUNTS******************
    When user enters "${Product 24}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown   
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Transaction Discount (Amount)" from "Selection List" list
    And user presses "OK" button and "Enter Transaction Discount Amount" page shown
    When user enters "24.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Transaction Discount (Amount)) -£24.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown    
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #***********************PRICE OVERRIDES************************
    Then user enters "${Product 24}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Price Override" button and "Select Basket Item" page shown
    When user selects "${Product 24 Description}" from "Selection List" list
    And user presses "OK" button and "Select Reason" page shown   
    And user selects "Fixed Price" from "Selection List" list   
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Fixed Price ( £34.00 to £10.00 )" is displayed in "Receipt" list    
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown         
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #***********************ITEM VOIDS*****************************
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    And user presses "Item Void" button
    Then "Select Basket Item" page is shown
    When user presses "Up" button
    And user presses "OK" button
    Then "Select Reason" page is shown
    When user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown                                                
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #***********************TRANSACTION VOIDS**********************
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    When user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown 
    #***********************NO SALES*******************************
    And user presses "Management" button
    And user presses "No Sale" button
    And "Select Reason" page is shown
    And user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown   
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown    
    When user presses "SignOff" button
    Then "Enter User" page is shown  
  
  @PT-2850 @ManualVerification @Regression @Reports @AUTOMATED
  Scenario: Display Trading Exceptions Report for This Week
    Given user signs on as "Sales Assistant"
    #***********************ITEM DISCOUNTS*************************
    Then user enters "${Product 47}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Manager Item Discount (%)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    And user enters "50%" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown    
    And "Manager Item Discount (%) 50% -£5.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown             
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown  
    #***********************TRANSACTION DISCOUNTS******************
    When user enters "${Product 24}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown   
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Transaction Discount (Amount)" from "Selection List" list
    And user presses "OK" button and "Enter Transaction Discount Amount" page shown
    When user enters "24.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Transaction Discount (Amount)) -£24.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown    
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #***********************PRICE OVERRIDES************************
    Then user enters "${Product 24}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Price Override" button and "Select Basket Item" page shown
    When user selects "${Product 24 Description}" from "Selection List" list
    And user presses "OK" button and "Select Reason" page shown   
    And user selects "Fixed Price" from "Selection List" list   
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Fixed Price ( £34.00 to £10.00 )" is displayed in "Receipt" list    
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown         
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #***********************ITEM VOIDS*****************************
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    And user presses "Item Void" button
    Then "Select Basket Item" page is shown
    When user presses "Up" button
    And user presses "OK" button
    Then "Select Reason" page is shown
    When user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown                                                
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #***********************TRANSACTION VOIDS**********************
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    When user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown 
    #***********************NO SALES*******************************
    And user presses "Management" button
    And user presses "No Sale" button
    And "Select Reason" page is shown
    And user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown   
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown    
    When user presses "SignOff" button
    Then "Enter User" page is shown  
  
  @PT-2851 @ManualVerification @Regression @Reports @AUTOMATED
  Scenario: Display Trading Exceptions Report for Today
    Given user signs on as "Sales Assistant"
    #***********************ITEM DISCOUNTS*************************
    Then user enters "${Product 47}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Manager Item Discount (%)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    And user enters "50%" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown    
    And "Manager Item Discount (%) 50% -£5.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown             
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown  
    #***********************TRANSACTION DISCOUNTS******************
    When user enters "${Product 24}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown   
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Transaction Discount (Amount)" from "Selection List" list
    And user presses "OK" button and "Enter Transaction Discount Amount" page shown
    When user enters "24.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Transaction Discount (Amount)) -£24.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown    
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #***********************PRICE OVERRIDES************************
    Then user enters "${Product 24}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Price Override" button and "Select Basket Item" page shown
    When user selects "${Product 24 Description}" from "Selection List" list
    And user presses "OK" button and "Select Reason" page shown   
    And user selects "Fixed Price" from "Selection List" list   
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Fixed Price ( £34.00 to £10.00 )" is displayed in "Receipt" list    
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown         
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #***********************ITEM VOIDS*****************************
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    And user presses "Item Void" button
    Then "Select Basket Item" page is shown
    When user presses "Up" button
    And user presses "OK" button
    Then "Select Reason" page is shown
    When user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown                                                
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #***********************TRANSACTION VOIDS**********************
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    When user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown 
    #***********************NO SALES*******************************
    And user presses "Management" button
    And user presses "No Sale" button
    And "Select Reason" page is shown
    And user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown   
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown    
    When user presses "SignOff" button
    Then "Enter User" page is shown  
  
  @PT-2852 @ManualVerification @Regression @Reports @AUTOMATED
  Scenario: Display Trading Exceptions Report for a Selected Date Range
    Given user signs on as "Sales Assistant"
    #***********************ITEM DISCOUNTS*************************
    Then user enters "${Product 47}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Manager Item Discount (%)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    And user enters "50%" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown    
    And "Manager Item Discount (%) 50% -£5.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown             
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown  
    #***********************TRANSACTION DISCOUNTS******************
    When user enters "${Product 24}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown   
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Transaction Discount (Amount)" from "Selection List" list
    And user presses "OK" button and "Enter Transaction Discount Amount" page shown
    When user enters "24.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Transaction Discount (Amount)) -£24.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown    
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #***********************PRICE OVERRIDES************************
    Then user enters "${Product 24}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Price Override" button and "Select Basket Item" page shown
    When user selects "${Product 24 Description}" from "Selection List" list
    And user presses "OK" button and "Select Reason" page shown   
    And user selects "Fixed Price" from "Selection List" list   
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Fixed Price ( £34.00 to £10.00 )" is displayed in "Receipt" list    
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown         
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #***********************ITEM VOIDS*****************************
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    And user presses "Item Void" button
    Then "Select Basket Item" page is shown
    When user presses "Up" button
    And user presses "OK" button
    Then "Select Reason" page is shown
    When user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown                                                
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #***********************TRANSACTION VOIDS**********************
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    When user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown 
    #***********************NO SALES*******************************
    And user presses "Management" button
    And user presses "No Sale" button
    And "Select Reason" page is shown
    And user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown   
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown    
    When user presses "SignOff" button
    Then "Enter User" page is shown   
