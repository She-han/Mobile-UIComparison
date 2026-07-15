Feature: Item Promotion Sale Slovenia

@PT-2806 @Fiscalisation @Slovenia @No_Printer @AUTOMATED
  Scenario: Item Promotion Sale - Amount Discount - with included product in Slovenia Fiscal POS
    Given user signs on as "Slovenia Fiscal Sales Assistant"
    When user enters "${Product Fiscal SI 5}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product Fiscal SI 5 Description}" is displayed in "Receipt" list
    And "${Product Fiscal SI 5 Price}" is displayed in "Receipt" list
    And "${Product Fiscal SI 5 Promotion Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
