Feature: CRM - Call Client

  @PT-9933 @CRMCallClient @POS @CRM @AUTOMATED
  Scenario: Check that user can book an appointment for call the client
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Customers" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    And user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    And user enters "${Customer 1 Email}" into "CRM Customer Search Page Email Text" field
    When user presses "CRM Customer Search Page Search Button" icon button
    Then "CRM Client Details" page is shown
    When user presses "CRM Customer Client Details Page Call Client Button" icon button
    Then "CRM Call Client" page is shown
    When user presses "CRM Call Client Page Book Appointment Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    And "CRM Diary Appointment Customer Name" field displays the text "${Customer 1 Name Without Title}"
    And user enters "Test Verify that user can book an appointment for call the client" into "CRM Diary Appointment Subject" field
    And user enters "Test Verify that user can book an appointment for call the client - Description" into "CRM Diary Appointment Details" field
    When user enters "#{today+1}" into "CRM Diary Appointment Start Date" date field
    And user enters "${CRM Diary Appointment Start Time Hours}:${CRM Diary Appointment Start Time Minutes}" into "CRM Diary Appointment Start Time" time field
    And user enters "${CRM Diary Appointment End Time Hours}:${CRM Diary Appointment End Time Minutes}" into "CRM Diary Appointment End Time" time field
    When user presses "CRM Save Button" icon button
    Then "CRM Call Client" page is shown
    And user enters "Test Call Subject" into "CRM Call Client Page Subject Input" field
    And user enters "Test Customer Response" into "CRM Call Client Page Customer Response Input" field
    And user presses "CRM Save Button" icon button
    And user presses "CRM Complete panel" icon button
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
    And "Next Appt" is displayed in "CRM Customer Client Details Page Appointments Section" panel
    When user presses "Back Button" icon button
    Then "CRM Select Customers Screen" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-16763 @CRMCallClient @POS @CRM @AUTOMATED
  Scenario: Check that user can book an appointment for call the client
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Customers" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    And user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    And user enters "${Customer 1 Email}" into "CRM Customer Search Page Email Text" field
    When user presses "CRM Customer Search Page Search Button" icon button
    Then "CRM Client Details" page is shown
    When user presses "CRM Customer Client Details Page Call Client Button" icon button
    Then "CRM Call Client" page is shown
    When user presses "CRM Call Client Page Book Appointment Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    And "CRM Diary Appointment Customer Name" field displays the text "Mark Harrison"
    And user enters "Test Verify that user can book an appointment for call the client" into "CRM Diary Appointment Subject" field
    And user enters "Test Verify that user can book an appointment for call the client - Description" into "CRM Diary Appointment Details" field
    And user enters "23:58" into "CRM Diary Appointment Start Time" time field
    And user enters "23:59" into "CRM Diary Appointment End Time" time field
    When user presses "CRM Save Button" icon button
    Then "CRM Call Client" page is shown
    And user enters "Test Call Subject" into "CRM Call Client Page Subject Input" field
    And user enters "Test Customer Response" into "CRM Call Client Page Customer Response Input" field
    And user presses "CRM Save Button" icon button
    And user presses "CRM Complete panel" icon button
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
    And "Next Appt" is displayed in "CRM Customer Client Details Page Appointments Section" panel
    When user presses "Back Button" icon button
    Then "CRM Select Customers Screen" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-224 @SET2 @ToBeFixedAutTest @CRMCallClient @POS @CRM @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Check that the Call Client screen is displayed and call details can be saved
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
    When user presses "CRM Customer Client Details Page Call Client Button" icon button
    Then "CRM Call Client" page is shown
    ## TODO: Component taking too long to get text in Telephone Call Details screen.
    ##       Need to find alternative way to reduce time taken.
    #And "Mr. Mark Harrison" is displayed in "CRM Call Client Panel" panel
    #And "${Customer 1 Phone No}" is displayed in "CRM Call Client Panel" panel
    When user presses "CRM Call Client Page Client Details Button" icon button
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
    Then "CRM Call Client" page is shown
    When user selects "Sales" from "CRM Call Client Page Contact Type Dropdown" combobox
    And user enters "Test Call Subject" into "CRM Call Client Page Subject Input" field
    And user enters "Test Customer Response" into "CRM Call Client Page Customer Response Input" field
    And user presses "CRM Save Button" icon button
    Then "CRM Call Client" page is shown
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