Feature: Give Change amount by Cash on German Fiscal POS

  @PT-2154 @GermanyFiscalChangeByCash @AUTOMATED @Germany @Fiscalisation @FiscalGermany @ManualVerification
  Scenario: Give Change amount by Cash and Complete the Transaction on German Fiscal POS
    Given user signs on as "Germany Fiscal Sales Assistant"
    And user enters "${Product Fiscal De 1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user enters "€200.00" into "Input Box" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "Change (Cash)" is displayed in "Receipt" list
    And "€57.20" is displayed in "Receipt List" list
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

