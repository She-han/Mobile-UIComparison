Feature: Item Sale with Card Tender on Czech Fiscal POS

  @PT-2201 @Fiscalisation @CzechRepublic @FiscalCzechRepublicItemSale @AUTOMATED @ManualVerification
  Scenario: Item sale paid with card on Czech Fiscal POS   
    Given user signs on as "Czech Republic Fiscal Sales Assistant"
    And user enters "${Product Fiscal CZ 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cards" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Insert Swipe Card" page shown
    And "ICCReader" page is shown
    And user selects "BMS Mastercard - Valid" from "Select Payment Card" combobox
    And user presses "Card Inserted" icon button
    And "Processing Card" page is shown
    And "ICCReader" page is shown
    And user presses "E" button
    And "Remove Card Prompt" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" icon button
    Then "Transaction Basket" page is shown
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown 