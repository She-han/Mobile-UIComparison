Feature: Tender with Card

  @PT-989 @No_Printer @AUTOMATED @Bosnia @Fiscalisation @FiscalBosnia
  Scenario: Complete transaction and Tender by Card on Bosnia Fiscal POS
    Given user signs on as "Bosnia Fiscal Sales Assistant"
    When user enters "${Product Fiscal BA 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal BA 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product Fiscal BA 1 Description}" is displayed in "Receipt" list
    And "${Product Fiscal BA 2 Description}" is displayed in "Receipt" list
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
    And user presses "SignOff" button
    Then "Enter User" page is shown
