Feature: Change by Cash on Slovenia Fiscal POS

  @PT-2284 @Fiscalisation @Slovenia @FiscalSloveniaBalanceByCash @ManualVerification @AUTOMATED
  Scenario: Do transaction and Give Change by Cash on Slovenia Fiscal POS
    Given user signs on as "Slovenia Fiscal Sales Assistant"
    And user enters "${Product Fiscal SI 1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user enters "100.00" into "Input Box" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "Change (Cash SI)" is displayed in "Receipt" list
    And "€ 87 45" is displayed in "Receipt List" list
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
