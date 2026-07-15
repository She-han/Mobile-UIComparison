Feature: CRM - Email Client

  @PT-223 @SET2 @CRMEmailClientSave @CRMEmailClient @POS @CRM @AUTOMATED
  Scenario: CRM Email Client - Check that user can save the Email message
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Customers" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    When user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    Then "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    When user enters "${Customer 1 Email}" into "CRM Customer Search Page Email Text" field
    Then "CRM Customer Search Page Email Text" field displays the text "${Customer 1 Email}"
    And user presses "CRM Customer Search Page Search Button" icon button
    Then "CRM Client Details" page is shown
    When user presses "CRM Customer Client Details Page Email Client Button" icon button
    Then "CRM Email Client" page is shown
    And "CRM Email Client Page To Input" field displays the text "${CUSTOMER_1_EMAIL}"
    And "CRM Email Client Page From Input" field displays the text "${MANAGER_2_EMAIL}"
    When user selects "-" from "CRM Email Client Page Template Dropdown" combobox
    And user enters "Test Save Message Subject" into "CRM Email Client Page Subject Input" field
    And user enters "This is the Save Email Message Contents" into "CRM Email Client Page Email Content Input" rich text field
    And user presses "CRM Save Button" icon button
    Then "CRM Client Details" page is shown
    When user presses "Back Button" icon button
    Then "CRM Select Customers Screen" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1365 @SET2 @CRMEmailClientCancel @CRMEmailClient @POS @CRM @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: CRM Email Client - Check that user can cancel the Email message
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Customers" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    When user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    Then "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    When user enters "${Customer 1 Email}" into "CRM Customer Search Page Email Text" field
    Then "CRM Customer Search Page Email Text" field displays the text "${Customer 1 Email}"
    When user presses "CRM Customer Search Page Search Button" icon button
    Then "CRM Client Details" page is shown
    When user presses "CRM Customer Client Details Page Email Client Button" icon button
    Then "CRM Email Client" page is shown
    And "CRM Email Client Page To Input" field displays the text "${CUSTOMER_1_EMAIL}"
    And "CRM Email Client Page From Input" field displays the text "${MANAGER_2_EMAIL}"
    When user selects "-" from "CRM Email Client Page Template Dropdown" combobox
    And user enters "Test Cancel Message Subject" into "CRM Email Client Page Subject Input" field
    And user enters "This is the Cancel Email Message Contents" into "CRM Email Client Page Email Content Input" rich text field
    And user presses "CRM Cancel Button" icon button
    Then "CRM Email Client Lose Changes Error" page is shown
    When user presses "OK" button
    Then "CRM Client Details" page is shown
    When user presses "Back Button" icon button
    Then "CRM Select Customers Screen" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1366 @SET2 @CRMEmailClientSendNew @CRMEmailClient @POS @CRM @POSValidatedTest @POSSet1
  Scenario: CRM Email Client - Check that user can send the Email message
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Customers" icon button
    Then "CRM Select Customers Screen" page is shown
    When user waits "2" seconds
    When user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    Then "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    When user enters "${Customer 1 Email}" into "CRM Customer Search Page Email Text" field
    Then "CRM Customer Search Page Email Text" field displays the text "${Customer 1 Email}"
    When user presses "CRM Customer Search Page Search Button" icon button
    Then "CRM Client Details" page is shown
    When user presses "CRM Customer Client Details Page Email Client Button" icon button
    Then "CRM Email Client" page is shown
    And "CRM Email Client Page To Input" field displays the text "${CUSTOMER_1_EMAIL}"
    When user presses "CRM Email Client Page Address Book Button" icon button
    Then "CRM Address Book" page is shown
    When user presses "Back Button" icon button
    Then "CRM Email Client" page is shown
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
    Then "CRM Client Details" page is shown
    When user presses "Back Button" icon button
    Then "CRM Select Customers Screen" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
