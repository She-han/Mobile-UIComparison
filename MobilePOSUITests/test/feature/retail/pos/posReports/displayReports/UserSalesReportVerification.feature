Feature: User Sales Report Verification

  @PT-2827 @AUTOMATED @ManualVerification
  Scenario: POS Reports | Display User Sales Report for a Selected Single Date
    ## Login as User A ##
    Given user signs on as "Sales Assistant"
    # Perform a normal sale transaction - 10 pounds
    And user enters "${Product 47}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # Perform a return in cash - 5 pounds
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Item Return Alert" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # Perform a sale with promotion in cash - 10 pounds
    And user enters "${Product 47}" into "Input Box" field
    And user presses "ENT" button
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Promotions" button
    And user presses "Enable Promotion" button and "Transaction Basket" page shown
    And "£8 Manual Activation Promo" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # Perform a sale with item discounts in cash - 10 pounds
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
    # Perform a sale with transaction discounts in cash - 10 pounds
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
    # Perform a normal sale with cheque - 15 pounds
    And user enters "${Product 11}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cheque" button and "Select Cheque Type" page shown
    And user presses "Business" button and "Cheque Tender Amount" page shown
    And user presses "OK" button and "Enter Cheque Number" page shown
    When user enters "${Tender Cheque Number UK}" into "Input Box" field
    Then user presses "OK" button and "Enter Cheque Sort Code" page shown
    When user enters "${Tender Cheque Sort Code UK}" into "Input Box" field
    And user presses "OK" button and "Enter Cheque Account Number" page shown
    When user enters "${Tender Cheque Account Number UK}" into "Input Box" field
    And user presses "OK" button and "Cheque Signature Verification" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # Perform a price override
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
    # Perform no sale
    And user presses "Management" button
    And user presses "No Sale" button
    And "Select Reason" page is shown
    And user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # Perform an order
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    When user enters "${SKU_PRODUCT_6}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Postcode" button and "Enter Post Code" page shown
    And user enters "sg" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Postcode" page is shown
    When user selects "${Customer 1 Name}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Address Delivery" button
    And user presses "Continue" button and "Capture Customer Name Contact" page shown
    And user presses "OK" button and "Capture Customer Address" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    Then user presses "Skip" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    ## Login as User B ##
    Given user signs on as "POS Operator"
    # Perform a normal sale transaction - 10 pounds
    And user enters "${Product 47}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # Perform a return in cash - 5 pounds
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Item Return Alert" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2828 @AUTOMATED @ManualVerification
  Scenario: POS Reports | Display User Sales Report for a Selected Period - Current Fiscal Period
    ## Login as User A ##
    Given user signs on as "Sales Assistant"
    # Perform a normal sale transaction - 10 pounds
    And user enters "${Product 47}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # Perform a return in cash - 5 pounds
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Item Return Alert" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # Perform a sale with promotion in cash - 10 pounds
    And user enters "${Product 47}" into "Input Box" field
    And user presses "ENT" button
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Promotions" button
    And user presses "Enable Promotion" button and "Transaction Basket" page shown
    And "£8 Manual Activation Promo" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # Perform a sale with item discounts in cash - 10 pounds
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
    # Perform a sale with transaction discounts in cash - 10 pounds
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
    # Perform a normal sale with cheque - 15 pounds
    And user enters "${Product 11}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cheque" button and "Select Cheque Type" page shown
    And user presses "Business" button and "Cheque Tender Amount" page shown
    And user presses "OK" button and "Enter Cheque Number" page shown
    When user enters "${Tender Cheque Number UK}" into "Input Box" field
    Then user presses "OK" button and "Enter Cheque Sort Code" page shown
    When user enters "${Tender Cheque Sort Code UK}" into "Input Box" field
    And user presses "OK" button and "Enter Cheque Account Number" page shown
    When user enters "${Tender Cheque Account Number UK}" into "Input Box" field
    And user presses "OK" button and "Cheque Signature Verification" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # Perform a price override
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
    # Perform no sale
    And user presses "Management" button
    And user presses "No Sale" button
    And "Select Reason" page is shown
    And user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # Perform an order
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    When user enters "${SKU_PRODUCT_6}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Postcode" button and "Enter Post Code" page shown
    And user enters "sg" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Postcode" page is shown
    When user selects "${Customer 1 Name}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Address Delivery" button
    And user presses "Continue" button and "Capture Customer Name Contact" page shown
    And user presses "OK" button and "Capture Customer Address" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    Then user presses "Skip" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    ## Login as User B ##
    Given user signs on as "POS Operator"
    # Perform a normal sale transaction - 10 pounds
    And user enters "${Product 47}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # Perform a return in cash - 5 pounds
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Item Return Alert" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2829 @AUTOMATED @ManualVerification
  Scenario: POS Reports | Display User Sales Report for a Selected Month
    ## Login as User A ##
    Given user signs on as "Sales Assistant"
    # Perform a normal sale transaction - 10 pounds
    And user enters "${Product 47}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # Perfrom a return in cash - 5 pounds
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Item Return Alert" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # Perform a sale with promotion in cash - 10 pounds
    And user enters "${Product 47}" into "Input Box" field
    And user presses "ENT" button
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Promotions" button
    And user presses "Enable Promotion" button and "Transaction Basket" page shown
    And "£8 Manual Activation Promo" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # Perfrom a sale with item discounts in cash - 10 pounds
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
    # Perfrom a sale with transaction discounts in cash - 10 pounds
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
    # Perform a normal sale with cheque - 15 pounds
    And user enters "${Product 11}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cheque" button and "Select Cheque Type" page shown
    And user presses "Business" button and "Cheque Tender Amount" page shown
    And user presses "OK" button and "Enter Cheque Number" page shown
    When user enters "${Tender Cheque Number UK}" into "Input Box" field
    Then user presses "OK" button and "Enter Cheque Sort Code" page shown
    When user enters "${Tender Cheque Sort Code UK}" into "Input Box" field
    And user presses "OK" button and "Enter Cheque Account Number" page shown
    When user enters "${Tender Cheque Account Number UK}" into "Input Box" field
    And user presses "OK" button and "Cheque Signature Verification" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # Perform a price override
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
    # Perfrom no sale
    And user presses "Management" button
    And user presses "No Sale" button
    And "Select Reason" page is shown
    And user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # Perform an order
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    When user enters "${SKU_PRODUCT_6}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Postcode" button and "Enter Post Code" page shown
    And user enters "sg" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Postcode" page is shown
    When user selects "${Customer 1 Name}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Address Delivery" button
    And user presses "Continue" button and "Capture Customer Name Contact" page shown
    And user presses "OK" button and "Capture Customer Address" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    Then user presses "Skip" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    ## Login as User B ##
    Given user signs on as "POS Operator"
    # Perform a normal sale transaction - 10 pounds
    And user enters "${Product 47}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # Perfrom a return in cash - 5 pounds
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Item Return Alert" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2830 @AUTOMATED @ManualVerification
  Scenario: POS Reports | Display User Sales Report for This Week
    ## Login as User A ##
    Given user signs on as "Sales Assistant"
    # Perform a normal sale transaction - 10 pounds
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # Perfrom a return in cash - 5 pounds
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Item Return Alert" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # Perform a sale with promotion in cash - 10 pounds
    And user enters "${Product 47}" into "Input Box" field
    And user presses "ENT" button
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Promotions" button
    And user presses "Enable Promotion" button and "Transaction Basket" page shown
    And "£8 Manual Activation Promo" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # Perfrom a sale with item discounts in cash - 10 pounds
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
    # Perfrom a sale with transaction discounts in cash - 10 pounds
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
    # Perform a normal sale with cheque - 15 pounds
    And user enters "${Product 11}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cheque" button and "Select Cheque Type" page shown
    And user presses "Business" button and "Cheque Tender Amount" page shown
    And user presses "OK" button and "Enter Cheque Number" page shown
    When user enters "${Tender Cheque Number UK}" into "Input Box" field
    Then user presses "OK" button and "Enter Cheque Sort Code" page shown
    When user enters "${Tender Cheque Sort Code UK}" into "Input Box" field
    And user presses "OK" button and "Enter Cheque Account Number" page shown
    When user enters "${Tender Cheque Account Number UK}" into "Input Box" field
    And user presses "OK" button and "Cheque Signature Verification" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # Perform a price override
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
    # Perfrom no sale
    And user presses "Management" button
    And user presses "No Sale" button
    And "Select Reason" page is shown
    And user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # Perform an order
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    When user enters "${SKU_PRODUCT_6}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Postcode" button and "Enter Post Code" page shown
    And user enters "sg" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Postcode" page is shown
    When user selects "${Customer 1 Name}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Address Delivery" button
    And user presses "Continue" button and "Capture Customer Name Contact" page shown
    And user presses "OK" button and "Capture Customer Address" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    Then user presses "Skip" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    ## Login as User B ##
    Given user signs on as "POS Operator"
    # Perform a normal sale transaction - 10 pounds
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # Perfrom a return in cash - 5 pounds
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Item Return Alert" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2831 @AUTOMATED @ManualVerification
  Scenario: POS Reports | Display User Sales Report for Today
    ## Login as User A ##
    Given user signs on as "Sales Assistant"
    # Perform a normal sale transaction - 10 pounds
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # Perfrom a return in cash - 5 pounds
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Item Return Alert" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # Perform a sale with promotion in cash - 10 pounds
    And user enters "${Product 47}" into "Input Box" field
    And user presses "ENT" button
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Promotions" button
    And user presses "Enable Promotion" button and "Transaction Basket" page shown
    And "£8 Manual Activation Promo" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # Perfrom a sale with item discounts in cash - 10 pounds
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
    # Perfrom a sale with transaction discounts in cash - 10 pounds
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
    # Perform a normal sale with cheque - 15 pounds
    And user enters "${Product 11}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cheque" button and "Select Cheque Type" page shown
    And user presses "Business" button and "Cheque Tender Amount" page shown
    And user presses "OK" button and "Enter Cheque Number" page shown
    When user enters "${Tender Cheque Number UK}" into "Input Box" field
    Then user presses "OK" button and "Enter Cheque Sort Code" page shown
    When user enters "${Tender Cheque Sort Code UK}" into "Input Box" field
    And user presses "OK" button and "Enter Cheque Account Number" page shown
    When user enters "${Tender Cheque Account Number UK}" into "Input Box" field
    And user presses "OK" button and "Cheque Signature Verification" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # Perform a price override
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
    # Perfrom no sale
    And user presses "Management" button
    And user presses "No Sale" button
    And "Select Reason" page is shown
    And user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # Perform an order
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    When user enters "${SKU_PRODUCT_6}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Postcode" button and "Enter Post Code" page shown
    And user enters "sg" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Postcode" page is shown
    When user selects "${Customer 1 Name}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Address Delivery" button
    And user presses "Continue" button and "Capture Customer Name Contact" page shown
    And user presses "OK" button and "Capture Customer Address" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    Then user presses "Skip" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    ## Login as User B ##
    Given user signs on as "POS Operator"
    # Perform a normal sale transaction - 10 pounds
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # Perfrom a return in cash - 5 pounds
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Item Return Alert" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2832 @AUTOMATED @ManualVerification
  Scenario: POS Reports | Display User Sales Report for a Selected Date Range
    ## Login as User A ##
    Given user signs on as "Sales Assistant"
    # Perform a normal sale transaction - 10 pounds
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # Perfrom a return in cash - 5 pounds
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Item Return Alert" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # Perform a sale with promotion in cash - 10 pounds
    And user enters "${Product 47}" into "Input Box" field
    And user presses "ENT" button
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Promotions" button
    And user presses "Enable Promotion" button and "Transaction Basket" page shown
    And "£8 Manual Activation Promo" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    # Perfrom a sale with item discounts in cash - 10 pounds
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
    # Perfrom a sale with transaction discounts in cash - 10 pounds
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
    # Perform a normal sale with cheque - 15 pounds
    And user enters "${Product 11}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cheque" button and "Select Cheque Type" page shown
    And user presses "Business" button and "Cheque Tender Amount" page shown
    And user presses "OK" button and "Enter Cheque Number" page shown
    When user enters "${Tender Cheque Number UK}" into "Input Box" field
    Then user presses "OK" button and "Enter Cheque Sort Code" page shown
    When user enters "${Tender Cheque Sort Code UK}" into "Input Box" field
    And user presses "OK" button and "Enter Cheque Account Number" page shown
    When user enters "${Tender Cheque Account Number UK}" into "Input Box" field
    And user presses "OK" button and "Cheque Signature Verification" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # Perform a price override
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
    # Perfrom no sale
    And user presses "Management" button
    And user presses "No Sale" button
    And "Select Reason" page is shown
    And user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # Perform an order
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    Then "Transaction Basket" page is shown
    And "Order Number" is displayed in "Receipt" list
    When user enters "${SKU_PRODUCT_6}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Postcode" button and "Enter Post Code" page shown
    And user enters "sg" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Postcode" page is shown
    When user selects "${Customer 1 Name}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Order Delivery Option Panel" page shown
    And user presses "Address Delivery" button
    And user presses "Continue" button and "Capture Customer Name Contact" page shown
    And user presses "OK" button and "Capture Customer Address" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "10% plus preauth" from "Selection List" list
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tender Pre Auth Prompt" page shown
    Then user presses "Skip" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    ## Login as User B ##
    Given user signs on as "POS Operator"
    # Perform a normal sale transaction - 10 pounds
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # Perform a return in cash - 5 pounds
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Item Return Alert" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
