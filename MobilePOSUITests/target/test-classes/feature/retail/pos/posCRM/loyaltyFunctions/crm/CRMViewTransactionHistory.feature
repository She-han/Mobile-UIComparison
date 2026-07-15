Feature: CRM - View Transaction History

  @PT-459 @PreSales @CRMTransactionHistory @POS @CRM @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Check that the Transaction History screen is displayed with relevant information
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Customers" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    When user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    And user enters "${Customer 1 Email}" into "CRM Customer Search Page Email Text" field
    And "CRM Customer Search Page Email Text" field displays the text "${Customer 1 Email}"
    And user presses "CRM Customer Search Page Search Button" icon button
    Then "CRM Client Details" page is shown
    When user presses "CRM Customer Client Details Page Transaction History Button" icon button
    Then "CRM Transaction History" page is shown
    When user presses "View Transaction History Button" icon button
    Then "CRM Transaction History Details" page is shown
    When user presses "Back Button" icon button
    Then "CRM Transaction History" page is shown
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

  @PT-19011 @CRMTransactionHistory @POS @CRM @AUTOMATED
  Scenario: Verify that the user can navigate to the Stored Customer Basket screen when clicking the Web button on the Transaction History screen
    Given user signs on as "Manager 2"
    #Store Basket by Customer Loyalty Card Number
    When user enters "2" into "Input Box" field
    Then user presses "ENT" button
    And user presses "Sales" button and "Transaction Basket" page shown
    And user presses "Store / Recall Options" button
    And user presses "Store by Customer Basket" button and "Loyalty Account Enquiry" page shown
    And user enters "${Loyalty Card Number 1}" into "Input Box" field
    And user presses "OK" button and "Loyalty Account Details" page shown
    And "Customer Loyalty Details Forname" field contains the text "Mark"
    And "Customer Loyalty Details Surname" field contains the text "Harrison"
    And "Customer Loyalty Details Account Number" field contains the text "1"
    And user presses "OK" button and "Transaction Basket" page shown
    #Verify stored customer basket
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Customers" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    When user enters "${Customer 1 Loyalty No}" into "CRM Customer Search Page Loyalty No Text" field
    Then "CRM Customer Search Page Loyalty No Text" field displays the text "${Customer 1 Loyalty No}"
    When user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    Then "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    And user enters "${Customer 1 Email}" into "CRM Customer Search Page Email Text" field
    And "CRM Customer Search Page Email Text" field displays the text "${Customer 1 Email}"
    And user presses "CRM Customer Search Page Search Button" icon button
    And user waits "2" seconds
    And "CRM Client Details" page is shown
    When user presses "CRM Customer Client Details Page Transaction History Button" icon button
    Then user waits "2" seconds
    And "CRM Transaction History" page is shown
    When user presses "CRM Customer Transaction History Web Button" icon button
    Then user waits "2" seconds
    And "CRM Stored Customer Transaction History" page is shown
    When user presses "View Stored Customer Transaction Button" icon button
    Then user waits "2" seconds
    And "Stored Customer Transaction Details" page is shown
    When user presses "Back Button" icon button
    Then "CRM Stored Customer Transaction History" page is shown
    When user presses "Back Button" icon button
    Then "CRM Transaction History" page is shown
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
