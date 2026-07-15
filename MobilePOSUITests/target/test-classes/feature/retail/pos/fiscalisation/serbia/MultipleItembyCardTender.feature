Feature: Multiple item transaction by card tender

  @PT-1482 @No_Printer @AUTOMATED @Serbia @Fiscalisation @FiscalSerbia
  Scenario: Verify the Fiscal Receipt for Multiple products by Card tender on Serbia Fiscal Printer
    Given user signs on as "Serbia Fiscal Sales Assistant"
    And user enters "${Product Fiscal RS 1}" into "Input Box" field
    When user presses "ENT" button
    And user enters "${Product Fiscal RS 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal RS 3}" into "Input Box" field
    And user presses "ENT" button
    And "${Product Fiscal RS 1 Description}" is displayed in "Receipt" list
    And "${Product Fiscal RS 2 Description}" is displayed in "Receipt" list
    And "${Product Fiscal RS 3 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
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

 
