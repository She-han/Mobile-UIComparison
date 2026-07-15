Feature: Item Sale with Foreign Currency (USD) on German Fiscal POS

  @PT-2172 @GermanyItemSaleWithForeignCurrency @AUTOMATED @Germany @Fiscalisation @FiscalGermany @ManualVerification
  Scenario: Item Sale with Foreign Currency (USD) on German Fiscal POS
  	Given user signs on as "Germany Fiscal Sales Assistant"
    And user enters "${Product Fiscal De 1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Foreign Currencies" button
    And user presses "USD" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown  
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
