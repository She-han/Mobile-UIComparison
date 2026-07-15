Feature: Reprint Recent

  @PT-861 @Fiscalisation @Norway @FiscalNorwayReprintRecent @No_Printer @AUTOMATED
  Scenario: Reprint Recent
    Given user signs on as "Norway Fiscal Sales Assistant"
    And user enters "${Product Fiscal No 2}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    Given user presses "Sales" button
    When user presses "Receipts" button
    And user presses "Reprint Recent" button and "Reprint Recent Select Transaction" page shown
    And user selects "Erik" from "Selection List" list
    And user presses "OK" button
    Then "Confirm Print Transaction" page is shown
    When user presses "Print" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
