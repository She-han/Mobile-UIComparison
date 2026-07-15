Feature: Item Sale with Mix Tender on Slovenia Fiscal POS

  @PT-2805 @Fiscalisation @Slovenia @FiscalSloveniaItemSalewithMixTenders @ManualVerification @AUTOMATED 
  Scenario: Verify Item Sale with Mix Tender on Slovenia Fiscal POS
    Given user signs on as "Slovenia Fiscal Sales Assistant"
    And user enters "${Product Fiscal SI 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user enters "10.00" into "Input Box" field   
    And user presses "ENT" button 
    And "Enter Cash Tender Amount" page is shown  
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
    And "Await Drawer Closed" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
