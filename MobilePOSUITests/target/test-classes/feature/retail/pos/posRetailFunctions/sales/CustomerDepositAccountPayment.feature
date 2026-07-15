Feature: Customer Deposit Account Payment

  @PT-2347 @POS @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Perform a Customer Deposit Account Payment by Customer Account Card Search
    Given user signs on as "Pos operator"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Customer Deposits" button
    And user presses "Deposit Account Payment" button and "Loyalty Account Enquiry" page shown
    And user enters "${Customer Deposit Card Number 1}" into "Input Box" field
    And user presses "OK" button and "Enter Payment Amount" page shown
    And user enters "${Customer Deposit Payment Amount}" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Customer Account Payment ${Customer Deposit Payment Amount}" is displayed in "Receipt" list
    And "${Customer Deposit Card Number 1 Masked Digits}${Customer Deposit Card Number 1 Last Digits}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | Customer Account Payment,${Customer Deposit Payment Amount}                                  |
      | item | ${Customer Deposit Card Number 1 Masked Digits}${Customer Deposit Card Number 1 Last Digits} |
      | item | Cash UK,-${Customer Deposit Payment Amount}                                                  |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2350 @POS @AUTOMATED @POSValidatedTest @POSSet4 @NotForRC1
  Scenario: Perform a Customer Deposit Account Payment by Name Search
    Given user signs on as "Pos operator"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Customer Deposits" button
    And user presses "Deposit Account Payment" button and "Loyalty Account Enquiry" page shown
    And user presses "Search By Name" button and "Loyalty  Customer Search By Name" page shown
    And user enters "${Customer Deposit Card Number 2 Forename}" into "Input Box" field
    And user presses "OK" button and "Loyalty Select Customer Search By Name" page shown
    And user presses "Down" button
    And user presses "Up" button
    And user presses "OK" button and "Enter Payment Amount" page shown
    And user enters "£10.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Customer Account Payment £10.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text      | Customer: ${Customer Deposit Card Number 2 Name}    	  |
      | address   | ${Customer Deposit Card Number 2 Address}				  |
      | text      | Tel: ${Customer Deposit Card Number 2 Phone1 No}     	  |
      | item 	  | Customer Account Payment,£10.00						 	  |
      | item 	  | Cash UK,-£10.00            							 	  |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2351 @POS @AUTOMATED @POSValidatedTest @POSSet3 @NotForRC1
  Scenario: Perform a Customer Deposit Account Payment by Postcode Search
    Given user signs on as "Pos Operator"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Customer Deposits" button
    And user presses "Deposit Account Payment" button and "Loyalty Account Enquiry" page shown
    And user presses "More" button
    And user presses "Search By Postcode" button and "Loyalty Customer Search ByPostcode" page shown
    And user enters "${Customer Deposit Card Number 2 Postcode}" into "Input Box" field
    And user presses "OK" button and "Loyalty Select Customer Search By Postcode" page shown
    And user selects "${Customer Deposit Card Number 2 name}" from "Selection List" list
    And user presses "OK" button and "Enter Payment Amount" page shown
    And user enters "£10.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Customer Account Payment £10.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text      | Customer: ${Customer Deposit Card Number 2 Name}    	  |
      | address   | ${Customer Deposit Card Number 2 Address}				  |
      | text      | Tel: ${Customer Deposit Card Number 2 Phone1 No}     	  |
      | item 	  | Customer Account Payment,£10.00						 	  |
      | item 	  | Cash UK,-£10.00            							 	  |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-9201 @POS @AUTOMATED @POSValidatedTest @POSSet3 @NotForRC1
  Scenario: Perform a Customer Deposit Account Payment by Email Search
    Given user signs on as "Pos Operator"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Customer Deposits" button
    And user presses "Deposit Account Payment" button and "Loyalty Account Enquiry" page shown
    And user presses "More" button
    When user presses "Search By Email" button and "Customer Search By Email" page shown
    And user enters "${Customer Deposit Card Number 2 Email}" into "Input Box" field
    And user presses "OK" button and "Enter Payment Amount" page shown
    And user enters "£10.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Customer Account Payment £10.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text      | Customer: ${Customer Deposit Card Number 2 Name}    	  |
      | address   | ${Customer Deposit Card Number 2 Address}				  |
      | text      | Tel: ${Customer Deposit Card Number 2 Phone1 No}     	  |
      | item 	  | Customer Account Payment,£10.00						 	  |
      | item 	  | Cash UK,-£10.00            							 	  |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-9211 @POS @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Perform a Customer Deposit Account Payment by Account Search
    Given user signs on as "Pos operator"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Customer Deposits" button
    And user presses "Deposit Account Payment" button and "Loyalty Account Enquiry" page shown
    When user presses "Account Search" icon button and "Customer Account Search" page shown
	  And user enters "${Customer Deposit Card Number 2  Surname}" into "Customer Account Search Details Surname" field
    And user enters "${Customer Deposit Card Number 2 Postcode}" into "Customer Details Postcode" field
    And user presses "OK" button and "Select Customer Account Search" page shown
    And user presses "OK" button and "Enter Payment Amount" page shown
    And user enters "£10.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Customer Account Payment £10.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text	  | Customer: ${Customer Deposit Card Number 2 Name}          |
      | address   | ${Customer Deposit Card Number 2 Address}				  |
      | text      | Tel: ${Customer Deposit Card Number 2 Phone1 No}     	  |
      | item 	  | Customer Account Payment,£10.00						 	  |
      | item 	  | Cash UK,-£10.00            							 	  |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-9212 @POS @AUTOMATED @POSValidatedTest @POSSet3 @NotForRC1
  Scenario: Perform a Customer Deposit Account Payment by Phone Search
    Given user signs on as "Pos operator"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Customer Deposits" button
    And user presses "Deposit Account Payment" button and "Loyalty Account Enquiry" page shown
    When user presses "Search By Phone Number" button and "Customer Search By Phone" page shown
    And user enters "${Customer Deposit Card Number 2 Phone1 No}" into "Input Box" field
    And user presses "OK" button and "Enter Payment Amount" page shown
    And user enters "£10.00" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Customer Account Payment £10.00" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text      | Customer: ${Customer Deposit Card Number 2 Name}    	  |
      | address   | ${Customer Deposit Card Number 2 Address}				  |
      | text      | Tel: ${Customer Deposit Card Number 2 Phone1 No}     	  |
      | item 	  | Customer Account Payment,£10.00						 	  |
      | item 	  | Cash UK,-£10.00            							 	  |
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown