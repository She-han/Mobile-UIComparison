Feature: Sale with Multiple Tenders on Turkey Fiscal POS

  @PT-10779 @Fiscalisation @Turkey @FiscalTurkeySaleWithMultipleTenders @AUTOMATED @ManualVerification
  Scenario: Verify multiple tender transaction
    Given user signs on as "Turkey Fiscal Sales Assistant"
    And user enters "${Product Fiscal TR 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user enters "10.00" into "Input Box" field
    And user presses "OK" button and "Select Tender" page shown
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
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown