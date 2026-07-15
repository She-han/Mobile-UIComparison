Feature: Reprinting of a normal sale with single item

  @PT-17376 @Fiscalisation @France @FiscalFranceReprintArchive @No_Printer @AUTOMATED
  Scenario: Reprinting of a normal sale with single item
    Given user signs on as "France Fiscal Sales Assistant"
    And user enters "${Product Fiscal Fr 2}" into "Input Box" field
    When user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    # waits for transaction to appear &proccess in EM
    And user waits "100" seconds
    Given user presses "Sales" button
    When user presses "Receipts" button
    And user presses "Copy Receipt" button and "Enter Original Transaction Id" page shown
    When user presses "Search" button and "Enter Original Transaction Details" page shown
    When user presses "Search" button and "Select Transaction Details" page shown
    When user presses "Select" button and "Confirm Print Transaction" page shown
    And user presses "Print" button and "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown