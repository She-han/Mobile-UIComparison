Feature: Create new Customer from CRM

  @PT-9928 @PreSales @POS @CRM @AUTOMATED 
  Scenario: New Customer Screen Clear button check
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Customers" icon button
    Then "CRM Select Customers Screen" page is shown
    When user presses "New Customer" icon button
    Then "CRM Capture Customer Details" page is shown
    When user selects "Mr" from "CRM Customer Title Input" combobox
    Then user enters "CRMFirstName" into "CRM Customer First Name Input" field
    And user enters "CRMSurname" into "CRM Customer Surname Input" field
    When user selects "United Kingdom" from "CRM Customer Country Code Input" combobox
    And user enters "SG13 8AT" into "CRM Customer Postcode Input" field
    And user enters "Cambridge House" into "CRM Customer Street One Input" field
    And user enters "Bluecoats Avenue" into "CRM Customer Street Two Input" field
    And user enters "Oak Grove" into "CRM Customer Street Three Input" field
    And user enters "Hertford" into "CRM Customer Town Input" field
    And user enters "Herts" into "CRM Customer County Input" field
    And user enters "321654987" into "CRM Customer Tel Input" field
    And user enters "crm_customer1@enactor.co.uk" into "CRM Customer Email Input" field
    And user presses "Toggle Alpha Keyboard" icon button
    Then "CRM Capture Customer Details Hide Keyboard" page is shown
    When user presses "CRM Clear Button" icon button
    #field displays the text
		And user confirms "CRM Customer First Name Input" field does not displays the text "CRMFirstName"
    And user confirms "CRM Customer Surname Input" field does not displays the text "CRMSurname"
    And user confirms "CRM Customer Postcode Input" field does not displays the text "SG13 8AT"
    And user confirms "CRM Customer Street One Input" field does not displays the text "Cambridge House"
    And user confirms "CRM Customer Street Two Input" field does not displays the text "Bluecoats Avenue"
    When user presses "Back Button" icon button
    Then "CRM Select Customers Screen" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
@PT-11385 @PreSales @CRMAddNewCustomer @POS @CRM @POSValidatedTest @POSSet1
  Scenario: New Customer - Create new customer with Customer Type and Organisation
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    And user presses "Customers" icon button
    And "CRM Select Customers Screen" page is shown
    And user presses "New Customer" icon button
    And "CRM Capture Customer Details" page is shown
    When user selects "Retail" from "CRM Customer Address Type Text Input" combobox
    And user enters "CRM Organisation" into "CRM Customer Organisation Text Input" field
    Then user selects "Mr" from "CRM Customer Title Input" combobox
    And user enters "CRMFirstNameTest2" into "CRM Customer First Name Input" field
    And user enters "CRMSurnameTest2" into "CRM Customer Surname Input" field
    When user selects "United Kingdom" from "CRM Customer Country Code Input" combobox
    And user enters "SG13 8AT" into "CRM Customer Postcode Input" field
    And user enters "Cambridge House" into "CRM Customer Street One Input" field
    And user enters "Bluecoats Avenue" into "CRM Customer Street Two Input" field
    And user enters "Oak Grove" into "CRM Customer Street Three Input" field
    And user enters "Hertford" into "CRM Customer Town Input" field
    And user enters "Herts" into "CRM Customer County Input" field
    And user enters "321654987" into "CRM Customer Tel Input" field
    And user enters "crm_customer2@enactor.co.uk" into "CRM Customer Email Input" field
    When user presses "CRM Save Button" icon button
    Then "CRM Client Details" page is shown
    And user presses "Back Button" icon button
    And "CRM Select Customers Screen" page is shown
    And user presses "Back Button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    

  @PT-212 @PreSales @CRMAddNewCustomer @MVP @Mobile @POS @CRM @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Create new Customer from CRM
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Customers" icon button
    Then "CRM Select Customers Screen" page is shown
    When user presses "New Customer" icon button
    Then "CRM Capture Customer Details" page is shown
    When user selects "Mr" from "CRM Customer Title Input" combobox
    And user enters "CRMFirstName" into "CRM Customer First Name Input" field
    And user enters "CRMSurname" into "CRM Customer Surname Input" field
    When user selects "United Kingdom" from "CRM Customer Country Code Input" combobox
    And user enters "SG13 8AT" into "CRM Customer Postcode Input" field
    And user enters "Cambridge House" into "CRM Customer Street One Input" field
    And user enters "Bluecoats Avenue" into "CRM Customer Street Two Input" field
    And user enters "Oak Grove" into "CRM Customer Street Three Input" field
    And user enters "Hertford" into "CRM Customer Town Input" field
    And user enters "Herts" into "CRM Customer County Input" field
    And user enters "321654987" into "CRM Customer Tel Input" field
    And user enters "crm_customer1@enactor.co.uk" into "CRM Customer Email Input" field
    When user presses "CRM Save Button" icon button
    Then "CRM Client Details" page is shown
    When user presses "Back Button" icon button
    Then "CRM Select Customers Screen" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
