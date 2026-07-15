Feature: Quantity sale paid with Mix Tenders

  @PT-981 @Fiscalisation @Bosnia @No_Printer @AUTOMATED
  Scenario: Quantity Sale Paid with both Cash and Card Tenders in Bosnia POS
    Given user signs on as "Bosnia Fiscal Sales Assistant"
    And user presses "Sales" button
    And user presses "QTY Sale" button
    And "Enter Qty" page is shown
    And user enters "3" into "Input Box" field
    And user presses "OK" button
    And "Enter Item" page is shown
    And user enters "${Product Fiscal BA 1}" into "Input Box" field
    When user presses "Sell Item" button
    Then "Transaction Basket" page is shown
    And "${Product Fiscal BA 1 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user enters "BAM6.00" into "Input Box" field
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
    And user presses "Close" button on external "Cash Drawer" window
    When "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
