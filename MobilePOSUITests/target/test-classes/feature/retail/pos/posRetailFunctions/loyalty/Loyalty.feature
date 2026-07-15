Feature: Loyalty

  @PT-342 @LoyaltyAccountEnquiry @Loyalty @POS @MVP @AUTOMATED @Smoke @POSValidatedTest @POSSet2
  Scenario: Loyalty Account Enquiry
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    When user presses "Loyalty Account Enquiry" button and "Loyalty Account Enquiry" page shown
    And user enters "${Loyalty Card Number 1}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Account Details" page is shown
    And "Customer Loyalty Details Forname" field displays the text "${Loyalty Card Number 1 Forname}"
    And "Customer Loyalty Details Surname" field displays the text "${Loyalty Card Number 1 Surname}"
    And "Customer Loyalty Details Account Number" field displays the text "${Loyalty Card Number 1 Account Number}"
    And "Customer Loyalty Details Account Status" field displays the text "${Loyalty Card Number 1 Account Status}"
    And "Customer Loyalty Details Loyalty Scheme" field displays the text "${Loyalty Card Number 1 Loyalty Scheme}"
    And "Customer Loyalty Details Loyalty Tier" field displays the text "${Loyalty Card Number 1 Loyalty Tier}"
    #And "Customer Loyalty Details Balance" field displays the text "${Loyalty Card Number 1 Balance}"
    When user presses "Cancel" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-226 @CaptureLoyalty @Loyalty @POS @Harrods @MVP @Support @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Capture Loyalty Card
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    When user presses "Capture Loyalty" button and "Loyalty Account Enquiry" page shown
    And user enters "${Loyalty Card Number 1}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Account Details" page is shown
    And "Customer Loyalty Details Forname" field displays the text "${Loyalty Card Number 1 Forname}"
    And "Customer Loyalty Details Surname" field displays the text "${Loyalty Card Number 1 Surname}"
    And "Customer Loyalty Details Account Number" field displays the text "${Loyalty Card Number 1 Account Number}"
    #And "Customer Loyalty Details Balance" field displays the text "${Loyalty Card Number 1 Balance}"
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And "Loyalty Account: ${Loyalty Card Number 1 Account Number}" is displayed in "Receipt" list
    And "Customer: ${Loyalty card number 1 full name}" is displayed in "Receipt" list
    #And "Points Balance: ${Loyalty card number 1 Balance}" is displayed in "Receipt" list
    And "Loyalty Points Earned ${Loyalty card number 1 transaction points earned}" is displayed in "Receipt" list
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-349 @AddLoyaltyPoints @Loyalty @POS @MVP @Mobile @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Add Loyalty Points after capturing the customer
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    When user presses "Capture Loyalty" button and "Loyalty Account Enquiry" page shown
    And user enters "${Loyalty Card Number 1}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Account Details" page is shown
    And "Customer Loyalty Details Forname" field displays the text "${Loyalty Card Number 1 Forname}"
    And "Customer Loyalty Details Surname" field displays the text "${Loyalty Card Number 1 Surname}"
    And "Customer Loyalty Details Account Number" field displays the text "${Loyalty Card Number 1 Account Number}"
    #And "Customer Loyalty Details Balance" field displays the text "${Loyalty Card Number 1 Balance}"
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And "Loyalty Account: ${Loyalty Card Number 1 Account Number}" is displayed in "Receipt" list
    And "Customer: ${Loyalty card number 1 full name}" is displayed in "Receipt" list
    #And "Loyalty Points Earned 35" is displayed in "Receipt" list
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    When user presses "Add Loyalty Points" button
    Then "Loyalty Account: ${Loyalty Card Number 1 Account Number}" is displayed in "Receipt" list
    And "Customer: ${Loyalty card number 1 full name}" is displayed in "Receipt" list
    And "Loyalty Points Added ${Loyalty card number 1 point rate}" is displayed in "Receipt" list
    #And "Loyalty Points Earned 135" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item | Customer:,${Loyalty Card Number 1 Forname},${Loyalty Card Number 1 Surname} |
      | item | ${Product 2 Description},${Product 2 Price}                                 |
      | text | Loyalty Points Added ${Loyalty card number 1 point rate}                    |
      | text | Loyalty Account: ${Loyalty Card Number 1 Account Number}                    |
      | text | Loyalty Account: ${Loyalty Card Number 1 Account Number}                    |
    #| text | You earned a total of 135 loyalty points                                    |
    #| text | New Loyalty Balance: 135                                                    |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-339 @CreateNewLoyaltyAccount @Loyalty @POS @MVP @Mobile @AUTOMATED @POSValidatedTest @POSSet2 @NotForRC1
  Scenario: Create new Loyalty Account
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    When user presses "New Loyalty Account" button and "Loyalty Account Enquiry" page shown
    And user enters "${Loyalty Card Number 2}" into "Input Box" field
    And user presses "OK" button
    Then "Capture Customer Name" page is shown
    When user enters "Forename" into "Customer Forename Text" field
    And user enters "Surname" into "Customer Surname Text" field
    And user enters "Enactor" into "Customer Organisation Text" field
    And user selects "Mr" from "Customer Title Dropdown" combobox
    And user enters "KC" into "Customer Initials Text" field
    And user selects "Male" from "Customer Sex Dropdown" combobox
    And user enters "250487" into "Customer Date of Birth Text" field
    And user presses "OK" button
    Then "Capture Customer Address" page is shown
    When user enters "Cambridge House" into "Customer Address Line1 Text" field
    And user enters "Bluecoats Avenue" into "Customer Address Line2 Text" field
    And user enters "Oak Grove" into "Customer Address Line3 Text" field
    And user enters "Hertford" into "Customer Town Text" field
    And user enters "Herts" into "Customer County Text" field
    And user enters "SG13 8AT" into "Customer Postcode Field" field
    And user presses "OK" button
    Then "Capture Customer Phone Email" page is shown
    When user enters "321654987" into "Customer Phone1 Text" field
    And user enters "987456321" into "Customer Phone2 Text" field
    And user enters "654123987" into "Customer Mobile Text" field
    And user enters "789654123" into "Customer Fax Text" field
    And user enters "testcustomer@enactor.co.uk" into "Customer Email Text Mandatory" field
    And user presses "OK" button and "Loyalty Scheme Prompt" page shown
    When user selects "${Loyalty Card Number 2 Loyalty Scheme}" from "Loyalty Scheme Dropdown" combobox
    And user selects "${Loyalty Card Number 2 Loyalty Tier}" from "Loyalty Tier Dropdown" combobox
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "Mr Forename Surname" is displayed in "Receipt" list
    And "${Loyalty Customer 1 Full Address}" is displayed in "Receipt" list
    And "Oak Grove" is displayed in "Receipt" list
    And "Hertford SG13 8AT" is displayed in "Receipt" list
    And "${Loyalty Card Number 2}" is displayed in "Receipt" list
    And "Loyalty Points Earned" is displayed in "Receipt" list
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | text | Customer: Forename Surname                    |
      | item | ${Product 2 Description},${Product 2 Price}   |
      | text | Issued Loyalty Card: ${Loyalty Card Number 2} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button

  @PT-351  @PreSales @AddLoyaltyPoints @Loyalty @POS @MVP @Mobile @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Capture Loyalty Customer After Adding Loyalty Points
    Given user signs on as "Manager 2"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    When user presses "Add Loyalty Points" button and "Transaction Basket" page shown
    And "Loyalty Points Added ${Loyalty card number 1 point rate}" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    When user presses "Capture Loyalty" button and "Loyalty Account Enquiry" page shown
    And user enters "${Loyalty Card Number 1}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Account Details" page is shown
    And "Customer Loyalty Details Forname" field displays the text "${Loyalty Card Number 1 Forname}"
    And "Customer Loyalty Details Surname" field displays the text "${Loyalty Card Number 1 Surname}"
    And "Customer Loyalty Details Account Number" field displays the text "${Loyalty Card Number 1 Account Number}"
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And "Loyalty Account: ${Loyalty Card Number 1 Account Number}" is displayed in "Receipt" list
    And "Customer: ${Loyalty card number 1 full name}" is displayed in "Receipt" list
    #And "Loyalty Points Earned 135" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | item    | Customer:,${Loyalty Card Number 1 Forname},${Loyalty Card Number 1 Surname} |
      | address | Bluecoats,Hertford,,SG141PB                                                 |
      | item    | ${Product 2 Description},${Product 2 Price}                                 |
      | text    | Loyalty Points Added ${Loyalty card number 1 point rate}                    |
      | text    | Loyalty Account: ${Loyalty Card Number 1 Account Number}                    |
    #| text    | You earned a total of 135 loyalty points                                    |
    #| text    | New Loyalty Balance: 270                                                    |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-227 @CaptureLoyaltyByPostCode @Loyalty @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Capture Loyalty Card by Postcode
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    When user presses "Capture Loyalty" button and "Loyalty Account Enquiry" page shown
    And user presses "More" button
    And user presses "Search By Postcode" button
    Then "Loyalty Customer Search Bypostcode" page is shown
    And user enters "${Loyalty Card Number 1 Postcode}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Select Customer Search By Postcode" page is shown
    And user selects "${Loyalty Card Number 1 name}" from "Selection List" list
    And user presses "OK" button
    Then "Loyalty Account Details" page is shown
    And "Customer Loyalty Details Forname" field displays the text "${Loyalty Card Number 1 Forname}"
    And "Customer Loyalty Details Surname" field displays the text "${Loyalty Card Number 1 Surname}"
    And "Customer Loyalty Details Account Number" field displays the text "${Loyalty Card Number 1 Account Number}"
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And "Loyalty Account: ${Loyalty Card Number 1 Account Number}" is displayed in "Receipt" list
    And "Customer: ${Loyalty card number 1 full name}" is displayed in "Receipt" list
    And "Loyalty Points Earned ${Loyalty card number 1 transaction points earned}" is displayed in "Receipt" list
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1419 @CreateNewLoyaltyAccountInvalidCardNumber @Loyalty @POS @MVP @Mobile @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Validate Customer's new loyalty Account Number using Invalid Customer Card
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    When user presses "New Loyalty Account" button and "Loyalty Account Enquiry" page shown
    And user enters "4444444" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Card Invalid Error" page is shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-340 @CreateNewLoyaltyAccountExistingCardNumber @Loyalty @POS @MVP @Mobile @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Validate Customer's new loyalty Account Number using existing Customer Card
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    When user presses "New Loyalty Account" button and "Loyalty Account Enquiry" page shown
    And user enters "${Loyalty Card Number 1}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Card Already Issued Error" page is shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-228 @CaptureLoyaltyByName @Loyalty @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Capture Loyalty Card by Customer Name
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    When user presses "Capture Loyalty" button and "Loyalty Account Enquiry" page shown
    And user presses "Search By Name" button
    Then "Loyalty Customer Search By Name" page is shown
    And user enters "${Loyalty Card Number 1 Forname}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Account Details" page is shown
    And "Customer Loyalty Details Forname" field displays the text "${Loyalty Card Number 1 Forname}"
    And "Customer Loyalty Details Surname" field displays the text "${Loyalty Card Number 1 Surname}"
    And "Customer Loyalty Details Account Number" field displays the text "${Loyalty Card Number 1 Account Number}"
    #And "Customer Loyalty Details Balance" field displays the text "270"
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And "Loyalty Account: ${Loyalty Card Number 1 Account Number}" is displayed in "Receipt" list
    And "Customer: ${Loyalty card number 1 full name}" is displayed in "Receipt" list
    #And "Points Balance: 270" is displayed in "Receipt" list
    And "Loyalty Points Earned ${Loyalty card number 1 transaction points earned}" is displayed in "Receipt" list
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-12004 @SkipLoyaltyCaptureAtStart @Loyalty @POS @AUTOMATED @POSValidatedTest @POSSet2 @NotForWeeklyRegression
  Scenario: POS - Prompt for Loyalty at start of transaction - Verify that user can Skip Loyalty capture
    Given template "LOYALTY_AT_START_POS_TEMPLATE" is set for the current POS terminal
    When "Enter User" page is shown
    And user enters "${Sales Assistant Username}" into "User Name Text" field
    And user enters "${Sales Assistant Password}" into "Password Text" field
    And user presses "ENT" button
    Then "Loyalty Account Enquiry" page is shown
    And user presses "Skip" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-12026 @SkipLoyaltyCapture @Loyalty @POS @AUTOMATED @POSValidatedTest @POSSet2 @NotForWeeklyRegression @ToBeFixedAutTest
  Scenario: Prompt for Loyalty at Total Pressed - Verify that user can Skip Loyalty capture
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button
    Then "Loyalty Account Enquiry" page is shown
    And user presses "Skip" button
    And "Enter Authorising User" page is shown
    And user enters "admin" into "Input Box" field
    And user presses "Sign On" button and "Enter Authorising Pin" page shown
    And user enters "admin" into "Input Box" field
    And user presses "OK" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1884 @POS @AUTOMATED @Loyalty
  Scenario: Capture Loyalty Card by Email
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    When user presses "Capture Loyalty" button and "Loyalty Account Enquiry" page shown
    And user presses "More" button
    And user presses "Search By Email" button
    Then "Customer Search By Email" page is shown
    And user enters "${Loyalty Card Number 1 Email}" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Search By Email" page is shown
    And user selects "${Loyalty Card Number 1 name}" from "Selection List" list
    And user presses "OK" button
    And "Loyalty Account Details" page is shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And "Loyalty Account: ${Loyalty Card Number 1 Account Number}" is displayed in "Receipt" list
    And "Customer: ${Loyalty card number 1 full name}" is displayed in "Receipt" list
    And "Loyalty Points Earned ${Loyalty card number 1 transaction points earned}" is displayed in "Receipt" list
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1886 @POS @AUTOMATED @Loyalty
  Scenario: Capture Loyalty Card by Phone Number
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    When user presses "Capture Loyalty" button and "Loyalty Account Enquiry" page shown
    And user presses "Search By Phone Number" button
    Then "Customer Search By Phone" page is shown
    And user enters "${Loyalty Card Number 1 Phone}" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Search By Phone" page is shown
    And user selects "${Loyalty Card Number 1 name}" from "Selection List" list
    And user presses "OK" button
    And "Loyalty Account Details" page is shown
    When user presses "OK" button
    Then "Transaction Basket" page is shown
    And "Loyalty Account: ${Loyalty Card Number 1 Account Number}" is displayed in "Receipt" list
    And "Customer: ${Loyalty card number 1 full name}" is displayed in "Receipt" list
    And "Loyalty Points Earned ${Loyalty card number 1 transaction points earned}" is displayed in "Receipt" list
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-11911 @POS @AUTOMATED @Loyalty
  Scenario: Loyalty Account Enquiry-Search By Phone Number
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    When user presses "Loyalty Account Enquiry" button and "Loyalty Account Enquiry" page shown
    And user presses "Search By Phone Number" button
    Then "Customer Search By Phone" page is shown
    And user enters "${Loyalty Card Number 1 Phone}" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Search By Phone" page is shown
    And user selects "${Loyalty Card Number 1 name}" from "Selection List" list
    And user presses "OK" button
    And "Loyalty Account Details" page is shown
    When user presses "Cancel" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-11912 @POS @AUTOMATED @Loyalty
  Scenario: Loyalty Account Enquiry - Search By Postcode
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    When user presses "Loyalty Account Enquiry" button and "Loyalty Account Enquiry" page shown
    And user presses "More" button
    And user presses "Search By Postcode" button
    Then "Loyalty Customer Search ByPostcode" page is shown
    And user enters "${Loyalty Card Number 1 Postcode}" into "Input Box" field
    And user presses "OK" button
    And "Loyalty Select Customer Search By Postcode" page is shown
    And user selects "${Loyalty Card Number 1 name}" from "Selection List" list
    And user presses "OK" button
    And "Loyalty Account Details" page is shown
    When user presses "Cancel" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-11913 @POS @AUTOMATED @Loyalty
  Scenario: Loyalty Account Enquiry - Search By Email
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    When user presses "Loyalty Account Enquiry" button and "Loyalty Account Enquiry" page shown
    And user presses "More" button
    And user presses "Search By Email" button
    Then "Customer Search By Email" page is shown
    And user enters "${Loyalty Card Number 1 Email}" into "Input Box" field
    And user presses "OK" button
    And "Select Customer Search By Email" page is shown
    And user selects "${Loyalty Card Number 1 name}" from "Selection List" list
    And user presses "OK" button
    And "Loyalty Account Details" page is shown
    When user presses "Cancel" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-10485 @POS @AUTOMATED @Loyalty
  Scenario: Verify Loyalty balance is updated on POS/EM after performing a sale transaction
    Given user signs on as "Manager 2"
    When user presses "CRM Button" icon button
    Then "CRM Menu Screen" page is shown
    And user presses "CRM Customers Button" icon button
    And "Crm Select Customers Screen" page is shown
    And user waits "1" seconds
    And user enters "${Loyalty Card Number 1 Forname}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Loyalty Card Number 1 Forname}"
    When user presses "Crm Customer Search Page Search Button" icon button
    Then "Crm Client Details" page is shown
    And "${Customer 1 Full Name}" is displayed in "CRM Customer Client Details Page Personal Details Section" panel
    And "${Customer 1 Loyalty No}" is displayed in "CRM Customer Client Details Page Loyalty Section" panel
    When user presses "Crm Customer Client Details Page Start Sale Button" icon button
    Then "Transaction Basket" page is shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | -£20.86                                               |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-8711 @AlertMessageFieldValidationMissing @Loyalty @POS @AUTOMATED @POSValidatedTest @POSSet2 @ToBeFixedAutTest
  Scenario: Updating Customer details - alert message for field validation missing
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    When user presses "New Loyalty Account" button and "Loyalty Account Enquiry" page shown
    And user enters "9526300011110241113" into "Input Box" field
    And user presses "OK" button
    And "Capture Customer Name" page is shown
    And user presses "OK" button
    # ERROR Expected
    Then "Customer Forename Error Label" label displays the text "<html>Required</html>"
    When user enters "Forename" into "Customer Forename Text" field
    And user presses "OK" button
    # ERROR Expected
    Then "Customer Address Line 1 Error Label" label displays the text "<html>Required</html>"
    And user enters "Test Street 1" into "Customer Address Line1 Text" field
    And user presses "OK" button
    When "Capture Customer Phone Email" page is shown
    And user presses "Cancel" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-16566 @Loyalty @POS @AUTOMATED
  Scenario: Loyalty capture using Invalid details
    Given user signs on as "Sales Assistant"
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    And user presses "Capture Loyalty" button and "Loyalty Account Enquiry" page shown
    And user enters "${Invalid Loyalty Card Number}" into "Input Box" field
    And user presses "OK" button
    And "InvalidLoyaltyCard Number Message" page is shown
    When user presses "OK" button
    Then "Loyalty Account Enquiry" page is shown
    And user presses "More" button and "Loyalty Account Enquiry" page shown
    And user presses "Back" button and "Loyalty Account Enquiry" page shown
    And user presses "Cancel" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
		
  @PT-11955 @Loyalty @POS @AUTOMATED
  Scenario: Redeem Loyalty with Search by Name
    Given user signs on as "Sales Assistant"
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Customers" button
    And user presses "Loyalty Account" button
    And "Loyalty Account Enquiry" page is shown
    And user presses "Search By Name" button
    And "Loyalty Customer Search By Name" page is shown
    And user enters "${First Characters of Customer 1 Name}" into "Input Box" field
    And user presses "OK" button
    And "Loyalty Select Customer Search By Name" page is shown
    And user selects "${Loyalty Card Number 1 Name}" from "Selection List" list
    And user waits "2" seconds
    And user presses "OK" button
    And "Card Tender Amount" page is shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown