Feature: Voiding a transaction on Serbia fiscal pos
     
  @PT-1492 @No_Printer @AUTOMATED @Serbia @Fiscalisation @FiscalSerbia
  Scenario: Verify voiding a transaction on Serbia fiscal pos
    Given user signs on as "Serbia Fiscal Sales Assistant"
    And user enters "${Product Fiscal RS 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal RS 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal RS 3}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "End Transaction Continue" page shown
    When user presses "OK" button and "Empty Basket" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
 