Feature: Give Change amount by Cash on Czech Fiscal POS

  @PT-2207 @CzechRepublicFiscalChangeByCash @AUTOMATED @CzechRepublic @Fiscalisation @FiscalCzechRepublic @ManualVerification
  Scenario: Give Change amount by Cash and Complete the Transaction on Czech Fiscal POS
    Given user signs on as "Czech Republic Fiscal Sales Assistant"
    And user enters "${Product Fiscal CZ 1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user enters "CZK30.00" into "Input Box" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "Change (Cash CZ)" is displayed in "Receipt" list
    And "9 45 CZK" is displayed in "Receipt List" list
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

