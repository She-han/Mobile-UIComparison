Feature: Verify Tender Totals Report

  @PT-2821 @AUTOMATED @Regression @ManualVerification @Reports
  Scenario: Generate Tender Totals Report for a Selected Single Date
    Given user signs on as "Sales Assistant"
    #-- PERFORM NORMAL SALE TRANSACTION - £10.00 --#
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM ITEM RETURN WITH CASH - £18.00 --#
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
    #-- PERFORM A SALE WITH PROMOTION IN CASH - £5.00 --#
    When user enters "${Product 6}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM A NORMAL SALE WITH CHEQUE - £5.00 --#
    When user enters "${Product 2}" into "Input Box" field
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
    #-- PERFORM A NORMAL SALE WITH CARD - £28.00 --#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    Then user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cards" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Insert Swipe Card" page shown
    And "ICCReader" page is shown
    And user selects "BMS Mastercard - Valid" from "Select Payment Card" combobox
    And user presses "Card Inserted" checkbox
    And "Processing Card" page is shown
    And "ICCReader" page is shown
    And user presses "E" button
    And "Remove Card Prompt" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    And "Transaction Basket" page is shown
    #-- PERFORM A NORMAL SALE WITH FOREIGN CURRENCY - EURO --#
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Tender Amount" page shown
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Foreign Currencies" button
    And user presses "EURO" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- GENERATE REPORT - FOR SINGLE DATE --#
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Tender Totals" button and "Select Date Type Form" page shown
    And user presses "Single Date" button and "Select Single Date Form" page shown
    When user enters "#{today}" into "Input Box" field
    And user presses "OK" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | TENDER TOTALS REPORT |
      | TERMINAL     | ${Terminal Number}   |
      | LOCATION     | ${Location}          |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2822 @AUTOMATED @Regression @ManualVerification @Reports
  Scenario: Generate Tender Totals Report for a Selected Date Range
    Given user signs on as "Sales Assistant"
    #-- PERFORM NORMAL SALE TRANSACTION - £10.00 --#
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM ITEM RETURN WITH CASH - £18.00 --#
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
    #-- PERFORM A SALE WITH PROMOTION IN CASH - £5.00 --#
    When user enters "${Product 6}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM A NORMAL SALE WITH CHEQUE - £5.00 --#
    When user enters "${Product 2}" into "Input Box" field
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
    #-- PERFORM A NORMAL SALE WITH CARD - £28.00 --#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    Then user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cards" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Insert Swipe Card" page shown
    And "ICCReader" page is shown
    And user selects "BMS Mastercard - Valid" from "Select Payment Card" combobox
    And user presses "Card Inserted" checkbox
    And "Processing Card" page is shown
    And "ICCReader" page is shown
    And user presses "E" button
    And "Remove Card Prompt" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    And "Transaction Basket" page is shown
    #-- PERFORM A NORMAL SALE WITH FOREIGN CURRENCY - EURO --#
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Tender Amount" page shown
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Foreign Currencies" button
    And user presses "EURO" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- GENERATE REPORT - FOR SELECTED DATE RANGE --#
    When user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Tender Totals" button and "Select Date Type Form" page shown
    And user presses "Date Range" button and "Select Date Range Form" page shown
    And user enters "#{today-3}" into "Report Date Range Start Date" field
    And user enters "#{today}" into "Report Date Range End Date" field
    And user presses "OK" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | TENDER TOTALS REPORT |
      | TERMINAL     | ${Terminal Number}   |
      | LOCATION     | ${Location}          |
      | PERIOD FROM  | #{today-3}           |
      | PERIOD TO    | #{today}             |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2823 @AUTOMATED @Regression @ManualVerification @Reports
  Scenario: Generate Tender Totals Report for Today
    Given user signs on as "Sales Assistant"
    #-- PERFORM NORMAL SALE TRANSACTION - £10.00 --#
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM ITEM RETURN WITH CASH - £18.00 --#
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
    #-- PERFORM A SALE WITH PROMOTION IN CASH - £5.00 --#
    When user enters "${Product 6}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM A NORMAL SALE WITH CHEQUE - £5.00 --#
    When user enters "${Product 2}" into "Input Box" field
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
    #-- PERFORM A NORMAL SALE WITH CARD - £28.00 --#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    Then user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cards" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Insert Swipe Card" page shown
    And "ICCReader" page is shown
    And user selects "BMS Mastercard - Valid" from "Select Payment Card" combobox
    And user presses "Card Inserted" checkbox
    And "Processing Card" page is shown
    And "ICCReader" page is shown
    And user presses "E" button
    And "Remove Card Prompt" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    When "Transaction Basket" page is shown
    #-- PERFORM A NORMAL SALE WITH FOREIGN CURRENCY - EURO --#
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Tender Amount" page shown
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Foreign Currencies" button
    And user presses "EURO" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #-- GENERATE REPORT - FOR TODAY --#
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Tender Totals" button and "Select Date Type Form" page shown
    And user presses "Today" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | TENDER TOTALS REPORT |
      | TERMINAL     | ${Terminal Number}   |
      | LOCATION     | ${Location}          |
      | PERIOD FROM  | #{today}             |
      | PERIOD TO    | #{today}             |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2824 @AUTOMATED @Regression @ManualVerification @Reports
  Scenario: Generate Tender Totals Report for This Week
    Given user signs on as "Sales Assistant"
    #-- PERFORM NORMAL SALE TRANSACTION - £10.00 --#
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM ITEM RETURN WITH CASH - £18.00 --#
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
    #-- PERFORM A SALE WITH PROMOTION IN CASH - £5.00 --#
    When user enters "${Product 6}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM A NORMAL SALE WITH CHEQUE - £5.00 --#
    When user enters "${Product 2}" into "Input Box" field
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
    #-- PERFORM A NORMAL SALE WITH CARD - £28.00 --#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    Then user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cards" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Insert Swipe Card" page shown
    And "ICCReader" page is shown
    And user selects "BMS Mastercard - Valid" from "Select Payment Card" combobox
    And user presses "Card Inserted" checkbox
    And "Processing Card" page is shown
    And "ICCReader" page is shown
    And user presses "E" button
    And "Remove Card Prompt" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    When "Transaction Basket" page is shown
    #-- PERFORM A NORMAL SALE WITH FOREIGN CURRENCY - EURO --#
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    Then user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Tender Amount" page shown
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Foreign Currencies" button
    And user presses "EURO" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #-- GENERATE REPORT - FOR THIS WEEK --#
    When user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Tender Totals" button and "Select Date Type Form" page shown
    And user presses "This Week" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | TENDER TOTALS REPORT |
      | TERMINAL     | ${Terminal Number 2} |
      | LOCATION     | ${Location}          |
      | PERIOD FROM  | #{Sunday}            |
      | PERIOD TO    | #{Sunday+6}          |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2825 @AUTOMATED @Regression @ManualVerification @Reports
  Scenario: Generate Tender Totals Report for Selected Month
    Given user signs on as "Sales Assistant"
    #-- PERFORM NORMAL SALE TRANSACTION - £10.00 --#
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM ITEM RETURN WITH CASH - £18.00 --#
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
    #-- PERFORM A SALE WITH PROMOTION IN CASH - £5.00 --#
    When user enters "${Product 6}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM A NORMAL SALE WITH CHEQUE - £5.00 --#
    When user enters "${Product 2}" into "Input Box" field
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
    #-- PERFORM A NORMAL SALE WITH CARD - £28.00 --#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    Then user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cards" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Insert Swipe Card" page shown
    And "ICCReader" page is shown
    And user selects "BMS Mastercard - Valid" from "Select Payment Card" combobox
    And user presses "Card Inserted" checkbox
    And "Processing Card" page is shown
    And "ICCReader" page is shown
    And user presses "E" button
    And "Remove Card Prompt" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    When "Transaction Basket" page is shown
    #-- PERFORM A NORMAL SALE WITH FOREIGN CURRENCY - EURO --#
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    Then user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Tender Amount" page shown
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Foreign Currencies" button
    And user presses "EURO" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #-- GENERATE REPORT - FOR A MONTH --#
    When user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Tender Totals" button and "Select Date Type Form" page shown
    And user presses "Other" button
    And user presses "Month" button and "Select Year For Month" page shown
    And user selects "${Report Year}" from "Selection List" list
    And user presses "OK" button and "Select Month" page shown
    And user selects "${Month Report}" from "Selection List" list
    And user presses "OK" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | TENDER TOTALS REPORT |
      | TERMINAL     | ${Terminal Number}   |
      | LOCATION     | ${Location}          |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2826 @AUTOMATED @Regression @ManualVerification @Reports
  Scenario: Generate Tender Totals Report for a Selected Period - Current Fiscal Period
    Given user signs on as "Sales Assistant"
    #-- PERFORM NORMAL SALE TRANSACTION - £10.00 --#
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM ITEM RETURN WITH CASH - £18.00 --#
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
    #-- PERFORM A SALE WITH PROMOTION IN CASH - £5.00 --#
    When user enters "${Product 6}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #-- PERFORM A NORMAL SALE WITH CHEQUE - £5.00 --#
    When user enters "${Product 2}" into "Input Box" field
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
    #-- PERFORM A NORMAL SALE WITH CARD - £28.00 --#
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    Then user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cards" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Insert Swipe Card" page shown
    And "ICCReader" page is shown
    And user selects "BMS Mastercard - Valid" from "Select Payment Card" combobox
    And user presses "Card Inserted" checkbox
    And "Processing Card" page is shown
    And "ICCReader" page is shown
    And user presses "E" button
    And "Remove Card Prompt" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    When "Transaction Basket" page is shown
    #-- PERFORM A NORMAL SALE WITH FOREIGN CURRENCY - EURO --#
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Tender Amount" page shown
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Foreign Currencies" button
    And user presses "EURO" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #-- GENERATE REPORT - FOR SELECTED PERIOD --#
    And user presses "Management" button
    And user presses "Reports" button
    And user presses "Display Reports" button and "Display Reports Select" page shown
    And user presses "Tender Totals" button and "Select Date Type Form" page shown
    And user presses "Other" button
    And user presses "Period" button and "Select Year For Period" page shown
    And user selects "${Report Year}" from "Selection List" list
    And user presses "OK" button and "Select Period" page shown
    And user selects "${Period Report}" from "Selection List" list
    And user presses "OK" button and "Display Document" page shown
    Then Following report details display in Basket
      | REPORT TITLE | TENDER TOTALS REPORT |
      | TERMINAL     | ${Terminal Number}   |
      | LOCATION     | ${Location}          |
    And user presses "OK" button and "Select Date Type Form" page shown
    And user presses "Back" button and "Display Reports Select" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
