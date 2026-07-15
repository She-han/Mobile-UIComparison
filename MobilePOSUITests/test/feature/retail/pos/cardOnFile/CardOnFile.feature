Feature: Card On File

  @PT-3593 @COF @PaymentServicesAutomation
  Scenario: Card Registration when card holder present
    Given user signs on as "Sales Assistant"
    Given View data of type "java.lang.String" with name "enactor.identity.AccessToken" and value "${COF Access Token}" is set
    And View data of type "java.lang.Long" with name "enactor.identity.AccessTokenExpiry" and value "${COF Expiry Date}" is set
		And user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Stored Card" button
    And user presses "Register Card" button and "Loyalty_Account_Enquiry" page shown
    When user enters "${Loyalty Card On File Number 2}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Account Details" page is shown
    When user presses "OK" button and "Register Payment Card" page shown
    And user presses "Add" button and "Add Card Prompt" page shown
    And "Preference Capture" page is shown
    And user presses "Register" button and "Registration Confirmation" page shown
		Then "Registration Confirmation" page is shown
		And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-3391 @COF @PaymentServicesAutomation
  Scenario: Card Registration for already registered card
    #Register same card for the same customer again
    Given user signs on as "Sales Assistant"
    Given View data of type "java.lang.String" with name "enactor.identity.AccessToken" and value "${COF Access Token}" is set
    And View data of type "java.lang.Long" with name "enactor.identity.AccessTokenExpiry" and value "${COF Expiry Date}" is set
		And user presses "Sales" button
    And user presses "More" button
    And user presses "Register Card" button and "Loyalty Account Enquiry" page shown
    When user enters "${Loyalty Card On File Number 1}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Account Details" page is shown
    When user presses "OK" button and "Register Payment Card" page shown
    And user presses "Add" button and "Preference Capture" page shown
    And user presses "Register" button and "Registration Confirmation" page shown
		Then "Registration Confirmation" page is shown
		When user presses "OK" button and "Already Registered" page shown
		When user presses "OK" button and "Register Payment Card" page shown
    Then user presses "Cancel" button and "Exit Registration Confirmation" page shown
    When user presses "Yes" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown   

  @PT-4877 @COF @PaymentServicesAutomation
  Scenario: Card Registration when Card holder is not present
    Given user signs on as "Sales Assistant"
    Given View data of type "java.lang.String" with name "enactor.identity.AccessToken" and value "${COF Access Token}" is set
    And View data of type "java.lang.Long" with name "enactor.identity.AccessTokenExpiry" and value "${COF Expiry Date}" is set
		And user presses "Sales" button
    And user presses "More" button
    And user presses "Register Card CNP" button and "Loyalty Account Enquiry" page shown
    When user enters "${Loyalty Card On File Number 1}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Account Details" page is shown
    When user presses "OK" button and "Register Payment Card" page shown
    When user presses "Add" button and "Check Customer Details" page shown
    And user presses "OK" button and "Preference Capture" page shown
    And user presses "Register" button and "Registration Confirmation" page shown
		And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
    
  @PT-3252 @COF @PaymentServicesAutomation
  Scenario: Registering a card when the basket is not empty
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
		And user presses "Sales" button
    And user presses "More" button
    And user presses "Register Card" button and "Basket Not Empty" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    Then user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    When user selects "Customer Left Store" from "Selection List" list
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-17405 @COF @PaymentServicesAutomation
  Scenario: Updating a registered card
    Given user signs on as "Sales Assistant"
    Given View data of type "java.lang.String" with name "enactor.identity.AccessToken" and value "${COF Access Token}" is set
    And View data of type "java.lang.Long" with name "enactor.identity.AccessTokenExpiry" and value "${COF Expiry Date}" is set
	And user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Stored Card" button
    And user presses "Register Card" button and "Loyalty_Account_Enquiry" page shown
    When user enters "${Loyalty Card On File Number 2}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Account Details" page is shown
    When user presses "OK" button and "Register Payment Card" page shown
    And user presses "Edit" button and "Preference Capture" page shown
    And user presses "Update" button and "Confirm Update" page shown
	And user presses "OK" button and "Wait Update" page shown
    Then "Recovery Window" page is shown
    
  @PT-19749 @COF @PaymentServicesAutomation
  Scenario: Validating that the expiry date is populating in the Card Edit screen
    Given user signs on as "Sales Assistant"
    Given View data of type "java.lang.String" with name "enactor.identity.AccessToken" and value "${COF Access Token}" is set
    And View data of type "java.lang.Long" with name "enactor.identity.AccessTokenExpiry" and value "${COF Expiry Date}" is set
		And user presses "Sales" button
    And user presses "More" button
    And user presses "More" button
    And user presses "Stored Card" button
    And user presses "Register Card" button and "Loyalty_Account_Enquiry" page shown
    When user enters "${Loyalty Card On File Number 2}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Account Details" page is shown
    When user presses "OK" button and "Register Payment Card" page shown
    And user presses "Edit" button and "Preference Capture" page shown
    And "Capture Expiry Date" field displays the text "${Cof Expiry Date}"
    When user presses "Cancel" button and "Register Payment Card" page shown
    Then user presses "Cancel" button and "Exit Registration Confirmation" page shown
    When user presses "Yes" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

    
  @PT-3594 @COF @PaymentServicesAutomation
  Scenario: Sale an item with MasterCard tender
    Given user signs on as "Sales Assistant"
    Given View data of type "java.lang.String" with name "enactor.identity.AccessToken" and value "${COF Access Token}" is set
    And View data of type "java.lang.Long" with name "enactor.identity.AccessTokenExpiry" and value "${COF Expiry Date}" is set
		And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "More" button
    When user presses "Stored Card Tender" button and "Loyalty Account Enquiry" page shown
    When user enters "${Loyalty Card On File Number 1}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Account Details" page is shown
    When user presses "OK" button and "Registered Card" page shown
    And user selects "VISA" from "Items Narrow List" list
    And user presses "Select" button and "DCC Offer" page shown
    Then user presses "No" button and "Card Tender Amount" page shown
    And user presses "OK" button and "Payment Confirmation" page shown
    Then user presses "OK" button
    And receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price} |
      | item | Mastercard,-£8.50                           |
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-4883 @COF @PaymentServicesAutomation
  Scenario: CardOnFile Refund - Not Original Card
    Given user signs on as "Sales Assistant"
    Given View data of type "java.lang.String" with name "enactor.identity.AccessToken" and value "${COF Access Token}" is set
    And View data of type "java.lang.Long" with name "enactor.identity.AccessTokenExpiry" and value "${COF Expiry Date}" is set
		And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "More" button
    When user presses "Stored Card Tender" button and "Loyalty Account Enquiry" page shown
    When user enters "${Loyalty Card On File Number 1}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Account Details" page is shown
    When user presses "OK" button and "Registered Card" page shown
    And user selects "VISA" from "Items Narrow List" list
    And user presses "Select" button and "DCC Offer" page shown
    Then user presses "No" button and "Card Tender Amount" page shown
    And user presses "OK" button and "Payment Confirmation" page shown
    Then user presses "OK" button
    And receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price} |
      | item | Mastercard,-£8.50                           |
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    #waits for transaction to appear &proccess in EM
    And user waits "90" seconds
    When user signs on as "Sales Assistant"
    Given View data of type "java.lang.String" with name "enactor.identity.AccessToken" and value "${COF Access Token}" is set
    And View data of type "java.lang.Long" with name "enactor.identity.AccessTokenExpiry" and value "${COF Expiry Date}" is set
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Extended Return Details" page shown
    When user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "Damaged / Faulty (30 Days)" from "Selection List" list
    And user presses "OK" button and "Promotion Details Screen" page shown
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    When user selects "Stored Card " from "Selection List" list
    And user presses "OK" button and "Original Tender Refund Confirmation" page shown
    And user presses "Yes" button and "Original Card Refund Confirmation" page shown
    And user presses "Yes" button and "Card Tender Amount" page shown
    And user presses "OK" button and "Confirm Refund" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Transaction Basket" page shown
    And receipt display with following details
      | text | Refund                                         |
      | item | ${Product 2 Description},${Product 2 Price} |
    When user presses "SignOff" button
    Then "Enter User" page is shown     
     
  @PT-4881 @COF @PaymentServicesAutomation
  Scenario: CardOnFile Refund Original - No Portal login
    Given user signs on as "Sales Assistant"
    Given View data of type "java.lang.String" with name "enactor.identity.AccessToken" and value "${COF Access Token}" is set
    And View data of type "java.lang.Long" with name "enactor.identity.AccessTokenExpiry" and value "${COF Expiry Date}" is set
		And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "More" button
    When user presses "Stored Card Tender" button and "Loyalty Account Enquiry" page shown
    When user enters "${Loyalty Card On File Number 1}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Account Details" page is shown
    When user presses "OK" button and "Registered Card" page shown
    And user selects "VISA" from "Items Narrow List" list
    And user presses "Select" button and "DCC Offer" page shown
    Then user presses "No" button and "Card Tender Amount" page shown
    And user presses "OK" button and "Payment Confirmation" page shown
    Then user presses "OK" button
    And receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price} |
      | item | Mastercard,-£8.50                           |
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    #waits for transaction to appear &proccess in EM
    And user waits "90" seconds
    When user signs on as "Sales Assistant"
    Given View data of type "java.lang.String" with name "enactor.identity.AccessToken" and value "${COF Access Token}" is set
    And View data of type "java.lang.Long" with name "enactor.identity.AccessTokenExpiry" and value "${COF Expiry Date}" is set
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Extended Return Details" page shown
    When user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "Damaged / Faulty (30 Days)" from "Selection List" list
    And user presses "OK" button and "Promotion Details Screen" page shown
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    When user selects "Stored Card " from "Selection List" list
    And user presses "OK" button and "Original Tender Refund Confirmation" page shown
    And user presses "Yes" button and "Original Card Refund Confirmation" page shown
    And user presses "No" button and "Original Card Refund With Portal Sign On" page shown
    And user presses "No" button and "Refund To Stored Card" page shown
    When user presses "Yes" button and "Registered Card" page shown
    And user selects "MASTERCARD" from "Items Narrow List" list
    And user presses "Select" button and "Card Tender Amount" page shown
    And user presses "OK" button and "Payment Confirmation" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button
    And receipt display with following details
      | text | Refund                                         |
      | item | ${Product 2 Description},${Product 2 Price} |
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-3398 @COF @PaymentServicesAutomation
  Scenario: Validate if DCC was used on the original tender then refund in DCC may be allowed otherwise refund will be in base currency.
    Given user signs on as "Sales Assistant"
    Given View data of type "java.lang.String" with name "enactor.identity.AccessToken" and value "${COF Access Token}" is set
    And View data of type "java.lang.Long" with name "enactor.identity.AccessTokenExpiry" and value "${COF Expiry Date}" is set
		And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "More" button
    When user presses "Stored Card Tender" button and "Loyalty Account Enquiry" page shown
    When user enters "${Loyalty Card On File Number 1}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Account Details" page is shown
    When user presses "OK" button and "Registered Card" page shown
    And user selects "VISA" from "Items Narrow List" list
    And user presses "Select" button and "DCC Offer" page shown
    Then user presses "Yes" button and "Enter Tender Amount DCC" page shown
    And user presses "OK" button and "Payment Confirmation" page shown
    Then user presses "OK" button
    And receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price} |
      | text | TRANSACTION CURRENCY Euros                  |
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    #waits for transaction to appear &proccess in EM
    And user waits "90" seconds
    When user signs on as "Sales Assistant"
    Given View data of type "java.lang.String" with name "enactor.identity.AccessToken" and value "${COF Access Token}" is set
    And View data of type "java.lang.Long" with name "enactor.identity.AccessTokenExpiry" and value "${COF Expiry Date}" is set
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Extended Return Details" page shown
    When user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "Damaged / Faulty (30 Days)" from "Selection List" list
    And user presses "OK" button and "Promotion Details Screen" page shown
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    And user presses "Skip Original Tenders" button and "Refund Item" page shown
    And user presses "More" button
    When user presses "Stored Card Refund" button and "Registered Card" page shown
    And user selects "VISA" from "Items Narrow List" list
    And user presses "Select" button and "DCC Offer" page shown
    Then user presses "Yes" button and "Enter Tender Amount DCC" page shown
    And user presses "OK" button and "Payment Confirmation" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Transaction Basket" page shown
    And receipt display with following details
      | text | Refund                                         |
      | item | ${Product 2 Description},${Product 2 Price} |
    When user presses "SignOff" button
    Then "Enter User" page is shown     


  @PT-3435 @COF @PaymentServicesAutomation
  Scenario: Refund with DCC: Validate Stored Card Refund Original Card, No Portal Sign-on
    Given user signs on as "Sales Assistant"
    Given View data of type "java.lang.String" with name "enactor.identity.AccessToken" and value "${COF Access Token}" is set
    And View data of type "java.lang.Long" with name "enactor.identity.AccessTokenExpiry" and value "${COF Expiry Date}" is set
		And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "More" button
    When user presses "Stored Card Tender" button and "Loyalty Account Enquiry" page shown
    When user enters "${Loyalty Card On File Number 1}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Account Details" page is shown
    When user presses "OK" button and "Registered Card" page shown
    And user selects "VISA" from "Items Narrow List" list
    And user presses "Select" button and "DCC Offer" page shown
    Then user presses "Yes" button and "Enter Tender Amount DCC" page shown
    And user presses "OK" button and "Payment Confirmation" page shown
    Then user presses "OK" button
    And receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price} |
      | text | TRANSACTION CURRENCY Euros                  |
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    #waits for transaction to appear &proccess in EM
    And user waits "90" seconds
    When user signs on as "Sales Assistant"
    Given View data of type "java.lang.String" with name "enactor.identity.AccessToken" and value "${COF Access Token}" is set
    And View data of type "java.lang.Long" with name "enactor.identity.AccessTokenExpiry" and value "${COF Expiry Date}" is set
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Extended Return Details" page shown
    When user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "Damaged / Faulty (30 Days)" from "Selection List" list
    And user presses "OK" button and "Promotion Details Screen" page shown
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    When user selects "Stored Card " from "Selection List" list
    And user presses "OK" button and "Original Tender Refund Confirmation" page shown
    And user presses "Yes" button and "Original Card Refund Confirmation" page shown
    And user presses "Yes" button and "DCC Offer CNP" page shown
    Then user presses "Yes" button and "Enter Tender Amount DCC" page shown
    And user presses "OK" button and "Confirm Refund" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Transaction Basket" page shown
    And receipt display with following details
      | text | Refund                                         |
      | item | ${Product 2 Description},${Product 2 Price} |
    When user presses "SignOff" button
    Then "Enter User" page is shown   
    
  @PT-3434 @COF @PaymentServicesAutomation
  Scenario: Refund with DCC, Validate Refund with No Original Tender
    Given user signs on as "Sales Assistant"
    Given View data of type "java.lang.String" with name "enactor.identity.AccessToken" and value "${COF Access Token}" is set
    And View data of type "java.lang.Long" with name "enactor.identity.AccessTokenExpiry" and value "${COF Expiry Date}" is set
		And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "More" button
    When user presses "Stored Card Tender" button and "Loyalty Account Enquiry" page shown
    When user enters "${Loyalty Card On File Number 1}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Account Details" page is shown
    When user presses "OK" button and "Registered Card" page shown
    And user selects "VISA" from "Items Narrow List" list
    And user presses "Select" button and "DCC Offer" page shown
    Then user presses "Yes" button and "Enter Tender Amount DCC" page shown
    And user presses "OK" button and "Payment Confirmation" page shown
    Then user presses "OK" button
    And receipt display with following details
      | item | ${Product 2 Description},${Product 2 Price} |
      | text | TRANSACTION CURRENCY Euros                  |
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    #waits for transaction to appear &proccess in EM
    And user waits "90" seconds
    When user signs on as "Sales Assistant"
    Given View data of type "java.lang.String" with name "enactor.identity.AccessToken" and value "${COF Access Token}" is set
    And View data of type "java.lang.Long" with name "enactor.identity.AccessTokenExpiry" and value "${COF Expiry Date}" is set
    And user presses "Returns" button and "Transaction Basket" page shown
    And user presses "Return Receipt" button and "Enter Original Transaction Id" page shown
    Then user enters "${retrieveTransaction(1)}" into "Input Box" field
    And user presses "OK" button and "Extended Return Details" page shown
    When user presses "Return Entire Receipt" button and "Confirm Return Complete Receipt" page shown
    And user presses "OK" button and "Select Reason" page shown
    When user selects "Damaged / Faulty (30 Days)" from "Selection List" list
    And user presses "OK" button and "Promotion Details Screen" page shown
    And user presses "OK" button and "Return Slip Message" page shown
    And user presses "Yes" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Return Tender" page shown
    When user selects "Stored Card " from "Selection List" list
    And user presses "OK" button and "Original Tender Refund Confirmation" page shown
    And user presses "Yes" button and "Original Card Refund Confirmation" page shown
    And user presses "No" button and "Original Card Refund With Portal Sign On" page shown
    And user presses "No" button and "Refund To Stored Card" page shown
    When user presses "Yes" button and "Registered Card" page shown
    And user selects "VISA" from "Items Narrow List" list
    And user presses "Select" button and "DCC Offer CNP" page shown
    Then user presses "Yes" button and "Enter Tender Amount DCC" page shown
    And user presses "OK" button and "Payment Confirmation" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Transaction Basket" page shown
    And receipt display with following details
      | text | Refund                                         |
      | item | ${Product 2 Description},${Product 2 Price} |
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-3825 @COF @PaymentServicesAutomation
  Scenario: Validate removing a CoF registered card
    Given user signs on as "Sales Assistant"
    Given View data of type "java.lang.String" with name "enactor.identity.AccessToken" and value "${COF Access Token}" is set
    And View data of type "java.lang.Long" with name "enactor.identity.AccessTokenExpiry" and value "${COF Expiry Date}" is set
		Then user presses "Sales" button
		Then user presses "More" button
		Then user presses "Register Card" button and "Loyalty Account Enquiry" page shown
		When user enters "${Loyalty Card On File Number 1}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Account Details" page is shown
    When user presses "OK" button and "Register Payment Card" page shown
    And user selects "0045" from "Items Narrow List" list
    And user presses "Remove" button and "Delete Card Confirmation" page shown
    Then user presses "OK" button and "Register Payment Card" page shown
    And "0507" is not displayed in "Items Narrow List" list 
    Then user presses "Cancel" button and "Exit Registration Confirmation" page shown
    When user presses "Yes" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
      
    
  @PT-3393 @COF @PaymentServicesAutomation
  Scenario: Register a same card for different customers
    Given user signs on as "Sales Assistant"
    Given View data of type "java.lang.String" with name "enactor.identity.AccessToken" and value "${COF Access Token}" is set
    And View data of type "java.lang.Long" with name "enactor.identity.AccessTokenExpiry" and value "${COF Expiry Date}" is set
		And user presses "Sales" button
    And user presses "More" button
    And user presses "Register Card" button and "Loyalty Account Enquiry" page shown
    When user enters "${Loyalty Card On File Number 1}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Account Details" page is shown
    When user presses "OK" button and "Register Payment Card" page shown
    And user presses "Add" button and "Preference Capture" page shown
    And user presses "Register" button and "Registration Confirmation" page shown
		Then "Registration Confirmation" page is shown
		And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    Given user signs on as "Sales Assistant"
    Given View data of type "java.lang.String" with name "enactor.identity.AccessToken" and value "${COF Access Token}" is set
    And View data of type "java.lang.Long" with name "enactor.identity.AccessTokenExpiry" and value "${COF Expiry Date}" is set
		And user presses "Sales" button
    And user presses "More" button
    And user presses "Register Card" button and "Loyalty Account Enquiry" page shown
    When user enters "${Loyalty Card Number 2}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Account Details" page is shown
    When user presses "OK" button and "Register Payment Card" page shown
    And user presses "Add" button and "Preference Capture" page shown
    And user presses "Register" button and "Registration Confirmation" page shown
		Then "Registration Confirmation" page is shown
		And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    


