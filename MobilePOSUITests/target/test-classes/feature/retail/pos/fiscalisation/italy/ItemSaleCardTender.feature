Feature: Item Sale with Card Tender on Italy Fiscal POS

  @PT-5731 @Fiscalisation @Italy @FiscalItalyItemSale @AUTOMATED @ManualVerification
  Scenario: Item sale paid with card on Italy Fiscal POS   
    Given user signs on as "Italy Fiscal Sales Assistant"
    And user enters "${Product Fiscal IT 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cards" button and "Insert Swipe Card" page shown
    And user presses "OK" button and "Insert Swipe Card" page shown
    And "ICCReader" page is shown
    And user selects "BMS Mastercard - Valid" from "Select Payment Card" combobox
    And user presses "Card Inserted" checkbox
    And "Processing Card" page is shown
    And "Enter Card Tender Amount" page is shown
    And user presses "OK" button
    And "ICCReader" page is shown
    And user presses "E" button
    And "Remove Card Prompt" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown 