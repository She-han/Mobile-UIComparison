 Feature: Item Sale with Foreign Currency on Croatia Fiscal POS

  @PT-2254 @Fiscalisation @Croatia @ItemSalewithForeignCurrency @AUTOMATED @ManualVerification 
  Scenario: Verify Item Sale with Foreign Currencies (Euro) on Croatia Fiscal POS
 
    Given user signs on as "Croatia Fiscal Sales Assistant"
    And user enters "${Product Fiscal HR 1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Foreign Currencies" button and "Select Tender" page shown
    And user presses "EURO" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown