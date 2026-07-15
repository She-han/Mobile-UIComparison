Feature: Price Override Down

  @PT-856 @Fiscalisation @Norway @FiscalNorwayPriceOverrideDown @No_Printer @AUTOMATED
  Scenario: Price Override Down
    Given user signs on as "Norway Fiscal Sales Assistant"
    And user enters "${Product Fiscal No 1}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Price Override" button and "Select Basket Item" page shown
    And user selects "${Product Fiscal No 1 Description}" from "Selection List" list
    And user presses "OK" button
    Then "Select Reason" page is shown
    When user selects "Price Override Down" from "Selection List" list
    And user presses "OK" button
    Then "Enter Price Override Amount" page is shown
    When user enters "9.00" into "Input Box" field
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    Given "Price Override Down (${Product Fiscal No 1 Price} to NOK 9,00)" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
