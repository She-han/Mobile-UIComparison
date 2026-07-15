Feature: Item Sale with Foreign Currencies (Euro) on Czech Fiscal POS

  @PT-2214 @CzechRepublicItemSaleWithForeignCurrency @AUTOMATED @CzechRepublic @Fiscalisation @ManualVerification
  Scenario: Verify Item Sale with Foreign Currencies (Euro) on Czech Fiscal POS
    Given user signs on as "Czech Republic Fiscal Sales Assistant"
    And user enters "${Product Fiscal CZ 1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Foreign Currencies" button
    And user presses "EURO" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown  
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
