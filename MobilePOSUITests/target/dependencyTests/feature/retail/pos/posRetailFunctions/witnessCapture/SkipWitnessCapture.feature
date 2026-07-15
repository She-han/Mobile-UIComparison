Feature: Skip Witness Capture

  @PT-2943 @AUTOMATED @JYSK
  Scenario: Skip witness capture - With role to skip active
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "Item Discount - Percentage Range" from "Selection List" list
    Then user presses "OK" button and "Capture Reason Witness Authorising Username" page shown
    And user presses "Skip" button and "Enter Item Discount Percentage" page shown
    And user enters "10%" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | text      | Item Discount - Percentage Ra,(-£1.80)                |
      | item      | Item Discount (Enactor-Bar Signa,-£1.80               |
      | text      | -£11.20                                               |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2944 @AUTOMATED @JYSK
  Scenario: Skip witness capture - with role to skip inactive
    Given user signs on as "Sales Assistant 3"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "Item Discount - Percentage Range" from "Selection List" list
    Then user presses "OK" button and "Capture Reason Witness Authorising Username" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "ENT" button and "Capture Reason Witness Authorising Password" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    And user enters "10%" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | text      | Item Discount - Percentage Ra,(-£1.80)                |
      | item      | Item Discount (Enactor-Bar Signa,-£1.80               |
      | text      | -£11.20                                               |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

