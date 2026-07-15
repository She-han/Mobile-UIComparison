Feature: Item Return of a single item sale

  @PT-17373 @Fiscalisation @France @FiscalFranceReturnItem @No_Printer @AUTOMATED
  Scenario: Item Return of a single item sale
    Given user signs on as "France Fiscal Sales Assistant"
    And user presses "Returns" button
    And user presses "Return Item" button and "Enter Authorising User" page shown
    And user enters "${Sales Assistant Username}" into "Input Box" field
    And user presses "Sign On" button and "Enter Authorising Pin" page shown
    And user enters "${Sales Assistant Password}" into "Input Box" field
    And user presses "OK" button and "Enter Return Item" page shown
    And user enters "${Product Fiscal Fr 1}" into "Input Box" field
    And user presses "Return Item" button and "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    And "Enter User" page is shown