Feature: Transaction with different tax rate

  @PT-1491 @No_Printer @AUTOMATED @Serbia @Fiscalisation @FiscalSerbia
  Scenario: Verify the Fiscal Receipt has differnt tax rate symbol on Serbia Fiscal Printer
    Given user signs on as "Serbia Fiscal Sales Assistant"
    And user enters "${Product Fiscal RS 1}" into "Input Box" field
    When user presses "ENT" button
    And user enters "${Product Fiscal RS 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal RS 3}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product Fiscal RS 4}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
