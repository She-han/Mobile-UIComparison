Feature: Tender with Cheque

  @PT-1301 @UKChequeNumberValidation @UKBankNumbers @POS @UKChequeTransactions @AUTOMATED @POSValidatedTest @POSSet3
  Scenario: UK Cheque Number Validation - Valid Cheque Number
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cheque" button and "Select Cheque Type" page shown
    And user presses "Business" button and "Cheque Tender Amount" page shown
    And user presses "OK" button and "Enter Cheque Number" page shown
    When user enters "${Tender Cheque Number UK}" into "Input Box" field
    Then user presses "OK" button and "Enter Cheque Sort Code" page shown
    When user enters "${Tender Cheque Sort Code UK}" into "Input Box" field
    And user presses "OK" button and "Enter Cheque Account Number" page shown
    When user enters "${Tender Cheque Account Number UK}" into "Input Box" field
    And user presses "OK" button and "Cheque Signature Verification" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description}, ${Product 1 Price}          |
      | text      | Cheques UK                                            |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1302 @UKChequeNumberErrorValidation @UKBankNumbers @POS @UKChequeTransactions @AUTOMATED @POSValidatedTest @POSSet3
  Scenario Outline: UK Cheque Account Number Error Validation - Invalid Cheque Account Number
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cheque" button and "Select Cheque Type" page shown
    And user presses "Business" button and "Cheque Tender Amount" page shown
    And user presses "OK" button and "Enter Cheque Number" page shown
    When user enters "${Tender Cheque Number UK}" into "Input Box" field
    Then user presses "OK" button and "Enter Cheque Sort Code" page shown
    When user enters "${Tender Cheque Sort Code UK}" into "Input Box" field
    And user presses "OK" button and "Enter Cheque Account Number" page shown
    When user enters <UK Cheque Account> into "Input Box" field
    And user presses "OK" button
    And "Invalid Cheque Number" page is shown
    And user presses "OK" button and "Enter Cheque Account Number" page shown
    And user presses "Cancel" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description}, ${Product 1 Price}          |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

    Examples: 
      | UK Cheque Account |
      | "1"               |
      | "12345"           |
      | "12345678901"     |

  @PT-1303 @UKChequeNumberValidation @UKBankNumbers @POS @UKChequeTransactions @AUTOMATED @POSValidatedTest @POSSet3
  Scenario Outline: UK Cheque Account Number Error Validation - Valid cheque account number
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cheque" button and "Select Cheque Type" page shown
    And user presses "Business" button and "Cheque Tender Amount" page shown
    And user presses "OK" button and "Enter Cheque Number" page shown
    When user enters "${Tender Cheque Number UK}" into "Input Box" field
    Then user presses "OK" button and "Enter Cheque Sort Code" page shown
    When user enters "${Tender Cheque Sort Code UK}" into "Input Box" field
    And user presses "OK" button and "Enter Cheque Account Number" page shown
    When user enters <UK Cheque Account> into "Input Box" field
    And user presses "OK" button and "Cheque Signature Verification" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | item      | ${Product 1 Description}, ${Product 1 Price}          |
      | text      | Cheques UK                                            |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

    Examples: 
      | UK Cheque Account |
      | "1234567"         |
      | "123456789"       |
      | "1234567890"      |

  @PT-1300 @POS @AUTOMATED @UKBankNumbers @POSValidatedTest @POSSet3
  Scenario: UK Cheque Number Validation - Invalid cheque number
    Given user signs on as "Sales Assistant"
    And user enters "1" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cheque" button and "Select Cheque Type" page shown
    And user presses "Business" button and "Cheque Tender Amount" page shown
    And user presses "OK" button and "Enter Cheque Number" page shown
    And user enters "${Tender Invalid Cheque Number Uk}" into "Input Box" field
    And user presses "OK" button
    Then "Invalid Cheque Number Error" page is shown
    And user presses "OK" button and "Enter Cheque Number" page shown
    And user presses "Cancel" button and "Select Tender" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
