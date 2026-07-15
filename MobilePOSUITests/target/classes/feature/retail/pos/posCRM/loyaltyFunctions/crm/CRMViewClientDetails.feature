Feature: CRM - View Client Details

  @PT-213 @PreSales @SET2 @CRMClientDetails @POS @CRM @AUTOMATED @CRMClientDetails @POSValidatedTest @POSSet1
  Scenario: Check that CRM Client Details screen is displayed with relevant information
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
    And "${Customer 1 Full Name}" is displayed in "CRM Customer Client Details Page Personal Details Section" panel
    And "${Customer 1 Sex}" is displayed in "CRM Customer Client Details Page Personal Details Section" panel
    And "${Customer 1 DOB}" is displayed in "CRM Customer Client Details Page Personal Details Section" panel
    ## TODO: Component taking too long to get text for Address section.
    ##       Need to find alternative way to reduce time taken.
    #And "Enactor" is displayed in "CRM Customer Client Details Page Main Address Section" panel
    #And "1 Enactor House" is displayed in "CRM Customer Client Details Page Main Address Section" panel
    #And "Bluecoats Avenue" is displayed in "CRM Customer Client Details Page Main Address Section" panel
    #And "Hertford" is displayed in "CRM Customer Client Details Page Main Address Section" panel
    #And "Hertfordshire" is displayed in "CRM Customer Client Details Page Main Address Section" panel
    #And "SG141PB" is displayed in "CRM Customer Client Details Page Main Address Section" panel
    And "${Customer 1 Phone No}" is displayed in "CRM Customer Client Details Page Contact Details Section" panel
    And "${Customer 1 Email}" is displayed in "CRM Customer Client Details Page Contact Details Section" panel
    And "${Customer 1 Loyalty No}" is displayed in "CRM Customer Client Details Page Loyalty Section" panel
    And "Account Status" is displayed in "CRM Customer Client Details Page Loyalty Section" panel
    And "Redemp. Balance" is displayed in "CRM Customer Client Details Page Loyalty Section" panel
    And "As at COB" is displayed in "CRM Customer Client Details Page Loyalty Section" panel
    And "Next Appt" is displayed in "CRM Customer Client Details Page Appointments Section" panel
    And "Last Transaction" is displayed in "CRM Customer Client Details Page Appointments Section" panel
    And "Last Contact" is displayed in "CRM Customer Client Details Page Appointments Section" panel
    When user presses "Back Button" icon button
    Then "CRM Select Customers Screen" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-214 @SET2 @CRMClientDetailsContactDetails @POS @CRM @AUTOMATED @CRMClientDetails @POSValidatedTest @POSSet1
  Scenario: CRM Client Details - Contact Details - Edit Preferred Contact
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Customers" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    When user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    And user presses "CRM Customer Search Page Search Button" icon button
    Then "CRM Client Details" page is shown
    And user presses "CRM Customer Client Details Page Contact Details Button" icon button
    Then "CRM Contact Details" page is shown
    And user presses "CRM Customer Edit Contact Details Button" icon button
    Then "CRM Contact Details" page is shown
    And user selects "Email" from "CRM Customer Contact Details Business Contact Type Dropdown" combobox
    And user selects "Letter" from "CRM Customer Contact Details Preferred Contact Type Dropdown" combobox
    And user selects "-" from "CRM Customer Contact Details Contact Time Dropdown" combobox
    And user presses "CRM Customer Contact Details Save Button" icon button
    And user waits "2" seconds
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

  @PT-292 @SET2 @CRMContactDetailsEditAddress @POS @CRM @AUTOMATED @CRMClientDetails @POSValidatedTest @POSSet1
  Scenario: CRM Contact Details - Edit Address
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
    And user presses "CRM Customer Client Details Page Contact Details Button" icon button
    Then "CRM Contact Details" page is shown
    Then user presses "CRM Addresses Button" icon button
    And user waits "2" seconds
    When user presses "CRM View Address Addresses Table Row Button" icon button
    And "CRM Edit Customer Address" page is shown
    Then user presses "CRM Edit Button" icon button
    And "CRM Edit Customer Address" page is shown
    And user enters "${Customer 1 Address Town} Updated" into "CRM Add Address Town Text" field
    And user enters "${Customer 1 Address County} Updated" into "CRM Add Address County Text" field
    And user presses "CRM Save Button" icon button
    Then "CRM Contact Details" page is shown
    Then user presses "CRM Addresses Button" icon button
    And "${Customer 1 Address Town} Updated" is displayed in "CRM Customer Contact Details Page View Address" panel
    And "${Customer 1 Address County} Updated" is displayed in "CRM Customer Contact Details Page View Address" panel
    # Change values back to previous values
    Then user presses "CRM Addresses Button" icon button
    And user waits "2" seconds
    When user presses "CRM View Address Addresses Table Row Button" icon button
    And "CRM Edit Customer Address" page is shown
    Then user presses "CRM Edit Button" icon button
    And "CRM Edit Customer Address" page is shown
    And user enters "${Customer 1 Address Town}" into "CRM Add Address Town Text" field
    And user enters "${Customer 1 Address County}" into "CRM Add Address County Text" field
    And user presses "CRM Save Button" icon button
    Then "CRM Contact Details" page is shown
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

  @PT-293 @SET2 @POS @AUTOMATED @CRMClientDetails @POSValidatedTest @POSSet1
  Scenario: Contact Details - Add Phone
    Given user signs on as "Manager 2"
    And user presses "Transaction Basket CRM button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Customers" icon button
    And "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    And user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    And user enters "${Customer 1 Email}" into "CRM Customer Search Page Email Text" field
    And "CRM Customer Search Page Email Text" field displays the text "${Customer 1 Email}"
    When user presses "CRM Customer Search Page Search Button" icon button
    Then "CRM Client Details" page is shown
    And user presses "CRM Customer Client Details Page Contact Details Button" icon button
    And "CRM Contact Details" page is shown
    And user presses "CRM Phone Numbers Button" icon button
    And "CRM Contact Details" page is shown
    And user presses "CRM Phone Add Number" icon button
    And "CRM Edit Customer Phone" page is shown
    When user selects "Mobile" from "CRM Phone Type Dropdown" combobox
    And user enters "+94" into "CRM Add Phone Country Code Text" field
    And user enters "071 123 4567" into "CRM Add Phone Number" field
    And user presses "CRM Save Button" icon button
    Then "CRM Contact Details" page is shown
    And user presses "Back Button" icon button
    And "CRM Client Details" page is shown
    And user presses "Back Button" icon button
    And "CRM Select Customers Screen" page is shown
    And user presses "Back Button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-295 @SET2 @CRMContactDetailsEditPhone @POS @CRM @AUTOMATED @CRMClientDetails @POSValidatedTest @POSSet1
  Scenario: CRM Contact Details - Edit Phone
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
    And user presses "CRM Customer Client Details Page Contact Details Button" icon button
    Then "CRM Contact Details" page is shown
    And user presses "CRM Phone Numbers Button" icon button
    Then "CRM Contact Details" page is shown
    And user presses "CRM View Phone Numbers Table Row Button" icon button
    Then "CRM Edit Customer Phone" page is shown
    And user presses "CRM Customer Edit Email Page Edit Button" icon button
    Then "CRM Edit Customer Phone" page is shown
    And user enters "+44" into "CRM Add Phone Country Code Text" field
    Then "CRM Add Phone Country Code Text" field displays the text "+44"
    #Commenting Main Number setting to prevent conflict with existing Main number
    #And user presses "CRM Add Main Phone" icon button
    And user presses "CRM Save Button" icon button
    Then "CRM Contact Details" page is shown
    When user presses "Back Button" icon button
    And user waits "1" seconds
    Then "CRM Client Details" page is shown
    When user presses "Back Button" icon button
    Then "CRM Select Customers Screen" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-299 @SET2 @CRMContactDetailsAddEmail @POS @CRM @AUTOMATED @CRMClientDetails @POSValidatedTest @POSSet1
  Scenario: CRM Contact Details - Add Email
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
    And user presses "CRM Customer Client Details Page Contact Details Button" icon button
    Then "CRM Contact Details" page is shown
    And user presses "CRM Email Addresses Button" icon button
    Then user presses "CRM Add Email Button" icon button
    Then "CRM Edit Customer Email" page is shown
    And user enters "${Customer 1 Email}" into "CRM Add Email Address Text" field
    Then "CRM Add Email Address Text" field displays the text "${Customer 1 Email}"
    And user presses "CRM Save Button" icon button
    Then "CRM Contact Details" page is shown
    When user presses "Back Button" icon button
    And user waits "1" seconds
    Then "CRM Client Details" page is shown
    When user presses "Back Button" icon button
    Then "CRM Select Customers Screen" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-291 @SET2 @CRMContactDetailsAddAddress @POS @CRM @AUTOMATED @CRMClientDetails @POSValidatedTest @POSSet1
  Scenario: CRM Contact Details - Add Address
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
    And user presses "CRM Customer Client Details Page Contact Details Button" icon button
    Then "CRM Contact Details" page is shown
    Then user presses "CRM Addresses Button" icon button
    And user presses "CRM Add Addresses Button" icon button
    And user waits "2" seconds
    And "CRM Edit Customer Address" page is shown
    When user selects "Other" from "CRM Add Address Type Input" combobox
    And user enters "SG141PB" into "CRM Add Address Postcode Text" field
    Then "CRM Add Address Postcode Text" field displays the text "SG141PB"
    And user enters "Enactor" into "CRM Add Address Organisation Text" field
    Then "CRM Add Address Organisation Text" field displays the text "Enactor"
    And user enters "1 Enactor House" into "CRM Add Address Street1 Text" field
    Then "CRM Add Address Street1 Text" field displays the text "1 Enactor House"
    And user enters "Bluecoats Avenue" into "CRM Add Address Street2 Text" field
    Then "CRM Add Address Street2 Text" field displays the text "Bluecoats Avenue"
    And user enters "Hertford" into "CRM Add Address Town Text" field
    Then "CRM Add Address Town Text" field displays the text "Hertford"
    And user enters "Hertfordshire" into "CRM Add Address County Text" field
    Then "CRM Add Address County Text" field displays the text "Hertfordshire"
    And user presses "CRM Save Button" icon button
    Then "CRM Contact Details" page is shown
    Then user presses "CRM Addresses Button" icon button
    And "Enactor" is displayed in "CRM Customer Contact Details Page View Other Address Table Row" panel
    And "1 Enactor House" is displayed in "CRM Customer Contact Details Page View Other Address Table Row" panel
    And "Bluecoats Avenue" is displayed in "CRM Customer Contact Details Page View Other Address Table Row" panel
    And "Hertford" is displayed in "CRM Customer Contact Details Page View Other Address Table Row" panel
    And "Hertfordshire" is displayed in "CRM Customer Contact Details Page View Other Address Table Row" panel
    Then "CRM Contact Details" page is shown
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

  @PT-288 @SET2 @CRMClientDetailsView @POS @CRM @AUTOMATED @CRMClientDetails @POSValidatedTest @POSSet1
  Scenario: CRM - View Client Contact details
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
    And user presses "CRM Customer Client Details Page Contact Details Button" icon button
    Then "CRM Contact Details" page is shown
    Then user presses "CRM Addresses Button" icon button
    And "${Customer 1 Address Organisation}" is displayed in "CRM Customer Contact Details Page View Address" panel
    And "${Customer 1 Address Line1}" is displayed in "CRM Customer Contact Details Page View Address" panel
    And "${Customer 1 Address Line2}" is displayed in "CRM Customer Contact Details Page View Address" panel
    And "${Customer 1 Address Town}" is displayed in "CRM Customer Contact Details Page View Address" panel
    And "${Customer 1 Address County}" is displayed in "CRM Customer Contact Details Page View Address" panel
    And user presses "CRM Phone Numbers Button" icon button
    And user presses "CRM Email Addresses Button" icon button
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

  @PT-3154 @SET2 @AUTOMATED @POS @Spurs
  Scenario: Customer Details Capture
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 2 Description}" is displayed in "Receipt" list
    When user presses "Sales" button
    And user presses "More" button
    And user presses "Customers" button
    And user presses "Capture Customer" button
    Then "Capture Customer Name" page is shown
    When user enters "${Crm Test Customer Forename}" into "Customer Forename Text" field
    And user enters "${Crm Test Customer Surname}" into "Customer Surname Text" field
    And user enters "${Crm Test Customer Organization}" into "Customer Organisation Text" field
    And user selects "${Crm Test Customer Title}" from "Customer Title Dropdown" combobox
    And user enters "${Crm Test Customer Initials}" into "Customer Initials Text" field
    And user selects "${Crm Test Customer Sex}" from "Customer Sex Dropdown" combobox
    And user enters "${Crm Test Customer Date Of Birth}" into "Customer Date of Birth Text" field
    And user presses "OK" button
    Then "Capture Customer Address" page is shown
    When user enters "${Crm Test Customer Address Line 1}" into "Customer Address Line1 Text" field
    And user enters "${Crm Test Customer Address Line 2}" into "Customer Address Line2 Text" field
    And user enters "${Crm Test Customer Address Line 3}" into "Customer Address Line3 Text" field
    And user enters "${Crm Test Customer Address Town}" into "Customer Town Text" field
    And user enters "${Crm Test Customer Address County}" into "Customer County Text" field
    And user enters "${Crm Test Customer Postcode}" into "Customer Postcode Field" field
    And user presses "OK" button
    Then "Capture Customer Phone Email" page is shown
    And user enters "${Crm Test Customer Email}" into "Customer Email Text Optional" field
    When user enters "${Crm Test Customer Phone 1}" into "Customer Phone1 Text" field
    And user enters "${Crm Test Customer Phone 2}" into "Customer Phone2 Text" field
    And user enters "${Crm Test Customer Mobile}" into "Customer Mobile Text" field
    And user enters "${Crm Test Customer Fax}" into "Customer Fax Text" field
    And user waits "Button 1" to display
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    And "${Crm Test Customer Title} ${Crm Test Customer Forename} ${Crm Test Customer Surname}" is displayed in "Receipt" list
    And "${Crm Test Customer Address Line 1} ${Crm Test Customer Address Line 2}" is displayed in "Receipt" list
    And "${Crm Test Customer Address Line 3}" is displayed in "Receipt" list
    And "${Crm Test Customer Address Town} ${Crm Test Customer Postcode}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-5320 @POS @AUTOMATED @Spurs
  Scenario: CRM Service- Customer Lookup by PostCode and Capture Loyalty Card
    Given user signs on as "Sales Assistant"
    And user enters "${Product 2}" into "Input Box" field
    And user presses "ENT" button
    And user presses "Sales" button
    And user presses "More" button
    And user presses "Loyalty" button
    When user presses "Capture Loyalty" button and "Loyalty Account Enquiry" page shown
    And user presses "More" button
    And user presses "Search By Postcode" button
    Then "Loyalty Customer search Bypostcode" page is shown
    And user enters "${Loyalty Card Number 1 Postcode}" into "Input Box" field
    And user presses "OK" button
    Then "Loyalty Select Customer Search By Postcode" page is shown
    And user selects "${Loyalty Card Number 1 Name}" from "Selection List" list
    And user presses "OK" button
    Then "Loyalty Account Details" page is shown
    And user presses "OK" button
    When "Transaction Basket" page is shown
    Then user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-9934 @POS @CRM @AUTOMATED
  Scenario: Check that user can start a sale in view customer screen
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
    When user presses "Crm Customer Client Details Page Start Sale Button" icon button
    Then "Transaction Basket" page is shown
		And "${Customer 1 Name}" is displayed in "Receipt" list
		And "${Customer 1 Address With Organisation}" is displayed in "Receipt" list    
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And "${Product 1 Description}" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    