Feature: Customer Account Test

  @PT-533 @PreSales @Regression @AUTOMATED @POS @POSValidatedTest @POSSet1
  Scenario: Customer Account Enquiry
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Customer AC" button
    When user presses "Credit Account Enquiry" button and "Loyalty Account Enquiry" page shown
    And user enters "${Customer 1 Account ID}" into "Input Box" field
    And user presses "OK" button and "Display Document" page shown
    And user presses "Print" button
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | Account Enquiry                                       |
      | item      | Name ${Customer 1 Full Name}   Address ${Customer 1 Address Line1},${Customer 1 Address Line2},${Customer 1 Address Town},${Customer 1 Address Postcode}  |
      | text      | Account ID    1                                       |
      | text      | Type          Customer Credit Account                 |
      | text      | Balance                                               |
      | item      | Status,Active                                         |
      | text      | Michael Browne                                        |
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-15800 @Regression @POSCustomerAccountsTender @POS
  Scenario: Verify that the customer credit account balance details page shown when the customer account card scanned.
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Customer AC" button
    When user presses "Credit Account Enquiry" button and "Loyalty Account Enquiry" page shown
    Then "Scanner" page is shown
    When user enters "${Customer 1 Account ID}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Display Document" page is shown
    When user presses "Print" button
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | Account Enquiry                                       |
      | item      | Name ${Customer 1 Full Name}   Address ${Customer 1 Address Line1},${Customer 1 Address Line2},${Customer 1 Address Town},${Customer 1 Address Postcode}  |
      | text      | Account ID    1                                       |
      | text      | Type          Customer Credit Account                 |
      | text      | Balance                                               |
      | item      | Status,Active                                         |
      | text      | Michael Browne                                        |
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown
