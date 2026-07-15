Feature: Cash tender credit limit on Turkey Fiscal POS

  @PT-10687 @Fiscalisation @Turkey @FiscalTurkeyCashTenderLimit @AUTOMATED @ManualVerification
  Scenario: Verify that cash payments can be done only up to the limit set in the Cash Tender
    Given user signs on as "Turkey Fiscal Sales Assistant"
    And user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter Qty" page is shown
    And user enters "300" into "Input Box" field
    And user presses "OK" button
    And "Enter Item" page is shown
    And user enters "${Product Fiscal TR 2}" into "Input Box" field
    When user presses "Sell Item" button
    Then "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Turkey Invoice Enforced" page shown
    And user presses "Continue" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Turkey Cash Tender Limit Exceed Prompt" page shown
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user enters "6900.00" into "Input Box" field
    And user presses "OK" button
    And "Select Tender" page is shown
    And user presses "Cards" button and "Insert Swipe Card" page shown
    And "ICCReader" page is shown
    And user selects "BMS Mastercard - Valid" from "Select Payment Card" combobox
    And user presses "Card Inserted" checkbox
    And "Enter Payment Service Tender Amount" page is shown
    And user presses "OK" button
    And "Processing Card" page is shown
    And "ICCReader" page is shown
    And user presses "E" button
    And "Turkey Capture Customer Name Contact" page is shown
    And user enters "Tom" into "Customer Forename Text" field
    And user enters "Sauyer" into "Customer Surname Text" field
    And user presses "OK" button
    Then "Capture Customer Address" page is shown
    And user enters "2321" into "Customer Postcode Field" field
    And user enters "Notingham" into "Customer Address Line1 Text" field
    And user presses "OK" button and "Turkey Capture Customer Phone And Email" page shown
    And user presses "OK" button and "Turkey Customer Confirmation Details" page shown
    And user enters "112345678123" into "Tax Id" field
    And user enters "Mr" into "Turkey Customer Title" field
    And user presses "Confirm" button 
    When user presses "Close" button on external "Cash Drawer" window
    Then "Remove Card Prompt" page is shown
    And "ICCReader" page is shown
    When user presses "Card Inserted" checkbox
    And "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown