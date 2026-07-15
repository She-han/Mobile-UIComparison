Feature: Print Fiscal Top-up Gift Card Receipt - Lithuania
    
  @PT-14893 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @TopUpGiftCard @ManualVerification
  Scenario: Lithuania - Verify that the top-up gift card functionality generates a receipt with the correct gift card ID, top-up amount, tender details and VAT/tax information
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user presses "Sales" button
    And user presses "Gift Cards" button
    And user presses "Gift Card Top Up" button and "Enter Authorising User" page shown
    And user enters "${Sales Assistant Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Sales Assistant Password}" into "Input Box" field
    And user presses "ENT" button and "Get Gift Card Number" page shown
    And user enters "${Lithuania Test Gift Card Number}" into "Input Box" field
    And user presses "OK" button and "Issue Gift Card Main" page shown
    And user enters "${Lithuania Test Gift Card Amount}" into "Input Box" field
    And user presses "OK" button and "Recovery Window" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button