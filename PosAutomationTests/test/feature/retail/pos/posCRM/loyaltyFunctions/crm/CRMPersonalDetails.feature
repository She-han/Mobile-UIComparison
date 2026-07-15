Feature: CRM - Personal Details

  @PT-467 @SET2 @CRMPersonalDetailsAddRelation @POS @CRM @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Add Relation to Customer in CRM Personal Details
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Customers" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    When user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    And user presses "CRM Customer Search Page Search Button" icon button
    Then "CRM Client Details" page is shown
    When user presses "CRM Personal Details Edit Button" icon button
    Then "CRM Client Details Personal Details" page is shown
    And "Title" is displayed in "CRM Personal Details Panel" panel
    And "${Customer 1 Title}" is displayed in "CRM Personal Details Panel" panel
    And "Forename" is displayed in "CRM Personal Details Panel" panel
    And "${Customer 1 Name}" is displayed in "CRM Personal Details Panel" panel
    And "Surname" is displayed in "CRM Personal Details Panel" panel
    And "${Customer 1 Surname}" is displayed in "CRM Personal Details Panel" panel
    And "Children" is displayed in "CRM Personal Details Panel" panel
    And "Marital Status" is displayed in "CRM Personal Details Panel" panel
    And user presses "CRM Personal Details Add Button" icon button
    Then "CRM Client Details Relationship Details" page is shown
    And user selects "Child" from "CRM Relationship Details Page Relationship Dropdown" combobox
    And user enters "${Crm Customer Relationship Details Surname Input}" into "CRM Customer Relationship Details Surname Input" field
    And user enters "${Crm Customer Relationship Details Forename Input}" into "CRM Customer Relationship Details Forename Input" field
    And user presses "CRM Save Button" icon button
    Then "CRM Client Details Personal Details" page is shown
    When user presses "Back Button" icon button
    Then "CRM Client Details" page is shown
    When user presses "Back Button" icon button
    Then "CRM Select Customers Screen" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-215 @PreSales @POS @CRM @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: CRM Client Details - Personal Details - Edit number of children
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Customers" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    When user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    And user presses "CRM Customer Search Page Search Button" icon button
    Then "CRM Client Details" page is shown
    And user presses "CRM Personal DetailS Edit Button" icon button
    And "CRM Client Details Personal Details" page is shown
    And "Title" is displayed in "CRM Personal Details Panel" panel
    And "${Customer 1 Title}" is displayed in "CRM Personal Details Panel" panel
    And "Forename" is displayed in "CRM Personal Details Panel" panel
    And "${Customer 1 Name}" is displayed in "CRM Personal Details Panel" panel
    And "Surname" is displayed in "CRM Personal Details Panel" panel
    And "${Customer 1 Surname}" is displayed in "CRM Personal Details Panel" panel
    And "Children" is displayed in "CRM Personal Details Panel" panel
    And "Marital Status" is displayed in "CRM Personal Details Panel" panel
    When user presses "CRM Customer Edit Contact Details Button" icon button
    And user enters "2" into "CRM Client Details Edit Children" field
    And user presses "CRM Customer Contact Details Save Button" icon button
    Then "CRM Client Details Personal Details" page is shown
    And "CRM Client Details Edit Children" field displays the text "2"
    And user presses "CRM Customer Edit Contact Details Button" icon button
    And user enters "${Crm Client Details Edit Children}" into "CRM Client Details Edit Children" field
    And user presses "CRM Customer Contact Details Save Button" icon button
    And "CRM Client Details Personal Details" page is shown
    And "CRM Client Details Edit Children" field displays the text "${Crm Client Details Edit Children}"
    And user presses "Back Button" icon button
    And "CRM Client Details" page is shown
    When user presses "Back Button" icon button
    And "CRM Select Customers Screen" page is shown
    And user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
 @PT-11386 @PreSales @CRMContactDetailsEditPhone @POS @CRM @AUTOMATED @CRMClientDetails @POSValidatedTest @POSSet1
  Scenario: Edit Customer - Edit ''Customer Type'' and ''Organisation''
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Customers" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    When user enters "Mark" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "Mark"
    And user enters "demo@enactor.co.uk" into "CRM Customer Search Page Email Text" field
    And "CRM Customer Search Page Email Text" field displays the text "demo@enactor.co.uk"
    And user presses "CRM Customer Search Page Search Button" icon button
    Then "CRM Client Details" page is shown
    And user presses "CRM Personal Details Edit Button" icon button
    And "CRM Client Details Personal Details" page is shown
    And user presses "CRM Customer Edit Contact Details Button" icon button
    And "CRM Client Details Personal Details" page is shown
    And user selects "Business" from "CRM Customer Address Type Input" combobox
    And user enters "CRMOrg Copy" into "CRM Customer Organisation Input" field
    And user presses "CRM Customer Contact Details Save Button" icon button
    And "CRM Client Details Personal Details" page is shown
    And user waits "2" seconds
    And user presses "Back Button" icon button
    And "CRM Client Details" page is shown
    When user presses "Back Button" icon button
    And "CRM Select Customers Screen" page is shown
    And user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
