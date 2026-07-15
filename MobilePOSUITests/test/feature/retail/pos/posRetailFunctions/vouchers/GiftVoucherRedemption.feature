Feature: Gift voucher redemption

  @PT-1285 @AUTOMATED @GiftVoucherRedemption_GiftVoucherEqualToTransactionAmount @GiftVoucherRedemption @POS @POSValidatedTest @POSSet3
  Scenario: Perform a sale transaction and tender with gift voucher equal to transaction amount.
    Given user signs on as "Sales Assistant"
    When user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Voucher" button and "Select Redeem Voucher" page shown
    And user presses "Select Voucher" button and "Select Redeem Voucher Type" page shown
    When user selects "${Gift Voucher Number 5 Type}" from "Selection List" list
    And user presses "OK" button and "Select Redeem Voucher Sub Type" page shown
    And user selects "£10" from "Selection List" list
    And user presses "OK" button and "Enter Voucher Serial Number" page shown
    When user enters "${Gift Voucher Number 5}" into "Input Box" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then "-£10.00" is displayed in "Receipt" list
    And "${Product 3 Description}" is displayed in "Receipt" list
    And "Redeem Gift Voucher Test UK" is displayed in "Receipt" list
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | item      | ${Gift Voucher Number 5 Type},-£10.00                 |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-6 @AUTOMATED @MVP @Mobile @GiftVoucherRedemption_GiftVoucherLessThanTransactionAmount @GiftVoucherRedemption @POS @Smoke @POSValidatedTest @POSSet4
  Scenario: Perform a sale transaction and tender with gift voucher with value less than transaction amount and tender balance with cash
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Voucher" button and "Select Redeem Voucher" page shown
    And user presses "Select Voucher" button and "Select Redeem Voucher Type" page shown
    When user selects "Gift Voucher Test UK" from "Selection List" list
    And user presses "OK" button and "Select Redeem Voucher Sub Type" page shown
    And user selects "£15" from "Selection List" list
    And user presses "OK" button and "Enter Voucher Serial Number" page shown
    When user enters "${Gift Voucher Number 2}" into "Input Box" field
    And user presses "OK" button and "Select Redeem Voucher" page shown
    And user presses "Back" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "Redeem Gift Voucher Test UK" is displayed in "Receipt" list
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-331 @AUTOMATED @MVP @Mobile @GiftVoucherRedemption_GiftVoucherGreaterThanTransactionAmount @GiftVoucherRedemption @POS @POSValidatedTest @POSSet3
  Scenario: Perform a sale transaction and tender with gift voucher with value more than transaction amount and return balance with cash
    Given user signs on as "Sales Assistant"
    When user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Voucher" button and "Select Redeem Voucher" page shown
    And user presses "Select Voucher" button and "Select Redeem Voucher Type" page shown
    When user selects "${Gift Voucher Number 3 Type}" from "Selection List" list
    And user presses "OK" button and "Select Redeem Voucher Sub Type" page shown
    And user selects "£15" from "Selection List" list
    And user presses "OK" button and "Enter Voucher Serial Number" page shown
    When user enters "${Gift Voucher Number 3}" into "Input Box" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    When "£5.00" is displayed in "Receipt" list
    And "${Product 3 Description}" is displayed in "Receipt" list
    And "Redeem Gift Voucher Test UK" is displayed in "Receipt" list
    And "Change (Cash UK)" is displayed in "Receipt" list
    And receipt display with following details
      | item | ${Product 3 Description},${Product 3 Price} |
      | item | ${Gift Voucher Number 3 Type},-£15.00       |
      | text | Change (Cash UK)                            |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-10844 @GiftCardRedemption @GiftCard @AUTOMATED @POS
  Scenario: Redeem voucher for a sale transaction by using 'Use Voucher' button 
    Given user signs on as "Sales Assistant"
    And user enters "${Product 10}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 10 Description}" is displayed in "Receipt" list 
    And user presses "Sales" button 
    And user presses "More" button
    And user presses "More" button
    And user presses "Use Voucher" button and "Enter Voucher Serial Number" page shown
    When user enters "${Gift Voucher Number 6}" into "Input Box" field
    And user presses "OK" button and "Enter Voucher Serial Number" page shown
    And user presses "Cancel" button and "Transaction Basket" page shown
    And "£25.00" is displayed in "Receipt" list
    And "${Product 10 Description}" is displayed in "Receipt" list
    And "Redeem £10 Pound off UK" is displayed in "Receipt" list
    And "£10 Pound off UK" is displayed in "Receipt" list
    Then "-£10.00" is displayed in "Receipt" list
    And "Serial: ${Gift Voucher Number 6}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown  
    And receipt display with following details
      | item | ${Product 10 Description},${Product 10 Price} | 
      | item | ${Gift Voucher Number 6 Type},-£10.00         | 
      | item | ${Gift Voucher Number 6}                      | 
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown  
    
  @PT-10499 @AUTOMATED @POS
  Scenario: Perform a sale transaction and tender with gift voucher with value more than transaction amount and return balance with cash
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Voucher" button and "Select Redeem Voucher" page shown
    Then user enters "${Gift Voucher Number 8}" into "Input Box" field
    When user presses "ENT" button
    Then "Minimum Spend Required" page is shown
    When user presses "OK" button
    Then "Select Tender" page is shown
    When user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown  

  @PT-12609 @AUTOMATED @GiftVoucherRedemption @SCnotReady
  Scenario: Verify whether a gift voucher can be used as a tender for React POS
    Given user signs on as "Sales Assistant"
    And user enters "${Product 10}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 10 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Voucher" button and "Select Redeem Voucher" page shown
    And user presses "Select Voucher" button and "Select Redeem Voucher Type" page shown
    Then user selects "Gift Voucher UK" from "Selection List" list
    And user presses "OK" button and "Select Redeem Voucher Sub Type" page shown
    And user selects "£5" from "Selection List" list
    And user presses "OK" button and "Enter Voucher Serial Number" page shown
    When user enters "${Gift Voucher Number 7}" into "Input Box" field
    And user presses "OK" button and "Select Redeem Voucher" page shown
    And "£5.00" is displayed in "Receipt" list
    And "${Product 10 Description}" is displayed in "Receipt" list
    And "Redeem Gift Voucher UK" is displayed in "Receipt" list
    And user presses "Back" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Product 10 Description},${Product 10 Price} |
      | item | ${Gift Voucher Number 7 Type},-£5.00          |
      | text | Serial: ${Gift Voucher Number 7}              |
    Then user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-8 @AUTOMATED @GiftVoucherVoid
  Scenario: Void Gift Voucher
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Gift Voucher" button and "Select Voucher Type" page shown
    When user selects "${Gift Voucher Number 7 Type}" from "Selection List" list
    Then user presses "OK" button
    And "Select Voucher Sub Type" page is shown
    And user selects "£5" from "Selection List" list
    And user presses "OK" button
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user enters "${Product 60}" into "Input Box" field
    When user presses "ENT" button and "Transaction Basket" page shown
    Then user selects "${Gift Voucher Number 7 Type}" from "Receipt List" list
    And "Modify Item" page is shown
    When user presses "Item Void" button and "Select Reason" page shown
    Then user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 60 Description},${Product 60 Price}         |
    And following details are not displayed on the receipt
      | text | ${Gift Voucher Number 7 Type} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-10500 @AUTOMATED @GiftVoucher
  Scenario: Verify whether the user should be able to redeem a voucher when Item Price is above the threshold value
    Given user signs on as "Manager 2"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Voucher" button
    And "Select Redeem Voucher" page is shown
    And user enters "${Gift Voucher Number Above 1}" into "Input Box" field
    And user presses "OK" button and "No Applicable Items" page shown
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Back" button
    Then "Transaction Basket" page is shown
    When user presses "Sales" button
    And user presses "Rich Product Search" button
    Then "Rich Product Search" page is shown
    When user enters "${Merchandise Product 1}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    Then "Rich Product Search Result" page is shown
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    When user presses "Product Search Result Item 1" icon button
    Then "Rich Product Details" page is shown
    When user presses "ADD TO BAG" button
    Then "Transaction Basket" page is shown
    And "${Merchandise Product 1 Description}" is displayed in "Receipt" list
    And "${Merchandise Product 1 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Voucher" button
    And "Select Redeem Voucher" page is shown
    And user enters "${Gift Voucher Number Above 1}" into "Input Box" field
    And user presses "OK" button
    And user presses "Back" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Tender Amount" page shown
    And user presses "OK" button
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}               |
      | telephone | Tel: ${Store Phone 1}                                               |
      | item      | ${Merchandise Product 1 Description},${Merchandise Product 1 Price} |
      | item      | ${Product 2 Description},${Product 2 Price}                         |
      | text      | Serial: ${Gift Voucher Number Above 1}                              |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-10510 @POSGiftVoucherRedemption @POS
  Scenario: Verify whether the user should be able to redeem a voucher multiple times the same transaction for different transaction items
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Voucher" button and "Select Redeem Voucher" page shown
    And user presses "Select Voucher" button and "Select Redeem Voucher Type" page shown
    Then user selects "${Gift Voucher Number 9 Type}" from "Selection List" list
    And user presses "OK" button and "Enter Voucher Serial Number" page shown
    When user enters "${Gift Voucher Number 9}" into "Input Box" field
    And user presses "OK" button and "Select Redeem Voucher" page shown
    When user enters "${Gift Voucher Number 9}" into "Input Box" field
    And user presses "OK" button and "Select Redeem Voucher" page shown
    When user enters "${Gift Voucher Number 9}" into "Input Box" field
    And user presses "OK" button and "Select Redeem Voucher" page shown
    When user enters "${Gift Voucher Number 9}" into "Input Box" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "Redeem £10 Off Voucher – Multiple Use" is displayed in "Receipt" list
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | text      | Serial: ${Gift Voucher Number 9}                      |
    Then user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-10502 @POSGiftVoucherRedemption @POS
  Scenario: Verify whether the user should be able to redeem a voucher when Item Price is less than the Item Price Below threshold value
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    When user presses "ENT" icon button
    And "Transaction Basket" page is shown
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 1 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Voucher" button
    And "Select Redeem Voucher" page is shown
    And user enters "${Gift Voucher Number Below 1}" into "Input Box" field
    And user presses "OK" button
    And user presses "Back" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-10504 @POSGiftVoucherRedemption @POS
  Scenario: Verify whether the user should be able to redeem the same voucher for different transactions within the usage amount limit
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    When user presses "ENT" icon button
    And "Transaction Basket" page is shown
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 1 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Voucher" button
    And "Select Redeem Voucher" page is shown
    And user enters "${Gift Voucher Number 6}" into "Input Box" field
    And user presses "OK" button
    And user presses "Back" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user enters "${Product 2}" into "Input Box" field
    When user presses "ENT" icon button
    And "Transaction Basket" page is shown
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "${Product 2 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Voucher" button
    And "Select Redeem Voucher" page is shown
    And user enters "${Gift Voucher Number 6}" into "Input Box" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-9976 @AUTOMATED @POS @Regression
  Scenario: Verify whether the user is able to tender using Voucher along with denominations values
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Voucher" button and "Select Redeem Voucher" page shown
    And user enters "${Gift Voucher Number With Denomination Value}" into "Input Box" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "Gift Voucher UK Denominations" is displayed in "Receipt" list
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-9977 @AUTOMATED @POS @Regression
  Scenario: Verify whether the user is able to tender using Voucher along with denominations values
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2020}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Voucher" button and "Select Redeem Voucher" page shown
    And user enters "${Gift Voucher Number With Transaction Discount}" into "Input Box" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "${Product 2020 Description}" is displayed in "Receipt" list
    And "Gift Voucher UK Trans Discount" is displayed in "Receipt" list
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-23087 @AUTOMATED @POS
  Scenario: Verify User Cannot Redeem Already Redeemed Vouchers
    Given user signs on as "Sales Assistant"
    And "Scanner" page is shown
    And user enters "${Product 116904}" into "Scan Text" field
    When user presses "Test Scanner Scan Button" icon button
    Then "Transaction Basket" page is shown
    And "${Product 116904 Description}" is displayed in "Receipt" list
    And "${Product 1169 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Voucher" button
    And "Select Redeem Voucher" page is shown
    And user presses "Select Voucher" button and "Select Redeem Voucher Type" page shown
    And user selects "${Monetary Voucher Overpayment Type}" from "Selection List" list
    And user presses "OK" button and "Enter Voucher Serial Number" page shown
    And user enters "${Redeemed Voucher Serial Number}" into "Input Box" field
    And user presses "OK" button and "Already Redeemed Voucher Popup" page shown
    And user presses "OK" button and "Enter Voucher Serial Number" page shown
    And user presses "Complete" button and "Select Tender" page shown  
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text      | Sale                                                                       |
      | item      | ${Product 116904 Description},${Product 1169 Price}   |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown 
    
  @PT-23088 @AUTOMATED @POS
  Scenario: Verify User Cannot Redeem Expired Vouchers
    Given user signs on as "Sales Assistant"
    And "Scanner" page is shown
    And user enters "${Product 116904}" into "Scan Text" field
    When user presses "Test Scanner Scan Button" icon button
    Then "Transaction Basket" page is shown
    And "${Product 116904 Description}" is displayed in "Receipt" list
    And "${Product 1169 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Voucher" button
    And "Select Redeem Voucher" page is shown
    And user enters "${Expired Voucher Serial Number}" into "Input Box" field
    And user presses "OK" button and "Expired Voucher Popup" page shown
    And user presses "OK" button and "Enter Voucher Serial Number" page shown
    And user presses "Complete" button and "Select Tender" page shown  
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text      | Sale                                                                       |
      | item      | ${Product 116904 Description},${Product 1169 Price}   |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-23089 @AUTOMATED @POS
  Scenario: Verify User Cannot Redeem Voided Vouchers
    Given user signs on as "Sales Assistant"
    And "Scanner" page is shown
    And user enters "${Product 116904}" into "Scan Text" field
    When user presses "Test Scanner Scan Button" icon button
    Then "Transaction Basket" page is shown
    And "${Product 116904 Description}" is displayed in "Receipt" list
    And "${Product 1169 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Voucher" button
    And "Select Redeem Voucher" page is shown
    And user enters "${Voided Voucher Serial Number}" into "Input Box" field
    And user presses "OK" button and "Voided Voucher Popup" page shown
    And user presses "OK" button and "Enter Voucher Serial Number" page shown
    And user presses "Complete" button and "Select Tender" page shown  
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text      | Sale                                                                       |
      | item      | ${Product 116904 Description},${Product 1169 Price}   |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-23090 @AUTOMATED @POS
  Scenario: POS – Attempt to Redeem a Voucher with a Future Start Date
    Given user signs on as "Sales Assistant"
    And "Scanner" page is shown
    And user enters "${Product 116904}" into "Scan Text" field
    When user presses "Test Scanner Scan Button" icon button
    Then "Transaction Basket" page is shown
    And "${Product 116904 Description}" is displayed in "Receipt" list
    And "${Product 1169 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Voucher" button
    And "Select Redeem Voucher" page is shown
    And user enters "${Future Voucher Serial Number}" into "Input Box" field
    And user presses "OK" button and "Future Voucher Popup" page shown
    And user presses "OK" button and "Enter Voucher Serial Number" page shown
    And user presses "Complete" button and "Select Tender" page shown  
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text      | Sale                                                                       |
      | item      | ${Product 116904 Description},${Product 1169 Price}   |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
     
  @PT-23091 @AUTOMATED @POS
  Scenario: Verify User Can Redeem the Serial Tracked Voucher
    Given user signs on as "Sales Assistant"
    And "Scanner" page is shown
    And user enters "${Product 116904}" into "Scan Text" field
    When user presses "Test Scanner Scan Button" icon button
    Then "Transaction Basket" page is shown
    And "${Product 116904 Description}" is displayed in "Receipt" list
    And "${Product 1169 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Voucher" button
    And "Select Redeem Voucher" page is shown
    And user enters "${Serial Tracked Voucher Serial Number}" into "Input Box" field
    And user presses "OK" button and "Get Tender Amount" page shown
    And user enters "${Product 1169 Price}" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And receipt display with following details
      | text      | Sale                                                                       |
      | item      | ${Product 116904 Description},${Product 1169 Price}   |
    When user presses "SignOff" button
    Then "Enter User" page is shown
     
  @PT-23108 @AUTOMATED @POS
  Scenario: Verify Remaining Balance is Assigned to Overpayment when configured through tender for Monetary Vouchers
    Given user signs on as "Sales Assistant"
    And "Scanner" page is shown
    And user enters "${Product 116904}" into "Scan Text" field
    When user presses "Test Scanner Scan Button" icon button
    Then "Transaction Basket" page is shown
    And "${Product 116904 Description}" is displayed in "Receipt" list
    And "${Product 1169 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Voucher" button
    And "Select Redeem Voucher" page is shown
    And user presses "Select Voucher" button and "Select Redeem Voucher Type" page shown
    And user selects "${Monetary Voucher Overpayment Type}" from "Selection List" list
    And user presses "OK" button and "Enter Voucher Serial Number" page shown
    And user enters "${Monetary Voucher Overpayment Serial Number}" into "Input Box" field
    And user presses "OK" button and "Get Tender Amount" page shown
    And user enters "${Monetary Voucher Overpayment Amount}" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And receipt display with following details
      | text      | Sale                                                                       |
      | item      | ${Product 116904 Description},${Product 1169 Price}   |
      | text      | Overpayment                                                             |
    When user presses "SignOff" button
    Then "Enter User" page is shown