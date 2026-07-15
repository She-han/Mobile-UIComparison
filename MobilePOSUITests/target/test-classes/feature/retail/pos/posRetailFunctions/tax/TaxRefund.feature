Feature: Tax Refund

  @PT-10872 @POS @TaxRefund @Sprint40-Week02 @NotForAutomation @ManualVerification @TobeFixedAutTest
  Scenario: Create Tax refund request before initializing the transaction
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Capture Customer" button
    Then "Capture Customer Name" page is shown
    And user presses "Search By Name" button and "Enter Search Name" page shown
    Then user enters "Mark" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    When user selects "${Customer 1 Name}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Transaction Basket" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "Total Tax £3.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Tax Refund Form Required" page shown
    And user presses "No" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | item    | Sale                                                  |
      | item    | ${Product 1 Description},${Product 1 Price}           |
      | item    | Total Tax,£3.00                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "Returns" button
    And user presses "Tax Refund Request" button
    And "Tax Refund Request Standalone" page is shown
    And user presses "Add Transaction" button
    And "Enter original Transaction Id" page is shown
    And user presses "Search by Customer" button
    And "Search Customer Transaction" page is shown
    And user enters "harr" into "Customer Surname" field
    And user presses "OK" button
    And "Select Transaction Details" page is shown
    And user presses "Select" button
    And "Tax Refund Request Standalone" page is shown
    And user presses "Complete" button
    And "Tax Refund Request Identification" page is shown
    And user presses "Customer Capture" button
    And "Tax Refund Request Details" page is shown
    And user selects "USA" from "Tax Refund Request Identifier Country" combobox
    And user presses "OK" button
    And "Tax Refund Request Print" page is shown
    And user presses "Continue" button and "Transaction Basket" page shown
    And receipt display with following details
      | address | ${Street 1},${Street 2},${Town},${County},${Postcode} |
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-11449 @POS @TaxRefund @Sprint41-Week01 @TobeFixedAutTest
  Scenario: Verify customer capture - Search for Passport Issuing Country & Country of Residence
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "Total Tax £6.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | item    | Sale                                                  |
      | item    | ${Product 1 Description},${Product 1 Price}           |
      | item    | Total Tax,£6.00                                       |
    And user presses "Close" button on external "Cash Drawer" window
    And "Tax Refund Request Identification" page is shown
    And user presses "Customer Capture" button and "Tax Refund Request Details" page shown
    And user enters "15978654" into "Identifier ID" field
    And user enters "638442" into "Passport Number" field
    And user presses "Search Passport Country" icon button
    And "Tax Refund Country List" page is shown
    And user selects "USA" from "Selection List" list
    And user presses "OK" button and "Tax Refund Request Details" page shown
    And user enters "Hans" into "Identifier Surname" field
    And user enters "Tim" into "Identifier Forename" field
    And user enters "demo@enactor.com" into "Identifier Email" field
    And user enters "85  Exning Road" into "Identifier Street1" field
    And user enters "Acle" into "Identifier Town" field
    And user enters "M4P 1A6" into "Identifier Postcode" field
    And user presses "Search Residence Country" icon button
    And "Tax Refund Country List" page is shown
    And user selects "Australia" from "Selection List" list
    And user presses "OK" button and "Tax Refund Request Details" page shown
    And user presses "OK" button
    And user waits "3" seconds
    And "Tax Refund Request Print" page is shown
    And user presses "Continue" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-4530 @POS @TaxRefund @Sprint41-Week03
  Scenario: Multiple items with tax enable and not tax enable products above the tax refund threshold
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "Total Tax Â£6.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "Total Tax Â£6.00" is displayed in "Receipt" list
    When receipt display with following details
      | item | ${Product 1 Description},${Product 1 Price} |
      | item | ${Product 1 Description},${Product 1 Price} |
      | item | ${Product 2 Description},${Product 2 Price} |
      | item | Total Tax,Â£6.00                            |
    Then user presses "Close" button on external "Cash Drawer" window
    And "Tax Refund Request Identification" page is shown
    And user presses "Customer Capture" button and "Tax Refund Request Details" page shown
    And user enters "15978654" into "Identifier ID" field
    And user enters "638442" into "Passport Number" field
    And user selects "USA" from "Passport Issuing Country" combobox
    And user enters "Hans" into "Identifier Surname" field
    And user enters "Tim" into "Identifier Forename" field
    And user enters "demo@enactor.com" into "Identifier Email" field
    And user enters "85  Exning Road" into "Identifier Street1" field
    And user enters "Acle" into "Identifier Town" field
    And user enters "M4P 1A6" into "Identifier Postcode" field
    And user selects "United Kingdom" from "Tax Refund Request Identifier Country" combobox
    And user presses "OK" button
    And user waits "3" seconds
    And "Tax Refund Request Print" page is shown
    And user presses "Reprint" button and "Tax Refund Request Print" page shown
    And user waits "3" seconds
    And user presses "Continue" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-4532 @POS @TaxRefund @Sprint41-Week03
  Scenario: Validate whether Total Tax amount is reduced after a item void in the Tax Refund Request transaction
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "Total Tax Â£10.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Tax Refund Request Identification" page is shown
    And user presses "Cancel" button and "Tax Refund Request Sale" page shown
    And user presses "Voids" button and "Tax Refund Request Sale" page shown
    And user presses "Item Void" button and "Select Basket Item" page shown
    And user presses "Up" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button and "Tax Refund Request Sale" page shown
    And "Total Tax Â£7.00" is displayed in "Receipt" list
    And user presses "Complete" button and "Tax Refund Request Identification" page shown
    And user presses "Customer Capture" button and "Tax Refund Request Details" page shown
    And user selects "United Kingdom" from "Tax Refund Request Identifier Country" combobox
    And user presses "OK" button
    And user waits "3" seconds
    And "Tax Refund Request Print" page is shown
    And user presses "Continue" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-4529 @POS @TaxRefund @Sprint41-Week03
  Scenario: Validate whether user is able to proceed with the Tax Refund Request with multiple tax enabled items
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "Total Tax Â£6.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | item    | Sale                                                  |
      | item    | ${Product 1 Description},${Product 1 Price}           |
      | item    | ${Product 1 Description},${Product 1 Price}           |
      | item    | Total Tax,Â£6.00                                      |
    And user presses "Close" button on external "Cash Drawer" window
    And "Tax Refund Request Identification" page is shown
    And user presses "Customer Capture" button and "Tax Refund Request Details" page shown
    And user selects "United Kingdom" from "Passport Issuing Country" combobox
    And user enters "Brown" into "Identifier Surname" field
    And user enters "Mark" into "Identifier Forename" field
    And user selects "United Kingdom" from "Tax Refund Request Identifier Country" combobox
    And user presses "OK" button
    And user waits "3" seconds
    And receipt display with following details
      | address | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | text    | Tax Refund Form                                       |
      | item    | ${Product 1 Description},${Product 1 Price}           |
      | item    | ${Product 1 Description},${Product 1 Price}           |
      | item    | Total Tax,Â£6.00                                      |
    And "Tax Refund Request Print" page is shown
    And user presses "Continue" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-4687 @POS @TaxRefund @Sprint41-Week03
  Scenario: Validate whether user is able to perform a Tax Refund Request Archive successfully
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "Total Tax Â£6.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "Total Tax Â£6.00" is displayed in "Receipt" list
    And receipt display with following details
      | item | ${Product 1 Description},${Product 1 Price} |
      | item | ${Product 1 Description},${Product 1 Price} |
      | item | ${Product 2 Description},${Product 2 Price} |
      | item | Total Tax,Â£6.00                            |
    And user presses "Close" button on external "Cash Drawer" window
    And "Tax Refund Request Identification" page is shown
    And user presses "Cancel" button and "Tax Refund Request Sale" page shown
    And user presses "Cancel Transaction" button and "Tax Refund Request Cancel Prompt" page shown
    And user presses "Message Prompt Ok Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    When "Enter User" page is shown
    Then user waits "20" seconds
    And user signs on as "Sales Assistant"
    And user presses "Sales" button and "Empty Basket" page shown
    And user presses "More" button and "Empty Basket" page shown
    And user presses "More" button and "Empty Basket" page shown
    And user presses "Tax Refund" button and "Empty Basket" page shown
    And user presses "Transaction Archive" button and "Enter Original Transaction ID" page shown
    And user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "ENT" button and "Tax Refund Request Sale" page shown
    And user presses "Complete" button and "Tax Refund Request Identification" page shown
    And user presses "Customer Capture" button and "Tax Refund Request Details" page shown
    And user selects "United Kingdom" from "Passport Issuing Country" combobox
    And user enters "Brown" into "Identifier Surname" field
    And user enters "Mark" into "Identifier Forename" field
    And user selects "United Kingdom" from "Tax Refund Request Identifier Country" combobox
    And user presses "OK" button
    And user waits "5" seconds
    And receipt display with following details
      | address | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | text    | Tax Refund Form                                       |
      | item    | ${Product 1 Description},${Product 1 Price}           |
      | item    | ${Product 1 Description},${Product 1 Price}           |
      | item    | Total Tax,Â£6.00                                      |
    And "Tax Refund Request Print" page is shown
    And user presses "Continue" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-4618 @POS @TaxRefund @Sprint41-Week03
  Scenario: Validate whether user is able to cancel the Tax Refund Request and proceed
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "Total Tax Â£6.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "Total Tax Â£6.00" is displayed in "Receipt" list
    And receipt display with following details
      | item | ${Product 1 Description},${Product 1 Price} |
      | item | ${Product 1 Description},${Product 1 Price} |
      | item | ${Product 2 Description},${Product 2 Price} |
      | item | Total Tax,Â£6.00                            |
    And user presses "Close" button on external "Cash Drawer" window
    And "Tax Refund Request Identification" page is shown
    And user presses "Cancel" button and "Tax Refund Request Sale" page shown
    And user presses "Cancel Transaction" button and "Tax Refund Request Cancel Prompt" page shown
    And user presses "Message Prompt Ok Button" icon button
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-4688 @POS @TaxRefund @Sprint41-Week03
  Scenario: Validate whether user is able to perform a Tax Refund Request  at the beginning of the Transaction from POS
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button and "Empty Basket" page shown
    Then user presses "More" button and "Empty Basket" page shown
    And user presses "More" button and "Empty Basket" page shown
    And user presses "Tax Refund" button and "Empty Basket" page shown
    And user presses "Tax Refund Request" button and "Tax Refund Request Standalone" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Tax Refund Request Standalone" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Tax Refund Request Standalone" page shown
    And "Total Tax Â£6.00" is displayed in "Receipt" list
    And user presses "Complete" button and "Tax Refund Request Identification" page shown
    And user presses "Customer Capture" button and "Tax Refund Request Details" page shown
    And user selects "United Kingdom" from "Passport Issuing Country" combobox
    And user enters "Brown" into "Identifier Surname" field
    And user enters "Mark" into "Identifier Forename" field
    And user selects "United Kingdom" from "Tax Refund Request Identifier Country" combobox
    And user presses "OK" button
    And user waits "5" seconds
    And receipt display with following details
      | address | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | text    | Tax Refund Form                                       |
      | item    | ${Product 1 Description},${Product 1 Price}           |
      | item    | ${Product 1 Description},${Product 1 Price}           |
      | item    | Total Tax,Â£6.00                                      |
    And "Tax Refund Request Print" page is shown
    And user presses "Continue" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-4531 @POS @TaxRefund @Sprint41-Week03
  Scenario: Validate whether user is able to add multiple tax enabled items to the Tax Refund Request transaction and proceed with the refund request
    Given user signs on as "Sales Assistant"
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "Total Tax Â£10.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When "Total Tax Â£10.00" is displayed in "Receipt" list
    Then receipt display with following details
      | item | ${Product 1 Description},${Product 1 Price} |
      | item | ${Product 1 Description},${Product 1 Price} |
      | item | ${Product 1 Description},${Product 1 Price} |
      | item | ${Product 3 Description},${Product 3 Price} |
      | item | Total Tax,Â£10.00                           |
    And user presses "Close" button on external "Cash Drawer" window
    And "Tax Refund Request Identification" page is shown
    And user presses "Cancel" button and "Tax Refund Request Sale" page shown
    And user presses "Sell Item" button and "Tax Refund Request Sale" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Tax Refund Request Sale" page shown
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Tax Refund Request Sale" page shown
    And user presses "Sell Item" button and "Tax Refund Request Sale" page shown
    And user presses "Quantity Sell Item" button and "Enter Qty" page shown
    And user enters "3" into "Input Box" field
    And user presses "ENT" button and "Enter Item" page shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Tax Refund Request Sale" page shown
    And user presses "Complete" button and "Tax Refund Request Identification" page shown
    And user enters "001992500888" into "Input Box" field
    And user presses "OK" button
    And "Tax Refund Request Identifier Confirm" page is shown
    And user presses "Confirm" button
    And "Tax Refund Request Print" page is shown
    And user presses "Continue" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
