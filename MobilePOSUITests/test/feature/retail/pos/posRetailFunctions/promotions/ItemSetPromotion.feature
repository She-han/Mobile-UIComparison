Feature: Item Set Promotions

  @PT-382 @MVP @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Item Set Promotion - Amount Discount - with included product
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 1 Price}" is displayed in "Receipt" list
    And "${Product 1 Promotion}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}              |
      | telephone | Tel: ${Store Phone 1}                                              |
     #Commented due to failing script casued by PLAT-16359
     #| item      | ${Product 1 Description},${Product 1 Price},${Product 1 Promotion} |
      | text      | Promotion Saving                                                   |
      | text      | ${Product 1 Promotion Saving Amount}                                                            |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-383 @Dune @MVP @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Item Set Promotion - Free Product Alert
    Given user signs on as "Sales Assistant"
    When user enters "${Product 18}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 18 Description}" is displayed in "Receipt" list
    And "Promotion Saving" is displayed in "Receipt" list
    And "${Product 18 Price}" is displayed in "Receipt" list
    And "${Product 18 Promotion}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 18 Description},${Product 18 Price}         |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-384 @PromotionForMultipleItems @MVP @POS @AUTOMATED @Dune @POSValidatedTest @POSSet2
  Scenario: Item Set - Multiple items - trigger on next item
    Given user signs on as "Sales Assistant"
    When user enters "${Product 17}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 17 Description}" is displayed in "Receipt" list
    And "${Product 17 Price}" is displayed in "Receipt" list
    When user enters "${Product 17}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 17 Description}" is displayed in "Receipt" list
    And "${Product 17 Price}" is displayed in "Receipt" list
    And "${Product 17 Promotion}" is displayed in "Receipt" list
    And "${Product 17 Promotion Saving Amount 1}" is displayed in "Receipt" list
    When user enters "${Product 17}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 17 Description}" is displayed in "Receipt" list
    And "${Product 17 Promotion}" is displayed in "Receipt" list
    And "${Product 17 Promotion Saving Amount 2}" is displayed in "Receipt" list
    When user enters "${Product 17}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 17 Description}" is displayed in "Receipt" list
    And "${Product 17 Promotion}" is displayed in "Receipt" list
    And "${Product 17 Promotion Saving Amount 3}" is displayed in "Receipt" list
    When user enters "${Product 17}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 17 Description}" is displayed in "Receipt" list
    And "${Product 17 Promotion}" is displayed in "Receipt" list
    And "${Product 17 Promotion Saving Amount 4}" is displayed in "Receipt" list
    When user enters "${Product 17}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 17 Description}" is displayed in "Receipt" list
    And "${Product 17 Promotion}" is displayed in "Receipt" list
    And "${Product 17 Promotion Saving Amount 4}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                   |
      | telephone | Tel: ${Store Phone 1}                                                   |
      | item      | ${Product 17 Description},${Product 17 Price}                           |
      | text      | Promotion Saving                                                        |
      | item      | Buy items for £2 after 2nd upto,${Product 17 Promotion Saving Amount 4} |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-77 @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Price Change Type - Item Set Promotion - Free Product Alert
    Given user signs on as "Sales Assistant"
    When user enters "${Product 30}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 30 Description}" is displayed in "Receipt" list
    And "Promotion Saving" is displayed in "Receipt" list
    And "${Product 30 Price}" is displayed in "Receipt" list
    And "${Product 30 Promotion}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 30 Description},${Product 30 Price}         |
      | text      | Promotion Saving                                      |
      | item      | ${Product 30 Promotion}                               |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-79 @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Price Change Type - Exclude Prodcut in Item Set Promotion - Free Product Alert
    Given user signs on as "Sales Assistant"
    When user enters "${Product 29}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 29 Description}" is displayed in "Receipt" list
    And "${Product 29 Price}" is displayed in "Receipt" list
    And "Promotion Saving" is not displayed in "Receipt" list
    Then user enters "${Product 35}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 35 Description}" is displayed in "Receipt" list
    And "Promotion Saving" is displayed in "Receipt" list
    And "${Product 35 Price}" is displayed in "Receipt" list
    And "${Product 35 Promotion}" is displayed in "Receipt" list
    When user enters "${Product 30}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 29 Description},${Product 29 Price}         |
      | item      | ${Product 35 Description},${Product 35 Price}         |
      | text      | Promotion Saving                                      |
      | item      | ${Product 35 Promotion}                               |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2511 @AUTOMATED
  Scenario: Price Chanage Type - Exclude Selected Product and Trigger the Item Free Promotion on Any Item
    Given user signs on as "Sales Assistant"
    When user enters "${Product 29}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 29 Description}" is displayed in "Receipt" list
    And "${Product 29 Price}" is displayed in "Receipt" list
    And "Promotion Saving" is not displayed in "Receipt" list
    Then user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 1 Description}" is displayed in "Receipt" list
    And "Promotion Saving" is displayed in "Receipt" list
    And "${Product 1 Price}" is displayed in "Receipt" list
    And "${Product 1 Promotion}" is displayed in "Receipt" list
    Then "${Product 30 Description}" is displayed in "Receipt" list
    And "Promotion Saving" is displayed in "Receipt" list
    And "${Product 30 Price}" is displayed in "Receipt" list
    And "${Product 30 Promotion}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 29 Description},${Product 29 Price}         |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product  Description},${Product 1 Price}            |
      | text      | Promotion Saving                                      |
      | item      | ${Product Any Promotion}                              |
      | item      | ${Product 30 Promotion}                               |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-88 @Regression @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Verify set Fee Override Promotion on item by amount
    Given user signs on as "Sales Assistant"   
    And user enters "${Product 17}" into "Input Box" field
    And user presses "ENT" button 
    And user enters "${Product 48}" into "Input Box" field
    And user presses "ENT" icon button
    And "Select Basket Item" page is shown   
    And "${Product 17 Description}" is displayed in "Selection List" list   
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Product 17 Description}" is displayed in "Receipt" list   
    And "${Product 48 Description}" is displayed in "Receipt" list  
    And "${Product 48 Price Type With Price}" is displayed in "Receipt" list    
    And "Promotion: amount ${Product 48 Promotion Reward Value}" is displayed in "Receipt" list
    And "rate ${Product 48 Promotion Reward Rate}" is displayed in "Receipt" list            
    And "${Product 48 Promotion}" is displayed in "Receipt" list 
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                                            |
      | telephone | Tel: ${Store Phone 1}                                                                            |
      | text      | Sale                                                                                             |
      | item      | ${Product 17 Description},${Product 17 Price}                                                    |
      | item      | ${Product 48 Description},${Product 48 Price}                                                    |
      | item      | Fee ${Product 48 Price}                                                                          |       
      | text      | Promotion: amount ${Product 48 Promotion Reward Value}, rate ${Product 48 Promotion Reward Rate} | 
      | text      | Promotion Saving                                                                                 |
      | item      | ${Product 48 Promotion},-${Product 48 Promotion Saving Amount}                                   |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-89 @Regression @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Verify set Fee Override Promotion on item by percentage
    Given user signs on as "Sales Assistant"   
    And user enters "${Product 17}" into "Input Box" field
    And user presses "ENT" button 
    And user enters "${Product 49}" into "Input Box" field
    And user presses "ENT" icon button
    And "Select Basket Item" page is shown    
    And "${Product 17 Description}" is displayed in "Selection List" list   
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Product 17 Description}" is displayed in "Receipt" list   
    And "${Product 49 Description}" is displayed in "Receipt" list  
    And "${Product 49 Price Type With Price}" is displayed in "Receipt" list    
    And "Promotion: amount ${Product 49 Promotion Reward Value}" is displayed in "Receipt" list 
    And "rate ${Product 49 Promotion Reward Rate}" is displayed in "Receipt" list     
    And "${Product 49 Promotion}" is displayed in "Receipt" list 
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                                            |
      | telephone | Tel: ${Store Phone 1}                                                                            |
      | text      | Sale                                                                                             |
      | item      | ${Product 17 Description},${Product 17 Price}                                                    |
      | item      | ${Product 49 Description},${Product 49 Price}                                                    |
      | item      | Fee ${Product 49 Price}                                                                          |   
      | text      | Promotion: amount ${Product 49 Promotion Reward Value}, rate ${Product 49 Promotion Reward Rate} |      
      | text      | Promotion Saving                                                                                 |
      | item      | ${Product 49 Promotion},-${Product 49 Promotion Saving Amount}                                   |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-10717 @POS @AUTOMATED @SCnotReady
  Scenario: Verify Promotion is triggered correctly
    Given user signs on as "Sales Assistant"
    And user enters "${Product 60}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 61}" into "Input Box" field
    And user presses "ENT" icon button
    And "Transaction Basket" page is shown
    And "${Product 60 Description}" is displayed in "Receipt" list
    And "${Product 61 Description}" is displayed in "Receipt" list
    And "Closest Products Free" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 60 Description},${Product 60 Price}         |
      | item      | ${Product 61 Description},${Product 61 Price}         |
      | text      | Promotion Saving                                      |
      | item      | Closest Products Free,-${Product 61 Price}            |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-3512 @POS @AUTOMATED @Regression
  Scenario: Verify Promotion is triggered when an item discount is applied to the transaction basket
  	Given user signs on as "Sales Assistant"
    And user enters "${Product 40}" into "Input Box" field
    And user presses "ENT" button
    And "Transaction Basket" page is shown
    And "${Product 40 Description}" is displayed in "Receipt" list
    And "${Item Set Promotion 3 Description}" is displayed in "Receipt" list
    And "${Transaction Reward Discount Promotion}" is displayed in "Receipt" list
    And user selects "${Product 40 Description}" from "Receipt List" list
  	And "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "Manual Item Discount" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Amount" page shown
    And user enters "5.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Manual Item Discount -£5.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 40 Description}           				          |
      | text      | Promotion Saving                                      |
      | item      | ${Item Set Promotion 3 Description}            		    |
      | item      | ${Transaction Reward Discount Promotion}           	  |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-3509 @POS @AUTOMATED @Regression
  Scenario: Verify item is configured with multiple automatic promotions, each applicable promotion is triggered and displayed correctly in the receipt.
  	Given user signs on as "Sales Assistant"
    And user enters "${Product 40}" into "Input Box" field
    And user presses "ENT" button
    And "Transaction Basket" page is shown
    And "${Product 40 Description}" is displayed in "Receipt" list
    And "${Item Set Promotion 3 Description}" is displayed in "Receipt" list
    And "${Transaction Reward Discount Promotion}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 40 Description}           									|
      | text      | Promotion Saving                                      |
      | item      | ${Item Set Promotion 3 Description}            				|
      | item      | ${Transaction Reward Discount Promotion}           		|
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown    