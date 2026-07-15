@ItemSale @Fiscalisation @Turkey @FiscalTurkeyItemSale @AUTOMATED @ManualVerification
Feature: Item Sale on Turkey Fiscal POS

  @PT-10781 @Fiscalisation @Turkey @FiscalTurkeyItemSaleCard @AUTOMATED @ManualVerification
  Scenario: Verify that a card transaction can be successfully completed
    Given user signs on as "Turkey Fiscal Sales Assistant"
    And user enters "${Product Fiscal TR 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cards" button and "Insert Swipe Card" page shown
    And "ICCReader" page is shown
    And user selects "BMS Mastercard - Valid" from "Select Payment Card" combobox
    And user presses "Card Inserted" checkbox
    And "Enter Payment Service Tender Amount" page is shown
    And user presses "OK" button
    And "Processing Card" page is shown
    And "ICCReader" page is shown
    And user presses "E" button
    And "Remove Card Prompt" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    When "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-10609 @Fiscalisation @Turkey @FiscalTurkeyItemSaleCash @AUTOMATED @ManualVerification
  Scenario: Verify the Single item Sale receipt
    Given user signs on as "Turkey Fiscal Sales Assistant"
    And user enters "${Product Fiscal TR 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-10615 @Fiscalisation @Turkey @FiscalTurkeyItemSaleForeignCurrency @AUTOMATED @ManualVerification
  Scenario: Verify Item Sale with foreign currency
    Given user signs on as "Turkey Fiscal Sales Assistant"
    And user enters "${Product Fiscal TR 2}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Foreign Currency" button and "Select Tender" page shown
    And user presses "GBP" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-10614 @AUTOMATED @Turkey @Fiscalisation @ManualVerification @FiscalTurkeyItemSaleGiftCard
  Scenario: Verify Item Sale with gift card: Change by cash
    Given user signs on as "Turkey Fiscal Sales Assistant"
    And user enters "${Product Fiscal TR 2}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Card" button and "Get Gift card number" page shown
    And user enters "9526300701201120128" into "Input Box" field    
    And user presses "OK" button and "Card Tender Amount" page shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
		And "Enter User" page is shown
