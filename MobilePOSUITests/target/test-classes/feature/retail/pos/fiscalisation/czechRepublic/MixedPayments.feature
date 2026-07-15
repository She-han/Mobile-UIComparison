Feature: Mixed payments on CzechRepublic Fiscal POS

  @PT-2209 @Fiscalisation @CzechRepublic @FiscalCzechRepublicMixedPayments @AUTOMATED @ManualVerification
  Scenario: Verify Mixed payments are allowed on Czech Fiscal POS
    Given user signs on as "Czech Republic Fiscal Sales Assistant"
    And user enters "${Product Fiscal CZ 3}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user enters "CZK2000.00" into "Input Box" field   
    And user presses "ENT" button 
    And "Enter Cash Tender Amount" page is shown
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
		Then "Await Drawer Closed" page is shown
		And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown