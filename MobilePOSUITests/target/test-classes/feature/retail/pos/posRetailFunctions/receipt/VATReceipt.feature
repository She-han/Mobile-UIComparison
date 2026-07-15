Feature: VAT Receipt

  @PT-1164 @PreSales @POS @AUTOMATED @VATReceipt @POSValidatedTest @POSSet3
  Scenario: Verify that pressing VAT receipt prints the tax details on the receipt
    Given user signs on as "Manager 2"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    Then "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 1 Price}" is displayed in "Receipt" list
    When user presses "Sales" button
    And user presses "Receipts" button
    And user presses "VAT Receipt" button
    Then "Tax Printed Message" page is shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    #		Note: below tax breakdown is with config: Item price excludes the tax
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | text      | Tax Breakdown                                         |
      | item      | VAT,${Product 1 Vat Net Value},${Product 1 Vat Tax Value}                                     |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
