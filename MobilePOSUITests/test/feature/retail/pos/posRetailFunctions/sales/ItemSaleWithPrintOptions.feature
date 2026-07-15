Feature: Item Sale with print options

  @PT-476 @PreSales @AUTOMATED @Dune @MVP
  Scenario: Perform a Sale and proceed with Print Only receipt option
    Given user signs on as "Manager 2"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Receipt Destination Selection" page shown
    When user presses "Print Only" button and "Transaction Basket" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | Cash UK,-£28.00                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-11442 @AUTOMATED @POS
  Scenario: Perform transaction without printing and complete the transaction when printer is not connected to POS
    Given user signs on as "Sales Assistant"
    And "Primary Printer" page is shown
    And user presses "Error" icon button
    And "Transaction Basket" page is shown
    When user enters "${Product_1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    Then user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Print Error" page shown
    And user presses "Continue without Printing" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Primary Printer" page is shown
    And user presses "Error" icon button
    And "Primary Printer" page is shown
    And user presses "Clear" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-10628 @AUTOMATED @NotForWeeklyRegression @POS
  Scenario: Perform a sale and proceed with Email Only - Amend an invalid email address
    Given user signs on as "Sales Assistant"
    And template "AUT_RETAIL_FIXED_POS_EMAIL_TEMPLATE" is set for the current POS
    When user enters "${Product_1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Receipt Destination Selection" page shown
    And user presses "Email Only" button and "Capture Email" page shown
    And user waits "3" seconds
    And user enters "enactor.testgmailcom" into "Capture Email Text" field
    And user presses "OK" button and "Popup Modal Ok" page shown
    And user presses "OK" button
    And "Capture Email" page is shown
    And user enters "enactor.test@gmail.com" into "Capture Email Text" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-10629 @AUTOMATED @NotForWeeklyRegression @POS
  Scenario: Perform a sale and proceed with Print & Email - Amend an invalid email address
    Given user signs on as "Sales Assistant"
    And template "AUT_RETAIL_FIXED_POS_EMAIL_TEMPLATE" is set for the current POS
    When user enters "${Product_1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Receipt Destination Selection" page shown
    And user presses "Email and Print" button and "Capture Email" page shown
    And user enters "enactor.testgmailcom" into "Capture Email Text" field
    And user presses "OK" button and "Popup Modal Ok" page shown
    And user presses "OK" button
    And "Capture Email" page is shown
    And user enters "enactor.test@gmail.com" into "Capture Email Text" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},£18.00                       |
      | text      | ${Product 1 Promotion}                                |
      | text      | Promotion Saving                                      |
      | text      | ${Product 1 Promotion}                                |
      | text      | -£3.00                                                |
      | item      | Total Tax,£3.00                                       |
      | text      | Total                                                 |
      | text      | £18.00                                                |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
