Feature: Normal multiple item sale with promotion
    
  @PT-17383 @Fiscalisation @France @FiscalFrancePromotion @No_Printer @AUTOMATED
  Scenario: Normal multiple item sale with promotion
    Given user signs on as "France Fiscal Sales Assistant"
    And user enters "${Product Fiscal Fr 1}" into "Input Box" field
    When user presses "ENT" button
    When user enters "${Product Fiscal Fr 6}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product Fiscal Fr 6 Description}" is displayed in "Receipt" list
    And "${Product Fiscal Fr 6 Price}" is displayed in "Receipt" list
    And "${Product Fiscal Fr 6 Promotion Description}" is displayed in "Receipt" list
    When user enters "${Product Fiscal Fr 5}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product Fiscal Fr 5 Description}" is displayed in "Receipt" list
    And "${Product Fiscal Fr 5 Price}" is displayed in "Receipt" list
    And "${Product Fiscal Fr 5 Promotion Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
