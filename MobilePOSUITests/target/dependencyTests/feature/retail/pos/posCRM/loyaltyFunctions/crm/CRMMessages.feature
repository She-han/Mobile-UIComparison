Feature: CRM - Messages

  @PT-10123 @CRMMessages @POS @CRM @AUTOMATED
  Scenario: Verify the behaviour when mailbox is not configured for user
    Given user signs on as "Sales Assistant"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Messages" icon button
    Then "CRM Email Overview" page is shown
    When user presses "CRM Messages Compose Button" icon button
    Then "CRM Mailbox Not Configured" page is shown
    When user presses "OK" button
    Then "CRM Email Overview" page is shown
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-10124 @CRMMessages @POS @CRM @AUTOMATED
  Scenario: Verify user can search emails in address book
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Messages" icon button
    Then "CRM Email Overview" page is shown
    When user presses "CRM Messages Compose Button" icon button
    Then "CRM Email Client" page is shown
    When user presses "CRM Email Client Page Address Book Button" icon button
    Then "CRM Address Book" page is shown
    When user enters "${Customer 1 Name}" into "CRM Add address book forename text" field
    And user presses "CRM Add address book search button" icon button
    Then user presses "CRM Select User Button" icon button
    Then "CRM Email Client" page is shown
    And "CRM Email Client Page To Input" field displays the text "${Customer 1 Email}"
    And user presses "CRM Cancel Button" icon button
    And "CRM Email Client Lose Changes Error" page is shown
    And user presses "OK" button
    And "CRM Email Overview" page is shown
    When user presses "CRM Messages Compose Button" icon button
    Then "CRM Email Client" page is shown
    When user presses "CRM Email Client Page Address Book Button" icon button
    Then "CRM Address Book" page is shown
    When user enters "${Customer 1 Surname}" into "CRM Add address book surname text" field
    And user presses "CRM Add address book search button" icon button
    And user presses "CRM Select User Button" icon button
    Then "CRM Email Client" page is shown
    And "CRM Email Client Page To Input" field displays the text "${Customer 1 Email}"
    And user presses "CRM Cancel Button" icon button
    And "CRM Email Client Lose Changes Error" page is shown
    And user presses "OK" button
    And "CRM Email Overview" page is shown
    When user presses "CRM Messages Compose Button" icon button
    Then "CRM Email Client" page is shown
    When user presses "CRM Email Client Page Address Book Button" icon button
    Then "CRM Address Book" page is shown
    When user enters "${Customer 1 Email}" into "CRM Add address book Email Address text" field
    And user presses "CRM Add address book search button" icon button
    And user presses "CRM Select User Button" icon button
    Then "CRM Email Client" page is shown
    And "CRM Email Client Page To Input" field displays the text "${Customer 1 Email}"
    And user presses "CRM Cancel Button" icon button 
    And "CRM Email Client Lose Changes Error" page is shown
    And user presses "OK" button
    And "CRM Email Overview" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-238 @PreSales @CRMMessagesSearchTab @CRMMessages @MVP @POS @CRM @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Check that CRM Messages screen and texts are displayed
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Messages" icon button
    Then "CRM Email Overview" page is shown
    And "Inbox" is displayed in "CRM Messages Email Overview Panel" panel
    And "Sent Items" is displayed in "CRM Messages Email Overview Panel" panel
    And "Status" is displayed in "CRM Messages Email Overview Panel" panel
    When user selects "New" from "CRM Messages Status Dropdown" combobox
    Then "CRM Email Overview" page is shown
    And user waits "2" seconds
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-306 @CRMMessagesSave @CRMMessages @MVP @POS @CRM @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Check that user can save the CRM Email message
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Messages" icon button
    Then "CRM Email Overview" page is shown
    When user presses "CRM Messages Compose Button" icon button
    Then "CRM Email Client" page is shown
    And "CRM Email Client Page From Input" field displays the text "${MANAGER_2_EMAIL}"
    When user presses "CRM Messages Client Search Button" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    When user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    Then "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    When user enters "${Customer 1 Email}" into "CRM Customer Search Page Email Text" field
    Then "CRM Customer Search Page Email Text" field displays the text "${Customer 1 Email}"
    And user presses "CRM Customer Search Page Search Button" icon button
    And user waits "2" seconds
    And user presses "CRM Customer Search Page Select Customer Button" icon button
    Then "CRM Email Client" page is shown
    And "CRM Email Client Page To Input" field displays the text "${CUSTOMER_1_EMAIL}"
    And "CRM Email Client Page From Input" field displays the text "${MANAGER_2_EMAIL}"
    When user selects "-" from "CRM Email Client Page Template Dropdown" combobox
    And user enters "Test Save CRM Message Subject" into "CRM Email Client Page Subject Input" field
    And user enters "This is the Save CRM Email Message Contents" into "CRM Email Client Page Email Content Input" rich text field
    And user presses "CRM Save Button" icon button
    Then "CRM Email Overview" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-307 @CRMMessagesCancel @CRMMessages @POS @CRM @MVP @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Check that user can cancel the CRM Email message
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Messages" icon button
    Then "CRM Email Overview" page is shown
    When user presses "CRM Messages Compose Button" icon button
    Then "CRM Email Client" page is shown
    And "CRM Email Client Page From Input" field displays the text "${MANAGER_2_EMAIL}"
    When user presses "CRM Messages Client Search Button" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    When user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    Then "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    When user enters "${Customer 1 Email}" into "CRM Customer Search Page Email Text" field
    Then "CRM Customer Search Page Email Text" field displays the text "${Customer 1 Email}"
    And user presses "CRM Customer Search Page Search Button" icon button
    And user waits "2" seconds
    And user presses "CRM Customer Search Page Select Customer Button" icon button
    Then "CRM Email Client" page is shown
    And "CRM Email Client Page To Input" field displays the text "${CUSTOMER_1_EMAIL}"
    When user presses "CRM Email Client Page Address Book Button" icon button
    Then "CRM Address Book" page is shown
    When user presses "Back Button" icon button
    Then "CRM Email Client" page is shown
    And "CRM Email Client Page From Input" field displays the text "${MANAGER_2_EMAIL}"
    When user selects "-" from "CRM Email Client Page Template Dropdown" combobox
    And user enters "Test Cancel CRM Message Subject" into "CRM Email Client Page Subject Input" field
    And user enters "This is the Cancel CRM Email Message Contents" into "CRM Email Client Page Email Content Input" rich text field
    And user presses "CRM Cancel Button" icon button
    Then "CRM Email Client Lose Changes Error" page is shown
    When user presses "OK" button
    Then "CRM Email Overview" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-300 @Regression @POSCRMMessages @POS
  Scenario: View and Delete Email in Message Inbox
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Messages" icon button
    Then "CRM Email Overview" page is shown
    When user presses "CRM Messages Inbox First Row View Button" icon button
    Then "CRM Email View" page is shown
    And "CRM Email View Message To Field" field displays the text "enactor.test@gmail.com"
    And "CRM Email View Message From Field" field displays the text "enactor.test1@gmail.com"
    And "CRM Email View Message Subject Field" field displays the text "123"
    When user presses "Back Button" icon button
    Then "CRM Email Overview" page is shown
    When user presses "CRM Messages Inbox First Row Delete Button" icon button
    Then "CRM Email Confirm Delete popup" page is shown
    And  user presses "Cancel" button
    And "CRM Email Overview" page is shown
    When user presses "CRM Messages Send Items First Row Delete Button" icon button
    Then "CRM Email Confirm Delete popup" page is shown
    And  user presses "OK" button
    And "CRM Email Overview" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-302 @Regression @POSCRMMessages @POS
  Scenario: Delete and View Email from Sent Items
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Messages" icon button
    Then "CRM Email Overview" page is shown
    When user presses "CRM Messages Send Items First Row Delete Button" icon button
    Then "CRM Email Confirm Delete popup" page is shown
    And  user presses "Cancel" button
    And "CRM Email Overview" page is shown
    When user presses "CRM Messages Send Items First Row Delete Button" icon button
    Then "CRM Email Confirm Delete popup" page is shown
    And  user presses "OK" button
    And "CRM Email Overview" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
		And user waits "5" seconds
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Messages" icon button
    Then "CRM Email Overview" page is shown
    When user presses "CRM Messages Send Items First Row View Button" icon button
    Then "CRM Email View Message" page is shown
    And "CRM Email Sent Items View Message To Field" field displays the text "test1@gmail.com"
    And "CRM Email Sent Items View Message From Field" field displays the text "enactor.test1@gmail.com"
    And "CRM Email Sent Items View Message Subject Field" field displays the text "Test 1"
    And "CRM Email View Message Body" field contains the text "Test 1"
    When user presses "Back Button" icon button
    Then "CRM Email Overview" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown    

  @PT-305 @CRMMessagesSend @CRMMessages @MVP @Mobile @POS @CRM @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Check that user can send the CRM Email message
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Messages" icon button
    Then "CRM Email Overview" page is shown
    When user presses "CRM Messages Compose Button" icon button
    Then "CRM Email Client" page is shown
    And "CRM Email Client Page From Input" field displays the text "${MANAGER_2_EMAIL}"
    When user presses "CRM Messages Client Search Button" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    When user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    Then "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    When user enters "${Customer 1 Email}" into "CRM Customer Search Page Email Text" field
    Then "CRM Customer Search Page Email Text" field displays the text "${Customer 1 Email}"
    And user presses "CRM Customer Search Page Search Button" icon button
    And user presses "CRM Customer Search Page Select Customer Button" icon button
    Then "CRM Email Client" page is shown
    And "CRM Email Client Page To Input" field displays the text "${CUSTOMER_1_EMAIL}"
    When user presses "CRM Email Client Page View Client Button" icon button
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
    Then "CRM Email Client" page is shown
    And "CRM Email Client Page From Input" field displays the text "${MANAGER_2_EMAIL}"
    When user selects "-" from "CRM Email Client Page Template Dropdown" combobox
    And user enters "Test Send Message Subject" into "CRM Email Client Page Subject Input" field
    And user presses "CRM Email Client Page Send Button" icon button
    Then "CRM Email Client Empty Message Error" page is shown
    When user presses "OK" button
    Then "CRM Email Client" page is shown
    And user enters "This is the Send Email Message Contents" into "CRM Email Client Page Email Content Input" rich text field
    And user presses "CRM Email Client Page Send Button" icon button
    Then "CRM Email Overview" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1362 @PreSales @CRMMessagesDraftsTab @CRMMessages @POS @CRM @AUTOMATED @MVP @POSValidatedTest @POSSet1
  Scenario: Check that Email Drafts screen is displayed with the saved emails and emails can be viewed and deleted.
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Messages" icon button
    Then "CRM Email Overview" page is shown
    When user presses "CRM Messages Email Drafts Tab" icon button
    Then "CRM Email Drafts" page is shown
    When user presses "CRM Messages Compose Button" icon button
    Then "CRM Email Client" page is shown
    When user presses "CRM Messages Client Search Button" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    When user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    Then "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    When user enters "${Customer 1 Email}" into "CRM Customer Search Page Email Text" field
    Then "CRM Customer Search Page Email Text" field displays the text "${Customer 1 Email}"
    And user presses "CRM Customer Search Page Search Button" icon button
    And user waits "2" seconds
    And user presses "CRM Customer Search Page Select Customer Button" icon button
    Then "CRM Email Client" page is shown
    And "CRM Email Client Page To Input" field displays the text "${CUSTOMER_1_EMAIL}"
    And user enters "Test Save CRM Message Subject" into "CRM Email Client Page Subject Input" field
    And user presses "CRM Save Button" icon button
    Then "CRM Email Drafts" page is shown
    When user presses "CRM Messages View Message Button" icon button
    Then "CRM Email Client" page is shown
    And "CRM Email Client Page To Input" field displays the text "${CUSTOMER_1_EMAIL}"
    And "CRM Email Client Page From Input" field displays the text "${MANAGER_2_EMAIL}"
    And "CRM Email Client Page Subject Input" field displays the text "Test Save CRM Message Subject"
    ## TODO: Need to support verifying text from component which returns text including html tags
    ##	And "CRM Email Client Page Email Content Input" field displays the text "This is the Save Email Message Contents"
    And user presses "CRM Cancel Button" icon button
    Then "CRM Email Client Lose Changes Error" page is shown
    When user presses "OK" button
    Then "CRM Email Drafts" page is shown
    When user presses "CRM Messages Delete Message Button" icon button
    Then "CRM Messages Delete Message Confirm Popup" page is shown
    When user presses "OK" button
    Then "CRM Email Drafts" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
