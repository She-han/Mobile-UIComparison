Feature: Item Discount

  @PT-391 @PreSales @ItemDiscountAmount @POS @ItemDiscount @AUTOMATED @POSValidatedTest @POSSet2 @TPE-9490
  Scenario: Perform an Amount Discount for an Item
    Given user signs on as "Sales Assistant"
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user selects "${Product 2 Description}" from "Receipt List" list
    Then "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "Manager Item Discount (Amount)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Amount" page shown
    Then user enters "5.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Manager Item Discount (Amount) -£5.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | text      | Manager Item Discount (Amount)                        |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (HD Complexion,-£5.00                   |
      #| item      | Item Discount (Manager Item Discount,-£5.00           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-257 @PreSales @ItemDiscountPercent @POS @ItemDiscount @AUTOMATED @Dune @Smoke @POSValidatedTest @POSSet2 @TPE-9490 
  Scenario: Perform a Percentage Discount for an Item
    Given user signs on as "Sales Assistant"
    When user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user selects "${Product 3 Description}" from "Receipt List" list
    Then "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "20% Item Discount" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "20% Item Discount 20% -£1.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      #Commented due to failing script casued by PLAT-16359
      #| item      | ${Product 3 Description},${Product 3 Price}          |
      #| text      | 20% Item Discount 20%                                |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (A-1),-£1.00                            |
      #| item      | Item Discount (20% Item Discount),-£1.00              |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-253 @PreSales @ItemDiscountFixed @POS @ItemDiscount @AUTOMATED @Dune @POSValidatedTest @POSSet2 @TPE-9490
  Scenario: Perform a Fixed Amount Discount for an Item
    Given user signs on as "Sales Assistant"
    When user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user selects "${Product 3 Description}" from "Receipt List" list
    Then "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "Fixed Amount Discount" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Fixed Amount Discount -£5.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      #Commented due to failing script casued by PLAT-16359
      #| item      | ${Product 3 Description},${Product 3 Price}          |
      #| text      | Fixed Amount Discount                                |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (A-1),-£5.00                            |
      #| item      | Item Discount (Fixed Amount Discount,-£5.00           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-256 @PreSales @Dune @MVP @RI @AUTOMATED @POS @ItemDiscount @POSValidatedTest @POSSet2 @TPE-9490
  Scenario: Add Manager Item Discount Percentage to an Item
    Given user signs on as "Manager 2"
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 3 Description}" from "Receipt List" list
    And "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "Manager Item Discount (%)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    And user enters "50%" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Manager Item Discount (%) 50% -£2.50" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price} |
      | item | ${Product 3 Description},${Product 3 Price} |
      | text | Manager Item Discount (%) 50%               |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item | Item Discount (A-1),-£2.50                  |
      #| item | Item Discount (Manager Item Discount,-£2.50 |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1406 @PreSales @AUTOMATED @Dune @POS @ItemDiscount @POSValidatedTest @POSSet2 @TPE-9490
  Scenario: Try to add Manager Item Discount Percentage greater than 100%
    Given user signs on as "Manager 2"
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 3 Description}" from "Receipt List" list
    And "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "Manager Item Discount (%)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    And user enters "150%" into "Input Box" field
    And user presses "OK" button
    Then "Item Discount Percentage Too High" page is shown
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    And user presses "Cancel" button and "Discount Cancelled" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-184 @PreSales @ItemDiscount @AUTOMATED @Dunelm @Harrods @Harrods_Sanity @Support @POS @Dune @POSValidatedTest @POSSet2
  Scenario: Perform Manager Transaction Discount with manually entering the Discount Percentage
    Given user signs on as "Sales Assistant"
    When user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user selects "${Product 3 Description}" from "Receipt List" list
    Then "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "Manager Item Discount (%)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    When user enters "15" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "Manager Item Discount (%) 15% -£0.75" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | item      | Manager Item Discount (%) 15%                         |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (A-1),-£0.75                            |
      #| item      | Item Discount (Manager Item Discount,-£0.75           |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-254 @PreSales @AUTOMATED @POS @Dune @MVP @ItemDiscount @POSValidatedTest @POSSet2 @TPE-9490
  Scenario: Apply Open Discount Value for Item through Discount / Overrides button and Verify
    Given user signs on as "Manager 2"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Merchandise Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket item" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "Manager Item Discount (Amount)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Amount" page shown
    And user enters "100.00" into "Input Box" field
    And user presses "ENT" button and "Item Discount Amount Too High" page shown
    And user presses "OK" button and "Enter Item Discount Amount" page shown
    And "Manager Item Discount (Amount)" is not displayed in "Receipt" list
    And user enters "10.00" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "Manager Item Discount (Amount) -£10.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}               |
      | telephone | Tel: ${Store Phone 1}                                               |
      | text      | Sale                                                                |
      | item      | ${Product 2 Description},${Product 2 Price}                         |
      | item      | ${Merchandise Product 1 Description},${Merchandise Product 1 Price} |
      | item      | Manager Item Discount (Amount)                                      |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (${Merchandise Product 1 Description},-£10.00         |
      #| item      | Item Discount (Manager Item Discount,-£10.00                        |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-263 @AUTOMATED @POS @Dunelm @MVP @ItemDiscount @POSValidatedTest @POSSet2 @TPE-9490
  Scenario: Apply Employee Discount for Item through Discount / Overrides button and Verify
    Given user signs on as "Manager 2"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Merchandise Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket item" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "Employee 20% Discount" from "Selection List" list
    And user presses "OK" button and "Capture Employee Details" page shown
    And user enters "1" into "Capture Employee ID" field
    And user enters "Sam" into "Capture Employee First Name" field
    And user enters "Granger" into "Capture Employee Surname" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Employee 20% Discount 20% -£4.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}               |
      | telephone | Tel: ${Store Phone 1}                                               |
      | text      | Sale                                                                |
      | item      | ${Product 2 Description},${Product 2 Price}                         |
      | item      | ${Merchandise Product 1 Description},${Merchandise Product 1 Price} |
      | item      | Employee 20% Discount                                               |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (${Merchandise Product 1 Description}),-£4.00         |
      #| item      | Item Discount (Employee 20% Discount,-£4.00                         |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1741 @Dune @ItemDiscount @ItemDiscountFixed @POS @AUTOMATED @POSValidatedTest @POSSet2 @TPE-9490
  Scenario: Perform multiple Percentage Discounts for Items in basket
    Given user signs on as "Sales Assistant"
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 2 Description}" from "Receipt List" list
    And "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "Manager Item Discount (%)" from "Selection List" list
    When user presses "OK" button and "Enter Item Discount Percentage" page shown
    And user enters "10" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user selects "${Product 3 Description}" from "Receipt List" list
    Then "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "Manager Item Discount (%)" from "Selection List" list
    When user presses "OK" button and "Enter Item Discount Percentage" page shown
    And user enters "15" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    Then user presses "OK" button and "Transaction Signature Verification" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | text      | Manager Item Discount (%) 15%                         |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | text      | Manager Item Discount (%) 10%                         |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (HD Complexion Sta,-£1.00               |
      | item      | Item Discount (A-1),-£0.75                            |
      #| item      | Item Discount (Manager Item Disc,-£1.00               |
      #| item      | Item Discount (Manager Item Disc,-£0.75               |
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1742 @Dune @ItemDiscount @ItemDiscountFixed @POS @AUTOMATED @POSValidatedTest @POSSet2 @TPE-9490
  Scenario: Perform multiple Fixed Amount Discount for Items in basket
    Given user signs on as "Sales Assistant"
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 3 Description}" from "Receipt List" list
    And "Modify Item" page is shown
    When user presses "Item Discount" button and "Select Reason" page shown
    And user selects "Fixed Amount Discount" from "Selection List" list
    Then user presses "OK" button and "Transaction Basket" page shown
    And "Fixed Amount Discount" is displayed in "Receipt" list
    And "-£5.00" is displayed in "Receipt" list
    And user selects "${Product 2 Description}" from "Receipt List" list
    And "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "Fixed Amount Discount" from "Selection List" list
    When user presses "OK" button and "Transaction Basket" page shown
    And "Fixed Amount Discount" is displayed in "Receipt" list
    And "-£5.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    Then user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | text      | Fixed Amount Discount                                 |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (A-1),-£5.00                            |
      | item      | Item Discount (HD Complexion Starter,-£5.00           |
      #| item      | Item Discount (Fixed Amount Discount,-£5.00           |
      #| item      | Item Discount (Fixed Amount Discount,-£5.00           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1760 @AUTOMATED @POS @Dune @ItemDiscount @POSValidatedTest @POSSet2
  Scenario: Try to add Item Discount value of 0 to item
    Given user signs on as "Sales Assistant"
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 3 Description}" from "Receipt List" list
    And "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    When user selects "Manager Item Discount (Amount)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Amount" page shown
    And user enters "0.00" into "Input Box" field
    And user presses "OK" button and "Invalid Zero Discount Amount" page shown
    And user presses "OK" button and "Enter Item Discount Amount" page shown
    And user enters "5.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | Manager Item Discount (Amount)                        |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (${Product 3 Description}),-£5.00       |
      #| item      | Item Discount (Manager Item Discount,-£5.00           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1761 @AUTOMATED @POS @Dune @ItemDiscount @POSValidatedTest @POSSet2 @TPE-9490
  Scenario: Try to add Item Discount Percentage of 0% to item
    Given user signs on as "Sales Assistant"
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 3 Description}" from "Receipt List" list
    And "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    When user selects "Manager Item Discount (%)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    And user enters "0%" into "Input Box" field
    And user presses "OK" button and "Invalid Discount Percentage" page shown
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    And user enters "10%" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | Manager Item Discount (%) 10%                         |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (${Product 3 Description}),-£0.50       |
      #| item      | Item Discount (Manager Item Discount,-£0.50           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1740 @Dune @ItemDiscount @ItemDiscountFixed @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Perform a Percentage Discount and Fixed Amount Discount for Items in basket
    Given user signs on as "Sales Assistant"
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 2 Description}" from "Receipt List" list
    And "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "Manager Item Discount (%)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    When user enters "15" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Manager Item Discount (%) 15% -£1.50" is displayed in "Receipt" list
    And user selects "${Product 3 Description}" from "Receipt List" list
    Then "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "Fixed Amount Discount" from "Selection List" list
    When user presses "OK" button and "Transaction Basket" page shown
    And "Fixed Amount Discount -£5.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    Then user presses "OK" button and "Transaction Signature Verification" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | text      | Fixed Amount Discount                                 |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | Manager Item Discount (%) 15%                         |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (HD Complexion Sta,-£1.50               |
      | item      | Item Discount (A-1),-£5.00                            |
      #| item      | Item Discount (Manager Item Disc,-£1.50               |
      #| item      | Item Discount (Fixed Amount Disc,-£5.00               |
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1759 @Dune @ItemDiscount @POS @AUTOMATED @POSValidatedTest @POSSet2 @TPE-9490
  Scenario: Try to add Item Discount Percentage that matches the item value
    Given user signs on as "Sales Assistant"
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 3 Description}" from "Receipt List" list
    And "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "Manager Item Discount (%)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    And user enters "100%" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}    |
      | telephone | Tel: ${Store Phone 1}                                    |
      | text      | Sale                                                     |
      | item      | ${Product 3 Description},${Product 3 Price}              |
      | item      | ${Product 2 Description},${Product 2 Price}              |
      | item      | Manager Item Discount (%) 100%                           |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (${Product 3 Description}),-${Product 3 Price} |
      #| item      | Item Discount (Manager Item Discount,-${Product 3 Price} |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1758 @Dune @ItemDiscount @POS @AUTOMATED @POSValidatedTest @POSSet2 @TPE-9489
  Scenario: Authorisation to add Fixed Amount Discount that matches the item value
    Given user signs on as "Pos Operator 3"
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 3 Description}" from "Receipt List" list
    Then "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "Item Discount (Amount) 50% Limit" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Amount" page shown
    And user enters "5.00" into "Input Box" field
    And user presses "OK" button and "Items Manager Discount Too High" page shown
    And user presses "OK" button and "Enter Authorising User" page shown
    When user enters "${Manager 4 Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Manager 4 Password}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    Then user presses "OK" button and "Transaction Signature Verification" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | item      | Item Discount (Amount) 50% Lim                        |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1745 @Dune @ItemDiscount @POS @AUTOMATED @POSValidatedTest @POSSet2 @TPE-9490
  Scenario: Try to add Fixed Amount Discount to an Item greater than item value
    Given user signs on as "Pos Operator 3"
    And user enters "${Product 18}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 18 Description}" from "Receipt List" list
    Then "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "Fixed Amount Discount" from "Selection List" list
    And user presses "OK" button and "Items Manager Discount Too High" page shown
    And user presses "OK" button and "Enter Authorising User" page shown
    When user enters "${Manager 4 Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Manager 4 Password}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    Then user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 18 Description},${Product 18 Price}         |
      | item      | Fixed Amount Discount                                 |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1755 @Dune @ItemDiscount @POS @AUTOMATED @POSValidatedTest @POSSet2 @TPE-9490
  Scenario: Try to add Manager Fixed Amount Discount that matches the item value
    Given user signs on as "Pos Operator 3"
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 3 Description}" from "Receipt List" list
    Then "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "Manager Item Discount (Amount) 50% Limit" from "Selection List" list
    And user presses "OK" button and "Enter Authorising User" page shown
    When user enters "${Manager 4 Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Manager 4 Password}" into "Input Box" field
    And user presses "OK" button and "Enter Item Discount Amount" page shown
    And user enters "7.00" into "Input Box" field
    And user presses "OK" button and "Items Manager Discount Too High" page shown
    And user presses "OK" button and "Enter Authorising User" page shown
    And user enters "${Manager 4 Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Manager 4 Password}" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    Then user presses "OK" button and "Transaction Signature Verification" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | item      | Manager Item Discount (Amount)                        |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1743 @AUTOMATED @POS @Dune @ItemDiscount @POSValidatedTest @POSSet2 @TPE-9490
  Scenario: Try to add Manager Fixed Amount Discount to an Item greater than item value
    Given user signs on as "Manager 4"
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 3 Description}" from "Receipt List" list
    And "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    When user selects "Manager Item Discount (Amount)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Amount" page shown
    And user enters "7.00" into "Input Box" field
    And user presses "OK" button and "Discount Amount Too High" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | Manager Item Discount (Amount)                        |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (${Product 3 Description}),-£7.00       |
      #| item      | Item Discount (Manager Item Discount,-£7.00           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1757 @AUTOMATED @POS @Dune @ItemDiscount @POSValidatedTest @POSSet2 @TPE-9489
  Scenario: Authorisation to add Fixed Amount Discount to an Item greater than item value
    Given user signs on as "Pos Operator 3"
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 3 Description}" from "Receipt List" list
    And "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    When user selects "Manager Item Discount (Amount)" from "Selection List" list
    And user presses "OK" button and "Enter Authorising User" page shown
    And user enters "${Manager 4 Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Manager 4 Password}" into "Input Box" field
    And user presses "OK" button and "Enter Item Discount Amount" page shown
    And user enters "7.00" into "Input Box" field
    And user presses "OK" button and "Discount Amount Too High" page shown
    And user presses "OK" button and "Enter Authorising User" page shown
    And user enters "${Manager 4 Username}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Manager 4 Password}" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | Manager Item Discount (Amount)                        |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (${Product 3 Description}),-£7.00       |
      #| item      | Item Discount (Manager Item Discount,-£7.00           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-1756 @AUTOMATED @POS @MVP @Mobile @Dune @TransactionDiscount @POSValidatedTest @POSSet2
  Scenario: Add Manager Transaction Percentage Discount amount that matches the item value
    Given user signs on as "Manager 2"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Manager Item Discount (%)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    When user enters "100%" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Manager Item Discount (%) 100% -£5.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    When user presses "Signature OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | text | Sale                                        |
      | item | ${Product 2 Description},${Product 2 Price} |
      | item | ${Product 3 Description},${Product 3 Price} |
      | text | Manager Item Discount (%) 100%              |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2357 @POS @ItemDiscount @ItemDiscountPercentage @AUTOMATED @POSValidatedTest @POSSet2 @Regression
  Scenario: Perform Item Discount Percentage with Disallow Promotions
    Given user signs on as "Manager 2"
    When "TRANSACTION_BASKET" page is shown
    Then user enters "${PRODUCT 1}" into "INPUT_BOX" field
    And user presses "ENT" button
    And "${PRODUCT_1_DESCRIPTION}" is displayed in "RECEIPT" list
    And "${PRODUCT_1_PROMOTION}" is displayed in "RECEIPT" list
    When user enters "${PRODUCT 2}" into "INPUT_BOX" field
    Then user presses "ENT" button
    And "${PRODUCT_2_DESCRIPTION}" is displayed in "RECEIPT" list
    When user selects "${PRODUCT_1_DESCRIPTION}" from "RECEIPT" list
    Then "MODIFY ITEM" page is shown
    And user presses "Item Discount" button and "SELECT REASON" page shown
    When user selects "10% Item Disc. - Disallow Promo" from "SELECTION LIST" list
    Then user presses "OK" button
    And "TRANSACTION_BASKET" page is shown
    And "${PRODUCT_1_PROMOTION}" is not displayed in "RECEIPT" list
    And "10% Item Disc. - Disallow Promo 10%" is displayed in "RECEIPT" list
    And "Total Label" label displays the text "£29.44"
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And following details are not displayed on the receipt
      | item | £3 off of KAT VON D Eye Liner,-£3.00 |
    And receipt display with following details
      | item | ${Product 1 Description},${Product 1 Price} |
      | item | ${Product 2 Description},${Product 2 Price} |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item | Item Discount (KAT VON D Eye Liner),-£1.80  |
      #| item | Item Discount (10% Item Disc. - Disa,-£1.80 |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-187 @Harrods @Harrods_Restaurant @Mobile @Regression @Support @POS @AUTOMATED @POSValidatedTest @POSSet2 @TPE-9490
  Scenario: Open item discount Amount
    Given user signs on as "POS Operator"
    And user enters "${Product 17}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 18}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "Open Discount Amount" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Amount" page shown
    And user enters "2.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    Then "Open Discount Amount" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 17 Description},${Product 17 Price}         |
      | item      | ${Product 18 Description},${Product 18 Price}         |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (${Product 18 Description}),-£2.00      |
      #| item      | Item Discount (Open Discount Amount),-£2.00           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2497 @POS @AUTOMATED @POSValidatedTest @POSSet2 @TPE-9490
  Scenario: Add Item Discount Percentage within the set Maximum range
    Given user signs on as "POS Operator"
    And user enters "${Product 17}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 18}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "Range Item Discount % (0-80%)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    And user enters "70.00" into "Input Box" field
    When user presses "OK" button and "Transaction Basket" page shown
    And "Range Item Discount % (0-80%) 70%" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 17 Description},${Product 17 Price}         |
      | item      | ${Product 18 Description},${Product 18 Price}         |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (Butterball Cream),-£1.85               |
      #| item      | Item Discount (Range Item Discount %,-£1.85           |
      | item      | Cash UK,-£8.05                                        |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-186 @Regression @discounts @item @percentage @POS @AUTOMATED @POSValidatedTest @POSSet2 @TPE-9490
  Scenario: Add Item Discount Percentage beyond the set Maximum range
    Given user signs on as "POS Operator"
    And user enters "${Product 17}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 18}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "${Reason Range Item Discount 0-80%}" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    And user enters "90.00" into "Input Box" field
    And user presses "OK" button and "Item Discount Percentage Too High" page shown
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    And user presses "Cancel" button and "Discount Cancelled" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "Voids" button and "Transaction Basket" page shown
    And user presses "Void Transaction" button and "Select Reason" page shown
    When user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | *** TRANSACTION VOID ***                              |
      | text      | Manager signature                                     |
      | text      | £0.00                                                 |
    #Commented due to failing script casued by PLAT-16360
    #And following details are not displayed on the receipt
    #| item | ${Product 17 Description},${Product 17 Price}              |
    #| item | ${Product 18 Description},${Product 18 Price}              |
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2498 @POS @Regression @AUTOMATED @POSValidatedTest @POSSet2 @TPE-9490
  Scenario: Apply an Item Discount Percentage above the Range for an Item
    Given user signs on as "POS Operator"
    When user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    Then user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    When user selects "${Product 3 Description}" from "Selection List" list
    And user presses "OK" button and "Select Reason" page shown
    And user selects " Item Discount - Percentage Range" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    Then user enters "82%" into "Input Box" field
    And user presses "OK" button and "Item Discount Percentage Too High" page shown
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    When user enters "15%" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Item Discount - Percentage Range 15% -£0.75" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      #Commented due to failing script casued by PLAT-16359
      #| item      | ${Product 3 Description},${Product 3 Price}           |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (A-1),-£0.75                            |
      #| item      | Item Discount - Perc,-£0.75                           |
    Then user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-188 @POS @Regression @AUTOMATED @POSValidatedTest @POSSet2 @TPE-9490
  Scenario: Apply a Item Discount Amount Above the Range for an Item
    Given user signs on as "POS Operator"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    Then user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    When user selects "${Product 2 Description}" from "Selection List" list
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Range Item Discount (Amount)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Amount" page shown
    Then user enters "£25.00" into "Input Box" field
    And user presses "OK" button and "Item Discount Amount Too High" page shown
    And user presses "OK" button and "Enter Item Discount Amount" page shown
    When user enters "£5.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Range Item Discount (Amount) -£5.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | item      | ${Product 3 Description},${Product 3 Price}           |
      | text      | Range Item Discount (Amount)                          |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (HD Complexion Starter,-£5.00           |
      #| item      | Item Discount (Range Item Discount (,-£5.00           |
    Then user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-185 @POS @Regression @AUTOMATED @Mobile @POSValidatedTest @POSSet2 @TPE-9490
  Scenario: Perform a Fixed Percentage Discount for an Item
    Given user signs on as "POS Operator"
    When user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    Then user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    When user selects "${Product 3 Description}" from "Selection List" list
    And user presses "OK" button and "Select Reason" page shown
    And user selects "20% Item Discount" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "20% Item Discount 20% -£1.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      #Commented due to failing script casued by PLAT-16359
      #| item      | ${Product 3 Description},${Product 3 Price}           |
      #| text      | 20% Item Discount 20%                                 |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (A-1),-£1.00                            |
      #| item      | Item Discount (20% Item Discount),-£1.00              |
    Then user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-189 @POS @Regression @AUTOMATED @POSValidatedTest @POSSet2 @TPE-9490
  Scenario: Perform a Fixed Amount Discount for a Style Color Size Item
    Given user signs on as "POS Operator"
    When user enters "${Style Colour Size Product 2}" into "Input Box" field
    And user presses "ENT" icon button
    And "Select Colour" page is shown
    When user selects "${Style Colour Size Product 2 Colour 1}" from "Selection List" list
    And user presses "OK" button and "Select Size" page shown
    When user selects "${Style Colour Size Product 2 Size 2}" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    Then user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    When user selects "${Style Colour Size Product 2 Description}" from "Selection List" list
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Fixed Amount Discount" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Fixed Amount Discount" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                           |
      | telephone | Tel: ${Store Phone 1}                                                           |
      | text      | Sale                                                                            |
      | item      | ${Style Colour Size Product 2 Description},${Style Colour Size Product 2 Price} |
      | text      | Style: MB709SN                                                                  |
      | text      | Colour: Navy Blue                                                               |
      | text      | Fixed Amount Discount                                                           |
      | item      | ${Product 3 Description},${Product 3 Price}                                     |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (Rose Print Tea Dress),-£5.00                                     |
      #| item      | Item Discount (Fixed Amount Discount,-£5.00                                     |
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2513 @POS @Regression @AUTOMATED @ManualVerification @POSValidatedTest @POSSet2 @TPE-9491 @NotForRC1
  Scenario: Perform Item Discount Amount with Capture Name and Address
    Given user signs on as "POS Operator"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    Then user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    When user selects "${Product 2 Description}" from "Selection List" list
    And user presses "OK" button and "Select Reason" page shown
    And user selects "£10.00 Item Disc. with Name & Address" from "Selection List" list
    And user presses "OK" button and "Capture Customer Name" page shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    Then user enters "Mark" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Transaction Basket" page shown
    And "Mr Mark Harrison" is displayed in "Receipt" list
    And "Address: 1 Enactor House Bluecoats Avenue Hertford SG141PB" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "£10.00 Item Disc. with Name & Address" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | text      | Customer: Mark Harrison                              |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | text      | £10.00 Item Disc. with Name & Addr (-£10.00)          |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | text      | Item Discount (HD Complexion Starter   -£10.00        |
    Then user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2514 @POS @Regression @AUTOMATED @POSValidatedTest @POSSet2 @TPE-9490
  Scenario: Perform Item Discount Amount with Disallow Promotions
    Given user signs on as "POS Operator"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    Then user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 1 Promotion}" is displayed in "Receipt" list
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    When user selects "${Product 1 Description}" from "Selection List" list
    And user presses "OK" button and "Select Reason" page shown
    And user selects "£2.50 Item Disc. - Disallow Promo" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "${Product 1 Description}" is displayed in "Receipt" list
    And "${Product 1 Promotion}" is not displayed in "Receipt" list
    And "£2.50 Item Disc. - Disallow Promo -£2.50" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And following details are not displayed on the receipt
      | item | ${Product 1 Promotion} |
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
    #Commented due to failing script casued by PLAT-16359
    #| text      |  £2.50 Item Disc. - Disallow Promo                    |
    Then user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2515 @POS @AUTOMATED @POSValidatedTest @POSSet2 @TPE-9490
  Scenario: Perform item discount amount with discount reason in Active date range
    Given user signs on as "Pos operator"
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "£4.50 Item Discount - Active Reason Date " from "Selection List" list
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
      | text      | £4.50 Item Discount - Active Reaso                    |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2516 @POS @AUTOMATED @POSValidatedTest @POSSet2 @TPE-9488
  Scenario: Verify that Item Discount Amount with Expired Reason date range is not displayed in reasons
    Given user signs on as "Pos operator"
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And "£25.00 Item Discount - Expired Reason Date" is not displayed in "Selection List" list
    And user presses "Cancel" button and "Discount Cancelled" page shown
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2517 @POS @AUTOMATED @ManualVerification @POSValidatedTest @POSSet2 @TPE-9491
  Scenario: Perform Item Discount Amount with Capture Details
    Given user signs on as "Pos operator"
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 2 Description}" from "Receipt List" list
    And "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "£5.00 Item Discount - Capture Details" from "Selection List" list
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
      | text      | £5.00 Item Discount - Capture Deta                    |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2512 @POS @Regression @AUTOMATED @ManualVerification @POSValidatedTest @POSSet2 @TPE-9491
  Scenario: Perform Item Discount Amount with capture reference
    Given user signs on as "POS Operator"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    Then user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    When user selects "${Product 2 Description}" from "Selection List" list
    And user presses "OK" button and "Select Reason" page shown
    And user selects "£3.00 Item Discount with REF" from "Selection List" list
    And user presses "OK" button and "Enter Quote Reference" page shown
    And user enters "ID002" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "£3.00 Item Discount with REF -£3.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | text      | £3.00 Item Discount with REF                          |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (HD Complexion Starter    -£3.00        |
      #| item      | Item Discount (£3.00 Item Discount w    -£3.00        |
    Then user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2525 @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Perform Item Discount Percentage with discount in Active date range under Discount tab
    Given user signs on as "Pos operator"
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 2 Description}" from "Receipt List" list
    And "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "15% Item Discount - Active Range Discount" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "15% Item Discount - Active Range Discount" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | text      | 15% Item Discount - Active Range D                    |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2526 @POS @AUTOMATED @POSValidatedTest @POSSet2 @TPE-9490
  Scenario: Perform Item Discount Percentage with discount in Expired date range under Discount tab
    Given user signs on as "Pos operator"
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user selects "${Product 2 Description}" from "Receipt List" list
    And "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "25% Item Discount - Expired Range Discount" from "Selection List" list
    And user presses "OK" button and "Validate Discount" page shown
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2365 @POS @Regression @AUTOMATED @ManualVerification @POSValidatedTest @POSSet2 @TPE-9491
  Scenario: Perform Item Discount Percentage with capture Details
    Given user signs on as "POS Operator"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    Then user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    When user selects "${Product 2 Description}" from "Selection List" list
    And user presses "OK" button and "Select Reason" page shown
    And user selects "20% Item Discount - Capture Details" from "Selection List" list
    And user presses "OK" button and "Capture Discount Details" page shown
    And user enters "Item Discount Percentage with capture Details" into "Notes Text" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "20% Item Discount - Capture Details" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | text      | 20% Item Discount - Capture Detail                    |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (HD Complexion Starter,-£2.00           |
      #| item      | Item Discount (20% Item Discount - C,-£2.00           |
    Then user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2362 @ItemDiscountPercentWithinActiveDateRange @POS @ItemDiscount @AUTOMATED @POSValidatedTest @POSSet2 @TPE-9490
  Scenario: Perform Item Discount Percentage with discount reason in Active date range
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    Then user selects "${Product 2 Description}" from "Receipt List" list
    And "Modify Item" page is shown
    When user presses "Item Discount" button and "Select Reason" page shown
    Then "25% Item Discount - Active Reason Date" is displayed in "Selection List" list
    And user selects "25% Item Discount - Active Reason Date" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "25% Item Discount - Active Reason Date" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | text      | 25% Item Discount - Active Reason                     |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2354 @POS @Regression @AUTOMATED @ManualVerification @POSValidatedTest @POSSet2 @TPE-9491
  Scenario: Perform Item Discount Percentage with capture reference
    Given user signs on as "POS Operator"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    Then user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    When user selects "${Product 2 Description}" from "Selection List" list
    And user presses "OK" button and "Select Reason" page shown
    And user selects "25% Item Discount with REF" from "Selection List" list
    And user presses "OK" button and "Enter Quote Reference" page shown
    And user enters "ID005" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "25% Item Discount with REF" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | text      | 25% Item Discount with REF 25%                        |
      #Change introduced from PLAT-20910 - Item Discount is printed with Reason description
      | item      | Item Discount (HD Complexion Starter,-£2.50           |
      #| item      | Item Discount (25% Item Discount wit,-£2.50           |
    Then user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2527 @ItemDiscountAmountWithinActiveDateRange @POS @ItemDiscount @AUTOMATED @POSValidatedTest @POSSet2 @TPE-9490
  Scenario: Perform Item Discount Amount with discount in Active date range under Discount tab
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    Then user selects "${Product 2 Description}" from "Receipt List" list
    And "Modify Item" page is shown
    When user presses "Item Discount" button and "Select Reason" page shown
    Then "£4.00 Item Discount - Active Range Discount" is displayed in "Selection List" list
    And user selects "£4.00 Item Discount - Active Range Discount" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "£4.00 Item Discount - Active Range Discount" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Sale                                                  |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Product 2 Description},${Product 2 Price}           |
      | text      | £4.00 Item Discount - Active Range                    |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-7648 @POS @AUTOMATED @POS @ItemDiscount @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Verifying that Reason description is shown against Item Discount on Receipt
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "20% Item Discount" from "Selection List" list
    Then user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | 20% Item Discount 20%                                 |
      | text      | -£3.00                                                |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
