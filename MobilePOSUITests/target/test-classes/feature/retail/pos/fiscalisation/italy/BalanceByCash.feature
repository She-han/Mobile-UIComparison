Feature: Change by Cash on Italy Fiscal POS

  @PT-5740 @Fiscalisation @Italy @FiscalItalyBalanceByCash @ManualVerification @AUTOMATED
  Scenario: Do transaction and Give Change by Cash on Italy Fiscal POS
    Given user signs on as "Italy Fiscal Sales Assistant"
    And user enters "${Product Fiscal IT 1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user enters "100.00" into "Input Box" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "Change (Cash IT)" is displayed in "Receipt" list
    And "â‚¬ 87 45" is displayed in "Receipt List" list
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
