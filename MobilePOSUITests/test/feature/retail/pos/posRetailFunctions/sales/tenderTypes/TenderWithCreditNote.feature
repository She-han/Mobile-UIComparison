Feature: Tender With Credit Notes

  @PT-323 @PreSales @Regression @POS @AUTOMATED @ToBeFixedAutTest
  Scenario: Redeem Credit Note – Verify Authorization
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    When user presses "Credit Note" button and "Credit Note Enter Serial Number" page shown
    And user enters "${Credit Note Serial Number 1}" into "Input Box" field
    And user presses "ENT" button and "Credit Note Redemption Error" page shown
    And user presses "OK" button and "Credit Note Enter Serial Number" page shown
    And user enters "${Credit Note Serial Number 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | Credit Note UK,-£18.00                                |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-335 @PreSales @TobeFixedAutTest @Dunelm @MVP @POS @AUTOMATED
  Scenario: Redeem Credit Note and Cash
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    When user presses "Credit Note" button and "Enter Serial Number" page shown
    And user enters "${Credit Note Serial Number 3}" into "Input Box" field
    And user presses "ENT" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | Credit Note UK,-£20.00                                |
      | item      | Cash UK,-£8.00                                        |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-336 @PreSales @ManualVerification @Dunelm @MVP @POS @AUTOMATED @ToBeFixedAutTest
  Scenario: Redeem Credit Note – Change Credit Note Authorization
    Given user signs on as "Manager 4"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Vouchers" button
    When user presses "Credit Note" button and "Credit Note Enter Serial Number" page shown
    And user enters "${Credit Note Serial Number 4}" into "Input Box" field
    And user presses "ENT" button and "Confirm Issue Change" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | Credit Note UK,-£18.00                                |
      | item      | Change (Credit Note UK),£8.00                         |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
