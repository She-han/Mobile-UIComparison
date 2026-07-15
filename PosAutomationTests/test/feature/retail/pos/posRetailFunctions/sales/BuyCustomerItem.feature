Feature: Buy Customer Item
  To test buying the Customer's Item

  @PT-5509 @AUTOMATED @POS @ToBeFixedAutTest
  Scenario: Buy a customer's item from a new customer
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    When user presses "Buy Customer Item" button and "Capture Customer Name" page shown
    Then user enters "${Buy From Customer 1 Name}" into "Customer Forename Text" field
    And user enters "${Buy From Customer 1 Surname}" into "Customer Surname Text" field
    And user selects "${Buy From Customer 1 Title}" from "Customer Title Dropdown" combobox
    And user enters "${Buy From Customer 1 Initials}" into "Customer Initials Text" field
    And user selects "${Buy From Customer 1 Sex}" from "Customer Sex Dropdown" combobox
    And user enters "${Buy From Customer 1 DOB}" into "Customer Date of Birth Text" field
    When user presses "OK" button
    Then "Capture Customer Address" page is shown
    When user presses "Postcode Lookup" button and "Address Search by Postcode" page shown
    Then user enters "${Buy From Customer 1 Address Postcode}" into "Input Box" field
    When user presses "OK" button and "Select Address by Postcode" page shown
    Then user selects "${Buy From Customer 1 Address Organisation}" from "Selection List" list
    When user presses "OK" button and "Capture Customer Address Prompt" page shown
    Then "Customer Address Organisation Text" field displays the text "${Buy From Customer 1 Address Organisation}"
    And "Customer Address Line1 Text" field displays the text "${Buy From Customer 1 Address Line1}"
    And "Customer Address Line2 Text" field displays the text "${Buy From Customer 1 Address Line2}"
    And "Customer Address Line3 Text" field displays the text "${Buy From Customer 1 Address Line3}"
    And "Customer Town Text" field displays the text "${Buy From Customer 1 Address Town}"
    And "Customer County Text" field displays the text "${Buy From Customer 1 Address County}"
    And "Customer Postcode" field displays the text "${Buy From Customer 1 Address Postcode}"
    When user presses "OK" button and "Capture Customer Phone Email" page shown
    Then user enters "${Buy From Customer 1 Phone1_No}" into "Customer Phone1 Text" field
    And user enters "${Buy From Customer 1 Phone2_No}" into "Customer Phone2 Text" field
    And user enters "${Buy From Customer 1 Mobile_NO}" into "Customer Mobile Text" field
    And user presses "OK" button and "Buy From Customer Quantity Entry" page shown
    When user presses "MMG Search" icon button
    Then "Buy From Customer Select MMG" page is shown
    And user enters "Col" into "Input Box" field
    And user selects "Cologne Gift Sets (All Regions)" from "MMG Group List" list
    When user presses "Select" button and "Buy From Customer Quantity Entry" page shown
    Then user enters "New Cologne Set" into "Buy From Customer Description" field
    And user enters "5" into "Buy From Customer Quantity" field
    And user enters "1000" into "Buy From Customer Cost Price" field
    And user enters "1200" into "Buy From Customer Retail Price" field
    When user presses "Confirm" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | New Cologne Set,5 @,-£10.00                           |
      | text      | Customer: ${Buy From Customer 1 Name Without Title}   |
      | address   | ${Buy From Customer 1 Address}                        |
      | text      | Tel: ${Buy From Customer 1 Phone1_No}                 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-5510 @AUTOMATED @POS @ToBeFixedAutTest
  Scenario: Buy a customer's item from an existing customer
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    When user presses "Buy Customer Item" button and "Capture Customer Name" page shown
    And user presses "Search By Postcode" button and "Enter Post Code" page shown
    Then user enters "${Customer 1 Address Postcode}" into "Input Box" field
    When user presses "OK" button and "Select Customer Postcode" page shown
    Then user selects "${Customer 1 Name}" from "Selection List" list
    When user presses "OK" button and "Confirm Customer" page shown
    Then "Confirm Customer Forename Text" field displays the text "${Customer 1 Name}"
    And "Confirm Customer Surname Text" field displays the text "${Customer 1 Surname}"
    And "Confirm Customer Email Text" field displays the text "${Customer 1 Email}"
    And "Confirm Customer Address Line1 Text" field displays the text "${Customer 1 Address Line1}"
    And "Confirm Customer Address Line2 Text" field displays the text "${Customer 1 Address Line2}"
    And "Confirm Customer Town Text" field displays the text "${Customer 1 Address Town}"
    And "Confirm Customer County Text" field displays the text "${Customer 1 Address County}"
    And "Confirm Customer Postcode" field displays the text "${Customer 1 Address Postcode}"
    When user presses "Confirm" button and "Buy From Customer Quantity Entry" page shown
    And user presses "MMG Search" icon button
    And "Buy From Customer Select MMG" page is shown
    Then user enters "Cos" into "Input Box" field
    And user selects "Cosmetics (All Regions)" from "MMG Group List" list
    When user presses "Select" button and "Buy From Customer Quantity Entry" page shown
    Then user enters "New Girls Dress" into "Buy From Customer Description" field
    And user enters "5" into "Buy From Customer Quantity" field
    And user enters "1000" into "Buy From Customer Cost Price" field
    And user enters "1200" into "Buy From Customer Retail Price" field
    When user presses "Confirm" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | New Girls Dress,5 @,-£10.00                           |
      | text      | Customer: ${Customer 1 Name Without Title}   |
      | address   | ${Customer 1 Address}                        |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
