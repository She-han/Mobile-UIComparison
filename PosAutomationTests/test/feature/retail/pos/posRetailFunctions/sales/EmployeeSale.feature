Feature: Employee Sale
  To test an employee sale.

  @PT-32 @EmployeeSale @POS @Harrods_Restaurant @Dunelm @Regression @Support @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Perform an employee sale and complete transaction in Cash tender
    Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "${Employee Sale Reason-Employee}" from "Selection List" list
    When user presses "OK" button and "Enter Employee" page shown
    When user enters "${Employee 1 Id}" into "Input Box" field
    And user presses "OK" button and "Confirm Employee" page shown
    Then "Employee Id" field displays the text "${Employee 1 Id}"
    And "Employee Name" field displays the text "${Employee 1 Name}"
    When user presses "OK" button and "Transaction Basket" page shown
    And "Employee Transaction" is displayed in "Receipt" list
    And "Employee Number 1" is displayed in "Receipt" list
    And "${Employee 1 Name}" is displayed in "Receipt" list
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Employee Sale Reason-Employee}" is displayed in "Receipt" list    
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Emp Transaction Signature Verification" page shown
    When user presses "Signature OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Employee Sale                                         |
      | text      | Employee Number ${Employee 1 Id}                      |
      | text      | ${Employee 1 Name}                                    |
      | text      | Opening Balance:                                      |
      | text      | Purchase Discount:                                    |
      | text      | Closing Balance:                                      |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | text      | Employee signature                                    |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-519 @EmployeeSale @LocationSearch @POS @AUTOMATED @Harrods @Support @POSValidatedTest @POSSet3
  Scenario: Perform an employee sale using Location Search and complete transaction with Cash tender
    Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "${Employee Sale Reason}" from "Selection List" list
    When user presses "OK" button and "Enter Employee" page shown
    And user presses "Location Search" button and "Select Employee" page shown
    And user presses "Change Location" button and "Select Location" page shown
    When user selects "${Location}" from "Selection List" list
    And user presses "OK" button and "Select Employee" page shown
    When user selects "${Employee 1 ID}" from "Selection List" list
    And user presses "OK" button and "Confirm Employee" page shown
    Then "Employee Id" field displays the text "${Employee 1 ID}"
    And "Employee Name" field displays the text "${Employee 1 Name}"
    When user presses "OK" button and "Transaction Basket" page shown
    And "Employee Transaction" is displayed in "Receipt" list
    And "Employee Number 1" is displayed in "Receipt" list
    And "${Employee 1 Name}" is displayed in "Receipt" list
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Employee Sale Reason} ( ${Product 1 Price} at 20% )" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Emp Transaction Signature Verification" page shown
    When user presses "Signature OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Employee Sale                                         |
      | text      | Employee Number ${Employee 1 ID}                      |
      | text      | ${Employee 1 Name}                                    |
      | text      | Opening Balance:                                      |
      | text      | Purchase Discount:                                    |
      | text      | Closing Balance:                                      |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ${Employee Sale Reason} (${Product 1 Price} at 20%)             |
      | text      | Employee signature                                    |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-518 @EmployeeSale @POS @Dunelm @Harrods @Harrods_Sanity @MVP @Mobile @Support @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Employee sale - using name search
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "${Employee Sale Reason}" from "Selection List" list
    When user presses "OK" button and "Enter Employee" page shown
    When user presses "Name Search" button and "Search Employee Name" page shown
    And user enters "sam" into "Input Box" field
    And user presses "Search" button and "Confirm Employee" page shown
    Then "Employee Id" field displays the text "${Employee 1 Id}"
    And "Employee Name" field displays the text "${Employee 1 Name}"
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And "Employee Transaction" is displayed in "Receipt" list
    And "Employee Number 1" is displayed in "Receipt" list
    And "${Employee 1 Name}" is displayed in "Receipt" list
    When user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Emp Transaction Signature Verification" page shown
    When user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Employee Sale                                         |
      | text      | Employee Number ${Employee 1 Id}                      |
      | text      | ${Employee 1 Name}                                    |
      | text      | Opening Balance:                                      |
      | text      | Purchase Discount:                                    |
      | text      | Closing Balance:                                      |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | text      | Employee signature                                    |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-914 @TobeFixedAutTest @Harrods @Regression @Support @POS @AUTOMATED @ManualVerification
  Scenario: Perform an Employee Transaction using Empoyee Account Tender - Refund by Cash and validate account balance
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "Employee Sale" from "Selection List" list
    When user presses "OK" button and "Enter Employee" page shown
    And user enters "1" into "Input Box" field
    And user presses "OK" button and "Confirm Employee" page shown
    Then "Employee Id" field displays the text "${Employee 1 ID}"
    And "Employee Name" field displays the text "${Employee 1 Name}"
    When user presses "OK" button and "Transaction Basket" page shown
    And "Employee Transaction" is displayed in "Receipt" list
    And "Employee Number 1" is displayed in "Receipt" list
    And "${Employee 1 Name}" is displayed in "Receipt" list
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "More" button
    And user presses "Employee Account" button and "Employee Account Tender Enter Employee" page shown
    And user enters "1" into "Input Box" field
    And user presses "OK" button and "Employee Account Tender Amount" page shown
    And user presses "OK" button and "Emp Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Transaction Basket" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Employee Number ${Employee 1 ID}                      |
      | text      | ${Employee 1 Name}                                    |
      | text      | Opening Balance:                                      |
      | text      | Purchase Discount:                                    |
      | text      | Closing Balance:                                      |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | text      | Employee signature                                    |
    When user presses "SignOff" button
    Then "Enter User" page is shown
    And user waits "90" seconds
    #Rturn the Employee Sales Receipt
    When user signs on as "POS Operator"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Enter Employee" page shown
    And user enters "1" into "Input Box" field
    And user presses "OK" button and "Confirm Employee" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "Returns" button
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Extended Return Details" page shown
    When user presses "Complete Receipt" button and "Select Reason" page shown
    And user selects "Damaged / Faulty (30 Days)" from "Selection List" list
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And "Employee Transaction Refund" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Return Tender" page shown
    Then user presses "Skip Original Tenders" button and "Refund Item" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Refund                                         |
      | item | R,${Product 1 Description},-${Product 1 Price} |
      | item | Employee Sale (£18.00 at 20%)                  |
      | item | Employee Account                   -£17.28     |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-10864 @EmployeeSale @POS @AUTOMATED
  Scenario: Employee Sale with a Fixed Percentage Discount reason
    Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "${Employee Sale Discount Reason}" from "Selection List" list
    When user presses "OK" button and "Transaction Basket" page shown
    Then user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Employee Sale Discount Reason} ( ${Product 2 Price} at 20% )" is displayed in "Receipt" list
    When user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Employee Sale Discount Reason} ( ${Product 3 Price} at 20% )" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "Close" button on external "Cash Drawer" window
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-10867 @EmployeeSale @POS @Sprint42-Week4 @AUTOMATED
  Scenario: Perform an employee sale and complete transaction in Cash tender
   Given user signs on as "Manager 2"
   When user presses "Sales" button
   And user presses "More" button
   And user presses "Employee Sale" button and "Select Reason" page shown    
   And user selects "${Employee Sale Discount Spend Reason}" from "Selection List" list
   And user presses "OK" button and "Enter Employee" page shown
   When user enters "${Employee 40 Id}" into "Input Box" field
   And user presses "OK" button and "Confirm Employee" page shown
   Then "Employee Id" field displays the text "${Employee 40 ID}"
   And "Employee Name" field displays the text "${Employee 40 Name}"
   And "Account Balance" field displays the text "${Employee 40 Balance}"
   When user presses "OK" button and "Transaction Basket" page shown
   And "Employee Transaction" is displayed in "Receipt" list 
   And "${Employee 40 Description}" is displayed in "Receipt" list
   And "${Employee 40 Name}" is displayed in "Receipt" list
   When user enters "${Product 1}" into "Input Box" field
   And user presses "ENT" button and "Transaction Basket" page shown
   When user presses "TOTAL" button and "Select Tender" page shown
   And user presses "Cash" button and "Enter Cash Tender Amount" page shown
   And user presses "OK" button and "Emp Transaction Signature Verification" page shown
   When user presses "Signature OK" button
   Then "Transaction Basket" page is shown
   And receipt display with following details
    | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
    | telephone | Tel: ${Store Phone 1}                                 |
    | text      | Employee Sale                                         |
    | text      | Employee Number ${Employee 40 Id}                     |
    | text      | ${Employee 40 Name}                                   |
    | text      | Opening Balance:                                      |
    | text      | Purchase Discount:                                    |
    | text      | Closing Balance:                                      |
    | item      | ${Product 1 Description},${Product 1 Price}           |
    | text      | Employee signature                                    |
   When user presses "Close" button on external "Cash Drawer" window
   Then "Transaction Basket" page is shown
   When user presses "SignOff" button

  @PT-10866 @EmployeeSale @POS @AUTOMATED @ToBeFixedAutTest
  Scenario: Track the balance of the employee sale
    Given user signs on as "Sales Assistant"
    When user presses "Sales" button
    Then user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "Employee Sale" from "Selection List" list
    When user presses "OK" button and "Enter Employee" page shown
    Then user presses "Name Search" button and "Search Employee Name" page shown
    And user enters "Evan" into "Input Box" field
    When user presses "Search" button and "Confirm Employee" page shown
    Then "Employee Id" field displays the text "${Employee 2 ID}"
    And "Employee Name" field displays the text "${Employee 2 Name}"
    #And "Employee Account Balance" field displays the text "${Employee 2 Balance}"
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-16744 @EmployeeSale @NameSearch @POS @AUTOMATED
  Scenario: Verify Auto Logoff is working whilst on employee selection screen
    Given user signs on as "Pos Operator 2"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "Employee Sale" from "Selection List" list
    When user presses "OK" button and "Enter Employee" page shown
    And user presses "Name Search" button and "Search Employee Name" page shown
    And user enters "John" into "Input Box" field
    When user presses "Search" button and "Search Employee Name" page shown
    #user waits 20 seconds for auto inactivity out
    And user waits "20" seconds
    And "Enter User" page is shown
    
  @PT-16717 @EmployeeSale @POS @AUTOMATED
  Scenario: Employee Sale - Employee Spend
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "${Employee Sale Reason-Employee Spend}" from "Selection List" list
    And user presses "OK" button and "Enter Employee" page shown
    And user enters "1" into "Input Box" field
    And user presses "OK" button and "Confirm Employee" page shown
    And "Employee Id" field displays the text "${Employee 1 ID}"
    And "Employee Name" field displays the text "${Employee 1 Name}"
    And user presses "OK" button and "Transaction Basket" page shown
    And "Employee Transaction" is displayed in "Receipt" list
    And "Employee Number 1" is displayed in "Receipt" list
    And "${Employee 1 Name}" is displayed in "Receipt" list
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Employee Sale Reason-Employee Spend}" is displayed in "Receipt" list       
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Emp Transaction Signature Verification" page shown
    When user presses "Signature OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Employee Sale                                         |
      | text      | Employee Number ${Employee 1 ID}                      |
      | text      | ${Employee 1 Name}                                    |
      | text      | Opening Balance:                                      |
      | text      | Purchase Discount:                                    |
      | text      | Closing Balance:                                      |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | text      | Employee signature                                    |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-10868 @EmployeeSale @POS @AUTOMATED
  Scenario: Employee Sale - Employee Grade
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "${Employee Sale Reason-Employee Grade}" from "Selection List" list
    And user presses "OK" button and "Enter Employee" page shown
    And user enters "${Employee 3 ID}" into "Input Box" field
    And user presses "OK" button and "Confirm Employee" page shown
    And "Employee Id" field displays the text "${Employee 3 ID}"
    And "Employee Name" field displays the text "${Employee 3 Name}"
    And user presses "OK" button and "Transaction Basket" page shown
    And "Employee Transaction" is displayed in "Receipt" list
    And "Employee Number ${Employee 3 ID}" is displayed in "Receipt" list
    And "${Employee 3 Name}" is displayed in "Receipt" list
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Employee Sale Reason-Employee Grade}" is displayed in "Receipt" list          
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Emp Transaction Signature Verification" page shown
    When user presses "Signature OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Employee Sale                                         |
      | text      | Employee Number ${Employee 3 ID}                      |
      | text      | ${Employee 3 Name}                                    |
      | text      | Opening Balance:                                      |
      | text      | Purchase Discount:                                    |
      | text      | Closing Balance:                                      |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | text      | Employee signature                                    |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown           

  @PT-10869 @EmployeeSale @POS @AUTOMATED
  Scenario: Employee Sale - Employee Grade Spend
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "${Employee Sale Reason-Employee Grade Spend}" from "Selection List" list
    And user presses "OK" button and "Enter Employee" page shown
    And user enters "${Employee 3 ID}" into "Input Box" field
    And user presses "OK" button and "Confirm Employee" page shown
    And "Employee Id" field displays the text "${Employee 3 ID}"
    And "Employee Name" field displays the text "${Employee 3 Name}"
    And user presses "OK" button and "Transaction Basket" page shown
    And "Employee Transaction" is displayed in "Receipt" list
    And "Employee Number ${Employee 3 ID}" is displayed in "Receipt" list
    And "${Employee 3 Name}" is displayed in "Receipt" list
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Employee Sale Reason-Employee Grade Spend}" is displayed in "Receipt" list    
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Emp Transaction Signature Verification" page shown
    When user presses "Signature OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Employee Sale                                         |
      | text      | Employee Number ${Employee 3 ID}                      |
      | text      | ${Employee 3 Name}                                    |
      | text      | Opening Balance:                                      |
      | text      | Purchase Discount:                                    |
      | text      | Closing Balance:                                      |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | text      | Employee signature                                    |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown 
    
  @PT-10870 @EmployeeSale @POS @AUTOMATED @Regresison
  Scenario: Employee Sale - Employee Grade by MMG
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "${Employee Sale Reason-Employee Grade by MMG}" from "Selection List" list
    And user presses "OK" button and "Enter Employee" page shown
    And user enters "${Employee 3 ID}" into "Input Box" field
    And user presses "OK" button and "Confirm Employee" page shown
    And "Employee Id" field displays the text "${Employee 3 ID}"
    And "Employee Name" field displays the text "${Employee 3 Name}"
    And user presses "OK" button and "Transaction Basket" page shown
    And "Employee Transaction" is displayed in "Receipt" list
    And "Employee Number ${Employee 3 ID}" is displayed in "Receipt" list
    And "${Employee 3 Name}" is displayed in "Receipt" list
    And user enters "${Product 123AS3Y-11}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Employee Sale Reason-Employee Grade by MMG}" is displayed in "Receipt" list        
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Emp Transaction Signature Verification" page shown
    When user presses "Signature OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Employee Sale                                         |
      | text      | Employee Number ${Employee 3 ID}                      |
      | text      | ${Employee 3 Name}                                    |
      | text      | Opening Balance:                                      |
      | text      | Purchase Discount:                                    |
      | text      | Closing Balance:                                      |
      | item      | ${Product 123AS3Y-11 Description},${Product 123AS3Y-11 Price}           |
      | text      | Employee signature                                    |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-10871 @EmployeeSale @POS @AUTOMATED @Regression
  Scenario: Employee Sale - Employee Grade Spend by MMG
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "${Employee Sale Reason-Employee Grade Spend by MMG}" from "Selection List" list
    And user presses "OK" button and "Enter Employee" page shown
    And user enters "${Employee 3 ID}" into "Input Box" field
    And user presses "OK" button and "Confirm Employee" page shown
    And "Employee Id" field displays the text "${Employee 3 ID}"
    And "Employee Name" field displays the text "${Employee 3 Name}"
    And user presses "OK" button and "Transaction Basket" page shown
    And "Employee Transaction" is displayed in "Receipt" list
    And "Employee Number ${Employee 3 ID}" is displayed in "Receipt" list
    And "${Employee 3 Name}" is displayed in "Receipt" list
    And user enters "${Product 123AS3Y-11}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Employee Sale Reason-Employee Grade Spend by MMG}" is displayed in "Receipt" list            
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Emp Transaction Signature Verification" page shown
    When user presses "Signature OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Employee Sale                                         |
      | text      | Employee Number ${Employee 3 ID}                      |
      | text      | ${Employee 3 Name}                                    |
      | text      | Opening Balance:                                      |
      | text      | Purchase Discount:                                    |
      | text      | Closing Balance:                                      |
      | item      | ${Product 123AS3Y-11 Description},${Product 123AS3Y-11 Price}           |
      | text      | Employee signature                                    |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-19995 @EmployeeSale @POS @AUTOMATED @Regression
  Scenario: Convert Sale to Employee Sale
    Given user signs on as "Sales Assistant ire"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button    
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button    
    And user presses "Convert to Employee" button and "Select Reason" page shown
    And user selects "${Employee Sale Reason-Employee}" from "Selection List" list
    And user presses "OK" button and "Enter Employee" page shown
    And  user enters "1" into "Input Box" field
    And user presses "OK" button and "Confirm Employee" page shown
    And "Employee Id" field displays the text "${Employee 1 ID}"
    And "Employee Name" field displays the text "${Employee 1 Name}"
    And user presses "OK" button and "Transaction Basket" page shown
    And "Employee Transaction" is displayed in "Receipt" list
    And "Employee Number 1" is displayed in "Receipt" list
    And "${Employee 1 Name}" is displayed in "Receipt" list
    And "${Employee Sale Reason-Employee}" is displayed in "Receipt" list    
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Emp Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown    
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown       
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Employee Sale                                         |
      | text      | Employee Number ${Employee 1 ID}                      |
      | text      | ${Employee 1 Name}                                    |
      | text      | Opening Balance:                                      |
      | text      | Purchase Discount:                                    |
      | text      | Closing Balance:                                      |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | text      | Employee signature                                    |
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-23302 @EmployeeSale @POS
  Scenario: Verify whether the user can initiate an Employee Sale for the Employee Spend Account by scanning the Employee Card
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "${Employee Sale Reason-Employee Spend}" from "Selection List" list
    And user presses "OK" button and "Enter Employee" page shown
    Then "Scanner" page is shown
    When user enters "${Employee 66 Card Number}" into "Scan Text" field
    Then user presses "Test Scanner Scan Button" icon button
    And "Confirm Employee" page is shown
    And "Employee Id" field displays the text "${Employee 66 Id}"
    And "Employee Name" field displays the text "${Employee 66 name}"
    And user presses "OK" button and "Transaction Basket" page shown
    And "Employee Transaction" is displayed in "Receipt" list
    And "${Employee 66 name}" is displayed in "Receipt" list
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Emp Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Employee Sale                                         |
      | text      | Employee Number ${Employee 66 ID}                      |
      | text      | ${Employee 66 Name}                                    |
      | text      | Opening Balance:                                      |
      | text      | Purchase Discount:                                    |
      | text      | Closing Balance:                                      |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | text      | Employee signature                                    |
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-23301 @EmployeeSale @POS
  Scenario: Verify whether the user can search for an invalid Employee ID
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "${Employee Sale Reason-Employee Spend}" from "Selection List" list
    And user presses "OK" button and "Enter Employee" page shown
    And user enters "${Invalid Employee Id}" into "Input Box" field
    And user presses "OK" button and "Employee Not Found" page shown
    And user presses "OK" button and "Enter Employee" page shown
    And user presses "Cancel" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-23295 @EmployeeSale @POS
  Scenario: Verify whether a item discount can be added to an employee sale when the 'Allow Overlap' flag is enabled.
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "${Employee Sale Reason-Employee Spend}" from "Selection List" list
    And user presses "OK" button and "Enter Employee" page shown
    And user enters "${Employee 66 Card Number}" into "Input Box" field
    And user presses "OK" button and "Confirm Employee" page shown
    And "Employee Id" field displays the text "${Employee 66 Id}"
    And "Employee Name" field displays the text "${Employee 66 name}"
    And user presses "OK" button and "Transaction Basket" page shown
    And "Employee Transaction" is displayed in "Receipt" list
    And "${Employee 66 name}" is displayed in "Receipt" list
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    When user selects "${Product 1 Description}" from "Receipt List" list
    Then "Modify Item" page is shown
    And user presses "Item Discount" button and "Select Reason" page shown
    And user selects "??5 New Price Item Discount" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Emp Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Employee Sale                                         |
      | text      | Employee Number ${Employee 66 ID}                      |
      | text      | ${Employee 66 Name}                                    |
      | text      | Opening Balance:                                      |
      | text      | Purchase Discount:                                    |
      | text      | Closing Balance:                                      |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | item      | ??5 New Price Item Discount                          |
      | text      | Employee signature                                    |
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-23294 @EmployeeSale @POS
  Scenario: Verify whether a transaction discount can be added to an employee sale when the 'Allow Overlap' flag is enabled.
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "${Employee Sale Reason-Employee Spend}" from "Selection List" list
    And user presses "OK" button and "Enter Employee" page shown
    And user enters "${Employee 66 Card Number}" into "Input Box" field
    And user presses "OK" button and "Confirm Employee" page shown
    And "Employee Id" field displays the text "${Employee 66 Id}"
    And "Employee Name" field displays the text "${Employee 66 name}"
    And user presses "OK" button and "Transaction Basket" page shown
    And "Employee Transaction" is displayed in "Receipt" list
    And "${Employee 66 name}" is displayed in "Receipt" list
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    And user selects "20% Trans. Disc. - Overlap Restriction % 1" from "Selection List" list
    And user presses "OK" button and "Add Item Text" page shown
    And user enters "Test Comment 1" into "Discount Text Field" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (20% Trans. Disc. - Overlap Restriction % 1 20%)" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Emp Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Employee Sale                                         |
      | text      | Employee Number ${Employee 66 ID}                      |
      | text      | ${Employee 66 Name}                                    |
      | text      | Opening Balance:                                      |
      | text      | Purchase Discount:                                    |
      | text      | Closing Balance:                                      |
      | item      | ${Product 1 Description},${Product 1 Price}           |
      | text      | Employee signature                                    |
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-23300 @EmployeeSale @POS
  Scenario: Verify whether promotion can be applied for a product added to an employee sale when the 'Allow Overlap'
    Given user signs on as "Manager 2"
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "${Employee Sale Reason-Employee}" from "Selection List" list
    When user presses "OK" button and "Enter Employee" page shown
    When user enters "1" into "Input Box" field
    And user presses "OK" button and "Confirm Employee" page shown
    Then "Employee Id" field displays the text "${Employee 1 ID}"
    And "Employee Name" field displays the text "${Employee 1 Name}"
    When user presses "OK" button and "Transaction Basket" page shown
    And "Employee Transaction" is displayed in "Receipt" list
    And "Employee Number 1" is displayed in "Receipt" list
    And "${Employee 1 Name}" is displayed in "Receipt" list
    When user enters "${Product Z2RW7P1 SKU}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Employee Sale Reason-Employee}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Emp Transaction Signature Verification" page shown
    When user presses "Signature OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}           |
      | telephone | Tel: ${Store Phone 1}                                           |
      | text      | Employee Sale                                                   |
      | text      | Employee Number ${Employee 1 ID}                                |
      | text      | ${Employee 1 Name}                                              |
      | text      | Opening Balance:                                                |
      | text      | Purchase Discount:                                              |
      | text      | Closing Balance:                                                |
      | item      | ${Product Z2RW7P1 SKU Description},${Product Z2RW7P1 SKU Price} |
      | item      | ??3 off of Employee sale                                         |
      | item      | Employee Sale (??145.00 at 20%)                                  |
      | text      | Employee signature                                              |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-23276 @EmployeeSale @POS
  Scenario: Employee Sale - Verify discount rates for Product while doing employee grade sale for valid date range
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "${Employee Sale Reason-Employee Grade}" from "Selection List" list
    And user presses "OK" button and "Enter Employee" page shown
    And user enters "${Employee 3 ID}" into "Input Box" field
    And user presses "OK" button and "Confirm Employee" page shown
    And "Employee Id" field displays the text "${Employee 3 ID}"
    And "Employee Name" field displays the text "${Employee 3 Name}"
    And user presses "OK" button and "Transaction Basket" page shown
    And "Employee Transaction" is displayed in "Receipt" list
    And "Employee Number ${Employee 3 ID}" is displayed in "Receipt" list
    And "${Employee 3 Name}" is displayed in "Receipt" list
    And user enters "${Sku Product 6}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Employee Sale Reason-Employee Grade}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Emp Transaction Signature Verification" page shown
    When user presses "Signature OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Employee Sale                                         |
      | text      | Employee Number ${Employee 3 ID}                      |
      | text      | ${Employee 3 Name}                                    |
      | text      | Opening Balance:                                      |
      | text      | Purchase Discount:                                    |
      | text      | Closing Balance:                                      |
      | item      | ${Sku Product 6 Description},${Sku Product 6 Price}   |
      | text      | Employee signature                                    |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-23278 @EmployeeSale @POS
  Scenario: Employee Sale - Verify Discount rates applied for a Particular Product in employee grade sale for an invalid date range
    Given user signs on as "Manager 2"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "${Employee Sale Reason-Employee Grade by MMG}" from "Selection List" list
    And user presses "OK" button and "Enter Employee" page shown
    And user enters "${Employee 3 ID}" into "Input Box" field
    And user presses "OK" button and "Confirm Employee" page shown
    And "Employee Id" field displays the text "${Employee 3 ID}"
    And "Employee Name" field displays the text "${Employee 3 Name}"
    And user presses "OK" button and "Transaction Basket" page shown
    And "Employee Transaction" is displayed in "Receipt" list
    And "Employee Number ${Employee 3 ID}" is displayed in "Receipt" list
    And "${Employee 3 Name}" is displayed in "Receipt" list
    And user enters "${Sku Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Employee Sale Reason-Employee Grade by MMG}" is not displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Emp Transaction Signature Verification" page shown
    When user presses "Signature OK" button
    Then "Transaction Basket" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | Employee Sale                                         |
      | text      | Employee Number ${Employee 3 ID}                      |
      | text      | ${Employee 3 Name}                                    |
      | text      | Opening Balance:                                      |
      | text      | Purchase Discount:                                    |
      | text      | Closing Balance:                                      |
      | item      | ${Sku Product 1 Description},${Sku Product 1 Price}   |
      | text      | Employee signature                                    |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-23287 @POS @AUTOMATED @Regression
  Scenario: Verify fallback to Default MMG Discount when Employee Graded Discount exceeds Account Balance for Different MMG Values
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "${Employee Sale Reason-Employee Grade by MMG}" from "Selection List" list
    And user presses "OK" button and "Enter Employee" page shown
    And user enters "${Employee With Graded Discount 1 ID}" into "Input Box" field
    And user presses "OK" button and "Confirm Employee" page shown
    And "Employee Id" field displays the text "${Employee With Graded Discount 1 ID}"
    And "Employee Name" field displays the text "${Employee With Graded Discount 1  Name}"
    And user presses "OK" button and "Transaction Basket" page shown
    And "Employee Transaction" is displayed in "Receipt" list
    And "Employee Number ${Employee With Graded Discount 1 ID}" is displayed in "Receipt" list
    And "${Employee With Graded Discount 1  Name}" is displayed in "Receipt" list
    And user enters "${Product 123AS3Y-11}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Employee Sale Reason-Employee Grade by MMG With Default Discount}" is displayed in "Receipt" list        
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Emp Transaction Signature Verification" page shown
    When user presses "Signature OK" button
    Then "Await Drawer Closed" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                               |
      | telephone | Tel: ${Store Phone 1}                                                               |
      | text      | Employee Sale                                                                       |
      | text      | Employee Number ${Employee With Graded Discount 1 ID}                               |
      | text      | ${Employee With Graded Discount 1 Name}                                             |
      | text      | Opening Balance:                                                                    |
      | text      | Purchase Discount:                                                                  |
      | text      | Closing Balance:                                                                    |
      | item      | ${Product 123AS3Y-11 Description},${Product 123AS3Y-11 Price} |
      | text      | Employee signature                                                                  |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-23277 @POS @AUTOMATED @Regression
  Scenario: Verify whether the configured discount rates not applied for a particular MMG group while doing employee grade sale for an invalid date range
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "${Employee Sale Reason-Employee Grade by MMG}" from "Selection List" list
    And user presses "OK" button and "Enter Employee" page shown
    And user enters "${Employee With Graded Discount 2 ID}" into "Input Box" field
    And user presses "OK" button and "Confirm Employee" page shown
    And "Employee Id" field displays the text "${Employee With Graded Discount 2 ID}"
    And "Employee Name" field displays the text "${Employee With Graded Discount 2  Name}"
    And user presses "OK" button and "Transaction Basket" page shown
    And "Employee Transaction" is displayed in "Receipt" list
    And "Employee Number ${Employee With Graded Discount 2 ID}" is displayed in "Receipt" list
    And "${Employee With Graded Discount 2  Name}" is displayed in "Receipt" list
    And user enters "${Product DF517XM-1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown       
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Emp Transaction Signature Verification" page shown
    When user presses "Signature OK" button
    Then "Await Drawer Closed" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                               |
      | telephone | Tel: ${Store Phone 1}                                                               |
      | text      | Employee Sale                                                                       |
      | text      | Employee Number ${Employee With Graded Discount 2 ID}                               |
      | text      | ${Employee With Graded Discount 2 Name}                                             |
      | text      | Opening Balance:                                                                    |
      | text      | Purchase Discount:                                                                  |
      | text      | Closing Balance:                                                                    |
      | item      | ${Product DF517XM-1 Description},${Product DF517XM-1 Price}   |
      | text      | Employee signature                                                                  |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-23271 @POS @AUTOMATED @Regression
  Scenario: Verify whether the configured discount rates are applied for a Particular mmg group while doing employee grade sale for valid date range
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Employee Sale" button and "Select Reason" page shown
    And user selects "${Employee Sale Reason-Employee Grade by MMG}" from "Selection List" list
    And user presses "OK" button and "Enter Employee" page shown
    And user enters "${Employee With Graded Discount 2 ID}" into "Input Box" field
    And user presses "OK" button and "Confirm Employee" page shown
    And "Employee Id" field displays the text "${Employee With Graded Discount 2 ID}"
    And "Employee Name" field displays the text "${Employee With Graded Discount 2  Name}"
    And user presses "OK" button and "Transaction Basket" page shown
    And "Employee Transaction" is displayed in "Receipt" list
    And "Employee Number ${Employee With Graded Discount 2 ID}" is displayed in "Receipt" list
    And "${Employee With Graded Discount 2  Name}" is displayed in "Receipt" list
    And user enters "${Product MB229XML-1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And "${Employee Sale Reason-Employee Grade by MMG With Discount}" is displayed in "Receipt" list        
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Emp Transaction Signature Verification" page shown
    When user presses "Signature OK" button
    Then "Await Drawer Closed" page is shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}                               |
      | telephone | Tel: ${Store Phone 1}                                                               |
      | text      | Employee Sale                                                                       |
      | text      | Employee Number ${Employee With Graded Discount 2 ID}                               |
      | text      | ${Employee With Graded Discount 2 Name}                                             |
      | text      | Opening Balance:                                                                    |
      | text      | Purchase Discount:                                                                  |
      | text      | Closing Balance:                                                                    |
      | item      | ${Product MB229XML-1 Description},${Product MB229XML-1 Price} |
      | text      | Employee signature                                                                  |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown