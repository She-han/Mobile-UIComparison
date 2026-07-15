Feature: CRM Overview

  @PT-229 @CRMOverview @POS @CRM @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Verify that CRM Overview screens are displayed
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Overview" icon button
    Then "CRM Daily Overview" page is shown
    And user presses "CRM Jobs Team Jobs Tab" icon button
    And user presses "CRM Jobs My Jobs Tab" icon button
    And "Today's Appointments" is displayed in "CRM Overview Appointment Panel" panel
    And "Inbox" is displayed in "CRM Overview Inbox Panel" panel
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-298 @POS @CRM @AUTOMATED @Mobile @MVP @POSValidatedTest @POSSet1
  Scenario: CRM Overview Compose Email
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    And user presses "Overview" icon button
    And "CRM Daily Overview" page is shown
    And user presses "CRM Email Compose Button" icon button
    And "CRM Email Client" page is shown
    And user presses "CRM Messages Client Search Button" icon button
    And "CRM Select Customers Screen" page is shown
    And user waits "2" seconds
    And user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    And user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    And user presses "CRM Customer Search Page Search Button" icon button
    And user waits "2" seconds
    When user presses "CRM Customer Search Page Select Customer Button" icon button
    Then "CRM Email Client" page is shown
    And "CRM Email Client Page To Input" field displays the text "${Customer 1 Email}"
    And "CRM Email Client Page From Input" field displays the text "${Manager 2 Email}"
    When user selects "-" from "CRM Email Client Page Template Dropdown" combobox
    And user enters "Test" into "CRM Email Client Page Subject Input" field
    And user enters "Test Email" into "CRM Email Client Page Email Content Input" rich text field
    And user presses "CRM Email Client Page Send Button" icon button
    Then "CRM Daily Overview" page is shown
    When user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-231 @POS @CRM @AUTOMATED @Mobile @MVP @POSValidatedTest @POSSet1
  Scenario: CRM Overview Check Email
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Overview" icon button
    And "CRM Daily Overview" page is shown
    And user waits "CRM Overview Inbox Panel" to display
    And user waits "CRM Email Inbox Email 1" to display
    And user presses "CRM Email Inbox Email 1" icon button
    And "CRM Email View" page is shown
    And user presses "Back Button" icon button
    And "CRM Daily Overview" page is shown
    And user presses "Back Button" icon button
    Then "CRM Menu Screen" page is shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-10839 @POS @CRM @AUTOMATED @Mobile @MVP @POSValidatedTest @POSSet1
  Scenario: Validating the time in the CRM Daily overview
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Diary" icon button
    And "CRM Diary Month View" page is shown
    And user presses "CRM Diary New Appointment Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    And user presses "CRM Diary Client Search Button" icon button
    And "CRM Select Customers Screen" page is shown
    And user waits "1" seconds
    And user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    And user presses "CRM Customer Search Page Search Button" icon button
    And user waits "2" seconds
    When user presses "CRM Customer Search Page Select Customer Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    And "CRM Diary Appointment Customer Name" field displays the text "Mark Harrison"
    And user enters "23:39" into "CRM Diary Appointment Start Time" time field
    And user enters "23:59" into "CRM Diary Appointment End Time" time field
    And user enters "CRM Daily Overview Test" into "CRM Diary Appointment Subject" field
    And user enters "CRM Daily Overview Test - Description" into "CRM Diary Appointment Details" field
    When user presses "CRM Save Button" icon button
    Then "CRM Diary Month View" page is shown
    And user presses "Back button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button      
    And user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Overview" icon button
    Then "CRM Daily Overview" page is shown
    And "CRM Daily Overview Test" is displayed in "CRM Overview Todays Appointments Appointment Description" panel
    And "${Customer 1 Formatted Name}" is displayed in "CRM Overview Todays Appointments Client" panel
    And "23:39" is displayed in "CRM Overview Todays Appointments Time" panel
    And "00:20" is displayed in "CRM Overview Todays Appointments Duration" panel
    And user presses "Back Button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-16733 @POS @CRM @AUTOMATED @MVP @ReactThickPOS
  Scenario: Validating the time in the CRM Daily overview - Only Applicable for React Thick POS
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Diary" icon button
    And "CRM Diary Month View" page is shown
    And user presses "CRM Diary New Appointment Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    And user presses "CRM Diary Client Search Button" icon button
    And "CRM Select Customers Screen" page is shown
    And user waits "1" seconds
    And user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    And user presses "CRM Customer Search Page Search Button" icon button
    When user presses "CRM Customer Search Page Select Customer Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    And "CRM Diary Appointment Customer Name" field displays the text "Mark Harrison"
    And user enters "23:00" into "CRM Diary Appointment Start Time" time field
    And user enters "23:59" into "CRM Diary Appointment End Time" time field
    And user enters "CRM Daily Overview Test" into "CRM Diary Appointment Subject" field
    And user enters "CRM Daily Overview Test - Description" into "CRM Diary Appointment Details" field
    When user presses "CRM Save Button" icon button
    Then "CRM Diary Month View" page is shown
    And user presses "Back button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button      
    And user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Overview" icon button
    Then "CRM Daily Overview" page is shown
    And "CRM Daily Overview Test" is displayed in "CRM Overview Todays Appointments Appointment Description" panel
    And "Mr. Mark Harrison" is displayed in "CRM Overview Todays Appointments Client" panel
    And "23:00" is displayed in "CRM Overview Todays Appointments Time" panel
    And "00:59" is displayed in "CRM Overview Todays Appointments Duration" panel
    And user presses "Back Button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-18743 @POS @CRM @AUTOMATED @Mobile @MVP @POSValidatedTest @POSSet1 @ReactPOSSpecific
  Scenario: Validating the time in the CRM Daily overview
    Given user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Diary" icon button
    And "CRM Diary Month View" page is shown
    And user presses "CRM Diary New Appointment Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    And user presses "CRM Diary Client Search Button" icon button
    And "CRM Select Customers Screen" page is shown
    And user waits "1" seconds
    And user enters "${Customer 1 Name}" into "CRM Customer Search Page Name Text" field
    And "CRM Customer Search Page Name Text" field displays the text "${Customer 1 Name}"
    And user presses "CRM Customer Search Page Search Button" icon button
    When user presses "CRM Customer Search Page Select Customer Button" icon button
    Then "CRM Diary Edit Appointment" page is shown
    And "CRM Diary Appointment Customer Name" field displays the text "Mark Harrison"
    And user enters "2339" into "CRM Diary Appointment Start Time" field
    And user enters "2359" into "CRM Diary Appointment End Time" field
    And user enters "CRM Daily Overview Test" into "CRM Diary Appointment Subject" field
    And user enters "CRM Daily Overview Test - Description" into "CRM Diary Appointment Details" field
    When user presses "CRM Save Button" icon button
    Then "CRM Diary Month View" page is shown
    And user presses "Back button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And user signs on as "Manager 2"
    When user presses "Transaction Basket CRM button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Overview" icon button
    Then "CRM Daily Overview" page is shown
    And "CRM Daily Overview Test" is displayed in "CRM Overview Todays Appointments Appointment Description" panel
    And "Mr Mark Harrison" is displayed in "CRM Overview Todays Appointments Client" panel
    And "23:39" is displayed in "CRM Overview Todays Appointments Time" panel
    And "00:20" is displayed in "CRM Overview Todays Appointments Duration" panel
    And user presses "Back Button" icon button
    And "CRM Menu Screen" page is shown
    And user presses "Home Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
