Feature: CRM Diary

  @PT-9926 @POSCRMDiary @POS
  Scenario: Verifying time slots in the day view
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Diary" icon button
    Then "CRM Diary Month View" page is shown
    When user presses "Day View" button
    Then "CRM Diary Day View" page is shown
    When user presses "> 1 Day" button
    Then "CRM Diary Day View" page is shown
    When user presses "CRM Diary New Appointment Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    And user waits "2" seconds
    And user enters "Test" into "CRM Diary Appointment Subject" field
    And user waits "2" seconds
    And user enters "Test Verifying time slots in the day view - Day view - Description" into "CRM Diary Appointment Details" field
    And user waits "2" seconds
    When user presses "CRM Diary Client Search Button" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    And user enters "${Customer 3 Name}" into "CRM Customer Search Page Name Text" field
    And user presses "CRM Customer Search Page Search Button" icon button
    When user presses "CRM Customer Search Page Select Customer Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    And user waits "2" seconds
    And "CRM Diary Appointment Customer Name" field displays the text "Philip Pare"
    When user presses "CRM Save Button" icon button
    And user waits "2" seconds
    Then "CRM Diary Day View" page is shown
    And user presses "CRM Calendar Day View Section Button" link button
    And "CRM Diary Edit Appointment" page is shown
    When user presses "CRM Cancel Button" icon button
    Then "CRM Diary Day View" page is shown
    When user presses "Month View" button
    Then "CRM Diary Month View" page is shown
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-9935 @PreSales @POS @CRM @AUTOMATED
  Scenario: Verify selecting an appointment slot by navigating through the calendar
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Diary" icon button
    Then "CRM Diary Month View" page is shown
    When user presses "< 1 Month" button
    Then "CRM Diary Month View" page is shown	
    When user presses "> 1 Month" button
    Then "CRM Diary Month View" page is shown
    When user presses "This Month" button
    Then "CRM Diary Month View" page is shown
    When user presses "Day View" button
    Then "CRM Diary Day View" page is shown
    And user presses "< 1 Month" button
    Then "CRM Diary Day View" page is shown
    When user presses "< 1 Week" button
    Then "CRM Diary Day View" page is shown
    When user presses "< 1 Day" button
    Then "CRM Diary Day View" page is shown
    When user presses "Today" button
    Then "CRM Diary Day View" page is shown
    When user presses "> 1 Day" button
    Then "CRM Diary Day View" page is shown
    When user presses "> 1 Week" button
    Then "CRM Diary Day View" page is shown
    When user presses "> 1 Month" button
    Then "CRM Diary Day View" page is shown
    When user presses "Today" button
    Then "CRM Diary Day View" page is shown
    When user presses "> 1 Day" button
    Then "CRM Diary Day View" page is shown
    When user presses "CRM Diary New Appointment Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    And user waits "2" seconds
    And user enters "Test" into "CRM Diary Appointment Subject" field
    And user waits "2" seconds
    And user enters "Test Verify that New Appointment added is viewable in Diary View - Day view - Description" into "CRM Diary Appointment Details" field
    And user waits "2" seconds
    When user presses "CRM Diary Client Search Button" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    And user enters "${Customer 3 Name}" into "CRM Customer Search Page Name Text" field
    And user presses "CRM Customer Search Page Search Button" icon button
    When user presses "CRM Customer Search Page Select Customer Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    And user waits "2" seconds
    And "CRM Diary Appointment Customer Name" field displays the text "Philip Pare"
    When user presses "CRM Save Button" icon button
    And "CRM Diary Day View" page is shown
    And user presses "CRM Calendar Day View Section Button" link button
    Then "CRM Diary Edit Appointment" page is shown
    When user presses "CRM Cancel Button" icon button
    Then "CRM Diary Day View" page is shown
    When user presses "Month View" button
    Then "CRM Diary Month View" page is shown
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-9937 @PreSales @POS @CRM @AUTOMATED
  Scenario: Verify Selecting a client in new appointment window - CRM
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Diary" icon button
    Then "CRM Diary Month View" page is shown
    When user presses "Day View" button
    Then "CRM Diary Day View" page is shown
    When user presses "> 1 Day" button
    Then "CRM Diary Day View" page is shown
    When user presses "CRM Diary New Appointment Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    When user presses "CRM Diary Client Search Button" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    And user enters "${Customer 3 Name}" into "CRM Customer Search Page Name Text" field
    And user presses "CRM Customer Search Page Search Button" icon button
    When user presses "CRM Customer Search Page Select Customer Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    And "CRM Diary Appointment Customer Name" field displays the text "Philip Pare"
    When user presses "CRM Cancel Button" icon button
    Then "CRM Diary Day View" page is shown
    When user presses "Month View" button
    Then "CRM Diary Month View" page is shown
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-9938 @POS @CRM @AUTOMATED
  Scenario: Verify Click on the cancel button in the new appointment window
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Diary" icon button
    Then "CRM Diary Month View" page is shown
    When user presses "Day View" button
    Then "CRM Diary Day View" page is shown
    When user presses "> 1 Day" button
    Then "CRM Diary Day View" page is shown
    When user presses "CRM Diary New Appointment Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    When user presses "CRM Cancel Button" icon button
    Then "CRM Diary Day View" page is shown
    When user presses "Month View" button
    Then "CRM Diary Month View" page is shown
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-9940 @PreSales @POS @CRM
  Scenario: Verify user can select an appointment in Day view
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Diary" icon button
    Then "CRM Diary Month View" page is shown
    When user presses "Day View" button
    Then "CRM Diary Day View" page is shown
    When user presses "> 1 Day" button
    Then "CRM Diary Day View" page is shown
    When user presses "CRM Diary New Appointment Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    And user waits "2" seconds
    And user enters "Test" into "CRM Diary Appointment Subject" field
    And user waits "2" seconds
    And user enters "Test Verify that New Appointment added is viewable in Diary View - Day view - Description" into "CRM Diary Appointment Details" field
    And user waits "2" seconds
    When user presses "CRM Diary Client Search Button" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    And user enters "${Customer 3 Name}" into "CRM Customer Search Page Name Text" field
    And user presses "CRM Customer Search Page Search Button" icon button
    When user presses "CRM Customer Search Page Select Customer Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    And user waits "2" seconds
    And "CRM Diary Appointment Customer Name" field displays the text "Philip Pare"
    When user presses "CRM Save Button" icon button
    And user presses "CRM Calendar Day View Section Button" link button
    Then "CRM Diary Edit Appointment" page is shown
    When user presses "CRM Cancel Button" icon button
    Then "CRM Diary Day View" page is shown
    When user presses "Month View" button
    Then "CRM Diary Month View" page is shown
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-9941 @PreSales @POS @CRM @AUTOMATED
  Scenario: Verify that New appointment added is viewable in Diary View - Day view
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Diary" icon button
    Then "CRM Diary Month View" page is shown
    When user presses "Day View" button
    Then "CRM Diary Day View" page is shown
    When user presses "> 1 Day" button
    Then "CRM Diary Day View" page is shown
    When user presses "CRM Diary New Appointment Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    And user waits "2" seconds
    And user enters "Test" into "CRM Diary Appointment Subject" field
    And user waits "2" seconds
    And user enters "Test Verify that New Appointment added is viewable in Diary View - Day view - Description" into "CRM Diary Appointment Details" field
    And user waits "2" seconds
    When user presses "CRM Diary Client Search Button" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    And user enters "${Customer 3 Name}" into "CRM Customer Search Page Name Text" field
    And user presses "CRM Customer Search Page Search Button" icon button
    When user presses "CRM Customer Search Page Select Customer Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    And user waits "2" seconds
    And "CRM Diary Appointment Customer Name" field displays the text "Philip Pare"
    When user presses "CRM Save Button" icon button
    And user waits "2" seconds
    Then "CRM Diary Day View" page is shown
    And user presses "CRM Calendar Day View Section Button" link button
    And "CRM Diary Edit Appointment" page is shown
    When user presses "CRM Cancel Button" icon button
    Then "CRM Diary Day View" page is shown
    When user presses "Month View" button
    Then "CRM Diary Month View" page is shown
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-297 @CRMDiaryNew @POS @CRM @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Verify that Diary screens and buttons are displayed
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Diary" icon button
    Then "CRM Diary Month View" page is shown
    When user selects "Tom Sales Assistant - UK" from "CRM Diary Show Diary for Dropdown" combobox
    Then "CRM Diary Month View" page is shown
    When user presses "< 1 Month" button
    Then "CRM Diary Month View" page is shown
    When user presses "This Month" button
    Then "CRM Diary Month View" page is shown
    When user presses "> 1 Month" button
    Then "CRM Diary Month View" page is shown
    And user waits "2" seconds
    When user presses "Day View" button
    Then "CRM Diary Day View" page is shown
    When user selects "${Sales Assistant 5 Full Name}" from "CRM Diary Show Diary for Dropdown" combobox
    And user presses "< 1 Month" button
    Then "CRM Diary Day View" page is shown
    When user presses "< 1 Week" button
    Then "CRM Diary Day View" page is shown
    When user presses "< 1 Day" button
    Then "CRM Diary Day View" page is shown
    When user presses "Today" button
    Then "CRM Diary Day View" page is shown
    When user presses "> 1 Day" button
    Then "CRM Diary Day View" page is shown
    When user presses "> 1 Week" button
    Then "CRM Diary Day View" page is shown
    When user presses "> 1 Month" button
    Then "CRM Diary Day View" page is shown
    When user presses "Back Button" icon button
    Then "CRM Diary Month View" page is shown
    When user presses "Day View" button
    Then "CRM Diary Day View" page is shown
    When user presses "Month View" button
    Then "CRM Diary Month View" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-296 @ValidateAddNewAppointmentWithHideInDiaryView @POS @CRM @AUTOMATED @MVP @Mobile @POSValidatedTest @POSSet1
  Scenario: Validate Add New Appointment – Hide in Diary View
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Diary" icon button
    Then "CRM Diary Month View" page is shown
    When user presses "> 1 Month" button
    Then "CRM Diary Month View" page is shown
    When user presses "CRM Diary New Appointment Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    When user presses "CRM Diary Client Search Button" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    And user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    And user presses "CRM Customer Search Page Search Button" icon button
    And user waits "2" seconds
    When user presses "CRM Customer Search Page Select Customer Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    And "CRM Diary Appointment Customer Name" field displays the text "Mark Harrison"
    And user enters "Test NOT Hide Diary View" into "CRM Diary Appointment Subject" field
    And user enters "Test NOT Hide Diary View - Description" into "CRM Diary Appointment Details" field
    And user presses "CRM Diary Hide In Diary View Checkbox" checkbox
    When user presses "CRM Save Button" icon button
    Then "CRM Diary Month View" page is shown
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-294 @ValidateDiaryPrivileges @POS @CRM @AUTOMATED @MVP @JIRA @POSValidatedTest @POSSet1
  Scenario: Validate Diary Privileges
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Diary" icon button
    Then "CRM Diary Month View" page is shown
    And user waits "CRM Diary New Appointment Button" to display
    And user waits "CRM Diary Day View Button" to display
    And user waits "CRM Diary Show Diary For Dropdown" to display
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    Given user signs on as "Manager 3"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Diary" icon button
    Then "CRM Diary Month View" page is shown
    And user waits "CRM Diary Day View Button" to display
    And user waits "CRM Diary New Appointment Button" to display
    And user confirms "CRM Diary Show Diary For Dropdown" not display
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "Log Out Button" icon button
    Then "Enter User" page is shown
    Given user signs on as "POS Operator"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Diary" icon button
    Then "CRM Diary Month View" page is shown
    And user waits "CRM Diary Day View Button" to display
    And user confirms "CRM Diary New Appointment Button" not display
    And user confirms "CRM Diary Show Diary For Dropdown" not display
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-232 @POS @CRM @AUTOMATED
  Scenario: Verify that New Appointment added is viewable in Diary Month View
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Diary" icon button
    And "CRM Diary Month View" page is shown
    And user presses "< 1 Month" button and "CRM Diary Month View" page shown
    And user waits "3" seconds
    And user confirms "CRM Diary New Appointment Button" not display
    And user presses "> 1 Month" button and "CRM Diary Month View" page shown
    And user waits "2" seconds
    And user presses "> 1 Month" button and "CRM Diary Month View" page shown
    And user waits "2" seconds
    And user presses "CRM Diary New Appointment Button" icon button
    And "CRM Diary Edit Appointment" page is shown
    And user presses "CRM Diary Client Search Button" icon button
    And "CRM Select Customers Screen" page is shown
		And user waits "5" seconds
    And user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    And user presses "CRM Customer Search Page Search Button" icon button
    And user waits "2" seconds
    And user presses "CRM Customer Search Page Select Customer Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    And "CRM Diary Appointment Customer Name" field displays the text "Mark Harrison"
    And user enters "Test NOT Hide Diary View" into "CRM Diary Appointment Subject" field
    When user enters "#{today+1}" into "CRM Diary Appointment Start Date" date field
    And user enters "Test NOT Hide Diary View - Description" into "CRM Diary Appointment Details" field
    And user enters "01:30" into "CRM Diary Appointment Start Time" time field
    And user enters "02:30" into "CRM Diary Appointment End Time" time field
    And user waits "2" seconds
    When user presses "CRM Save Button" icon button
    And "CRM Diary Month View" page is shown
    And user presses "Back button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-16764 @POS @CRM @AUTOMATED @MVP @ManualVerification @ReactThickPOS @ToBeFixedAutTest
  Scenario: Verify that New Appointment added is viewable in Diary View
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Diary" icon button
    And "CRM Diary Month View" page is shown
    And user presses "< 1 Month" button and "CRM Diary Month View" page shown
    And user confirms "CRM Diary New Appointment Button" not display
    And user presses "> 1 Month" button and "CRM Diary Month View" page shown
    And user presses "> 1 Month" button and "CRM Diary Month View" page shown
    And user presses "CRM Diary New Appointment Button" icon button
    And "CRM Diary Edit Appointment" page is shown
    And user presses "CRM Diary Client Search Button" icon button
    And "CRM Select Customers Screen" page is shown
    And user waits "5" seconds
    And user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    And user presses "CRM Customer Search Page Search Button" icon button
    And user presses "CRM Customer Search Page Select Customer Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    And "CRM Diary Appointment Customer Name" field displays the text "Mark Harrison"
    And user enters "Test NOT Hide Diary View" into "CRM Diary Appointment Subject" field
    And user enters "28/04/2021" into "CRM Diary Appointment Date" field
    And user enters "Test NOT Hide Diary View - Description" into "CRM Diary Appointment Details" field
    And user enters "0001" into "CRM Diary Appointment Start Time Hours" field
    And user enters "0002" into "CRM Diary Appointment End Time Hours" field
    When user presses "CRM Save Button" icon button
    And "CRM Diary Past Appointment Not Allowed" page is shown
    And user presses "OK" button
    And "CRM Diary Edit Appointment" page is shown
    And user presses "CRM Cancel Button" icon button
    And "CRM Diary Month View" page is shown
    And user presses "CRM Diary New Appointment Button" icon button
    And "CRM Diary Edit Appointment" page is shown
    And user presses "CRM Diary Client Search Button" icon button
    And "CRM Select Customers Screen" page is shown
    And user waits "1" seconds
    And user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    And user presses "CRM Customer Search Page Search Button" icon button
    And user presses "CRM Customer Search Page Select Customer Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    And "CRM Diary Appointment Customer Name" field displays the text "Mark Harrison"
    And user enters "Test NOT Hide Diary View" into "CRM Diary Appointment Subject" field
    And user enters "2358" into "CRM Diary Appointment Start Time Hours" field
    And user enters "2359" into "CRM Diary Appointment End Time Hours" field
    And user enters "Test NOT Hide Diary View - Description" into "CRM Diary Appointment Details" field
    And user presses "CRM Save Button" icon button
    Then "CRM Diary Month View" page is shown
    And user presses "Back button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    
  @PT-13490 @PreSales @POS @CRM @AUTOMATED @TobeFixedAutTest
  Scenario: Verify that user can delete an appointment
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Diary" icon button
    Then "CRM Diary Month View" page is shown
    When user presses "Day View" button
    Then "CRM Diary Day View" page is shown
    When user presses "> 1 Day" button
    Then "CRM Diary Day View" page is shown
    When user presses "CRM Diary New Appointment Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    And user waits "2" seconds
    And user enters "Test Subject" into "CRM Diary Appointment Subject" field
    And user waits "2" seconds
    And user enters "Test verify that New Appointment can be added and deleted - Description" into "CRM Diary Appointment Details" field
    And user waits "2" seconds
    When user presses "CRM Diary Client Search Button" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    And user enters "${Customer 3 Name}" into "CRM Customer Search Page Name Text" field
    And user presses "CRM Customer Search Page Search Button" icon button
    And user waits "2" seconds
    When user presses "CRM Customer Search Page Select Customer Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    And user waits "2" seconds
    And "CRM Diary Appointment Customer Name" field displays the text "Philip Pare"
    When user presses "CRM Save Button" icon button
    And user presses "CRM Calendar Day View Section Button" link button
    Then "CRM Diary Edit Appointment" page is shown
    When user presses "CRM Delete Button" icon button
    Then "CRM Diary Confirm Delete Appointment" page is shown
    And user presses "OK" button
    Then "CRM Diary Day View" page is shown
    When user presses "Month View" button
    Then "CRM Diary Month View" page is shown
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    And "Enter User" page is shown

  @PT-13370 @POSCRMDiary @Regression @POS
  Scenario: Verify that user cant schedule appointments for past days
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Diary" icon button
    Then "CRM Diary Month View" page is shown
    When user presses "CRM Diary New Appointment Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    And user waits "2" seconds
    And user enters "Test Subject" into "CRM Diary Appointment Subject" field
    And user waits "2" seconds
    And user enters "Test verify that user cant schedule appointments for past days - Description" into "CRM Diary Appointment Details" field
    And user waits "2" seconds
    When user presses "CRM Diary Client Search Button" icon button
    Then "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    And user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    And user presses "CRM Customer Search Page Search Button" icon button
    When user presses "CRM Customer Search Page Select Customer Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    And "CRM Diary Appointment Customer Name" field displays the text "Mark Harrison"
    And user enters "01/01/2000" into "CRM Diary Appointment Date" date field
    When user presses "CRM Save Button" icon button
    And "CRM Diary Past Appointment Not Allowed" page is shown
    And user presses "OK" button
    And "CRM Diary Edit Appointment" page is shown
    And user presses "CRM Cancel Button" icon button
    Then "CRM Diary Month View" page is shown
    When user presses "Back button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown