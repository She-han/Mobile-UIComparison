Feature: Change by Cash on Croatia Fiscal POS

  @PT-2249 @Fiscalisation @Croatia @FiscalCroatiaBalanceByCash @ManualVerification @AUTOMATED
  Scenario: Do transaction and Give Change by Cash on Croatia Fiscal POS
    Given user signs on as "Croatia Fiscal Sales Assistant"
    And user enters "${Product Fiscal HR 1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user enters "100.00" into "Input Box" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "Change (Cash HR)" is displayed in "Receipt" list
    And "HRK 69 50" is displayed in "Receipt List" list
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
