Feature: Transaction Discount

  @PT-10657 @PreSales @AUTOMATED @POS
  Scenario: Verify a transaction discount when enter an invalid employee id for Employee Discount
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "${Reason Staff Discount}" from "Selection List" list
    And user presses "OK" button and "Capture Employee Details" page shown
    And user enters "123456789" into "Capture Employee ID" field
    And user enters "SamS" into "Capture Employee First Name" field
    And user enters "Grange" into "Capture Employee Surname" field
    And user presses "OK" button and "Invalid EmployeeID message" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | ${Product 3 Description},${Product 3 Price}           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-180 @PreSales @TransactionDiscountAmount @POS @AUTOMATED @TransactionDiscount @Smoke @POSValidatedTest @POSSet2
  Scenario: Perform a Transaction Discount (Amount) and complete transaction in Cash tender
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "${Reason Transaction Discount Amount}" from "Selection List" list
    And user presses "OK" button and "Enter Transaction Discount Amount" page shown
    When user enters "20.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Transaction Discount (Amount)) -£20.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | item      | Discount (Transaction Discount,(Amount)),-£20.00      |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-255 @PreSales @TransactionDiscountPercent @POS @Dune @MVP @AUTOMATED @TransactionDiscount @POSValidatedTest @POSSet2
  Scenario: Perform a Transaction Discount (Percentage) and complete transaction in Cash tender
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "${Reason 20% Transaction Discount}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Receipt Display 20% Transaction Discount}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | text      | Discount (20% Transaction   Discount)                 |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-258 @PreSales @TransactionDiscountFixed @POS @Dune @Harrods @MVP @Support @AUTOMATED @TransactionDiscount @POSValidatedTest @POSSet2
  Scenario: Perform a Transaction Discount (Fixed) and complete transaction in Cash tender
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "${Reason Fixed Amount Discount £5}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Receipt Display Fixed Amount Discount £5}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | item      | Discount (Fixed Amount Discount,-£5.00                |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-259 @MVP @Mobile @AUTOMATED @POS @TransactionDiscount @POSValidatedTest @POSSet2
  Scenario: Add Manager Transaction Discount amount greater than the transaction total
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Manager Transaction Discount (Amount)" from "Selection List" list
    And user presses "OK" button and "Enter Transaction Discount Amount" page shown
    And user enters "25.00" into "Input Box" field
    And user presses "OK" button and "Transaction Discount Amount Too High" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    Then "Transaction Discount (Manager Transaction Discount (Amount)) -£25.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Refund                                                     |
      | item | ${Product 2 Description},${Product 2 Price}                |
      | item | ${Product 3 Description},${Product 3 Price}                |
      | item | Discount (Manager Transaction   Discount (Amount)),-£25.00 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-260 @MVP @AUTOMATED @POS @TransactionDiscount @POSValidatedTest @POSSet2
  Scenario: Add Manager Transaction Discount amount less than the transaction total
    Given user signs on as "Manager 2"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    When user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason Manager Transaction Discount Amount}" from "Selection List" list
    And user presses "OK" button and "Enter Transaction Discount Amount" page shown
    And user enters "10.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then "${Receipt Display Manager Transaction Discount Amount}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | text | Sale                                                       |
      | item | ${Product 2 Description},${Product 2 Price}                |
      | item | ${Product 3 Description},${Product 3 Price}                |
      | item | Discount (Manager Transaction   Discount (Amount)),-£10.00 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-261 @MVP @Dune @AUTOMATED @POS @TransactionDiscount @POSValidatedTest @POSSet2
  Scenario: Add Manager Transaction Discount percentage greater than 100%
    Given user signs on as "Manager 2"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    When user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason Manager Transaction Discount %}" from "Selection List" list
    And user presses "OK" button and "Enter Transaction Discount Percentage" page shown
    And user enters "101%" into "Input Box" field
    And user presses "OK" button and "Transaction Discount Percentage Too High" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    Then "${Receipt Display Manager Transaction Discount 101%}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | text | Refund                                        |
      | item | ${Product 2 Description},${Product 2 Price}   |
      | item | ${Product 3 Description},${Product 3 Price}   |
      | item | Discount (Manager Transaction   Discount (%)) |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-262 @MVP @AUTOMATED @POS @TransactionDiscount @POSValidatedTest @POSSet2
  Scenario: Add Manager Transaction Discount percentage less than 100%
    Given user signs on as "Manager 2"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    When user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason Manager Transaction Discount %}" from "Selection List" list
    And user presses "OK" button and "Enter Transaction Discount Percentage" page shown
    And user enters "50%" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then "${Receipt Display Manager Transaction Discount 50%}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | text | Sale                                          |
      | item | ${Product 2 Description},${Product 2 Price}   |
      | item | ${Product 3 Description},${Product 3 Price}   |
      | item | Discount (Manager Transaction   Discount (%)) |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-275 @AUTOMATED @POS @TransactionDiscount @POSValidatedTest @POSSet2
  Scenario: None manager users do not allow to give discounts value greater than transaction total
    Given user signs on as "POS Operator"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    When user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason Transaction Discount Amount}" from "Selection List" list
    And user presses "OK" button and "Enter Transaction Discount Amount" page shown
    And user enters "${Amount Over Highest Allowed Discount Limit}" into "Input Box" field
    And user presses "OK" button and "Transaction Discount Amount Too High" page shown
    And user presses "OK" button and "This Function Not Allowed" page shown
    And user presses "OK" button and "Enter Transaction Discount Amount" page shown
    And user enters "10.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then "${Receipt Display Transaction Discount Amount}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Sale                                               |
      | item | ${Product 2 Description},${Product 2 Price}        |
      | item | ${Product 3 Description},${Product 3 Price}        |
      | item | Discount (Transaction Discount   (Amount)),-£10.00 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-276 @AUTOMATED @POS @TransactionDiscount @POSValidatedTest @POSSet2
  Scenario: None manager users do not allow to give discount percentage greater than 100%
    Given user signs on as "POS Operator"
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "{Reason Transaction Discount %}" from "Selection List" list
    And user presses "OK" button and "Enter Transaction Discount Percentage" page shown
    And user enters "101%" into "Input Box" field
    And user presses "OK" button and "Transaction Discount Percentage Too High" page shown
    And user presses "OK" button and "This Function Not Allowed" page shown
    And user presses "OK" button and "Enter Transaction Discount Percentage" page shown
    And user enters "50%" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then "${Receipt Display Transaction Discount 50%}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Sale                                        |
      | item | ${Product 2 Description},${Product 2 Price} |
      | item | ${Product 3 Description},${Product 3 Price} |
      | item | Discount (Transaction Discount   (%))       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1409 @AUTOMATED @POS @TransactionDiscount @POSValidatedTest @POSSet2
  Scenario: None manager users do not allow to add Manager Transaction Discount Percentage without manager authorisation
    Given user signs on as "POS Operator"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    When user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason Manager Transaction Discount %}" from "Selection List" list
    And user presses "OK" button and "Enter Authorising User" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "Sign On" button and "Enter Authorising PIN" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "OK" button and "Enter Transaction Discount Percentage" page shown
    And user enters "50%" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then "${Receipt Display Manager Transaction Discount 50%}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Sale                                          |
      | item | ${Product 2 Description},${Product 2 Price}   |
      | item | ${Product 3 Description},${Product 3 Price}   |
      | item | Discount (Manager Transaction   Discount (%)) |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1410 @AUTOMATED @POS @TransactionDiscount @POSValidatedTest @POSSet2
  Scenario: None manager users do not allow to add Manager Transaction Discount Amount without manager authorisation
    Given user signs on as "POS Operator"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    When user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason Manager Transaction Discount Amount}" from "Selection List" list
    And user presses "OK" button and "Enter Authorising User" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "Sign On" button and "Enter Authorising PIN" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "OK" button and "Enter Transaction Discount Amount" page shown
    And user enters "10.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then "${Receipt Display Manager Transaction Discount Amount}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Sale                                                       |
      | item | ${Product 2 Description},${Product 2 Price}                |
      | item | ${Product 3 Description},${Product 3 Price}                |
      | item | Discount (Manager Transaction   Discount (Amount)),-£10.00 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-265 @EmployeeDiscountForTransaction @AUTOMATED @Dunelm @Harrods @MVP @Support @POS @TransactionDiscount @POSValidatedTest @POSSet2
  Scenario: Apply Employee Discount for transaction and Verify
    Given user signs on as "Sales Assistant"
    When user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    Then user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    Then user selects "${Reason Employee 20% Discount}" from "Selection List" list
    And user presses "OK" button and "Capture Employee Details" page shown
    When user enters "1" into "Capture Employee Id" field
    And user enters "Sam" into "Capture Employee First Name" field
    Then user enters "Granger" into "Capture Employee Surname" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then "${Receipt Display Employee 20% Discount}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | text      | Discount (Employee 20% Discount)                      |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1413 @POS @AUTOMATED @Regression @POSValidatedTest @POSSet2
  Scenario: Perform Transaction Discount % by Include Subsequent Items flag and sell items before applying discount
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "${Reason Transaction Discount % Include Subsequent Items}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Receipt Display Transaction Discount % Include Subsequent Items}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                                                            |
      | telephone | Tel: ${Store Phone 1}                                                                                            |
      | text      | Sale                                                                                                             |
      | item      | ${Product 1 Description},${Product 1 Price}                                                                      |
      | item      | ${Product 2 Description},${Product 2 Price}                                                                      |
      | item      | Discount (Trans Discount% -   Include Subsequent Items),${Transaction Discount % Include Subsequent 2 Items 20%} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1414 @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Perform Transaction Discount % Include Subsequent Items flag and sell items after applying discount
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "{Reason Transaction Discount % Include Subsequent Items}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Trans Discount% - Include Subsequent Items 20%) ${Transaction Discount % Include Subsequent 2 Items 20%}" is displayed in "Receipt" list
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "Transaction Discount (Trans Discount% - Include Subsequent Items 20%) ${Transaction Discount % Include Subsequent 3 Items 20%}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                                                            |
      | telephone | Tel: ${Store Phone 1}                                                                                            |
      | text      | Sale                                                                                                             |
      | item      | ${Product 1 Description},${Product 1 Price}                                                                      |
      | item      | ${Product 2 Description},${Product 2 Price}                                                                      |
      | item      | ${Product 3 Description},${Product 3 Price}                                                                      |
      | item      | Discount (Trans Discount% -   Include Subsequent Items),${Transaction Discount % Include Subsequent 3 Items 20%} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1415 @POS @AUTOMATED @Regression @POSValidatedTest @POSSet2
  Scenario: Perform Transaction Discount % without Include Subsequent Items flag and sell items before applying discount
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "${Reason Transaction Discount % Exclude Subsequent Items}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Trans Discount% - Exclude Subsequent Items" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                                                            |
      | telephone | Tel: ${Store Phone 1}                                                                                            |
      | text      | Sale                                                                                                             |
      | item      | ${Product 1 Description},${Product 1 Price}                                                                      |
      | item      | ${Product 2 Description},${Product 2 Price}                                                                      |
      | item      | Discount (Trans Discount% -   Exclude Subsequent Items),${Transaction Discount % Exclude Subsequent 2 Items 20%} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1416 @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Perform Transaction Discount % without Include Subsequent Items flag and sell items after applying discount
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Trans Discount% - Exclude Subsequent Items" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Trans Discount% - Exclude Subsequent Items 20%) ${Transaction Discount % Exclude Subsequent 2 Items 20%}" is displayed in "Receipt" list
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "Transaction Discount (Trans Discount% - Exclude Subsequent Items 20%) ${Transaction Discount % Exclude Subsequent 3 Items 20%}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                                                            |
      | telephone | Tel: ${Store Phone 1}                                                                                            |
      | text      | Sale                                                                                                             |
      | item      | ${Product 1 Description},${Product 1 Price}                                                                      |
      | item      | ${Product 2 Description},${Product 2 Price}                                                                      |
      | item      | Discount (Trans Discount% -   Exclude Subsequent Items),${Transaction Discount % Exclude Subsequent 3 Items 20%} |
      | item      | ${Product 3 Description},${Product 3 Price}                                                                      |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1762 @Dune @TransactionDiscount @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Try to add discount percentage of 0% to transaction
    Given user signs on as "POS Operator"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason Transaction Discount %}" from "Selection List" list
    Then user presses "OK" button and "Enter Transaction Discount Percentage" page shown
    And user enters "0%" into "Input Box" field
    And user presses "OK" button
    And "Percentage Value Invalid" page is shown
    And user presses "OK" button and "Enter Transaction Discount Percentage" page shown
    And user enters "10%" into "Input Box" field
    When user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Transaction Discount (%) 10%) ${Transaction Discount % 2 Items 10%}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    Then user presses "OK" button and "Transaction Signature Verification" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                       |
      | telephone | Tel: ${Store Phone 1}                                                       |
      | text      | Sale                                                                        |
      | item      | ${Product 2 Description},${Product 2 Price}                                 |
      | item      | ${Product 3 Description},${Product 3 Price}                                 |
      | item      | Discount (Transaction Discount   (%)),${Transaction Discount % 2 Items 10%} |
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1417 @AUTOMATED @POS @Regression @POSValidatedTest @POSSet2
  Scenario: Perform Transaction Discount Amount Include Subsequent Items flag and sell items before applying discount
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "${Reason Transaction Discount V Include Subsequent Items}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Trans Discount(V) - Include Subsequent Items) ${Transaction Discount V Include Subsequent 2 Items}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                                                          |
      | telephone | Tel: ${Store Phone 1}                                                                                          |
      | text      | Sale                                                                                                           |
      | item      | ${Product 1 Description},${Product 1 Price}                                                                    |
      | item      | ${Product 2 Description},${Product 2 Price}                                                                    |
      | item      | Discount (Trans Discount(V) -   Include Subsequent Items),${Transaction Discount V Include Subsequent 2 Items} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1418 @AUTOMATED @POS @Regression @POSValidatedTest @POSSet2
  Scenario: Perform Transaction Discount Amount Include Subsequent Items flag and sell items after applying discount
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason Transaction Discount V Include Subsequent Items}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Trans Discount(V) - Include Subsequent Items) ${Transaction Discount V Include Subsequent 2 Items}" is displayed in "Receipt" list
    When user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "Transaction Discount (Trans Discount(V) - Include Subsequent Items) ${Transaction Discount V Include Subsequent 3 Items}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                                                          |
      | telephone | Tel: ${Store Phone 1}                                                                                          |
      | text      | Sale                                                                                                           |
      | item      | ${Product 1 Description},${Product 1 Price}                                                                    |
      | item      | ${Product 2 Description},${Product 2 Price}                                                                    |
      | item      | ${Product 3 Description},${Product 3 Price}                                                                    |
      | item      | Discount (Trans Discount(V) -   Include Subsequent Items),${Transaction Discount V Include Subsequent 3 Items} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1421 @AUTOMATED @POS @Regression @POSValidatedTest @POSSet2
  Scenario: Perform Transaction Discount Amount without Include Subsequent Items flag and sell items after applying discount
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason Transaction Discount V Exclude Subsequent Items}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Trans Discount(V) - Exclude Subsequent Items) ${Transaction Discount V Exclude Subsequent 2 Items}" is displayed in "Receipt" list
    When user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                                                          |
      | telephone | Tel: ${Store Phone 1}                                                                                          |
      | text      | Sale                                                                                                           |
      | item      | ${Product 1 Description},${Product 1 Price}                                                                    |
      | item      | ${Product 2 Description},${Product 2 Price}                                                                    |
      | item      | Discount (Trans Discount(V) -   Exclude Subsequent Items),${Transaction Discount V Exclude Subsequent 2 Items} |
      | item      | ${Product 3 Description},${Product 3 Price}                                                                    |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1747 @Dune @TransactionDiscount @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Non manager users authorisation to give transaction discount percentage greater than 100%
    Given user signs on as "Pos Operator 3"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "Transaction Discount (%)" from "Selection List" list
    And user presses "OK" button and "Enter Transaction Discount Percentage" page shown
    When user enters "101%" into "Input Box" field
    And user presses "OK" button and "Transaction Discount Percentage Too High" page shown
    And user presses "OK" button and "Enter Authorising User" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Refund                                                |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | item      | Discount (Transaction Discount   (%))                 |
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1748 @Dune @TransactionDiscount @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Non manager users authorisation to give Amount discounts value greater than transaction total
    Given user signs on as "Pos Operator 3"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "Transaction Discount (Amount)" from "Selection List" list
    And user presses "OK" button and "Enter Transaction Discount Amount" page shown
    When user enters "${Over Limit Discount Amount}" into "Input Box" field
    And user presses "OK" button and "Transaction Discount Amount Too High" page shown
    And user presses "OK" button and "Enter Authorising User" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Refund                                                |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | item      | Discount (Transaction Discount   (Amount))            |
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2360 @POS @AUTOMATED @TransactionDiscount @POSValidatedTest @POSSet2
  Scenario: Perform a Transaction Discount Percentage with Capture Name and Address and complete transaction in Cash tender
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button
    Then "Select Reason" page is shown
    When user selects "${Reason 15% Transaction Discount With Name And Address}" from "Selection List" list
    And user presses "OK" button
    Then "Capture Customer Name" page is shown
    When user enters "${Customer 1 Name}" into "Customer Forename Text" field
    And user enters "${Customer 1 SurName}" into "Customer SurName Text" field
    And user enters "${Customer 1 Organisation}" into "Customer Organisation Text" field
    And user selects "${Customer 1 Title}" from "Customer Title DropDown" combobox
    And user enters "${Customer 1 Initials}" into "Customer Initials Text" field
    And user selects "${Customer 1 Sex}" from "Customer Sex DropDown" combobox
    And user enters "${Customer 1 DOB}" into "Customer Date Of Birth Text" field
    And user presses "OK" button
    Then "Capture Customer Address" page is shown
    When user enters "${Customer 1 Address Organisation}" into "Customer Address Organisation Text" field
    And user enters "${Customer 1 Address Line1}" into "Customer Address Line1 Text" field
    And user enters "${Customer 1 Address Line2}" into "Customer Address Line2 Text" field
    And user enters "${Customer 1 Address Line3}" into "Customer Address Line3 Text" field
    And user enters "${Customer 1 Address Town}" into "Customer Town Text" field
    And user enters "${Customer 1 Address County}" into "Customer County Text" field
    And user selects "United Kingdom" from "Customer Address Country DropDown" combobox
    And user enters "${Customer 1 Address Postcode}" into "Customer Postcode Field" field
    And user presses "OK" button
    Then "Capture Customer Phone Email" page is shown
    When user enters "${Customer 1 Contact Phone1 No}" into "Customer Phone1 Text" field
    And user enters "${Customer 1 Contact Phone2 No}" into "Customer Phone2 Text" field
    And user enters "${Customer 1 Contact Mobile Phone No}" into "Customer Mobile Text" field
    And user enters "${Customer 1 Contact Fax No}" into "Customer Fax Text" field
    And user enters "${Customer 1 Contact Email}" into "Customer Email Text Optional" field
    And user presses "Customer Internal Marketing Check Box" checkbox
    And user presses "Customer External Marketing Check Box" checkbox
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "Customer: ${Customer 1 Full Name}" is displayed in "Receipt" list
    And "Address: ${Customer 1 Full Address}" is displayed in "Receipt" list
    And "Transaction Discount (15% Trans. Disc. with Name & Address 15%)" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Customer: ${Customer 1 Name Without Title}                                   |
      | item | Address: ${Customer 1 Address Line1}, ${Customer 1 Address Line2}, ${Customer 1 Address Line3},  ${Customer 1 Address Town},  ${Customer 1 Address Postcode}, ${Customer 1 Address Country Full}|
      | text | Tel: 01295768256                                           |
      | text | Mob: 00775316921                                           |
      | item | ${Product 1 Description},${Product 1 Price}                |
      | item | ${Product 2 Description},${Product 2 Price}                |
      | item | Discount (15% Trans. Disc. with   Name & Address),${Transaction 15% Discount WIth Name And Address 2 Items}   |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-182 @Regression @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Open transaction discount %
    Given user signs on as "POS Operator"
    And user enters "${Product 17}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 18}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "{Reason Transaction Discount %}" from "Selection List" list
    And user presses "OK" button and "Enter Transaction Discount Percentage" page shown
    And user enters "18.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Transaction Discount (Transaction Discount (%) 18%)" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 17 Description},${Product 17 Price}         |
      | item      | ${Product 18 Description},${Product 18 Price}         |
      | item      | Discount (Transaction Discount   (%)),-£1.78          |
      | item      | Cash UK,-£8.12                                        |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1420 @AUTOMATED @POS @Regression @POSValidatedTest @POSSet2
  Scenario: Perform Transaction Discount Amount without Include Subsequent Items flag and sell items before applying discount
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "${Reason Transaction Discount V Exclude Subsequent Items}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Trans Discount(V) - Exclude Subsequent Items) ${Transaction Discount V Exclude Subsequent 2 Items}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                                                          |
      | telephone | Tel: ${Store Phone 1}                                                                                          |
      | text      | Sale                                                                                                           |
      | item      | ${Product 1 Description},${Product 1 Price}                                                                    |
      | item      | ${Product 2 Description},${Product 2 Price}                                                                    |
      | item      | Discount (Trans Discount(V) -   Exclude Subsequent Items),${Transaction Discount V Exclude Subsequent 2 Items} |
      | item      | Cash UK,${Tender After Discount V Exclude Subsequent 2 Items}                                                  |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1749 @Dune @MVP @Mobile @POS @AUTOMATED @TransactionDiscount @POSValidatedTest @POSSet2
  Scenario: Add a Manager Transaction Discount percentage greater than 100%
    Given user signs on as "Manager 2"
    And user enters "${Product 17}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 18}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Manager Transaction Discount (%)" from "Selection List" list
    And user presses "OK" button and "Enter Transaction Discount Percentage" page shown
    And user enters "101%" into "Input Box" field
    And user presses "OK" button and "Transaction Discount Percentage Too High" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And "Refund" is displayed in "Receipt" list
    Then "Transaction Discount (Manager Transaction Discount (%) 101%)" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Refund                                                |
      | item      | ${Product 17 Description},${Product 17 Price}         |
      | item      | ${Product 18 Description},${Product 18 Price}         |
      | item      | Discount (Manager Transaction   Discount (%)),-£9.99  |
      | item      | ${Refund Cash Tender},£0.09                           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1751 @Dune @MVP @Mobile @POS @AUTOMATED @TransactionDiscount @POSValidatedTest @POSSet2
  Scenario: Add a Manager Transaction Discount percentage equal to 100%
    Given user signs on as "Manager 2"
    And user enters "${Product 17}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 18}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "{Reason Manager Transaction Discount %}" from "Selection List" list
    And user presses "OK" button and "Enter Transaction Discount Percentage" page shown
    And user enters "100%" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Transaction Discount (Manager Transaction Discount (%) 100%)" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Transaction Basket" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 17 Description},${Product 17 Price}         |
      | item      | ${Product 18 Description},${Product 18 Price}         |
      | item      | Discount (Manager Transaction   Discount (%)),-£9.90  |
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1753 @Dune @POS @AUTOMATED @TransactionDiscount @POSValidatedTest @POSSet2
  Scenario: Non-Manager users should not be able to give discount percentage equal to 100%
    Given user signs on as "POS Operator 3"
    And user enters "${Product 17}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 18}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Max 90% - Manager Transaction Discount (%)" from "Selection List" list
    And user presses "OK" button and "Enter Authorising User" page shown
    And user enters "${Sales Assistant Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Sales Assistant Password}" into "Input Box" field
    And user presses "ENT" button and "Enter Transaction Discount Percentage" page shown
    And user enters "100%" into "Input Box" field
    When user presses "OK" button and "Transaction Discount Percentage Too High" page shown
    And user presses "OK" button and "Enter Authorising User" page shown
    And user enters "${Sales Assistant Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Sales Assistant Password}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    Then "Transaction Discount (Max 90% - Manager Transaction Discount (%) 100%)" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Transaction Basket" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}          |
      | telephone | Tel: ${Store Phone 1}                                          |
      | text      | Sale                                                           |
      | item      | ${Product 17 Description},${Product 17 Price}                  |
      | item      | ${Product 18 Description},${Product 18 Price}                  |
      | item      | Discount (Max 90% - Manager   Transaction Discount (%)),-£9.90 |
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1763 @Dune @POS @AUTOMATED @TransactionDiscount @POSValidatedTest @POSSet2
  Scenario: Validate whether the System Not Allow to Perform Transaction Discount Amount 0.00
    Given user signs on as "Pos Operator"
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    Then user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason Transaction Discount Amount}" from "Selection List" list
    And user presses "OK" button and "Enter Transaction Discount Amount" page shown
    And user enters "0.00" into "Input Box" field
    And user presses "OK" button and "Invalid Discount Amount" page shown
    And user presses "OK" button and "Enter Transaction Discount Amount" page shown
    And user enters "10.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Transaction Discount (Amount)) -£10.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Sale                                             |
      | item | ${Product 2 Description},${Product 2 Price}      |
      | item | ${Product 3 Description},${Product 3 Price}      |
      | item | Discount (Transaction Discount,(Amount)),-£10.00 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2496 @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Add Transaction Discount Percentage within the set Maximum range
    Given user signs on as "Sales Assistant"
    And user enters "${Product 17}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 18}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "${Reason Max 90% Manager Transaction Discount %}" from "Selection List" list
    And user presses "OK" button and "Enter Transaction Discount Percentage" page shown
    And user enters "70.00" into "Input Box" field
    When user presses "OK" button and "Transaction Basket" page shown
    Then "Transaction Discount (Max 90% - Manager Transaction Discount (%) 70%)" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}          |
      | telephone | Tel: ${Store Phone 1}                                          |
      | text      | Sale                                                           |
      | item      | ${Product 17 Description},${Product 17 Price}                  |
      | item      | ${Product 18 Description},${Product 18 Price}                  |
      | item      | Discount (Max 90% - Manager   Transaction Discount (%)),-£6.93 |
      | item      | Cash UK,-£2.97                                                 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-183 @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Add Transaction Discount Percentage beyond the set Maximum range
    Given user signs on as "POS Operator 3"
    And user enters "${Product 17}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 18}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Max 90% - Manager Transaction Discount (%)" from "Selection List" list
    And user presses "OK" button and "Enter Authorising User" page shown
    And user enters "${Manager 3 Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Manager 3 Password}" into "Input Box" field
    And user presses "ENT" button and "Enter Transaction Discount Percentage" page shown
    And user enters "90.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Transaction Discount (Max 90% - Manager Transaction Discount (%) 90%)" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}          |
      | telephone | Tel: ${Store Phone 1}                                          |
      | text      | Sale                                                           |
      | item      | ${Product 17 Description},${Product 17 Price}                  |
      | item      | ${Product 18 Description},${Product 18 Price}                  |
      | item      | Discount (Max 90% - Manager   Transaction Discount (%)),-£8.91 |
      | item      | Cash UK,-£0.99                                                 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2524 @POS @AUTOMATED @TransactionDiscount @POSValidatedTest @POSSet2
  Scenario: Perform transaction with discount amount disallow promotions
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    When user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "£10.00 Trans. Disc. - Disallow Promo" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (£10.00 Trans. Disc. - Disallow Promo)" is displayed in "Receipt" list
    And "${Product 1 Promotion}" is not displayed in "Receipt" list
    And "£1 Discount" is not displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}       |
      | telephone | Tel: ${Store Phone 1}                                       |
      | item      | ${Tender After Transaction Discount Disallow Promo 2 Items} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-179 @TransactionDiscount @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Perform a Transaction Discount Amount with a value within the allowed Range
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    When user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason Transaction Discount Amount Max 80%}" from "Selection List" list
    And user presses "OK" button and "Enter Transaction Discount Amount" page shown
    And user enters "${Over Limit Discount Amount}" into "Input Box" field
    And user presses "OK" button and "Transaction Discount Amount Too High" page shown
    And user presses "OK" button and "This Function Not Allowed" page shown
    And user presses "OK" button and "Enter Transaction Discount Amount" page shown
    And user enters "${Limit Discount Amount}" into "Input Box" field
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Text" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Trans. Disc. Amount Max 80%) ${Limit Discount Transaction Amount}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Sale                                             |
      | item | ${Product 1 Description},${Product 1 Price}      |
      | item | ${Product 2 Description},${Product 2 Price}      |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2495 @TransactionDiscount @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Validate Range Transaction Discount Value on the maximum limit
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    When user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason Transaction Discount Amount Max 80%}" from "Selection List" list
    And user presses "OK" button and "Enter Transaction Discount Amount" page shown
    And user enters "${Limit Discount Amount}" into "Input Box" field
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Text" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Trans. Disc. Amount Max 80%) ${Limit Discount Transaction Amount}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | text | Sale                                                                          |
      | item | ${Product 1 Description},${Product 1 Price}                                   |
      | item | ${Product 2 Description},${Product 2 Price}                                   |
      | item | Discount (Trans. Disc. Amount   Max 80%),${Limit Discount Transaction Amount} |
      | item | Cash UK,${Tender After Transaction Discount AMount Max 80%}                   |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1750 @Dune @TransactionDiscount @POS @AUTOMATED @Mobile @POSValidatedTest @POSSet2
  Scenario: Add Manager Transaction Fixed Amount Discount amount greater than the transaction total
    Given user signs on as "Manager 2"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "${Reason Manager Fixed Amount Discount £30}" from "Selection List" list
    And user presses "OK" button and "Transaction Discount Amount Too High" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Receipt Display Manager Fixed Amount Discount £30} ${Transaction Manager Fixed Amount Discount 2 Items £30}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | text | Refund                                      |
      | item | ${Product 1 Description},${Product 1 Price} |
      | item | ${Product 2 Description},${Product 2 Price} |
      | item | ${Transaction Manager Fixed Amount Discount 2 Items £30}                 |
      | item | ${Refund Cash Tender},${Tender After Manager Fixed Amount Discount 2 Items £30}                        |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1754 @Dune @TransactionDiscount @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Verify that non-manager user requires authorisation to give discounts value matching the transaction total
    Given user signs on as "Pos Operator 3"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    When user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "Manager Trans. Disc. Amt Limit 80%" from "Selection List" list
    And user presses "OK" button and "Enter Authorising User" page shown
    And user enters "${Manager 4 Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Manager 4 Password}" into "Input Box" field
    And user presses "OK" button and "Enter Transaction Discount Amount" page shown
    And user enters "${Over Limit Discount Amount 2}" into "Input Box" field
    And user presses "OK" button and "Transaction Discount Amount Too High" page shown
    And user presses "OK" button and "Enter Authorising User" page shown
    And user enters "${Manager 4 Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Manager 4 Password}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "Transaction Discount (Manager Trans. Disc. Amt Limit 80%)" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Transaction Basket" page shown
    Then receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price}             |
      | item | ${Product 3 Description},${Product 3 Price}             |
      | item | Discount (Manager Trans. Disc.   Amt Limit 80%),-£15.00 |
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2518 @POS @AUTOMATED @ManualVerification @POSValidatedTest @POSSet2
  Scenario: Perform Transaction Discount Amount with capture reference
    Given user signs on as "Pos operator"
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 2}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "${Reason Transaction Discount With REF}" from "Selection List" list
    Then user presses "OK" button and "Enter Quote Reference" page shown
    When user enters "1234" into "Input Box" field
    Then user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | Discount (£15.00 Transaction   Discount with REF)     |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2520 @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Perform Transaction Discount Amount with Capture Name and Address
    Given user signs on as "Pos operator"
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 2}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "${Reason £10 Transaction Discount With Name And Address}" from "Selection List" list
    Then user presses "OK" button and "Capture Customer Name" page shown
    And user enters "${Customer 1 Name}" into "Customer Forename Text" field
    And user enters "${Customer 1 SurName}" into "Customer SurName Text" field
    And user enters "${Customer 1 Organisation}" into "Customer Organisation Text" field
    And user selects "${Customer 1 Title}" from "Customer Title DropDown" combobox
    And user enters "${Customer 1 Initials}" into "Customer Initials Text" field
    And user selects "${Customer 1 Sex}" from "Customer Sex DropDown" combobox
    And user enters "${Customer 1 DOB}" into "Customer Date Of Birth Text" field
    And user presses "OK" button and "Capture Customer Address" page shown
    And user enters "${Customer 1 Address Organisation}" into "Customer Address Organisation Text" field
    And user enters "${Customer 1 Address Line1}" into "Customer Address Line1 Text" field
    And user enters "${Customer 1 Address Line2}" into "Customer Address Line2 Text" field
    And user enters "${Customer 1 Address Line3}" into "Customer Address Line3 Text" field
    And user enters "${Customer 1 Address Town}" into "Customer Town Text" field
    And user enters "${Customer 1 Address County}" into "Customer County Text" field
    And user selects "United Kingdom" from "Customer Address Country DropDown" combobox
    And user enters "${Customer 1 Address Postcode}" into "Customer Postcode Field" field
    And user presses "OK" button and "Capture Customer Phone Email" page shown
    And user enters "${Customer 1 Contact Phone1 No}" into "Customer Phone1 Text" field
    And user enters "${Customer 1 Contact Phone2 No}" into "Customer Phone2 Text" field
    And user enters "${Customer 1 Contact Mobile Phone No}" into "Customer Mobile Text" field
    And user enters "${Customer 1 Contact Fax No}" into "Customer Fax Text" field
    And user enters "${Customer 1 Contact Email}" into "Customer Email Text Optional" field
    And user presses "Customer Internal Marketing Check Box" checkbox
    And user presses "Customer External Marketing Check Box" checkbox
    And user presses "OK" button and "Transaction Basket" page shown
    And "Customer: ${Customer 1 Full Name}" is displayed in "Receipt" list
    And "Address: 1 Enactor House Bluecoats Avenue Hertford1 Hertford SG141PB" is displayed in "Receipt" list
    And "Transaction Discount (£10.00 Trans. Disc. with Name & Address)" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Customer: ${Customer 1 Name Without Title}                                     |
      | item | Address: ${Customer 1 Address Line1}, ${Customer 1 Address Line2}, ${Customer 1 Address Line3},  ${Customer 1 Address Town},  ${Customer 1 Address Postcode}, ${Customer 1 Address Country Full}|
      | text | Tel: 01295768256                                           |
      | text | Mob: 00775316921                                           |
      | item | ${Product 1 Description},${Product 1 Price}                |
      | item | ${Product 2 Description},${Product 2 Price}                |
      | text | Discount (£10.00 Trans. Disc.   with Name & Address)       |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2521 @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Perform Transaction Discount Amount with discount reason in Active date range
    Given user signs on as "Pos operator"
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 2}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "${Reason £12 Transaction Discount Active Date}" from "Selection List" list
    Then user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}     |
      | telephone | Tel: ${Store Phone 1}                                     |
      | text      | Sale                                                      |
      | item      | ${Product 1 Description},${Product 1 Price}               |
      | item      | ${Product 2 Description},${Product 2 Price}               |
      | item      | Discount (£12.00 Trans. Discount   - Active Date),-£12.00 |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2522 @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Verify that Transaction Discount Amount with Expired Reason date range is not displayed in reasons
    Given user signs on as "Pos operator"
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And "£25.00 Trans. Discount - Expired Date" is not displayed in "Selection list" list
    And user presses "Cancel" button and "Discount Cancelled Press Ok to Continue" page shown
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2523 @POS @AUTOMATED @ManualVerification @POSValidatedTest @POSSet2
  Scenario: Perform Transaction Discount Amount with Capture Details
    Given user signs on as "Pos operator"
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "{Reason £15 Transaction Discount Capture Details}" from "Selection List" list
    And user presses "OK" button and "Capture Discount Details" page shown
    And user enters "Test Note" into "Notes Text" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | text      | Discount (£15.00 Trans. Disc. -   Capture Details)    |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2361 @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Perform Transaction Discount Percentage with discount reason in Active date range
    Given user signs on as "POS Operator"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason 25% Transaction Discount Active Date}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    Then "${Receipt Display 25% Transaction Discount Active Date}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                                          |
      | telephone | Tel: ${Store Phone 1}                                                                          |
      | text      | Sale                                                                                           |
      | item      | ${Product 1 Description},${Product 1 Price}                                                    |
      | item      | ${Product 2 Description},${Product 2 Price}                                                    |
      | item      | Discount (25% Trans. Discount -   Active Date),${Transaction 25% Discount_Active_Date_2_Items} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2363 @POS @AUTOMATED @ManualVerification @POSValidatedTest @POSSet2
  Scenario: Verify that Transaction Discount Percentage with Expired Reason date range is not displayed in reasons
    Given user signs on as "POS Operator"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And "${Reason 50% Transaction Discount Expired Date}" is not displayed in "Selection List" list
    And user presses "Cancel" button and "Discount Cancelled Press Ok to Continue" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2364 @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Verify that Transaction Discount Percentage with Expired Reason date range is not displayed in reasons
    Given user signs on as "Pos operator"
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And "${Reason 50% Item Discount Expired Reason Date}" is not displayed in "Selection List" list
    And user presses "Cancel" button and "Discount Cancelled Press Ok to Continue" page shown
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2566 @POS @AUTOMATED @ManualVerification @POSValidatedTest @POSSet2
  Scenario: Perform Transaction Discount Percentage with Capture Details
    Given user signs on as "Pos operator"
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason 20% Transaction Discount Capture Details}" from "Selection List" list
    And user presses "OK" button and "Capture Discount Details" page shown
    And user enters "Test Note" into "Notes Text" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | text      | Discount (20% Trans. Disc. -   Capture Details)       |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2358 @POS @AUTOMATED @TransactionDiscount @POSValidatedTest @POSSet2
  Scenario: Perform Transaction Discount Percentage which has discount set with Disallow Promotions
    Given user signs on as "Pos Operator"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    When user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason 10% Transaction Discount Disallow Promo}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    Then "${Receipt Display 10% Transaction Discount Disallow Promo}" is displayed in "Receipt" list
    And "${Product 1 Promotion}" is not displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Discount (10% Trans. Disc. -   Disallow Promo)        |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2353 @POS @AUTOMATED @ManualVerification @POSValidatedTest @POSSet2
  Scenario: Perform Transaction Discount Percentage with capture reference
    Given user signs on as "Pos operator"
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 2}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "${Reason 25% Transaction Discount With REF}" from "Selection List" list
    Then user presses "OK" button and "Enter Quote Reference" page shown
    When user enters "ID006" into "Input Box" field
    Then user presses "OK" button and "Transaction Basket" page shown
    And "${Receipt Display 25% Transaction Discount With REF}" is displayed in "Receipt" list
    And "REF 25%)" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | Discount (25% Transaction   Discount with REF)        |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1775 @AUTOMATED @POS @POSValidatedTest @POSSet2
  Scenario: Verify multiple reasons are listed when proceeding with transaction discount
    Given user signs on as "POS Operator"
    When user enters "${Product 2}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    When user presses "Discount / Overrides" button
    Then user presses "Transaction Discount" button and "Select Reason" page shown
    And "${Reason 10% Transaction Discount}" is displayed in "Selection List" list
    And "${Reason 20% Transaction Discount}" is displayed in "Selection List" list
    And "${Reason Range Transaction Discount %}" is displayed in "Selection List" list
    And "${Reason 10% Off}" is displayed in "Selection List" list
    And "${Reason 20% Off}" is displayed in "Selection List" list
    And user selects "${Reason 10% Off}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Product 2 description}" is displayed in "Receipt" list
    And "${Receipt Display 10% Off}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Sale                                        |
      | item | ${Product 2 Description},${Product 2 Price} |
      | item | Discount (10 % Off)                         |
      | item | Cash UK,${Tender After 10% Off 1 Items}     |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-10845 @AUTOMATED @POS @POSValidatedTest @POSSet2
  Scenario: Perform a Transaction Discount (Amount) with reason selected by pressing enter key on onscreen number pad
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason Transaction Discount Amount}" from "Selection List" list
    When user presses "ENT" button and "Enter Transaction Discount Amount" page shown
    And user enters "12.50" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Transaction Discount (Transaction Discount (Amount)) -£12.50" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           | 
      | telephone | Tel: ${Store Phone 1}                                                           | 
      | text      | Sale                                                                            | 
      | item      | ${Product 1 Description},${Product 1 Price}                                     | 
      | item      | ${Product 2 Description},${Product 2 Price}                                     | 
      | item      | Discount (Transaction Discount   (Amount)),${Discount Amount}                   |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-19509 @AUTOMATED @POS
  Scenario: Verify that the Transaction Discount is not applied with Discountable product (voided) and non-discountable product in the basket
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product Discount Disallowed}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user selects "${Product 2 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    And user presses "Item Void" button and "Select Reason" page shown
    And user selects "Item Faulty" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason 10% Transaction Discount}" from "Selection List" list
    And user presses "OK" button and "Transaction Discount Not Allowed" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | text      | Sale                                                                            |
      | item      | ${Product Discount Disallowed Description},${Product Discount Disallowed Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-19510 @AUTOMATED @POS
  Scenario: Verify that Transaction Discount is applied with a Discountable product and a non-discountable product (voided) in the basket
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product Discount Disallowed}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user selects "${Product Discount Disallowed Description}" from "Receipt" list
    Then "Modify Item" page is shown
    And user presses "Item Void" button and "Select Reason" page shown
    And user selects "Item Faulty" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason 10% Transaction Discount}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}  |
      | telephone | Tel: ${Store Phone 1}                                  |
      | text      | Sale                                                   |
      | item      | ${Product 2 Description},${Product 2 Price}            |
      | item      | Discount (10% Transaction   Discount)                  |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-19511 @AUTOMATED @POS
  Scenario: Verify that Transaction Discount is not applied with a Discountable product and a non-discountable product in the basket
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product Discount Disallowed}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "${Reason 10% Transaction Discount}" from "Selection List" list
    And user presses "OK" button and "Not All Items Applicable Message" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}  													|
      | telephone | Tel: ${Store Phone 1}                                  													|
      | text      | Sale                                                   													|
      | item      | ${Product 2 Description},${Product 2 Price}                                     |
      | item      | ${Product Discount Disallowed Description},${Product Discount Disallowed Price} |
      | item      | Discount (10% Transaction   Discount)                                           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown