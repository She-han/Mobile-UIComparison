Feature: Promotion Transaction

  @PT-6437 @Promotions @POS @AUTOMATED
  Scenario: Verifying doing a transaction for a product with a promotion after selecting Loyalty
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    And user presses "Capture Loyalty" button
    And "Loyalty Account Enquiry" page is shown
    And user enters "${CUSTOMER_1_LOYALTY_NO}" into "Input Box" field
    When user presses "OK" button
    Then "Loyalty Account Details" page is shown
    And "Customer Loyalty Details Forname" field displays the text "${LOYALTY_CARD_NUMBER_1_FORNAME}"
    And "Customer Loyalty Details Surname" field displays the text "${LOYALTY_CARD_NUMBER_1_SURNAME}"
    And "Customer Loyalty Details Address Line1" field displays the text "${CUSTOMER_1_ADDRESS_LINE1}"
    And "Customer Loyalty Details Address Line2" field displays the text "${CUSTOMER_1_ADDRESS_LINE2}"
    And "Customer Loyalty Details Postcode" field displays the text "${CUSTOMER_1_ADDRESS_POSTCODE}"
    And "Customer Loyalty Details Account Number" field displays the text "${LOYALTY_CARD_NUMBER_1_ACCOUNT_NUMBER}"
    And "Customer Loyalty Details Account Status" field displays the text "${LOYALTY_CARD_NUMBER_1_ACCOUNT_STATUS}"
    And "Customer Loyalty Details Loyalty Scheme" field displays the text "${LOYALTY_CARD_NUMBER_1_LOYALTY_SCHEME}"
    And "Customer Loyalty Details Loyalty Tier" field displays the text "${LOYALTY_CARD_NUMBER_1_LOYALTY_TIER}"
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user enters "1" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-6454 @Promotions @POS @AUTOMATED
  Scenario: Verifying doing a transaction for a product with a promotion after selecting Capture Loyalty: Search By Name
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    And user presses "Capture Loyalty" button
    And "Loyalty Account Enquiry" page is shown
    And user presses "Search By Name" button
    And "Loyalty customer Search By Name" page is shown
    And user enters "${LOYALTY_CARD_NUMBER_1_FORNAME}" into "Input Box" field
    When user presses "OK" button
    Then "Loyalty Account Details" page is shown
    And "Customer Loyalty Details Forname" field displays the text "${LOYALTY_CARD_NUMBER_1_FORNAME}"
    And "Customer Loyalty Details Surname" field displays the text "${LOYALTY_CARD_NUMBER_1_SURNAME}"
    And "Customer Loyalty Details Address Line1" field displays the text "${CUSTOMER_1_ADDRESS_LINE1}"
    And "Customer Loyalty Details Address Line2" field displays the text "${CUSTOMER_1_ADDRESS_LINE2}"
    And "Customer Loyalty Details Postcode" field displays the text "${CUSTOMER_1_ADDRESS_POSTCODE}"
    And "Customer Loyalty Details Account Number" field displays the text "${LOYALTY_CARD_NUMBER_1_ACCOUNT_NUMBER}"
    And "Customer Loyalty Details Account Status" field displays the text "${LOYALTY_CARD_NUMBER_1_ACCOUNT_STATUS}"
    And "Customer Loyalty Details Loyalty Scheme" field displays the text "${LOYALTY_CARD_NUMBER_1_LOYALTY_SCHEME}"
    And "Customer Loyalty Details Loyalty Tier" field displays the text "${LOYALTY_CARD_NUMBER_1_LOYALTY_TIER}"
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user enters "1" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-11580 @Promotions @POS @AUTOMATED
  Scenario: Verify 'Maximum Reward Saving' is properly applied
    Given user signs on as "Sales Assistant"
    When user enters "${Product 9}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 9 Description}" is displayed in "Receipt" list    
    And user enters "${Sku Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Sku Product 2 Description}" is displayed in "Receipt" list    
    And "20% Transaction Reward for £300" is displayed in "Receipt" list   
    Then "-£60.00" is displayed in "Receipt" list
    When user enters "${Product 31}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 31 Description}" is displayed in "Receipt" list       
    And "20% Transaction Reward for £300" is displayed in "Receipt" list   
    Then "-£77.60" is displayed in "Receipt" list    
    When user enters "${Sku Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Sku Product 2 Description}" is displayed in "Receipt" list    
    And "20% Transaction Reward for £300" is displayed in "Receipt" list      
    Then "-£80.00" is displayed in "Receipt" list      
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details    
      | item      | ${Product 9 Description},${Product 9 Price}                        |
      | item      | ${Sku Product 2 Description},${Sku Product 2 Price}                |      
      | item      | ${Product 31 Description},${Product 31 Price}                      |      
      | item      | ${Sku Product 2 Description},${Sku Product 2 Price}                |       
      | text      | Promotion Saving                                                   |
      | text      | 20% Transaction Reward for £300    -£80.00                  		   |    
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown 
    
  @PT-17045 @Promotions @POS @AUTOMATED @ToBeFixedAutTest
  Scenario: Verify that Promotions are triggered at tender selection when a required tender is configured
    Given "Enter User" page is shown
    When user enters "${Sales Assistant US Username}" into "User Name Text" field
    And user enters "${Sales Assistant US Password}" into "Password Text" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown    
    And user enters "${Offer Price Product}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Foreign Currencies" button and "Select Tender" page shown
    And user presses "SEK" button and "Promotion Confirm Screen" page shown
    And user presses "OK" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
	@PT-69 @Promotions @POS @Regression
	Scenario: Verify Gift Card Promotion is applied and shown in the receipt when the transaction is performed by an eligible employee
	Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "${Employee Sale Reason}" from "Selection List" list
    And user presses "OK" button and "Enter Employee" page shown
    And user enters "${Employee 4 Id}" into "Input Box" field
    And user presses "OK" button and "Confirm Employee" page shown
    And "Employee Id" field displays the text "${Employee 4 ID}"
    And "Employee Name" field displays the text "${Employee 4 Name}"
    And user presses "OK" button and "Transaction Basket" page shown
    And "Employee Transaction" is displayed in "Receipt" list
    And "Employee Number 4" is displayed in "Receipt" list
    And "${Employee 4 Name}" is displayed in "Receipt" list
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button    
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user selects "${Product 2 Description}" from "Receipt List" list
    And "Modify Item" page is shown
    And user presses "Change Quantity" button 
    And "Enter Quantity" page is shown
    And user enters "30" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Gift Card Transaction Promotion}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Emp Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card Number 1}" into "Input Box" field
    And user presses "OK" button and "Await Drawer Closed" page shown   
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 2 Description}           										|
      | text      | Promotion Saving                                      |
      | item      | ${Gift Card Transaction Promotion}            				|
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-23347 @Promotions @POS @AUTOMATED
  Scenario: Verify Operator Acknowledgement for Triggered Promotion Alert
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    And user presses "Rich Product Search" button
    Then "Rich Product Search" page is shown
    And user enters "${Product 23347 Description}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    When "Rich Product Search Result" page is shown
    Then "Product Search Results Input" field displays the text "${Product 23347 Description}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    When user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Product 23347 Description}"
    And user presses "ADD TO BAG" button
    And "Transaction Basket" page is shown
    When user presses "Sales" button
    And user presses "Rich Product Search" button
    Then "Rich Product Search" page is shown
    And user enters "${Product 23347 Description}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    When "Rich Product Search Result" page is shown
    Then "Product Search Results Input" field displays the text "${Product 23347 Description}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    When user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Product 23347 Description}"
    And user presses "ADD TO BAG" button
    And "Transaction Basket" page is shown
    And "${Product 23347 Description}" is displayed in "Receipt" list    
    And "13% Discount" is displayed in "Receipt" list       
    When user presses "TOTAL" button and "Promotion Acknowledgement Alert" page shown 
    Then user presses "Continue Ack" icon button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown 
    
  @PT-23346 @Promotions @POS @AUTOMATED @Regression
  Scenario: Verify "Alert Operator When Nearly Triggered" functionality
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    And user presses "Rich Product Search" button
    Then "Rich Product Search" page is shown
    When user enters "${Product 23347 Description}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Product 23347 Description}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    When user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Product 23347 Description}"
    And user presses "ADD TO BAG" button
    And "Transaction Basket" page is shown
    And "${Product 23347 Description}" is displayed in "Receipt" list    
    And "*13% Discount* has nearly triggered!" is displayed in "Receipt" list       
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-22912 @Promotions @POS @AUTOMATED @Regression
  Scenario: Verify whether the user can manually activate an Transaction promotion when the 'Manual Activation Required' flag is enabled in the promotion config
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    And user presses "Rich Product Search" button
    Then "Rich Product Search" page is shown
    And user enters "${Product 22912 Description}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    When "Rich Product Search Result" page is shown
    Then "Product Search Results Input" field displays the text "${Product 22912 Description}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    When user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Product 22912 Description}"
    And user presses "ADD TO BAG" button
    And "Transaction Basket" page is shown
    When user presses "Sales" button
    And user presses "Rich Product Search" button
    Then "Rich Product Search" page is shown
    And user enters "${Product 22912 Description}" into "Product Search Input" field
    When user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Product 22912 Description}"
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    When user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Product 22912 Description}"
    And user presses "ADD TO BAG" button
    And "Transaction Basket" page is shown
    And "${Product 22912 Description}" is displayed in "Receipt" list
    When user presses "Sales" button
    And  user presses "More" button 
    And user presses "Promotions" button
    Then user presses "Enable Promotion" button and "Select Reason" page shown
    And user selects "Enable Promotion ManualActive Trans 10" from "Selection List" list
    When user presses "OK" button and "Transaction Basket" page shown
    Then "ManualActive Trans 10%" is displayed in "Receipt" list       
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-22911 @Promotions @POS @AUTOMATED @Regression
  Scenario: Verify whether the Spend X Get Y type transaction promotion is triggered
    When user signs on as "POS Operator"
    And user presses "Sales" button and "Sell Unknown Product" page shown
    Then user presses "QTY Sale" button and "Enter Qty" page shown
    And user enters "40" into "Input Box" field
    When user presses "ENT" button and "Enter Item" page shown
    Then user enters "${Product 22912}" into "Input Box" field
    And user presses "Sell Item" button and "Transaction Basket" page shown
    And "${Product 22912 Description}" is displayed in "Receipt List" list
    And "22911 Spend X Get Y" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-14179 @Promotions @POS @AUTOMATED @Regression
  Scenario: Verify whether the applied promotion gets recalculated for the best offer when there are any multiple promotions in the basket
    Given user signs on as "Sales Assistant"
    And user enters "${Product 14179}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 14179 Description}" is displayed in "Receipt" list
    When user enters "${Product 14179}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 14179 Description}" is displayed in "Receipt" list
    Then "20% off for 100" is displayed in "Receipt" list
    And user enters "${Product 14179}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 14179 Description}" is displayed in "Receipt" list
    And "3 for 2 promotion 14179" is displayed in "Receipt" list
    And "20% off for 100" is not displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-10094 @Promotions @POS @AUTOMATED @Regression
  Scenario: Verify when the basket has items with both overlapping promotions and non-overlapping promotions
    Given user signs on as "Sales Assistant"
    When user enters "${Merchandise Product 10094}" into "Input Box" field
    And user presses "ENT" button
    And "${Merchandise Product 10094 Description}" is displayed in "Receipt" list
    Then "24% Discount 10094" is displayed in "Receipt" list
    And "17% Discount 10094" is displayed in "Receipt" list
    When user enters "${Merchandise Product 10094 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Merchandise Product 10094 2 Description}" is displayed in "Receipt" list
    Then "20% off for 100" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details    
      | item      | ${Merchandise Product 10094 Description},${Merchandise Product 10094 Price}                        |
      | text      | 24% Discount 10094                  		                           |
      | text      | 17% Discount 10094                  		                           |
      | item      | ${Merchandise Product 10094 2 Description},${Merchandise Product 10094 2 Price}                    |
      | text      | 20% off for 100                  		                               |
      | text      | Promotion Saving                                                   |
      | text      | 20% off for 100                        -£24.80                     |
      | text      | 24% Discount 10094                     -£17.76                     |
      | text      | 17% Discount 10094                     -£12.58                     |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-10093 @Promotions @POS @AUTOMATED @Regression
  Scenario: Verify that when there are no Overlapping Groups and Overlapping Promotions the best deal should apply in POS
    Given user signs on as "Sales Assistant"
    When user enters "${Merchandise Product 10094 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Merchandise Product 10094 2 Description}" is displayed in "Receipt" list
    Then "20% off for 100" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details    
      | item      | ${Merchandise Product 10094 2 Description},${Merchandise Product 10094 2 Price}                    |
      | text      | 20% off for 100                  		                               |
      | text      | Promotion Saving                                                   |
      | text      | 20% off for 100                        -£24.80                     |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-10092 @Promotions @POS @AUTOMATED @Regression
  Scenario: verify that all promotions overlapping each other are shown for the total discount of the transaction
    Given user signs on as "Sales Assistant"
    When user enters "${Merchandise Product 10094}" into "Input Box" field
    And user presses "ENT" button
    And "${Merchandise Product 10094 Description}" is displayed in "Receipt" list
    Then "24% Discount 10094" is displayed in "Receipt" list
    And "17% Discount 10094" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details    
      | item      | ${Merchandise Product 10094 Description},${Merchandise Product 10094 Price}                        |
      | text      | 24% Discount 10094                  		                           |
      | text      | 17% Discount 10094                  		                           |
      | text      | Promotion Saving                                                   |
      | text      | 24% Discount 10094                     -£17.76                     |
      | text      | 17% Discount 10094                     -£12.58                     |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-8663 @Promotions @POS @AUTOMATED @Regression
  Scenario: Verify defined Gift Card Type for Transaction Promotions in EM is displayed in POS when making a sale
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "QTY Sale" button and "Enter Qty" page shown
    And user enters "60" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    When user enters "${Merchandise Product 22692}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Merchandise Product 22692 Description}" is displayed in "Receipt" list
    Then "Gift Card Promotion 8662: GIFT_CARD_PROMO_8662" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Get Gift Card Number" page shown
    And user enters "9526300500192837480" into "Input Box" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-11364 @Promotions @POS @AUTOMATED @Regression
  Scenario: Verifying promotions are overlapping when promotion groups overlap
    Given user signs on as "Sales Assistant"
    When user enters "${Merchandise Product 10094}" into "Input Box" field
    And user presses "ENT" button
    And "${Merchandise Product 10094 Description}" is displayed in "Receipt" list
    Then "24% Discount 10094" is displayed in "Receipt" list
    And "17% Discount 10094" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details    
      | item      | ${Merchandise Product 10094 Description},${Merchandise Product 10094 Price}                        |
      | text      | 24% Discount 10094                  		                           |
      | text      | 17% Discount 10094                  		                           |
      | text      | Promotion Saving                                                   |
      | text      | 24% Discount 10094                     -£17.76                     |
      | text      | 17% Discount 10094                     -£12.58                     |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
