Feature: Quantity Sale

  @PT-6514 @PreSales @POS @AUTOMATED
  Scenario: Verify Product Search option in quantity sale should direct to the Rich Product Search
    When user signs on as "POS Operator"
    And user presses "Sales" button and "Sell Unknown Product" page shown
    And user presses "QTY Sale" button and "Enter Qty" page shown
    When user enters "3" into "Input Box" field
    And user presses "OK" button and "Enter Item" page shown
    And user presses "Product Search" button and "Select Product" page shown
    And user waits "1" seconds
    And user presses "Keyboard" icon button
    And "Product Details Keyboard Shown" page is shown
    And user presses "Keyboard Number 5 button" icon button
    And user presses "Keyboard Number 7 button" icon button
    And user presses "Keyboard Number 9 button" icon button
    And user presses "Keyboard Number 4 button" icon button
    And user presses "Keyboard Number 9 button" icon button
    And user presses "Keyboard Number 0 button" icon button
    And user waits "5" seconds
    And user selects "${Product 4}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Product 4 description}" is displayed in "Receipt List" list
    And "${Product 4 selected quantity}" is displayed in "Receipt List" list
    And user presses "Keyboard" icon button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 4 Description}                              |
      | item      | Cash UK,-£57.60                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    Then user presses "SignOff" button
    And "Enter User" page is shown
    And user waits "2" seconds

  @PT-825 @PreSales @QtySale_Cash @POS @QtySale @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Sell an item with multiple quantity and complete transaction in Cash tender
    When user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "QTY Sale" button
    Then "Enter QTY" page is shown
    When user enters "3" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "Sell Item" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-162 @QtySale_NotAllowed @POS @Dune @Harrods @JYSK @MVP @Mobile @Support @QtySale @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Attempt to perform quantity sale of an Item for which quantity entry is dissallowed
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "QTY Sale" button
    Then "Enter QTY" page is shown
    When user enters "4" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "Sell Item" button
    Then "QTY Sale Not Allowed Error" page is shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-250 @PreSales @QtySale_Morethan99 @MVP @POS @QtySale @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Verify that user is not allowed to sell quantity more than 99
    Given user signs on as "POS Operator"
    And user presses "Sales" button
    And user presses "QTY Sale" button
    Then "Enter QTY" page is shown
    When user enters "101" into "Input Box" field
    And user presses "ENT" button
    Then "Invalid QTY Error" page is shown
    When user presses "OK" button
    Then "Enter QTY" page is shown
    And user presses "Cancel" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2585 @PreSales @Regression @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Modify Item quantity by increasing by 1
    Given user signs on as "POS Operator"
    And user presses "Sales" button
    And user presses "QTY Sale" button and "Enter Qty" page shown
    And user enters "3" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 2 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    And user presses "Change Quantity" button and "Enter Quantity" page shown
    And user enters "4" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description},4 @,${Product 2 Price}       |
    #Value may change based on promotions applied
    #| item      | Cash UK,-£40.00                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    Then user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2586 @PreSales @Regression @POS @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Modify Item quantity by decreasing by 1
    Given user signs on as "POS Operator"
    And user presses "Sales" button
    And user presses "QTY Sale" button and "Enter Qty" page shown
    And user enters "2" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 2 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    And user presses "Change Quantity" button and "Enter Quantity" page shown
    And user enters "1" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | Cash UK,-£10.00                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    Then user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2587 @PreSales @Regression @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Verify that modifying item quantity to zero is not allowed
    Given user signs on as "POS Operator"
    And user presses "Sales" button
    And user presses "QTY Sale" button and "Enter Qty" page shown
    And user enters "3" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 2 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    And user presses "Change Quantity" button and "Enter Quantity" page shown
    And user enters "0" into "Input Box" field
    And user presses "ENT" button and "Invalid Unit Quantity" page shown
    And user presses "OK" button and "Enter Quantity" page shown
    And user presses "Cancel" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description},3 @,${Product 2 Price}       |
    #Value may change based on promotions applied
    #| item      | Cash UK,-£30.00                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    Then user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2588 @PreSales @Regression @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Modify Item quantity for an Item with Unit of Measure
    Given user signs on as "POS Operator"
    And user presses "Sales" button
    And user presses "QTY Sale" button and "Enter Qty" page shown
    And user enters "1.5" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    When user enters "${Product 46}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 46 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    And user presses "Change Quantity" button and "Enter Quantity" page shown
    And user enters "1.7" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 46 Description}                             |
    #Value may change based on promotions applied
    #| item      | Cash UK,-£84.15                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    Then user presses "SignOff" button
    And "Enter User" page is shown

  @PT-12258 @PreSales @POS @AUTOMATED
  Scenario: POS - Add Pricing method "Quantity Break - Apply to All" Adding Items through quantity change
    Given user signs on as "Sales Assistant"
    When user enters "${Product 11}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown  
    Then "${Product 11 price}" is displayed in "Receipt" list
    And user selects "${Product 11 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Change Quantity" button and "Enter Quantity" page shown
    When user enters "2" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown    
    Then "£30.00" is displayed in "Receipt" list
    And user selects "${Product 11 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Change Quantity" button and "Enter Quantity" page shown
    When user enters "3" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown    
    Then "£30.00" is displayed in "Receipt" list    
    And user selects "${Product 11 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Change Quantity" button and "Enter Quantity" page shown
    When user enters "4" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown    
    Then "£40.00" is displayed in "Receipt" list
    And user selects "${Product 11 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Change Quantity" button and "Enter Quantity" page shown
    When user enters "5" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown    
    Then "£50.00" is displayed in "Receipt" list     
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | item      | ${Product 11 Description},5 @,£10.00                   |
      | item      | Cash UK,-£40.00                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown    
 
  @PT-12259 @PreSales @POS @AUTOMATED @ToBeFixedAutTest
  Scenario: POS - Add Pricing method "Quantity Break - Apply to All" Adding Items one by one
    Given user signs on as "Sales Assistant"
    When user enters "${Product 11}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown  
    And "${Product 11 price}" is displayed in "Receipt" list    
    Then "£15.00" is displayed in "Receipt" list    
    When user enters "${Product 11}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown  
    Then "Total Label" label displays the text "£30.00"    
    When user enters "${Product 11}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown  
    Then "Total Label" label displays the text "£30.00"
    When user enters "${Product 11}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown  
    Then "Total Label" label displays the text "£40.00"
    When user enters "${Product 11}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown  
    Then "Total Label" label displays the text "£35.00"
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 11 Description},£15.00                      |
      | item      | Quantity Price                                        |
      | item      | -£5.00                                                |
      | item      | ${Product 11 Description},£15.00                      |
      | item      | Quantity Price                                        |
      | item      | -£5.00                                                |      
      | item      | ${Product 11 Description},£15.00                      |
      | item      | Quantity Price                                        |
      | item      | -£5.00                                                |      
      | item      | ${Product 11 Description},£15.00                      |
      | item      | Quantity Price                                        |
      | item      | -£5.00                                                |      
      | item      | ${Product 11 Description},£15.00                      |
      | item      | Quantity Price                                        |
      | item      | -£5.00                                                |      
      | item      | Cash UK,-£35.00                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2875 @POS @JYSK @AUTOMATED @TPE-9483
  Scenario: POS - Add Pricing method "Quantity Break - Apply to All" Adding Items through quantity sale
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter QTY" page is shown
    When user enters "3" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "${Product 11}" into "Input Box" field
    And user presses "Sell Item" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 11 Description},3 @ £10.00                  |
      | item      | Cash UK,-£30.00                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-12264 @POS @AUTOMATED
  Scenario: POS - Add Pricing method "Quantity Break - Apply to All" Adding Items through quantity sale, one by one and change quantity
    Given user signs on as "Sales Assistant"
    When user enters "${Product 11}" into "Input Box" field    
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Product 11 price}" is displayed in "Receipt" list    
    Then "Total Label" label displays the text "£15.00"    
    When user enters "${Product 11}" into "Input Box" field    
    And user presses "ENT" button and "Transaction Basket" page shown
    Then "Total Label" label displays the text "£30.00"    
    And user selects "${Product 11 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Change Quantity" button and "Enter Quantity" page shown
    When user enters "2" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown    
    Then "Total Label" label displays the text "£30.00"   
    And user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter QTY" page is shown
    When user enters "2" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "${Product 11}" into "Input Box" field
    And user presses "Sell Item" button and "Transaction Basket" page shown
    And "£30.00" is displayed in "Receipt" list
    And user waits "3" seconds    
    Then "Total Label" label displays the text "£35.00"     
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 11 Description},2 @ ${Product 11 Price}     |
      | item      | Quantity Price                                        |
      | item      | -£10.00                                               |      
      | item      | ${Product 11 Description},${Product 11 Price}         | 
      | item      | Quantity Price                                        |
      | item      | -£5.00                                                |            
      | item      | ${Product 11 Description},2 @ ${Product 11 Price}     |      
      | item      | Quantity Price                                        |
      | item      | -£10.00                                               |      
      | item      | Cash UK,-£35.00                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown    

  @PT-12260 @POS @AUTOMATED
  Scenario: POS - Add Pricing method "Quantity Break - Apply After Threshold" Adding Items through quantity change
    Given user signs on as "Sales Assistant"
    When user enters "${Product 56}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown  
    And "${Product 56 price}" is displayed in "Receipt" list
    Then "Total Label" label displays the text "£10.00"  
    And user selects "${Product 56 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Change Quantity" button and "Enter Quantity" page shown
    When user enters "2" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown    
    And "£20.00" is displayed in "Receipt" list
    Then "Total Label" label displays the text "£20.00"
    And user selects "${Product 56 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Change Quantity" button and "Enter Quantity" page shown
    When user enters "3" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "£28.00" is displayed in "Receipt" list
    Then "Total Label" label displays the text "£28.00"
    And user selects "${Product 56 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Change Quantity" button and "Enter Quantity" page shown
    When user enters "4" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "£36.00" is displayed in "Receipt" list
    Then "Total Label" label displays the text "£36.00"
    And user selects "${Product 56 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Change Quantity" button and "Enter Quantity" page shown
    When user enters "5" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "£44.00" is displayed in "Receipt" list
    Then "Total Label" label displays the text "£34.00"    
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | item      | ${Product 56 Description},qty: 5,£44.00               |
      | item      | Cash UK,-£34.00                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-12261 @POS @AUTOMATED
  Scenario: POS - Add Pricing method "Quantity Break - Apply After Threshold" Adding Items one by one
    Given user signs on as "Sales Assistant"
    When user enters "${Product 56}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown  
    And "${Product 56 price}" is displayed in "Receipt" list
    Then "Total Label" label displays the text "£10.00"      
    When user enters "${Product 56}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown  
    And "${Product 56 price}" is displayed in "Receipt" list
    Then "Total Label" label displays the text "£20.00"      
    When user enters "${Product 56}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown  
    And "${Product 56 price}" is displayed in "Receipt" list
    Then "Total Label" label displays the text "£28.00"    
    When user enters "${Product 56}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown  
    And "${Product 56 price}" is displayed in "Receipt" list
    Then "Total Label" label displays the text "£36.00"    
    When user enters "${Product 56}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown  
    And "${Product 56 price}" is displayed in "Receipt" list
    Then "Total Label" label displays the text "£34.00"   
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |   
      | item      | ${Product 56 Description},${Product 56 Price}         |
      | item      | ${Product 56 Description},${Product 56 Price}         |
      | item      | ${Product 56 Description},${Product 56 Price}         |
      | item      | Quantity Threshold                                    |
      | item      | -£2.00                                                |     
      | item      | ${Product 56 Description},${Product 56 Price}         |
      | item      | Quantity Threshold                                    |
      | item      | -£2.00                                                |      
      | item      | ${Product 56 Description},${Product 56 Price}         |
      | item      | Quantity Threshold                                    |
      | item      | -£2.00                                                |      
      | item      | Cash UK,-£34.00                                       |      
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2876 @POS @JYSK @AUTOMATED @TPE-9483
  Scenario: POS - Add Pricing method "Quantity Break - Apply After Threshold" Adding Items through quantity sale
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter QTY" page is shown
    When user enters "4" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "${Product 56}" into "Input Box" field
    And user presses "Sell Item" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |   
      | item      | ${Product 56 Description},qty: 4,£36.00               |
      | item      | Cash UK,-£36.00                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
 
  @PT-12265 @POS @AUTOMATED
  Scenario: POS - Add Pricing method "Quantity Break - Apply After Threshold" Adding Items through quantity sale, one by one and change quantity
    Given user signs on as "Sales Assistant"
    When user enters "${Product 56}" into "Input Box" field    
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Product 56 price}" is displayed in "Receipt" list    
    Then "Total Label" label displays the text "£10.00"    
    When user enters "${Product 56}" into "Input Box" field    
    And user presses "ENT" button and "Transaction Basket" page shown
    Then "Total Label" label displays the text "£20.00"    
    And user selects "${Product 56 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Change Quantity" button and "Enter Quantity" page shown
    When user enters "2" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown    
    Then "Total Label" label displays the text "£28.00"   
    And user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter QTY" page is shown
    When user enters "2" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "${Product 56}" into "Input Box" field
    And user presses "Sell Item" button and "Transaction Basket" page shown
    And user waits "3" seconds
    Then "Total Label" label displays the text "£34.00"     
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 56 Description},qty: 2,£20.00               |
      | item      | ${Product 56 Description},${Product 56 Price}         |
      | item      | Quantity Threshold                                    |
      | item      | -£2.00                                                |      
      | item      | ${Product 56 Description},qty: 2,£20.00               |      
      | item      | Quantity Threshold                                    |
      | item      | -£4.00                                                |
      | item      | Cash UK,-£34.00                                       |      
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown       

  @PT-12172 @POS @AUTOMATED
  Scenario: POS - Verify Pricing method "Pack pricing" Adding Items through quantity change
    Given user signs on as "Sales Assistant"
    When user enters "${Product 57}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown  
    Then "${Product 57 price}" is displayed in "Receipt" list
    And user selects "${Product 57 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Change Quantity" button and "Enter Quantity" page shown
    When user enters "2" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown    
    Then "£24.00" is displayed in "Receipt" list
    And user selects "${Product 57 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Change Quantity" button and "Enter Quantity" page shown
    When user enters "3" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown    
    Then "£36.00" is displayed in "Receipt" list    
    And user selects "${Product 57 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Change Quantity" button and "Enter Quantity" page shown
    When user enters "4" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown    
    Then "£45.00" is displayed in "Receipt" list      
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | item      | ${Product 57 Description},4 @,${Product 57 Price}     |
      | item      | Cash UK,-£45.00                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
       
  @PT-12262 @POS @AUTOMATED
  Scenario: POS - Verify Pricing method "Pack pricing" Adding Items one by one
    Given user signs on as "Sales Assistant"
    When user enters "${Product 57}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown  
    And "${Product 57 price}" is displayed in "Receipt" list
    Then "Total Label" label displays the text "£13.00"   
    When user enters "${Product 57}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown  
    Then "Total Label" label displays the text "£24.00"
    When user enters "${Product 57}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown  
    Then "Total Label" label displays the text "£36.00"
    When user enters "${Product 57}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown  
    Then "Total Label" label displays the text "£45.00"	
    When user enters "${Product 57}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown  
    Then "Total Label" label displays the text "£45.00"
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | item      | ${Product 57 Description},${Product 57 Price}         |
      | item      | ${Product 57 Description},${Product 57 Price}         |
      | item      | Pack Pricing                                          |
      | item      | -£2.00                                                |
      | item      | ${Product 57 Description},${Product 57 Price}         |
      | item      | Pack Pricing                                          |
      | item      | -£1.00                                                |      
      | item      | ${Product 57 Description},${Product 57 Price}         |      
      | item      | Pack Pricing                                          |
      | item      | -£4.00                                                |      
      | item      | ${Product 57 Description},${Product 57 Price}         |      
      | item      | Cash UK,-£45.00                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown           
       
  @PT-12263 @POS @AUTOMATED
  Scenario: POS - Verify Pricing method "Pack pricing" Adding Items through quantity sale
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter QTY" page is shown
    When user enters "4" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "${Product 57}" into "Input Box" field
    And user presses "Sell Item" button and "Transaction Basket" page shown
    Then "Total Label" label displays the text "£45.00"	    
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |   
      | item      | ${Product 57 Description},4 @,${Product 57 Price}     |
      | item      | Cash UK,-£45.00                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
       
  @PT-12266 @POS @AUTOMATED
  Scenario: POS - Verify Pricing method "Pack pricing" Adding Items through quantity sale, one by one and change quantity
    Given user signs on as "Sales Assistant"
    When user enters "${Product 57}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown  
    And "${Product 57 price}" is displayed in "Receipt" list
    Then "Total Label" label displays the text "£13.00"     
    When user enters "${Product 57}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown  
    And "${Product 57 price}" is displayed in "Receipt" list
    Then "Total Label" label displays the text "£24.00"     
    And user selects "${Product 57 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Change Quantity" button and "Enter Quantity" page shown
    When user enters "2" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown    
    And "£24.00" is displayed in "Receipt" list    
    Then "Total Label" label displays the text "£36.00"     
    And user presses "Sales" button    
    And user presses "QTY Sale" button
    And "Enter QTY" page is shown
    When user enters "2" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "${Product 57}" into "Input Box" field
    And user presses "Sell Item" button and "Transaction Basket" page shown
    And user waits "3" seconds
    Then "Total Label" label displays the text "£49.00"		
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}    |
      | item      | ${Product 57 Description},2 @,${Product 57 Price},£26.00 |
      | item      | ${Product 57 Description},${Product 57 Price}            |      
      | item      | Pack Pricing                                             |
      | item      | -£1.00                                                   |         
      | item      | ${Product 57 Description},2 @,${Product 57 Price},£26.00 |      
      | item      | Pack Pricing                                             |
      | item      | -£2.00                                                   |      
      | item      | Cash UK,-£49.00                                          |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown                  
        
  @PT-3184 @AUTOMATED
  Scenario: POS - Verify Quantity sale from Rich product search
    Given user signs on as "Sales Assistant"
    And "Transaction Basket" page is shown
    When user enters "${SKU Product 6}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    When user selects "${SKU Product 6 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    And user presses "Product Details" button
    And user waits "2" seconds
    And "Rich Product Details" page is shown
    And user presses "Product Increase Quantity" icon button
    And user presses "Product Increase Quantity" icon button
    And user presses "ADD TO BAG" button
    When "Transaction Basket" page is shown
    And "${SKU Product 6 Description}" is displayed in "Receipt" list
    And "3,  @ , £42.60" is displayed in "Receipt" list
    Then user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}   |
      | telephone | Tel: ${Store Phone 1}                                   |
      | item      | ${SKU Product 6 Description},3 @,${SKU Product 6 Price} |
      | text      | ${SKU Product 6 Price}                                  |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-10602 @POS @AUTOMATED
  Scenario: Perform a Quantity Sale using Style Size product
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter QTY" page is shown
    And user enters "3" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "A-5" into "Input Box" field
    And user presses "ENT" button and "Select Size" page shown
    And user selects "Medium" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "3 @ £15.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Style Size Product 1 Description},3 @,${Style Size Product 1 Price} |
      | item | Cash UK,-£45.00                                                       |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-15026 @POS
  Scenario: Perform a Change Quantity for a product that has higher quantity than existing
    Given user signs on as "Sales Assistant"
    When user enters "${Product 189}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown  
    And "${Product 189 price}" is displayed in "Receipt" list
    Then "Total Label" label displays the text "£10.00"  
    And user selects "${Product 189 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Change Quantity" button and "Enter Quantity" page shown
    When user enters "2" into "Input Box" field
    And user presses "ENT" button and "Not Enough Stock" page shown
    And user presses "Yes" button 
    And "User Authorisation" page is shown
    When user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "ENT" button
    And "User Authorisation Enter Pin" page is shown
    When user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown  
    And "£20.00" is displayed in "Receipt" list
    Then "Total Label" label displays the text "£20.00" 
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button 
    And "Enter Cash Tender Amount" page is shown
    And user presses "OK" button
    And "Printing Receipt" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-15028 @POS
  Scenario: Perform a Quantity Sale for a product with Negative Inventory
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter QTY" page is shown
    And user enters "2" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "${Product 190}" into "Input Box" field
    And user presses "ENT" button and "Zero Stock" page shown
    And user presses "Yes" button 
    And "User Authorisation" page is shown
    When user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "ENT" button
    And "User Authorisation Enter Pin" page is shown
    When user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown 
    And "£20.00" is displayed in "Receipt" list
    Then "Total Label" label displays the text "£20.00" 
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button 
    And "Enter Cash Tender Amount" page is shown
    And user presses "OK" button
    And "Printing Receipt" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-15029 @POS
  Scenario: Perform a Quantity Sale for a product with Negative Inventory - Rejected
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter QTY" page is shown
    And user enters "2" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "${Product 190}" into "Input Box" field
    And user presses "ENT" button and "Zero Stock" page shown
    And user presses "Yes" button 
    And "User Authorisation" page is shown
    And user presses "Cancel" button 
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-15032 @POS
  Scenario: Perform a Change Quantity for a product with Negative Inventory - Rejected
    Given user signs on as "Sales Assistant"
    When user enters "${Product 188}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown  
    And "${Product 188 price}" is displayed in "Receipt" list
    Then "Total Label" label displays the text "£10.00"  
    And user selects "${Product 188 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Change Quantity" button and "Enter Quantity" page shown
    When user enters "2" into "Input Box" field
    And user presses "ENT" button and "Not Enough Stock" page shown
    And user presses "Yes" button 
    And "User Authorisation" page is shown
    And user presses "Cancel" button 
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-13324 @POS @AUTOMATED
  Scenario: Sell an item with multiple quantity and complete transaction in Cash tender when the @ symbol which is used to indicate the quantity sold is replaced with 'X'
    Given user signs on as "Sales Assistant Ire"
    When user presses "Sales" button
    Then user presses "QTY Sale" button
    And "Enter QTY" page is shown
    And user enters "3" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "1" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When "${PRODUCT_1_DESCRIPTION} 3 X ${PRODUCT_1_PRICE}" is displayed in "Receipt" list
    Then user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-17915 @POS @AUTOMATED
  Scenario: Verify Modify Quantity Function is Allowed to Privileged Users
    Given user signs on as "Sales Assistant"
    When user enters "${SKU Product 6}" into "Input Box" field
	When user presses "ENT" button
	When "${SKU Product 6 Description}" is displayed in "Receipt" list
	When user selects "${SKU Product 6 Description}" from "Receipt" list
	When "Modify Item" page is shown
    When user presses "Change Quantity" button and "Enter Quantity" page shown
	And user enters "2" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
	When privilege "enactor.pos.AuthorisesModifyQuantity" is removed from the current user
	When user selects "${SKU Product 6 Description}" from "Receipt" list
	When "Modify Item" page is shown
	When user presses "Change Quantity" button
	Then "Enter Authorising User" page is shown
    When user presses "Cancel" button and "Transaction Basket" page shown
	When privilege "enactor.pos.AuthorisesModifyQuantity" is added to the current user
	When user selects "${SKU Product 6 Description}" from "Receipt" list
	When "Modify Item" page is shown
	When user presses "Change Quantity" button and "Enter Quantity" page shown
	When user enters "4" into "Input Box" field
    When user presses "ENT" button and "Transaction Basket" page shown
    When user presses "Voids" button
    When user presses "Void Transaction" button and "Select Reason" page shown
    When user selects "Operator Error" from "Selection List" list
    When user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-10757 @PreSales @QtySale_Cash @POS @QtySale @AUTOMATED
  Scenario: Verify Quantity Sale for Non-Merchandise Product Sale
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter QTY" page is shown
    And user enters "3" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "${Product Non Merchandise}" into "Input Box" field
    And user presses "Sell Item" button and "Transaction Basket" page shown
    And "3 @ £2.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product Non Merchandise Description}                |
      | item      | 3 @ ${Product Non Merchandise Price}                  |
      | text      | ${Product Non Merchandise Price}                      |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-18999 @AUTOMATED @POS
  Scenario: Verify that the user can perform a quantity sale for an unknown product and change quantity of a unknown product in a transaction
    Given user signs on as "Sales Assistant 11"
    When user presses "Sales" button
    Then user presses "QTY Sale" button
    And "Enter QTY" page is shown
    And user enters "3" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    When user enters "unknown2" into "Input Box" field
    Then user presses "Sell Item" button
    And "Confirm Unknown Product Sale" page is shown
    And user presses "Sell" button and "Select Reason" page shown
    When user selects "Faulty Barcode" from "Selection List" list
    Then user presses "OK" button and "Filtered MMG" page shown
    And user presses "Toggle Alpha Keyboard" icon button
    When "Enter User with Keyboard" page is shown
    Then user presses "Keyboard Letter c button" icon button
    And user waits "1" seconds
    And user presses "Keyboard Letter h button" icon button
    And user waits "2" seconds
    And user selects "Children (All Regions)" from "MMG Group List" list
    When user presses "Select" button and "Enter Item Price" page shown
    Then "Enter Item Price" page is shown
    When user enters "£15.00" into "Input Box" field
    Then user presses "OK" button and "Transaction Basket" page shown
    And user presses "Toggle Alpha Keyboard" icon button
    And "Keyboard Hidden Sales" page is shown
    When "Children 3 @ £15.00" is displayed in "Receipt" list
    Then user selects "Children" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Change Quantity" button
    And "Modify Quantity" page is shown
    When user enters "2" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And "Children 2 @ £15.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown    

  @PT-18998 @POS @AUTOMATED
  Scenario: Verify whether the user can change the Quantity for a Non-merchandise product in a transaction
    Given user signs on as "Sales Assistant"
    When user enters "${Product Non Merchandise}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown  
    And "${Product Non Merchandise Description}" is displayed in "Receipt" list 
    And user selects "${Product Non Merchandise Description}" from "Receipt" list
    Then "Modify Item" page is shown
    And user presses "Change Quantity" button and "Enter Quantity" page shown
    And user enters "3" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "3 @ £2.00" is displayed in "Receipt" list    
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-19999 @POS @AUTOMATED
  Scenario: Quantity Sale - Rich Product Search Filter by Price
    Given user signs on as "POS Operator"
    And user presses "Sales" button and "Sell Unknown Product" page shown
    And user presses "QTY Sale" button and "Enter Qty" page shown
    And user enters "3" into "Input Box" field
    And user presses "OK" button and "Enter Item" page shown
    And user presses "Product Search" button and "Select Product" page shown
    And user presses "Additional Filters" button and "Product Filters" page shown
    And user enters "${Start Price}" into "Start Price" field
    And user enters "{End Price}" into "End Price" field
    And user presses "OK" button and "Select Product" page shown
    And user enters "${First Characters of Product 1}" into "Input Box" field
    And user presses "ENT" icon button and "Select Product" page shown
    And user waits "5" seconds            
    And user selects "${Product 1}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Product 1 description}" is displayed in "Receipt List" list
    And "${Product 1 selected quantity}" is displayed in "Receipt List" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-20000 @POS @AUTOMATED
  Scenario: Quantity Sale - Rich Product Filter by colour
    Given user signs on as "POS Operator"
    And user presses "Sales" button and "Sell Unknown Product" page shown
    And user presses "QTY Sale" button and "Enter Qty" page shown
    And user enters "3" into "Input Box" field
    And user presses "OK" button and "Enter Item" page shown
    And user presses "Product Search" button and "Select Product" page shown
    And user presses "Additional Filters" button and "Product Filters" page shown    
    And user presses "Search Colour" icon button
    And "Prompt State" page is shown
    And user selects "${Style Colour Size Product 2 Colour 1}" from "Selection List" list    
    And user presses "OK" button and "Product Filters" page shown
    And user presses "OK" button and "Select Product" page shown
    And user enters "${Style Colour Size Product 2}" into "Input Box" field
    And user presses "ENT" icon button and "Select Product" page shown
    And user waits "5" seconds                        
    And user selects "${SKU Product 6}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "${SKU Product 6 description}" is displayed in "Receipt List" list
    And "${SKU Product 6 selected quantity}" is displayed in "Receipt List" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown    

   @PT-20001 @POS @AUTOMATED
  Scenario: Quantity Sale - Rich Product Filter by category
    Given user signs on as "POS Operator"
    And user presses "Sales" button and "Sell Unknown Product" page shown
    And user presses "QTY Sale" button and "Enter Qty" page shown
    And user enters "3" into "Input Box" field
    And user presses "OK" button and "Enter Item" page shown
    And user presses "Product Search" button and "Select Product" page shown
    And user presses "Additional Filters" button and "Product Filters" page shown        
    And user presses "Search Product Group" icon button and "Select Group List" page shown
    And user enters "${Product 123AS3Y-11 MMG Group}" into "Input Box" field
    And user waits "5" seconds    
    And user presses "OK" button and "Product Filters" page shown
    And user presses "OK" button and "Select Product" page shown
    And user waits "5" seconds                
    And user selects "${Product 123AS3Y}" from "Selection List" list        
    And user presses "OK" button and "Select Colour" page shown
    And user selects "${Product 123AS3Y-11 Color}" from "Selection List" list
    And user presses "OK" button and "Select Size" page shown
    And user selects "${Product 123AS3Y-11 Size}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Product 123AS3Y-11 description}" is displayed in "Receipt List" list
    And "${Product 123AS3Y-11 selected quantity}" is displayed in "Receipt List" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown   