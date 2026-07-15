 Feature: Item Sale with Foreign Currency on Slovenia Fiscal POS

  @PT-2279 @Fiscalisation @Slovenia @ItemSalewithForeignCurrency @AUTOMATED @ManualVerification 
  Scenario: Verify Item Sale with Foreign Currencies (GBP) on Slovenia Fiscal POS
  	Given user signs on as "Slovenia Fiscal Sales Assistant"
    And user enters "${Product Fiscal SI 1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Foreign Currencies" button and "Select Tender" page shown
    And user presses "GBP" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown