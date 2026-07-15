Feature: Verify Hourly Sales Report

  @PT-2839 @AUTOMATED @Regression @Report @ManualVerification
  Scenario: Generate Hourly Sales Report for a Selected Single Date
    Given user signs on as "Sales Assistant"
    #-- PERFORM NORMAL SALE CASH TRANSACTION - £10.00 --#
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM A SALE WITH ITEM DISCOUNT IN CASH - £17.00 --#
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 2 Description}" from "Receipt List" list
    Then "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "Manager Item Discount (Amount)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Amount" page shown
    And user enters "5.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Manager Item Discount (Amount) -£5.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM A SALE WITH TRANSACTION DISCOUNT IN CASH £28.30--#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    Then user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Fixed Amount Discount (£5.00)" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Fixed Amount Discount (£5.00))" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM NORMAL SALE WITH CHEQUE - £28.30 --#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cheque" button and "Select Cheque Type" page shown
    And user presses "Business" button and "Cheque Tender Amount" page shown
    And user presses "OK" button and "Enter Cheque Number" page shown
    And user enters "${Tender Cheque Number UK2}" into "Input Box" field
    Then user presses "OK" button and "Enter Cheque Sort Code" page shown
    When user enters "${Tender Cheque Sort Code UK2}" into "Input Box" field
    And user presses "OK" button and "Enter Cheque Account Number" page shown
    And user enters "${Tender Cheque Account Number UK2}" into "Input Box" field
    And user presses "OK" button and "Cheque Signature Verification" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM PRODUCT OVERRIDE - £10.00 --> £9.00 --#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Price Override" button and "Select Basket Item" page shown
    And user selects "${Product 1 Description}" from "Selection List" list
    And user presses "OK" button
    Then "Select Reason" page is shown
    When user selects "Price Override Down" from "Selection List" list
    And user presses "OK" button
    Then "Enter Price Override Amount" page is shown
    When user enters "9.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM NO SALE --#
    When user presses "Management" button
    And user presses "No Sale" button
    Then "Select Reason" page is shown
    When user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM TRANSACTION VOID --#
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    #-- PERFORM ITEM VOID - £10.00 --#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 4}" into "Input Box" field
    And user presses "ENT" button
    Then user presses "Voids" button
    And user presses "Item Void" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM AN ORDER TRANSACTION - DELIVERY TO HOME --#
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    Then "Transaction Basket" page is shown
    When user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Postcode" button and "Enter Post Code" page shown
    And user enters "sg" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Postcode" page is shown
    Then user selects "${Customer 1 Name}" from "Selection List" list
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
    When user presses "Skip" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- DISPLAY REPORT - FOR SELECTED DATE RANGE --#
    When user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Hourly Sales" button and "Select Date Type Form" page shown
    And user presses "Single Date" button and "Select Single Date Form" page shown
    And user enters "#{today}" into "Input Box" field
    And user presses "OK" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | HOURLY SALES REPORT |
      | TERMINAL     | ${Terminal Number}  |
      | LOCATION     | ${Location}         |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2844 @AUTOMATED @Regression @Report @ManualVerification
  Scenario: Generate Hourly Sales Report for a Selected Date Range
    Given user signs on as "Sales Assistant"
    #-- PERFORM NORMAL SALE CASH TRANSACTION - £10.00 --#
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM AN ITEM RETURN IN CASH - £18.00 --#
    When user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM A SALE WITH ITEM DISCOUNT IN CASH - £17.00 --#
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 2 Description}" from "Receipt List" list
    Then "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "Manager Item Discount (Amount)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Amount" page shown
    And user enters "5.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Manager Item Discount (Amount) -£5.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM A SALE WITH TRANSACTION DISCOUNT IN CASH £28.30--#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    Then user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Fixed Amount Discount (£5.00)" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM NORMAL SALE WITH CHEQUE - £28.30 --#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cheque" button and "Select Cheque Type" page shown
    And user presses "Business" button and "Cheque Tender Amount" page shown
    And user presses "OK" button and "Enter Cheque Number" page shown
    And user enters "${Tender Cheque Number UK2}" into "Input Box" field
    Then user presses "OK" button and "Enter Cheque Sort Code" page shown
    When user enters "${Tender Cheque Sort Code UK2}" into "Input Box" field
    And user presses "OK" button and "Enter Cheque Account Number" page shown
    And user enters "${Tender Cheque Account Number UK2}" into "Input Box" field
    And user presses "OK" button and "Cheque Signature Verification" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM PRODUCT OVERRIDE - £10.00 --> £9.00 --#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Price Override" button and "Select Basket Item" page shown
    And user selects "${Product 1 Description}" from "Selection List" list
    And user presses "OK" button
    Then "Select Reason" page is shown
    When user selects "Price Override Down" from "Selection List" list
    And user presses "OK" button
    Then "Enter Price Override Amount" page is shown
    When user enters "9.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM NO SALE --#
    When user presses "Management" button
    And user presses "No Sale" button
    Then "Select Reason" page is shown
    When user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM TRANSACTION VOID --#
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    #-- PERFORM ITEM VOID - £10.00 --#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 4}" into "Input Box" field
    And user presses "ENT" button
    Then user presses "Voids" button
    And user presses "Item Void" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM AN ORDER TRANSACTION - DELIVERY TO HOME --#
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    Then "Transaction Basket" page is shown
    When user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Postcode" button and "Enter Post Code" page shown
    And user enters "sg" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Postcode" page is shown
    Then user selects "${Customer 1 Name}" from "Selection List" list
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
    When user presses "Skip" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- DISPLAY REPORT - FOR SELECTED DATE RANGE --#
    When user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Hourly Sales" button and "Select Date Type Form" page shown
    And user presses "Date Range" button and "Select Date Range Form" page shown
    And user enters "#{today-3}" into "Report Date Range Start Date" field
    And user enters "#{today}" into "Report Date Range End Date" field
    And user presses "OK" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | HOURLY SALES REPORT |
      | TERMINAL     | ${Terminal Number}  |
      | LOCATION     | ${Location}         |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2841 @AUTOMATED @Regression @Report @ManualVerification
  Scenario: Generate Hourly Sales Report for a a Selected Month - For Fiscal Year
    Given user signs on as "Sales Assistant"
    #-- PERFORM NORMAL SALE CASH TRANSACTION - £10.00 --#
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM AN ITEM RETURN IN CASH - £18.00 --#
    When user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM A SALE WITH ITEM DISCOUNT IN CASH - £17.00 --#
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 2 Description}" from "Receipt List" list
    Then "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "Manager Item Discount (Amount)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Amount" page shown
    And user enters "5.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Manager Item Discount (Amount) -£5.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM A SALE WITH TRANSACTION DISCOUNT IN CASH £28.30--#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    Then user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Fixed Amount Discount (£5.00)" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM NORMAL SALE WITH CHEQUE - £28.30 --#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cheque" button and "Select Cheque Type" page shown
    And user presses "Business" button and "Cheque Tender Amount" page shown
    And user presses "OK" button and "Enter Cheque Number" page shown
    And user enters "${Tender Cheque Number UK2}" into "Input Box" field
    Then user presses "OK" button and "Enter Cheque Sort Code" page shown
    When user enters "${Tender Cheque Sort Code UK2}" into "Input Box" field
    And user presses "OK" button and "Enter Cheque Account Number" page shown
    And user enters "${Tender Cheque Account Number UK2}" into "Input Box" field
    And user presses "OK" button and "Cheque Signature Verification" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM PRODUCT OVERRIDE - £10.00 --> £9.00 --#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Price Override" button and "Select Basket Item" page shown
    And user selects "${Product 1 Description}" from "Selection List" list
    And user presses "OK" button
    Then "Select Reason" page is shown
    When user selects "Price Override Down" from "Selection List" list
    And user presses "OK" button
    Then "Enter Price Override Amount" page is shown
    When user enters "9.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM NO SALE --#
    When user presses "Management" button
    And user presses "No Sale" button
    Then "Select Reason" page is shown
    When user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM TRANSACTION VOID --#
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    #-- PERFORM ITEM VOID - £10.00 --#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 4}" into "Input Box" field
    And user presses "ENT" button
    Then user presses "Voids" button
    And user presses "Item Void" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM AN ORDER TRANSACTION - DELIVERY TO HOME --#
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    Then "Transaction Basket" page is shown
    When user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Postcode" button and "Enter Post Code" page shown
    And user enters "sg" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Postcode" page is shown
    Then user selects "${Customer 1 Name}" from "Selection List" list
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
    When user presses "Skip" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- DISPLAY REPORT - FOR SELECTED MONTH --#
    When user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Hourly Sales" button and "Select Date Type Form" page shown
    And user presses "Other" button
    And user presses "Month" button and "Select Year For Month" page shown
    And user selects "${Report Year}" from "Selection List" list
    And user presses "OK" button and "Select Month" page shown
    And user selects "${Month Report}" from "Selection List" list
    And user presses "OK" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | HOURLY SALES REPORT |
      | TERMINAL     | ${Terminal Number}  |
      | LOCATION     | ${Location}         |
      | REPORT DATE  | #{today}            |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2842 @AUTOMATED @Regression @Report @ManualVerification
  Scenario: Generate Hourly Sales Report for This Week
    Given user signs on as "Sales Assistant"
    #-- PERFORM NORMAL SALE CASH TRANSACTION - £10.00 --#
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM AN ITEM RETURN IN CASH - £18.00 --#
    When user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM A SALE WITH ITEM DISCOUNT IN CASH - £17.00 --#
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 2 Description}" from "Receipt List" list
    Then "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "Manager Item Discount (Amount)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Amount" page shown
    And user enters "5.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Manager Item Discount (Amount) -£5.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM A SALE WITH TRANSACTION DISCOUNT IN CASH £28.30--#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    Then user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Fixed Amount Discount (£5.00)" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM NORMAL SALE WITH CHEQUE - £28.30 --#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cheque" button and "Select Cheque Type" page shown
    And user presses "Business" button and "Cheque Tender Amount" page shown
    And user presses "OK" button and "Enter Cheque Number" page shown
    And user enters "${Tender Cheque Number UK2}" into "Input Box" field
    Then user presses "OK" button and "Enter Cheque Sort Code" page shown
    When user enters "${Tender Cheque Sort Code UK2}" into "Input Box" field
    And user presses "OK" button and "Enter Cheque Account Number" page shown
    And user enters "${Tender Cheque Account Number UK2}" into "Input Box" field
    And user presses "OK" button and "Cheque Signature Verification" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM PRODUCT OVERRIDE - £10.00 --> £9.00 --#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Price Override" button and "Select Basket Item" page shown
    And user selects "${Product 1 Description}" from "Selection List" list
    And user presses "OK" button
    Then "Select Reason" page is shown
    When user selects "Price Override Down" from "Selection List" list
    And user presses "OK" button
    Then "Enter Price Override Amount" page is shown
    When user enters "9.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM NO SALE --#
    When user presses "Management" button
    And user presses "No Sale" button
    Then "Select Reason" page is shown
    When user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM TRANSACTION VOID --#
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    #-- PERFORM ITEM VOID - £10.00 --#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 4}" into "Input Box" field
    And user presses "ENT" button
    Then user presses "Voids" button
    And user presses "Item Void" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM AN ORDER TRANSACTION - DELIVERY TO HOME --#
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    Then "Transaction Basket" page is shown
    When user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Postcode" button and "Enter Post Code" page shown
    And user enters "sg" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Postcode" page is shown
    Then user selects "${Customer 1 Name}" from "Selection List" list
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
    When user presses "Skip" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- DISPLAY REPORT - FOR THIS WEEK --#
    When user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Hourly Sales" button and "Select Date Type Form" page shown
    And user presses "This Week" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | HOURLY SALES REPORT |
      | TERMINAL     | ${Terminal Number}  |
      | LOCATION     | ${Location}         |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2843 @AUTOMATED @Regression @Report @ManualVerification
  Scenario: Generate Hourly Sales Report for Today
    Given user signs on as "Sales Assistant"
    #-- PERFORM NORMAL SALE CASH TRANSACTION - £10.00 --#
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM AN ITEM RETURN IN CASH - £18.00 --#
    When user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM A SALE WITH ITEM DISCOUNT IN CASH - £17.00 --#
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 2 Description}" from "Receipt List" list
    Then "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "Manager Item Discount (Amount)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Amount" page shown
    And user enters "5.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Manager Item Discount (Amount) -£5.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM A SALE WITH TRANSACTION DISCOUNT IN CASH £28.30--#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    Then user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Fixed Amount Discount (£5.00)" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM NORMAL SALE WITH CHEQUE - £28.30 --#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cheque" button and "Select Cheque Type" page shown
    And user presses "Business" button and "Cheque Tender Amount" page shown
    And user presses "OK" button and "Enter Cheque Number" page shown
    And user enters "${Tender Cheque Number UK2}" into "Input Box" field
    Then user presses "OK" button and "Enter Cheque Sort Code" page shown
    When user enters "${Tender Cheque Sort Code UK2}" into "Input Box" field
    And user presses "OK" button and "Enter Cheque Account Number" page shown
    And user enters "${Tender Cheque Account Number UK2}" into "Input Box" field
    And user presses "OK" button and "Cheque Signature Verification" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM PRODUCT OVERRIDE - £10.00 --> £9.00 --#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Price Override" button and "Select Basket Item" page shown
    And user selects "${Product 1 Description}" from "Selection List" list
    And user presses "OK" button
    Then "Select Reason" page is shown
    When user selects "Price Override Down" from "Selection List" list
    And user presses "OK" button
    Then "Enter Price Override Amount" page is shown
    When user enters "9.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM NO SALE --#
    When user presses "Management" button
    And user presses "No Sale" button
    Then "Select Reason" page is shown
    When user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM TRANSACTION VOID --#
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    #-- PERFORM ITEM VOID - £10.00 --#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 4}" into "Input Box" field
    And user presses "ENT" button
    Then user presses "Voids" button
    And user presses "Item Void" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM AN ORDER TRANSACTION - DELIVERY TO HOME --#
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    Then "Transaction Basket" page is shown
    When user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Postcode" button and "Enter Post Code" page shown
    And user enters "sg" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Postcode" page is shown
    Then user selects "${Customer 1 Name}" from "Selection List" list
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
    When user presses "Skip" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- DISPLAY REPORT - FOR TODAY --#
    When user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Hourly Sales" button and "Select Date Type Form" page shown
    And user presses "Today" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | HOURLY SALES REPORT |
      | TERMINAL     | ${Terminal Number}  |
      | LOCATION     | ${Location}         |
      | REPORT DATE  | #{today}            |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2840 @AUTOMATED @Regression @Report @ManualVerification
  Scenario: Display Hourly Sales Report for a Selected Period - Current Fiscal Period
    Given user signs on as "Sales Assistant"
    #-- PERFORM NORMAL SALE CASH TRANSACTION - £10.00 --#
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM AN ITEM RETURN IN CASH - £18.00 --#
    When user presses "Returns" button
    And user presses "Return Item" button and "Enter Return Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Select Reason" page shown
    And user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM A SALE WITH ITEM DISCOUNT IN CASH - £17.00 --#
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 2 Description}" from "Receipt List" list
    Then "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "Manager Item Discount (Amount)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Amount" page shown
    And user enters "5.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Manager Item Discount (Amount) -£5.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM A SALE WITH TRANSACTION DISCOUNT IN CASH £28.30--#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    Then user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Fixed Amount Discount (£5.00)" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM NORMAL SALE WITH CHEQUE - £28.30 --#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cheque" button and "Select Cheque Type" page shown
    And user presses "Business" button and "Cheque Tender Amount" page shown
    And user presses "OK" button and "Enter Cheque Number" page shown
    And user enters "${Tender Cheque Number UK2}" into "Input Box" field
    Then user presses "OK" button and "Enter Cheque Sort Code" page shown
    When user enters "${Tender Cheque Sort Code UK2}" into "Input Box" field
    And user presses "OK" button and "Enter Cheque Account Number" page shown
    And user enters "${Tender Cheque Account Number UK2}" into "Input Box" field
    And user presses "OK" button and "Cheque Signature Verification" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM PRODUCT OVERRIDE - £10.00 --> £9.00 --#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Price Override" button and "Select Basket Item" page shown
    And user selects "${Product 1 Description}" from "Selection List" list
    And user presses "OK" button
    Then "Select Reason" page is shown
    When user selects "Price Override Down" from "Selection List" list
    And user presses "OK" button
    Then "Enter Price Override Amount" page is shown
    When user enters "9.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM NO SALE --#
    When user presses "Management" button
    And user presses "No Sale" button
    Then "Select Reason" page is shown
    When user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM TRANSACTION VOID --#
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    #-- PERFORM ITEM VOID - £10.00 --#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 4}" into "Input Box" field
    And user presses "ENT" button
    Then user presses "Voids" button
    And user presses "Item Void" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM AN ORDER TRANSACTION - DELIVERY TO HOME --#
    And user presses "Sales" button
    When user presses "More" button
    And user presses "Customers" button
    And user presses "Order Functions" button
    And user presses "Order" button
    Then "Transaction Basket" page is shown
    When user enters "${SKU Product 6}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Capture Customer Name" page shown
    And user presses "Search By Postcode" button and "Enter Post Code" page shown
    And user enters "sg" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Postcode" page is shown
    Then user selects "${Customer 1 Name}" from "Selection List" list
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
    When user presses "Skip" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- DISPLAY REPORT - FOR CURRENT FISCAL PERIOD --#
    When user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Hourly Sales" button and "Select Date Type Form" page shown
    And user presses "Other" button
    And user presses "Period" button and "Select Year For Period" page shown
    And user selects "${Report Year}" from "Selection List" list
    And user presses "OK" button and "Select Period" page shown
    And user selects "${Period Report}" from "Selection List" list
    And user presses "OK" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | HOURLY SALES REPORT |
      | TERMINAL     | ${Terminal Number}  |
      | LOCATION     | ${Location}         |
      | REPORT DATE  | #{today}            |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
