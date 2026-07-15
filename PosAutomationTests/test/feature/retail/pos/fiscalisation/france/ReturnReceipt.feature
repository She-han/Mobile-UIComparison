Feature: Return of a receipt

  @PT-17375 @Fiscalisation @France @FiscalFranceReturnItem @No_Printer @AUTOMATED
  Scenario: Return of a receipt
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
    # waits for transaction to appear &proccess in EM
    And user waits "100" seconds
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Authorising User" page shown
    And user enters "${Sales Assistant Username}" into "Input Box" field
    When user presses "Sign On" button and "Enter Authorising Pin" page shown
    And user enters "${Sales Assistant Password}" into "Input Box" field
    When user presses "OK" button and "Enter Original Transaction Id" page shown
    When user presses "Search" button and "Enter Original Transaction Details" page shown
    When user presses "Search" button and "Select Transaction Details" page shown
    When user presses "Select" button and "Extended Return Details" page shown
    And user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt Prompt" page is shown
    When user presses "OK" button and "Select Reason" page shown
    And user selects "Damaged / Faulty (30 Days)" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Select Return Tender" page shown
    And user selects "Cash FR" from "Selection List" list 
    And "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    And "Enter User" page is shown