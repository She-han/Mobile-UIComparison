Feature: Item Sale with Cheque Tender on Croatia Fiscal POS

  @PT-2245 @Fiscalisation @Croatia @FiscalCroatiaItemSalewithChequeTender @AUTOMATED @ManualVerification
  Scenario: Verify Item Sale with Cheque Tender on Croatia Fiscal POS
    Given user signs on as "Croatia Fiscal Sales Assistant"
    And user enters "${Product Fiscal HR 1}" into "Input Box" field
    When user presses "ENT" button
    And user enters "${Product Fiscal HR 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cheque" button and "Cheque Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
