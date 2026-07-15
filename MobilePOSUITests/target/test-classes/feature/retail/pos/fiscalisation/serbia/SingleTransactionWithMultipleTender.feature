Feature: Single Transaction with Multiple tender on Serbia fiscal printer

  @PT-1497 @SingleTransactionWithMultipleTender @No_Printer @AUTOMATED @Serbia @Fiscalisation @FiscalSerbia
  Scenario: Complete a transaction with both cash and card tender on Serbia fiscal POS
    Given user signs on as "Serbia Fiscal Sales Assistant"
    And user enters "${Product Fiscal RS 1}" into "Input Box" field
    When user presses "ENT" button
    And user enters "${Product Fiscal RS 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal RS 3}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user enters "3.00" into "Input Box" field
    And user presses "ENT" button
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
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-1530 @SingleTransactionWithMultipleTender @No_Printer @AUTOMATED @Serbia @Fiscalisation @FiscalSerbia
  Scenario: Complete a transaction with both cash and cheque tender on Serbia fiscal POS
    Given user signs on as "Serbia Fiscal Sales Assistant"
    And user enters "${Product Fiscal RS 3}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user enters "3.00" into "Input Box" field
    And user presses "ENT" button
    When user presses "Cheque" button and "Cheque Tender Options" page shown
    And user presses "Business" button and "Card Tender Amount" page shown
    And user presses "OK" button and "Cheque Signature Verification" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
 

  @PT-1531 @SingleTransactionWithMultipleTender @No_Printer @AUTOMATED @Serbia @Fiscalisation @FiscalSerbia
  Scenario: Complete a transaction with both cheque and card tender on Serbia fiscal POS
    Given user signs on as "Serbia Fiscal Sales Assistant"
    And user enters "${Product Fiscal RS 3}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "ChequeTender" button and "Cheque Tender Options" page shown
    And user presses "Business" button and "Card Tender Amount" page shown
    And user enters "3.00" into "Input Box" field
    And user presses "ENT" button
    And user presses "OK" button and "Select Tender" page shown
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
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown


    
     