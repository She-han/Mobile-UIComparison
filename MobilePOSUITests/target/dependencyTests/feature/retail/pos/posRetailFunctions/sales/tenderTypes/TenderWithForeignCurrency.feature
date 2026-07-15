Feature: Tender With Foreign Currency

  @PT-1019 @POS @Regression @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Part Tender by Euro
    Given user signs on as "Pos Operator"
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 3 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Tender Amount" page shown
    And user enters "1.00" into "Input Box" field
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Foreign Currencies" button
    And user presses "EURO" button and "Get Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 3 Description}, ${Product 3 Price}          |
      | item      | Cash UK,-£1.00                                        |
      | item      | Euro Cash UK,€8.18 @ 1.635 €/£,-£5.00                 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-887 @PreSales @POS @Regression @AUTOMATED @Dunelm @Dune @POSValidatedTest @POSSet3
  Scenario: Tender with Foreign Currency
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Foreign Currencies" button
    When user presses "EURO" button and "Get Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "${Product 2 Price Euro}" is displayed in "Receipt" list
    And "${Exchange Rate Euro To GBP}" is displayed in "Receipt" list
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                                   |
      | telephone | Tel: ${Store Phone 1}                                                                   |
      | text      | Sale                                                                                    |
      | item      | ${Product 2 Description}, ${Product 2 Price}                                            |
      | item      | Euro Cash UK,${Product 2 Price Euro} @ ${Exchange Rate Euro To GBP},-${Product 2 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-11509 @POS @AUTOMATED @Sprint-41
  Scenario: Performing a sale with less than the minimum tender amount set for foreign currency
    Given user signs on as "Sales Assistant"
    When user enters "${Product 2}" into "Input Box" field
    Then user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Foreign Currencies" button
    When user presses "EURO SCOTLAND" button and "Get Tender Amount" page shown
    And user enters "2.00" into "Input Box" field
    And user presses "OK" button and "Invalid Denomination Amount" page shown
    And user presses "OK" button and "Get Tender Amount" page shown
    And user enters "20.00" into "Input Box" field
    Then user presses "OK" button and "Await Drawer Closed" page shown
    And "€20.00" is displayed in "Receipt" list
    And "${Exchange Rate Euro To GBP}" is displayed in "Receipt" list
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}               |
      | telephone | Tel: ${Store Phone 1}                                               |
      | text      | Sale                                                                |
      | item      | ${Product 2 Description}, ${Product 2 Price}                        |
      | item      | Euro Cash UK Scotland,€20.00 @ ${Exchange Rate Euro To GBP},-£12.23 |
    And user presses "Close" button on external "Cash Drawer" window
    When "Transaction Basket" page is shown
    Then user presses "SignOff" button
    And "Enter User" page is shown
