Feature: Item Set Reward Promotions

  @PT-10716 @POS @AUTOMATED
  Scenario: Verify Cheapest Products Free Promotion is triggered correctly
    Given user signs on as "Sales Assistant"
    And user enters "${Product 68}" into "Input Box" field
    And user presses "ENT" button
    When user enters "${Product 69}" into "Input Box" field
    And user presses "ENT" button
    # Verify promotion is added to the basket
    And "Test promo for Cheapest Free" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Promotion Saving                     |
      | item | Test promo for Cheapest Free,-£18.00 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-11638 @POS @AUTOMATED
  Scenario: Verify Alert Operator when Nearly Triggered option
    Given user signs on as "Sales Assistant"
    And user enters "${Product 65}" into "Input Box" field
    And user presses "ENT" button
    # Verify promotion is added to the basket
    And "*Test promo for Alert Operator* has nearly triggered!" is displayed in "Receipt" list
    When user enters "${Product 66}" into "Input Box" field
    And user presses "ENT" button
    And "Test promo for Alert Operator" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Promotion Saving                     |
      | item | Test promo for Alert Operator,-£7.20 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-9281 @POS @AUTOMATED
  Scenario: Verify Mixed bag of a promotion and a manual promotion is triggered correctly
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    # Verify promotion is added to the basket
    And "£3 off of KAT VON D Eye Liner" is displayed in "Receipt" list
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button
	And user presses "More" button
	And user presses "Promotions" button
    And user presses "Enable Promotion" button and "Select reason" page shown
    Then user selects "£5 Manual Activation Promotion" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "£5 Manual Activation Promo" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Promotion Saving                  |
      | item | £5 Manual Activation Promo,-£5.00 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-10721 @POS @AUTOMATED
  Scenario: Verify Fixed Price by Item Promotion is triggered correctly
    Given user signs on as "Sales Assistant"
    And user enters "${Product 62}" into "Input Box" field
    And user presses "ENT" button
    When user enters "${Product 63}" into "Input Box" field
    And user presses "ENT" button
    # Verify promotion is not added to the basket
    And "Test promotion for Fixed Price by Item" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Promotion Saving                        |
      | item | Test promotion for Fixed Price,-£10.00  |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-10719 @POS @AUTOMATED
  Scenario: Verify Closest Products Promotion is triggered correctly
    Given user signs on as "Sales Assistant"
    And user enters "${Product 89}" into "Input Box" field
    And user presses "ENT" button
    When user enters "${Product 90}" into "Input Box" field
    And user presses "ENT" button
    # Verify promotion is added to the basket
    And "Test promo for Closest Products" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Product 89 Description},${Product 89 Price} |
      | item | ${Product 90 Description},${Product 90 Price} |
      | text | Promotion Saving                              |
      | item | Test promo for Closest Products,-£0.05        |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-10718 @POS @AUTOMATED
  Scenario: Verify Cheapest Products Promotion is triggered correctly
    Given user signs on as "Sales Assistant"
    And user enters "${Product 86}" into "Input Box" field
    And user presses "ENT" button
    When user enters "${Product 87}" into "Input Box" field
    And user presses "ENT" button
    # Verify promotion is added to the basket
    And "Test promo for cheapest products" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Product 86 Description},${Product 86 Price} |
      | item | ${Product 87 Description},${Product 87 Price} |
      | text | Promotion Saving                              |
      | item | Test promo for cheapest products,-£0.60       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-73 @ItemSetRewardPromotion @POS @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Item Set percent promotion for specific product set
    Given user signs on as "Sales Assistant"
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    # Verify promotion is not added to the basket
    And "${Item Set Promotion 1 Description}" is not displayed in "Receipt" list
    When user enters "${Product 7}" into "Input Box" field
    And user presses "ENT" button
    # Verify promotion is  added to the basket
    Then "${Item Set Promotion 1 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      #TODO: Fix regular expression to handle receipt text verification
      #| item | ${Product 7 Description},${Product 7 Price},${Item Set Promotion 1 Description} |
      | text | Promotion Saving                            |
      | item | ${Item Set Promotion 1 Description},-£11.50 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-75 @ItemSetRewardPromotion @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Item Set Fixed Price promotion for specific MM Group
    Given user signs on as "Sales Assistant"
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    # Verify promotion is not added to the basket
    And "${Item Set Promotion 2 Description}" is not displayed in "Receipt" list
    When user enters "${Product 8}" into "Input Box" field
    And user presses "ENT" button
    # Verify promotion is  added to the basket
    Then "${Item Set Promotion 2 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Product 8 Description},${Product 8 Price} |
      | text | Promotion Saving                            |
      | item | ${Item Set Promotion 2 Description},-£3.00  |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-76 @ItemSetRewardPromotion @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Item Set amount discount promotion for all specific price type products after threshold limit
    Given user signs on as "Sales Assistant"
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    # Total is below threshold limit. Verify promotion is not added
    And "${Item Set Promotion 3 Description}" is not displayed in "Receipt" list
    When user enters "${Product 9}" into "Input Box" field
    And user presses "ENT" button
    # Total is above threshold limit. Verify promotion is  added to each item (£5 x # of items)
    Then "${Item Set Promotion 3 Description}" is displayed in "Receipt" list
    And "-£5.00" is displayed in "Receipt" list
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Item Set Promotion 3 Description}" is displayed in "Receipt" list
    And "-£5.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Product 3 Description},${Product 3 Price} |
      | item | ${Product 9 Description},${Product 9 Price} |
      | item | ${Product 2 Description},${Product 2 Price} |
      | text | Promotion Saving                            |
      | item | ${Item Set Promotion 3 Description},-£5.00  |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-81 @ItemSetRewardPromotion @AUTOMATED
  Scenario: Item Set Spend X Get Y discount promotion for all items above the threshold limit
    Given user signs on as "Sales Assistant"
    And user enters "${Product 32}" into "Input Box" field
    And user presses "ENT" button
    # Total is below threshold limit. Verify promotion is not added
    And "${Item Set Promotion 4 Description}" is not displayed in "Receipt" list
    When user enters "${Product 33}" into "Input Box" field
    And user presses "ENT" button
    # Verify promotion is  added to each item
    Then "${Item Set Promotion 4 Description}" is displayed in "Receipt" list
    And "-£1.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Product 32 Description},${Product 32 Price}                                     |
      | item | ${Product 33 Description},${Product 33 Price},${Item Set Promotion 4 Description} |
      | text | Promotion Saving                                                                  |
      | item | ${Item Set Promotion 4 Description},-£1.00                                        |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-83 @ItemSetRewardPromotion @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Check promotion coupon prints when a product sells
    Given user signs on as "Sales Assistant"
    And user enters "${Product 11}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 11 Description}" is displayed in "Receipt" list
    And "${Product 11 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Sale                                          |
      | item | ${Product 11 Description},${Product 11 Price} |
      | text | Promotion Coupon                              |
      | text | ${Item Set Promotion 5 Description}           |
      | text | ${Promotion Coupon Product 1}                 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-85 @ItemSetRewardPromotion @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Promotion - Issue Gift Voucher when purchasing specific products
    Given user signs on as "Sales Assistant"
    And user enters "${Product 12}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 12 Description}" is displayed in "Receipt" list
    And "${Product 12 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Select Voucher Sub Type" page shown
    Then user selects "£5" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "Gift Voucher UK" is displayed in "Receipt" list
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And receipt display with following details
      | text | Sale                                          |
      | item | ${Product 12 Description},${Product 12 Price} |
      | text | Gift Voucher UK                               |
      | item | Issue Date :,#{today}                         |
      | text | Serial No. :                                  |
      | text | Value :                                       |
      | text | £5.00                                         |
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-86 @ItemSetRewardPromotion @POS @AUTOMATED @MVP_DE @POSValidatedTest @POSSet4
  Scenario: Promotion - Additional loyalty points are added when muliti purchasing specific products
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter QTY" page is shown
    When user enters "4" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "${Product 13}" into "Input Box" field
    And user presses "Sell Item" button and "Transaction Basket" page shown
    And "${Product 13 Description}" is displayed in "Receipt" list
    And "4 @ ${Product 13 Price}" is displayed in "Receipt" list
    Then user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Sale                                              |
      | item | ${Product 13 Description},4 @ ${Product 12 Price} |
      | text | Promotion Saving                                  |
      | item | ${Item Set Promotion 6 Description},2             |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-72 @Price @Regression @Support @POS @AUTOMATED
  Scenario: Item Set Value Discount on 10th item onward in the basket
    Given user signs on as "Sales Assistant"
    And user enters "${Product 19}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 20}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 19}" into "input Box" field
    And user presses "ENT" button
    And user enters "${Product 20}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 19}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 20}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 19}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 20}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 19}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 20}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 19}" into "Input Box" field
    When user presses "ENT" button
    And "${Item Set Promotion 10 Description}" is displayed in "Receipt" list
    Then user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Sale                                          |
      | item | ${Product 19 Description},${Product 19 Price} |
      | item | ${Product 20 Description},${Product 20 Price} |
      | text | Promotion Saving                              |
      | item | ${Item Set Promotion 10 Description},-£1.25   |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-338 @ToBeFixedAutTest @MVP @Mobile @Smoke @AUTOMATED @POS @POSValidatedTest @POSSet4
  Scenario: Item Set Percentage Discount Promotion for Loyalty Member
    Given user signs on as "Pos Operator"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    When user presses "Capture Loyalty" button and "Loyalty Account Enquiry" page shown
    And user presses "More" button
    And user presses "Search By Postcode" button
    Then "Loyalty Customer Search Bypostcode" page is shown
    And user enters "${Loyalty Card Number 1 Postcode}" into "Input Box" field
    And user presses "OK" button
    And "Loyalty Select Customer Search By Postcode" page is shown
    And user selects "${Loyalty Card Number 1 name}" from "Selection List" list
    And user presses "OK" button
    And "Loyalty Account Details" page is shown
    And "Customer Loyalty Details Forname" field displays the text "${Loyalty Card Number 1 Forname}"
    And "Customer Loyalty Details Surname" field displays the text "${Loyalty Card Number 1 Surname}"
    And "Customer Loyalty Details Account Number" field displays the text "${Loyalty Card Number 1 Account Number}"
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And "Loyalty Account: ${Loyalty Card Number 1 Account Number}" is displayed in "Receipt" list
    And "Customer: ${Loyalty card number 1 full name}" is displayed in "Receipt" list
    And "Address: 1 Enactor House Bluecoats Avenue Hertford SG141PB" is displayed in "Receipt" list
    And "Loyalty Points Earned ${Loyalty card number 1 transaction points earned}" is displayed in "Receipt" list
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 2 Description}" is displayed in "Receipt" list
    And "${Item Set Promotion 8 Description}" is displayed in "Receipt" list
    And "-£1.50" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text    | Sale                                                                        |
      | item    | Customer:,${Loyalty Card Number 1 Forname},${Loyalty Card Number 1 Surname} |
      | address | Bluecoats Avenue,Hertford,SG141PB                                           |
      | item    | ${Product 2 Description},${Product 2 Price}                                 |
      | text    | Promotion Saving                                                            |
      | item    | ${Item Set Promotion 8 Description},-£1.50                                  |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-78 @MVP_DE @Regression @AUTOMATED @POS @POSValidatedTest @POSSet4
  Scenario: Item Set Free Product (cheapest) - trigger on any item, exclude products groups
    Given user signs on as "Pos Operator"
    When user enters "${Product 19}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 20}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 31}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 32}" into "Input Box" field
    And user presses "ENT" button
    # Verify promotion is not added to the basket
    Then "${Item Set Promotion 9 Description}" is not displayed in "Receipt" list
    When user enters "${Product 33}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" icon button
    And user enters "${Product 34}" into "Input Box" field
    And user presses "ENT" icon button
    # Verify promotion is added to the basket
    Then "${Item Set Promotion 9 Description}" is displayed in "Receipt" list
    And "-${SKU Product 6 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Sale                                                        |
      | item | ${Product 19 Description},${Product 19 Price}               |
      | item | ${Product 20 Description},${Product 20 Price}               |
      | item | ${Product 3 Description},${Product 3 Price}                 |
      | item | ${Product 31 Description},${Product 31 Price}               |
      | item | ${Product 32 Description},${Product 32 Price}               |
      | item | ${Product 33 Description},${Product 33 Price}               |
      | item | ${SKU Product 6 Description},${SKU Product 6 Price}         |
      | item | ${Product 34 Description},${Product 34 Price}               |
      | text | Promotion Saving                                            |
      | item | ${Item Set Promotion 9 Description},-${SKU Product 6 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-80 @AUTOMATED @POS @POSValidatedTest @POSSet2
  Scenario: Item Set Free Product (dearest) - trigger on any item, exclude MM Groups
    Given user signs on as "Pos Operator"
    When user enters "${Product 31}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 34}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 19}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 20}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button
    # Verify promotion is not added to the basket
    Then "${Item Set Promotion 10 Description}" is not displayed in "Receipt" list
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Style Size Product 1 Size 2 SKU}" into "Input Box" field
    And "Empty Basket" page is shown
    And user presses "ENT" button
    # Verify promotion is added to the basket
    Then "${Item Set Promotion 10 Description}" is displayed in "Receipt" list
    And "-${SKU Product 6 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Sale                                                              |
      | item | ${Product 31 Description},${Product 31 Price}                     |
      | item | ${Product 34 Description},${Product 34 Price}                     |
      | item | ${Product 19 Description},${Product 19 Price}                     |
      | item | ${Product 20 Description},${Product 20 Price}                     |
      | item | ${Product 3 Description},${Product 3 Price}                       |
      | item | ${SKU Product 6 Description},${SKU Product 6 Price}               |
      | item | ${Product 2 Description},${Product 2 Price}                       |
      | item | ${Style Size Product 1 Description},${Style Size Product 1 Price} |
      | text | Promotion Saving                                                  |
      | item | ${Item Set Promotion 10 Description},-${SKU Product 6 Price}      |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
