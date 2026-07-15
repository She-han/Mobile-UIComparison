Feature: Prompt Loyalty After Total Pressed

  @PT-11940 @AUTOMATED @MVP @Loyalty @POS @POSValidatedTest @NotForWeeklyRegression
  Scenario: Perform a Department Sale operation (Not on file)
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    And user presses "New Loyalty Account" button
    Then "loyalty account enquiry" page is shown
    When user enters "${Loyalty Card Number 5}" into "Input Box" field
    And user waits "1" seconds
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
    And user enters "${Customer 1 Address Postcode}" into "Customer Postcode" field
    And user presses "OK" button
    Then "Capture Customer Phone Email" page is shown
    When user enters "${Customer 1 Contact Phone1 No}" into "Customer Phone1 Text" field
    And user enters "${Customer 1 Contact Phone2 No}" into "Customer Phone2 Text" field
    And user enters "${Customer 1 Contact Mobile Phone No}" into "Customer Mobile Text" field
    And user enters "${Customer 1 Contact Fax No}" into "Customer Fax Text" field
    And user enters "${Customer 1 Contact Email}" into "Customer Email Text Mandatory" field
    And user presses "Customer Internal Marketing Check Box" checkbox
    And user presses "Customer External Marketing Check Box" checkbox
    And user presses "OK" button
    Then "Loyalty Scheme Prompt" page is shown
    When user selects "${Loyalty Card Number 1 Loyalty Scheme}" from "Loyalty Scheme Dropdown" combobox
    And user waits "2" seconds
    And user presses "OK" button
    Then "Empty Basket" page is shown
    When user presses "TOTAL" button
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-11942 @AUTOMATED @MVP @Loyalty @POS @POSValidatedTest @NotForWeeklyRegression
  Scenario: Prompt for Loyalty at Total Pressed - Proceed with Search by Name
    Given template "LOYALTY_AT_TOTAL_POS_TEMPLATE" is set for the current POS terminal
    When user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user waits "2" seconds
    And user presses "Rich Product Search" button
    And user waits "2" seconds
    Then "Rich Product Search" page is shown
    When user presses "Product Category 1" icon button
    Then "Rich Product Search Result" page is shown
    And user waits "2" seconds
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    When user presses "ADD TO BAG" button
    Then "Recovery Window" page is shown
    When user presses "TOTAL" button
    Then "Loyalty Account Enquiry" page is shown
    When user presses "Search By Name" button
    Then "Loyalty Customer Search By Name" page is shown
    When user enters "Ma" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Select Customer Search By Name" page is shown
    And user selects "${Loyalty Card Number 1 Name}" from "Selection List" list
    And user waits "2" seconds
    When user presses "OK" button
    Then "Loyalty Account Details" page is shown
    When user presses "OK" button
    Then "Select Tender" page is shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-11952 @AUTOMATED @MVP @Loyalty @POS @POSValidatedTest @NotForWeeklyRegression
  Scenario: Prompt for Loyalty at Total Pressed - Proceed with invalid loyalty card number
    Given template "LOYALTY_AT_TOTAL_POS_TEMPLATE" is set for the current POS terminal
    When user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user waits "2" seconds
    And user presses "Rich Product Search" button
    And user waits "2" seconds
    Then "Rich Product Search" page is shown
    When user presses "Product Category 1" icon button
    Then "Rich Product Search Result" page is shown
    And user waits "2" seconds
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    When user presses "ADD TO BAG" button
    Then "Recovery Window" page is shown
    When user presses "TOTAL" button
    Then "Loyalty Account Enquiry" page is shown
    And user waits "1" seconds
    When user enters "4545454545" into "Input Box" field
    And user presses "OK" button
    Then "InvalidLoyaltyCard Number Message" page is shown
    And user waits "1" seconds
    And user presses "OK" button
    Then "Customer Search" page is shown
    And user presses "Cancel" button and "Select Tender" page shown
    And user presses "Back" button and "Recovery Window" page shown
    And user waits "1" seconds
    When user presses "Voids" button
    And user presses "Item Void" button and "Cannot Void Last Item" page shown
    When user presses "Yes" button and "Select Reason" page shown
    When user selects "Item Faulty" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-11953 @AUTOMATED @MVP @Loyalty @POS @POSValidatedTest @NotForWeeklyRegression
  Scenario: Prompt for Loyalty at Total Pressed - Skip
    Given template "LOYALTY_AT_TOTAL_POS_TEMPLATE" is set for the current POS terminal
    When user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user waits "2" seconds
    And user presses "Rich Product Search" button
    And user waits "2" seconds
    Then "Rich Product Search" page is shown
    When user presses "Product Category 1" icon button
    Then "Rich Product Search Result" page is shown
    And user waits "2" seconds
    And user waits "Product Search Result Item 1" to display
    And user waits "2" seconds
    And user presses "Product Search Result Item 1" icon button
    And "Rich Product Details" page is shown
    When user presses "ADD TO BAG" button
    Then "Recovery Window" page is shown
    When user presses "TOTAL" button
    Then "Loyalty Account Enquiry" page is shown
    When user presses "Skip" button
    Then "Select Tender" page is shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-11941 @AUTOMATED @MVP @Loyalty @POS @POSValidatedTest @NotForWeeklyRegression
  Scenario: Prompt for Loyalty at Total Pressed - Proceed with valid loyalty card number
    Given template "LOYALTY_AT_TOTAL_POS_TEMPLATE" is set for the current POS terminal
    When user signs on as "Sales Assistant"
    And user enters "${Sku Product 1}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button
    Then "Loyalty Account Enquiry" page is shown
    And user enters "${Customer 1 Loyalty No}" into "Input Box" field
    And user presses "OK" button and "Loyalty Account details" page shown
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
   @PT-70 @POS @AUTOMATED @Regression
   Scenario: Transaction Additional Loyalty Points - Included Employee Group
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "${Employee Sale Reason}" from "Selection List" list
    When user presses "OK" button and "Enter Employee" page shown
    #Enter employee details in included Employee Group
    When user enters "${Employee 1 Id}" into "Input Box" field
    And user presses "OK" button and "Confirm Employee" page shown
    Then "Employee Id" field displays the text "${Employee 1 ID}"
    And "Employee Name" field displays the text "${Employee 1 Name}"
    When user presses "OK" button and "Transaction Basket" page shown
    And "Employee Transaction" is displayed in "Receipt" list
    And "Employee Number 1" is displayed in "Receipt" list
    And "${Employee 1 Name}" is displayed in "Receipt" list
    When user enters "${SKU Product 11}" into "Input Box" field
    And user presses "ENT" button
    And "${SKU Product 11 Description}" is displayed in "Receipt" list
    And "${SKU Product 11 Price}" is displayed in "Receipt" list
    #Promotion: Promotion Additional Loyalty Points
    And "${Transaction Employee Sale Promotion}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Emp Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${SKU Product 11 Description},${SKU Product 11 Price} |
      | text      | Employee signature                                    |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
   @PT-71 @POS @AUTOMATED @Regression
   Scenario: Transaction Multiplier Loyalty Points - Excluded Employee Group
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "${Employee Sale Reason}" from "Selection List" list
    And user presses "OK" button and "Enter Employee" page shown
    #Enter employee details in excluded Employee Group
    And user enters "${Employee 4 Id}" into "Input Box" field
    And user presses "OK" button and "Confirm Employee" page shown
    Then "Employee Id" field displays the text "${Employee 4 ID}"
    And "Employee Name" field displays the text "${Employee 4 Name}"
    And user presses "OK" button and "Transaction Basket" page shown
    And "Employee Transaction" is displayed in "Receipt" list
    And "Employee Number 4" is displayed in "Receipt" list
    And "${Employee 4 Name}" is displayed in "Receipt" list
    And user enters "${SKU Product 11}" into "Input Box" field
    And user presses "ENT" button
    And "${SKU Product 11 Description}" is displayed in "Receipt" list
    And "${SKU Product 11 Price}" is displayed in "Receipt" list
    And "${Multiplier Loyalty Points Promotion}" is not displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Emp Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${SKU Product 11 Description},${SKU Product 11 Price} |
      | text      | Employee signature                                    |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
   @PT-87 @POS @AUTOMATED @Regression
   Scenario: Item Set Loyalty Points - multiplier
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    When user presses "Capture Loyalty" button and "Loyalty Account Enquiry" page shown
    And user enters "${Loyalty Card Number 1}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Account Details" page is shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And "Loyalty Account: ${Loyalty Card Number 1 Account Number}" is displayed in "Receipt" list
    And "Customer: ${Loyalty card number 1 full name}" is displayed in "Receipt" list
    And user enters "${Product 7}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 7 Description}" is displayed in "Receipt" list
    And "${Product 7 Price}" is displayed in "Receipt" list
    #Promotion: Points Rate
    And "${Product 7 Promotion}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 7 Description},${Product 7 Promotion}       |
      | text      | Promotion Saving                                      |
      | item      | ${Product 7 Promotion}                                |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
   @PT-66 @POS @AUTOMATED @Regression
   Scenario:  Transaction Free Product Alert - Included Customer Group and Fascia, Triggered by Tender
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Capture Customer" button
    And "Capture Customer Name" page is shown
    When user presses "Search By Name" button
    Then "Enter Search Name" page is shown
    And user enters "Abigail" into "Input Box" field
    And user presses "OK" button and "Select Customer" page shown
    And user selects "${Customer 2 Name Without Initials}" from "Selection List" list
    And user presses "OK" button and "Confirm Customer" page shown
    And user presses "Confirm" button and "Transaction Basket" page shown
    And "Customer: ${Customer 2 Full Name}" is displayed in "Receipt" list
    And user enters "${Product 111}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 111 Description}" is displayed in "Receipt" list
    And "${Product 111 Price}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
    	| address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                    |
      | item      | ${Product 111 Description}       					   |
      | text      | Promotion Saving                                         |
      | item      | ${Transaction Free Product Alert}                        |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-68 @POS @AUTOMATED @Regression
  Scenario:  Verifies that the promotion coupon is applied correctly when include employee and region criteria are satisfied during a sale
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "${Employee Sale Reason}" from "Selection List" list
    And user presses "OK" button and "Enter Employee" page shown
    And user enters "${Employee 11 Id}" into "Input Box" field
    And user presses "OK" button and "Confirm Employee" page shown
    And "Employee Id" field displays the text "${Employee 11 ID}"
    And "Employee Name" field displays the text "${Employee 11 Name}"
    And user presses "OK" button and "Transaction Basket" page shown
    And "Employee Transaction" is displayed in "Receipt" list
    And "Employee Number 11" is displayed in "Receipt" list
    And "${Employee 11 Name}" is displayed in "Receipt" list
    And user enters "${Transaction Promotion Coupon Product}" into "Input Box" field
    And user presses "ENT" button
    And "${Transaction Promotion Coupon Product Description}" is displayed in "Receipt" list
    #Promotion: Promotion Coupon displayed
    And "${Transaction Promotion Coupon}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Emp Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}|
      | telephone | Tel: ${Store Phone 1}                                |
      | item      | ${Transaction Promotion Coupon Product Description}  |
      | text      | Promotion Saving                                     |
      | item      | ${Transaction Promotion Coupon}                      |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown