Feature: Item Sale paid in cash and change given

  @PT-1045 @Fiscalisation @Bosnia @FiscalBosniaItemSaleWithChangeGiven @No_Printer @AUTOMATED
  Scenario: Item Sale With amount paid in cash that is more than the product value
    Given user signs on as "Bosnia Fiscal Sales Assistant"
    And user enters "${Product Fiscal Ba 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user enters "10.00" into "Input Box" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "Change (Cash BA)" is displayed in "Receipt" list
    And "BAM4.00" is displayed in "Receipt List" list
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
