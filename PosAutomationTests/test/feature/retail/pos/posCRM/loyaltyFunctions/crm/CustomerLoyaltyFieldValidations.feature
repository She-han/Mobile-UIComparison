Feature: Check field validations in customer capture screen

  @PT-8698 @MVP @AUTOMATED @POS @POSValidatedTest @POSSet1 @ToBeFixedAutTest
  Scenario: Customer Loyalty flow - Verify validation message when clicking on OK button without entering the Postcode in the Address Capture screen
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    And user presses "New Loyalty Account" button and "Loyalty Account Enquiry" page shown
    And user enters "${Loyalty Card Number 4}" into "Input Box" field
    And user presses "OK" button
    And "Capture Customer Name" page is shown
    And user enters "Cust_Forename" into "Customer Forename Text" field
    And user enters "Cust_Surname" into "Customer Surname Text" field
    And user enters "Enactor" into "Customer Organisation Text" field
    And user selects "Mr" from "Customer Title Dropdown" combobox
    And user enters "KC" into "Customer Initials Text" field
    And user selects "Male" from "Customer Sex Dropdown" combobox
    And user enters "250487" into "Customer Date of Birth Text" field
    And user presses "OK" button
    And "Capture Customer Address" page is shown
    And user presses "OK" button
    And "Customer Postcode Error" label displays the text "Required"
    And "Capture Customer Address" page is shown
    And user presses "Cancel" button
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
