Feature: CustomerDepositAccountEnquiry

  @PT-2342 @POS @AUTOMATED @POSValidatedTest @POSSet4
  Scenario: Perform a Customer Deposit Account Enquiry by Name Search
    Given user signs on as "Pos operator"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Customer Deposits" button
    And user presses "Deposit Account Enquiry" button and "Loyalty Account Enquiry" page shown
    And user presses "Search By Name" button and "Loyalty  Customer Search By Name" page shown
    And user enters "${Customer Deposit Card Number 1 Forename}" into "Input Box" field
    And user presses "OK" button and "Loyalty Select Customer Search By Name" page shown
    And user presses "Down" button
    And user presses "Up" button
    And user presses "OK" button and "Display Document" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2343 @POS @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Perform a Customer Deposit Account Enquiry by Postcode Search
    Given user signs on as "Pos Operator"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Customer Deposits" button
    And user presses "Deposit Account Enquiry" button and "Loyalty Account Enquiry" page shown
    And user presses "More" button
    And user presses "Search By Postcode" button and "Loyalty Customer Search ByPostcode" page shown
    And user enters "${Customer Deposit Card Number 1 Postcode}" into "Input Box" field
    And user presses "OK" button and "Loyalty Select Customer Search By Postcode" page shown
    And user selects "${Customer Deposit Card Number 1 name}" from "Selection List" list
    And user presses "OK" button and "Display Document" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-2345 @POS @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: Perform a Customer Deposit Account Enquiry by Customer Account ID Search
    Given user signs on as "Pos Operator"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Customer Deposits" button
    And user presses "Deposit Account Enquiry" button and "Loyalty Account Enquiry" page shown
    And user enters "${Customer Deposit  Card Number 1 Account Number}" into "Input Box" field
    And user presses "OK" button and "Display Document" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
