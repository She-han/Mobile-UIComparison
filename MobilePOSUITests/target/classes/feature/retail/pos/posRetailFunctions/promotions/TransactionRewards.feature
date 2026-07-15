Feature: Transaction Reward Promotions

  @PT-10715 @PreSales @POS @AUTOMATED @POSValidatedTest 
  Scenario: Transaction Discount percent promotion for specific customer at specific location when paid by specific voucher
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Capture Customer" button
    And "Capture Customer Name" page is shown
    And user presses "Search By Name" button
    And "Enter Search Name" page is shown
    And user enters "${Customer 4 Name}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 4 Id}" from "Selection List" list
    And user presses "OK" button
    And "Confirm Customer" page is shown
    And user presses "Confirm" button
    Then "Transaction Basket" page is shown
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    When user enters "${Product 4}" into "Input Box" field
    And user presses "ENT" button
    And "Test promo: included customer only" is displayed in "Receipt" list
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    When user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Capture Customer" button
    And "Capture Customer Name" page is shown
    And user presses "Search By Name" button
    And "Enter Search Name" page is shown
    And user enters "${Customer 3 Name}" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 3 Id}" from "Selection List" list
    And user presses "OK" button
    And "Confirm Customer" page is shown
    And user presses "Confirm" button
    Then "Transaction Basket" page is shown
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    When user enters "${Product 4}" into "Input Box" field
    And user presses "ENT" button
    And "Test promo: included customer only" is not displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-64 @PreSales @TransactionRewardPromotion @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Transaction Discount percent promotion for specific customer at specific location when paid by specific voucher
    Given user signs on as "Manager 2"
    And user presses "CRM Button" icon button
    And "CRM Menu Screen" page is shown
    When user presses "Customers" icon button and "CRM Select Customers Screen" page shown
    And user waits "CRM Customer Search Page Search Button" to display
    And user waits "2" seconds
    And user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    And user enters "${Customer 1 Email}" into "CRM Customer Search Page Email Text" field
    And "CRM Customer Search Page Email Text" field displays the text "${Customer 1 Email}"
    And user presses "CRM Customer Search Page Search Button" icon button
    And "CRM Client Details" page is shown
    And user presses "CRM Customer Client Details Page Start Sale Button" icon button
    And "Transaction Basket" page is shown
    And "${Customer 1 Full Name}" is displayed in "Receipt" list
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    # Verify Voucher promotion is not added to the basket
    And "${Voucher Promotion 1 Description}" is not displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Voucher" button and "Select Redeem Voucher" page shown
    And user enters "${Gift Voucher Number 1}" into "Input Box" field
    And user presses "ENT" button and "Await Drawer Closed" page shown
    # Verify Voucher promotion is  added to the basket
    And "${Voucher Promotion 1 Description}" is displayed in "Receipt" list
    And "Serial: ${Gift Voucher Number 1}" is displayed in "Receipt" list
    And "${Gift Voucher Number 1 Type}" is displayed in "Receipt" list
    And "-${Gift Voucher Number 1 Value}" is displayed in "Receipt" list
    And receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price}                                    |
      | text | Promotion Saving                                                               |
      | item | ${Voucher Promotion 1 Description},-£2.50                                      |
      | item | ${Gift Voucher Number 1 Type},-${Gift Voucher Number 1 Value}                  |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-65 @SET2 @ToBeFixedAutTest @TransactionRewardPromotion @POS @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Transaction Discount amount promotion with exlude customer and region
    Given user signs on as "Manager 2"
    And user presses "CRM Button" icon button
    And "CRM Menu Screen" page is shown
    When user presses "Customers" icon button
    And "CRM Select Customers Screen" page is shown
    And user waits "CRM Customer Search Page Search Button" to display
    And user waits "2" seconds
    And user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    And user enters "${Customer 1 Email}" into "CRM Customer Search Page Email Text" field
    And "CRM Customer Search Page Email Text" field displays the text "${Customer 1 Email}"
    And user presses "CRM Customer Search Page Search Button" icon button
    And user waits "5" seconds
    And "CRM Client Details" page is shown
    And user presses "CRM Customer Client Details Page Start Sale Button" icon button
    And "Transaction Basket" page is shown
    And "${Customer 1 Full Name}" is displayed in "Receipt" list
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    # Verify Voucher promotion is not added to the basket
    Then "${Transaction Promotion 1 Description}" is not displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price} |
    And following details are not displayed on the receipt
      | text | ${Transaction Promotion 1 Description} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-392 @SET2 @ToBeFixedAutTest @MVP @Support @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Transaction Amount Discount Promotion with included Customer Group
    Given user signs on as "Manager 2"
    And user presses "CRM Button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Customers" icon button
    And "CRM Select Customers Screen" page is shown
    And user waits "CRM Customer Search Page Search Button" to display
    And user waits "2" seconds
    And user enters "${Customer 2 Name}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Customer 2 Name}"
    And user enters "${Customer 2 Email}" into "CRM Customer Search Page Email Text" field
    And "CRM Customer Search Page Email Text" field displays the text "${Customer 2 Email}"
    And user presses "CRM Customer Search Page Search Button" icon button
    And "CRM Client Details" page is shown
    When user presses "CRM Customer Client Details Page Start Sale Button" icon button
    And "Transaction Basket" page is shown
    And "${Customer 2 Full Name}" is displayed in "Receipt" list
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 2 Description}" is displayed in "Receipt" list
    And "${Product 2 Price}" is displayed in "Receipt" list
    And "${Transaction Promotion 2 Description} -£5.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price}   |
      | text | Promotion Saving                              |
      | item | ${Transaction Promotion 2 Description},-£5.00 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
