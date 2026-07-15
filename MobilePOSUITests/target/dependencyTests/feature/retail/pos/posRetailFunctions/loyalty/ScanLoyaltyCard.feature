Feature: Scan Loyalty Card

  @PT-1426 @Harrods_Sanity @Harrods_Restaurant @Harrods @AUTOMATED
  Scenario: Scanning a rewards card at tender
    Given "Enter User" page is shown
    And user enters "${Manager 4 Username}" into "User Name Text" field
    And user enters "${Manager 4 Password}" into "Password Text" field
    And user presses "ENT" button
    And "Loyalty Account Enquiry" page is shown
    And user presses "Skip" button and "Transaction Basket" page shown
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Loyalty Account Enquiry" page shown
    And user presses "Skip" button and "Select Tender" page shown
    And user presses "Vouchers" button
    And user presses "Gift Card" button and "Get Gift Card Number" page shown
    And "Scanner" page is shown
    When user enters "${Gift Card Number 6}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    And "Card Tender Amount" page is shown
    And user presses "OK" button and "Loyalty Account Enquiry" page shown
    And user presses "Skip" button and "Transaction Basket" page shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-11493 @CaptureLoyalty @Loyalty @POS @AUTOMATED @NotForWeeklyRegression
  Scenario: Capturing multiple loyalty cards
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    When user presses "Capture Loyalty" button and "Loyalty Account Enquiry" page shown
    Then user enters "${Loyalty Card Number 8}" into "Input Box" field
    And user presses "OK" button
    And "Loyalty Account Details" page is shown
    And "Customer Loyalty Details Forname" field displays the text "${Loyalty Card Number 8 Forname}"
    And "Customer Loyalty Details Surname" field displays the text "${Loyalty Card Number 8 Surname}"
    And "Customer Loyalty Details Account Number" field displays the text "${Loyalty Card Number 8 Account Number}"
    And "Customer Loyalty Details Address Line1" field displays the text "${Loyalty Card Number 8 Address Line1}"
    And "Customer Loyalty Details Address Line2" field displays the text "${Loyalty Card Number 8 Address Line2}"
    And "Customer Loyalty Details Postcode" field displays the text "${Loyalty Card Number 8 postcode}"
    And "Customer Loyalty Details Balance" field displays the text "${Loyalty Card Number 8 Balance}"
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    When user presses "Capture Loyalty" button and "Loyalty Account Enquiry" page shown
    And user enters "${Loyalty Card Number 9}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Account Details" page is shown
    And "Customer Loyalty Details Forname" field displays the text "${Loyalty Card Number 9 Forname}"
    And "Customer Loyalty Details Surname" field displays the text "${Loyalty Card Number 9 Surname}"
    And "Customer Loyalty Details Account Number" field displays the text "${Loyalty Card Number 9 Account Number}"
    And "Customer Loyalty Details Address Line1" field displays the text "${Loyalty Card Number 9 Address Line1}"
    And "Customer Loyalty Details Address Line2" field displays the text "${Loyalty Card Number 9 Address Line2}"
    And "Customer Loyalty Details Postcode" field displays the text "${Loyalty Card Number 9 postcode}"
    And "Customer Loyalty Details Balance" field displays the text "${Loyalty Card Number 9 Balance}"
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
