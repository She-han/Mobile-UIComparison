Feature: Normal sale with multiple items
    
  @PT-17361 @Fiscalisation @France @FiscalFranceSaleWithMultipleItem @No_Printer @AUTOMATED
  Scenario: Normal sale with multiple items
    Given user signs on as "France Fiscal Sales Assistant"
    And user enters "${Product Fiscal Fr 1}" into "Input Box" field
    When user presses "ENT" button
    And user enters "${Product Fiscal Fr 2}" into "Input Box" field
    When user presses "ENT" button
    And user enters "${Product Fiscal Fr 3}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
