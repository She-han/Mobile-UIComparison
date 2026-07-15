Feature: Prompt Loyalty After Transaction And Offer Loyalty Card

  @PT-11983 @AUTOMATED @MVP @Loyalty @POS @POSValidatedTest @NotForWeeklyRegression @ToBeFixedAutTest
  Scenario: Prompt for Loyalty at Start of Transaction - Proceed with valid loyalty card number
    Given user signs on as "Sales Assistant"
    And user enters "${Sku Product 1}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button
    Then "Loyalty Account Enquiry" page is shown
    And user presses "Skip" button and "Loyalty Issue New Card" page shown
    And user presses "Issue New Card" button and "Loyalty Account Enquiry" page shown
    When user enters "${Loyalty Card Number 6}" into "Input Box" field
    And user waits "1" seconds
    And user presses "OK" button and "Capture Customer Name" page shown
    When user enters "${Customer 1 Name}" into "Customer Forename Text" field
    And user enters "${Customer 1 SurName}" into "Customer SurName Text" field
    And user enters "${Customer 1 Organisation}" into "Customer Organisation Text" field
    And user selects "${Customer 1 Title}" from "Customer Title DropDown" combobox
    And user enters "${Customer 1 Initials}" into "Customer Initials Text" field
    And user selects "${Customer 1 Sex}" from "Customer Sex DropDown" combobox
    And user enters "${Customer 1 DOB}" into "Customer Date Of Birth Text" field
    And user presses "OK" button
    Then "Capture Customer Address" page is shown
    When user enters "${Customer 1 Address Organisation}" into "Customer Address Organisation Text" field
    And user enters "${Customer 1 Address Line1}" into "Customer Address Line1 Text" field
    And user enters "${Customer 1 Address Line2}" into "Customer Address Line2 Text" field
    And user enters "${Customer 1 Address Line3}" into "Customer Address Line3 Text" field
    And user enters "${Customer 1 Address Town}" into "Customer Town Text" field
    And user enters "${Customer 1 Address County}" into "Customer County Text" field
    And user selects "United Kingdom" from "Customer Address Country DropDown" combobox
    And user enters "${Customer 1 Address Postcode}" into "Customer Postcode" field
    And user presses "OK" button
    Then "Capture Customer Phone Email" page is shown
    When user enters "${Customer 1 Contact Phone1 No}" into "Customer Phone1 Text" field
    And user enters "${Customer 1 Contact Phone2 No}" into "Customer Phone2 Text" field
    And user enters "${Customer 1 Contact Mobile Phone No}" into "Customer Mobile Text" field
    And user enters "${Customer 1 Contact Fax No}" into "Customer Fax Text" field
    And user enters "${Customer 1 Contact Email}" into "Customer Email Text Mandatory" field
    And user presses "Customer Internal Marketing Check Box" checkbox
    And user presses "Customer External Marketing Check Box" checkbox
    And user presses "OK" button
    Then "Loyalty Scheme Prompt" page is shown
    When user selects "${Loyalty Card Number 1 Loyalty Scheme}" from "Customer Loyalty Details Loyalty Scheme" combobox
    And user waits "2" seconds
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
