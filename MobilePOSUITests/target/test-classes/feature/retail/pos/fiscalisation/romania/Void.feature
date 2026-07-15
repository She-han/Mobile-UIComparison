Feature: Item and Transaction Void

  @PT-954 @RomaniaFIscalItemVoid @No_Printer @AUTOMATED @Romania @Fiscalisation @FiscalRomania
  Scenario: Verify Item Void
    Given user signs on as "Romania Fiscal Sales Assistant"
    And user enters "${Product Fiscal RO 2}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${Product Fiscal RO 3}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${Product Fiscal RO 4}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Voids" button
    And user presses "Item Void" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Item Faulty" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-955 @RomaniaFIscalTransactionVoid @No_Printer @AUTOMATED @Romania @Fiscalisation @FiscalRomania
  Scenario: Verify Transaction Void
    Given user signs on as "Romania Fiscal Sales Assistant"
    And user enters "${Product Fiscal RO 1}" into "Input Box" field
    When user presses "ENT" button
    Given user enters "${Product Fiscal RO 2}" into "Input Box" field
    When user presses "ENT" button
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    And "Enter User" page is shown
