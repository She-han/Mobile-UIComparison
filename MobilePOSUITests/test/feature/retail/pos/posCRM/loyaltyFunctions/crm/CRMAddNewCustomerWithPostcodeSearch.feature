Feature: Create new Customer from CRM with Postcode search

  @PT-1360 @CRMAddressLookup @POS @CRM @AUTOMATED @POSValidatedTest	@POSSet1
  Scenario: Create new Customer from CRM with Postcode search
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
    And user enters "SG1" into "CRM Customer Postcode Input" field
    And user presses "CRM Customer Address Lookup" icon button
    Then "CRM Postcode Address Selection" page is shown
    When user presses "Select" button
    Then "CRM Address Not Selected Message" page is shown
    When user presses "OK" button
    Then "CRM Postcode Address Selection" page is shown
    ##Single component "TABLE_CELL_1" for whole table. Clicking on component selects the first record
    When user presses "CRM Customer Postcode Address Table" icon button
    When user presses "Select" button
    Then "CRM Capture Customer Details" page is shown
    And "CRM Customer Postcode Input" field displays the text "SG141PB"
    And "CRM Customer Street One Input" field displays the text "3 Bluecoats Avenue"
    And "CRM Customer Street Two Input" field displays the text "SG14 1PB"
    And "CRM Customer Street Three Input" field displays the text "UK 59200"
    And "CRM Customer Town Input" field displays the text "Hertford"
    And "CRM Customer County Input" field displays the text "Hertfordshire County"
    When user enters "321654987" into "CRM Customer Tel Input" field
    And user enters "crm_postcode1@enactor.co.uk" into "CRM Customer Email Input" field
    And user presses "Toggle Alpha Keyboard" icon button
    Then "CRM Capture Customer Details Hide Keyboard" page is shown
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
