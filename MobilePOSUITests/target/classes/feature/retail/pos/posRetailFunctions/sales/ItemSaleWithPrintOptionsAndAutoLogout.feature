Feature: Item Sale with print options and auto logout
  Sale item - with print options and auto logout

  @PT-1157 @ItemSaleWithPrintOptionsAndAutoLogout @PrintOptionsAndAutoLogoutConfig @AUTOMATED
  Scenario: Verify that Pos displays launch screen, receipt options and automatically signs out after sale
    Given "Enter User" page is shown
    And user enters "${Sales Assistant 2 Username}" into "User Name Text" field
    When user enters "${Sales Assistant 2 Password}" into "Password Text" field
    And user presses "ENT" button
    And "Launch Screen" page is shown
    And user presses "Launch Screen Sell Button" icon button
    And "Transaction Basket" page is shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Select Receipt Destination" page shown
    Then user presses "Print Only" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | text      | Cash UK                                -£12.00        |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Enter User" page is shown

  @PT-477 @ItemSaleWithEmailOnlyAndAutoLogout @PrintOptionsAndAutoLogoutConfig @AUTOMATED @Dune @MVP @RI
  Scenario: Item Sale With Receipt Destination - Email Only
    Given "Enter User" page is shown
    And user enters "${Sales Assistant 2 Username}" into "User Name Text" field
    When user enters "${Sales Assistant 2 Password}" into "Password Text" field
    And user presses "ENT" button
    And "Launch Screen" page is shown
    And user presses "Launch Screen Sell Button" icon button
    And "Transaction Basket" page is shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Select Receipt Destination" page shown
    Then user presses "Email Only" button and "Capture Email" page shown
    When user enters "enactor.test@gmail.com" into "Capture Email Text" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Enter User" page is shown

  @PT-478 @ItemSaleWithEmailPrintOptionsAndAutoLogout @PrintOptionsAndAutoLogoutConfig @AUTOMATED @Dune @MVP @RI
  Scenario: Item Sale With Receipt Destination - Email and Print Only
    Given "Enter User" page is shown
    And user enters "${Sales Assistant 2 Username}" into "User Name Text" field
    When user enters "${Sales Assistant 2 Password}" into "Password Text" field
    And user presses "ENT" button
    And "Launch Screen" page is shown
    And user presses "Launch Screen Sell Button" icon button
    And "Transaction Basket" page is shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Select Receipt Destination" page shown
    Then user presses "Email and Print" button and "Capture Email" page shown
    When user enters "enactor.test@gmail.com" into "Capture Email Text" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | Cash UK,-£12.00                                       |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Enter User" page is shown
