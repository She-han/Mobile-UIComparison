Feature: Item Sale with Cheque Tender on Slovenia Fiscal POS

  @PT-2286 @Fiscalisation @Slovenia @FiscalSloveniaItemSalewithChequeTender @AUTOMATED @ManualVerification
  Scenario: Verify Item Sale with Cheque Tender on Slovenia Fiscal POS
    Given user signs on as "Slovenia Fiscal Sales Assistant"
    And user enters "${Product Fiscal SI 1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "ChequeTender" button and "Card Tender Amount" page shown
    And user presses "OK" button and "Enter Cheque Number" page shown
    And user enters "123456" into "Input Box" field
    And user presses "OK" button and "Enter Cheque Sort Code" page shown
    And user enters "23-1902" into "Input Box" field
    And user presses "OK" button and "Enter Cheque Account Number" page shown
    And user enters "1234567" into "Input Box" field
    And user presses "OK" button and "Cheque Signature Verification" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
