Feature: Item Set Promotions

@PT-1011 @Fiscalisation @Bosnia @No_Printer @AUTOMATED
  Scenario: Item Set Promotion - Amount Discount - with included product in Bosnia Fiscal POS
    Given user signs on as "Bosnia Fiscal Sales Assistant"
    When user enters "${Product Fiscal BA 3}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product Fiscal BA 3 Description}" is displayed in "Receipt" list
    And "${Product Fiscal BA 3 Price}" is displayed in "Receipt" list
    And "${Product Fiscal BA 3 Promotion Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
