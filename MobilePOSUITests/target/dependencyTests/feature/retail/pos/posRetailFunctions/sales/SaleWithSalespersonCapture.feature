Feature: Sale with Salesperson Capture

  @PT-12027 @POS @Sale @AUTOMATED @Regression
  Scenario: Verify clearing Salesperson assignment
    Given user signs on as "Manager 2"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    When user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Assign To SalesPerson" button and "Select Sales Person" page shown
    And user selects "INVENTORY0069" from "Selection List" list
    And user presses "OK" button and "Concession Product List Screen" page shown
    And user selects "1" from "Selection List" list
    And user presses "Select" button
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Assign To SalesPerson" button and "Select Sales Person" page shown
    And user selects "AM1" from "Selection List" list
    And user presses "OK" button and "Concession Product List Screen" page shown
    And user selects "2" from "Selection List" list
    And user presses "Select" button
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Clear SalesPerson" button and "Concession Product List Screen" page shown
    And user selects "2" from "Selection List" list
    And user presses "Select" button
    And user presses "OK" button
    And "Confirm Removal Message" page is shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Assign To SalesPerson" button and "Select Sales Person" page shown
    And user selects "BO_TEST_USER_01" from "Selection List" list
    And user presses "OK" button and "Concession Product List Screen" page shown
    And user selects "2" from "Selection List" list
    And user presses "Select" button
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
    
  @PT-1149 @SaleWithSalespersonCaptureFromInputField @POS @AUTOMATED @SaleWithSalespersonCapture
  Scenario: Capture salesperson from ID input during a sale
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "Salesperson" button
    Then "Enter Sales Person" page is shown
    When user presses "Cancel" button
    Then "Transaction Basket" page is shown
    When user presses "Sales" button
    And user presses "Salesperson" button
    Then "Enter Sales Person" page is shown
    When user enters "${Supervisor Username}" into "Input Box" field
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Salesperson:  ${Supervisor Name}                      |
      | item      | ${Product 1 Description},${Product 1 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-527 @SaleWithSalespersonCaptureFromList @POS @AUTOMATED @SaleWithSalespersonCapture
  Scenario: Capture salesperson from selection list during a sale
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "Salesperson" button
    Then "Enter Sales Person" page is shown
    And user selects "${SALES_PERSON_ID}" from "Selection List" list
    And user presses "Down" button
    And user presses "Down" button
    And user presses "Up" button
    And user selects "${Sales Assistant Username}" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Salesperson:  ${Sales Assistant Name}                 |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1864 @Dune @AUTOMATED @POS @TobeFixedAutTest
  Scenario: POS - Commission - Verify that one sales person can be assigned on the transaction
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "Salesperson" button and "Enter Sales Person" page shown
    When user enters "${Supervisor Username}" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user enters "${Style Size Product 1 Size 2 SKU}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | text      | Salesperson:  ${Supervisor Name}                            |
      | item | ${Style Size Product 1 Description},${Style Size Product 1 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1865 @Dune @AUTOMATED @POS
  Scenario: POS - Commission - Verify that another sales person can be assigned to the sale on a transaction
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "Salesperson" button and "Enter Sales Person" page shown
    And user selects "${Sales Assistant Username}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button
    And user presses "Salesperson" button and "Enter Sales Person" page shown
    And user selects "${POS Operator Username}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button
    And "Enter Cash Tender Amount" page is shown
    And user presses "OK" button
    And "Await Drawer Closed" page is shown 
    And receipt display with following details
      | text | Salesperson:  ${Sales Assistant Name}       |
      | item | ${Product 1 Description},${Product 1 Price} |
      | text | Salesperson:  ${POS Operator Name}          |
      | item | ${Product 2 Description},${Product 2 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1866 @Dune @AUTOMATED @POS
  Scenario: POS- Commission - Verify that multiple sales persons can be assigned to the sale on a transaction
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "Salesperson" button and "Enter Sales Person" page shown
    And user selects "${Sales Assistant Username}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button
    And user presses "Salesperson" button and "Enter Sales Person" page shown
    And user selects "${POS Operator Username}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Sales" button
    And user presses "Salesperson" button and "Enter Sales Person" page shown
    And user selects "${POS Operator 2 Username}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button
    And "Enter Cash Tender Amount" page is shown
    And user presses "OK" button
    And "Await Drawer Closed" page is shown 
    And receipt display with following details
      | text | Salesperson:  ${Sales Assistant Name}       |
      | item | ${Product 2 Description},${Product 2 Price} |
      | text | Salesperson:  ${POS Operator Name}          |
      | item | ${Product 3 Description},${Product 3 Price} |
      | text | Salesperson:  ${POS Operator 2 Name}        |
      | item | ${Product 1 Description},${Product 1 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1867 @Dune @AUTOMATED @Regression
  Scenario: POS - Commission - Verify that an item in the transaction can be reassigned to another sales person
    Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "Salesperson" button and "Enter Sales Person" page shown
    And user selects "${Sales Assistant Username}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field   
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Assign To SalesPerson" button and "Select Sales Person" page shown
    And user selects "${POS Operator Surname}" from "Selection List" list
    And user presses "OK" button and "Concession Product List Screen" page shown
    And user selects "2" from "Selection List" list
    And user presses "Select" button
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    Then receipt display with following details
      | text | Salesperson:  ${Sales Assistant Name}       |
      | item | ${Product 1 Description},${Product 1 Price} |
      | text | Salesperson:  ${POS Operator Name}          |
      | item | ${Product 2 Description},${Product 2 Price} |
      | text | Salesperson:  ${Sales Assistant Name}       |
      | item | ${Product 3 Description},${Product 3 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1868 @Dune @AUTOMATED
  Scenario: POS - Commission - Verify that an item in the transaction can be removed from the sales person
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    And user presses "Salesperson" button and "Enter Sales Person" page shown
    And user selects "${Sales Assistant Username}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "Salesperson" button and "Enter Sales Person" page shown
    And user selects "${POS Operator Username}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "Salesperson" button and "Enter Sales Person" page shown
    And user selects "${Sales Assistant Username}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user selects "${Product 2}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Remove Salesperson" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Salesperson:  ${Sales Assistant Name}       |
      | item | ${Product 1 Description},${Product 1 Price} |
      | text | Salesperson:  ${POS Operator Name}          |
      | item | ${Product 3 Description},${Product 3 Price} |
      | text | Salesperson:  ${Sales Assistant Name}       |
      | item | ${Product 1 Description},${Product 1 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-23155 @POSSalesPersonCapture @Regression @POS
  Scenario: Verify Salesperson assignment to a Gift Card Product
    Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "Salesperson" button
    Then "Enter Sales Person" page is shown
    When user enters "${Supervisor Username}" into "Input Box" field
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button
    And user presses "Gift Cards" button
    And user presses "New Gift Card" button and "Get Gift Card Number" page shown
    And user enters "${Gift Card number 21}" into "Input Box" field
    And user presses "OK" button and "Issue Gift Card Main" page shown
    And user enters "5.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Salesperson:  ${Supervisor Name}                      |
      | item      | ${Product 1 Description},${Product 1 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-23157 @POSSalesPersonCapture @Regression @POS
  Scenario: Verify Salesperson assignment to a Service Product
    Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "Salesperson" button
    Then "Enter Sales Person" page is shown
    When user enters "${Supervisor Username}" into "Input Box" field
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user enters "${Service Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}       |
      | telephone | Tel: ${Store Phone 1}                                       |
      | text      | Salesperson:  ${Supervisor Name}                            |
      | item      | ${Service Product 1 Description}                            |
      | item      | ${Service Product 1 Price}                                  |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-23160 @POSSalesPersonCapture @Regression @POS
  Scenario: Verify Salesperson assignment to a Fee Product
    Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "Salesperson" button
    Then "Enter Sales Person" page is shown
    When user enters "${Supervisor Username}" into "Input Box" field
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button
    When user presses "QTY Sale" button
    And "Enter QTY" page is shown
    And user enters "1" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "${Fee Product 1}" into "Input Box" field
    And user presses "Sell Item" button and "Select Basket Item" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}       |
      | telephone | Tel: ${Store Phone 1}                                       |
      | text      | Salesperson:  ${Supervisor Name}                            |
      | item      | ${Fee Product 1 Description}                            |
      | item      | ${Fee Product 1 Price}                                  |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
