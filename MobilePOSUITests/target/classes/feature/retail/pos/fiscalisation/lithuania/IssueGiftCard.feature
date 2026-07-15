Feature: Print Fiscal Gift Card Receipt - Lithuania
    
  @PT-14891 @LithuaniaFiscalReceipt @Fiscalisation @Lithuania @AUTOMATED @IssueGiftCard @ManualVerification
  Scenario: Lithuania - Verify that issuing a gift card generates a receipt with the correct gift card ID, tender, and VAT/tax information
    Given user signs on as "Lithuania Fiscal Sales Assistant"
    And user presses "Gift Cards" button
    And user presses "New Gift Card" button and "Get Gift Card Number" page shown
    And user enters "${Lithuania New Gift Card Number}" into "Input Box" field
    And user presses "OK" button and "Issue Gift Card Main" page shown
    And user enters "${Lithuania New Gift Card Amount}" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button