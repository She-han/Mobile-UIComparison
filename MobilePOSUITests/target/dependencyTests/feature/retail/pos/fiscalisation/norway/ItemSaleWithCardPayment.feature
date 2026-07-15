Feature: Sale using card payment

  @PT-2493 @Fiscalisation @Norway @FiscalNorwaySaleWithCardPayment @No_Printer @AUTOMATED
  Scenario: Sale of an item using card payment
    Given user signs on as "Norway Fiscal Sales Assistant"
    And user enters "${Product Fiscal No 1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cards" button and "Insert Swipe Card" page shown
    And "ICCReader" page is shown
    And user selects "BMS Mastercard - Valid" from "Select Payment Card" combobox
    And user presses "Card Inserted" checkbox
    And "Card Tender Amount" page is shown
    And user presses "OK" button
    And "ICCReader" page is shown
    And user presses "E" button
    And "Remove Card Prompt" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown