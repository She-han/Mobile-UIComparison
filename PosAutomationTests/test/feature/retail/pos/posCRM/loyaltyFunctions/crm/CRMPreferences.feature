Feature: CRM - Preferences Test

  @PT-1363 @CRMKeyDatesTab @CRMPreferences @CRM @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Check that user can add and view Social Calendar / Key Dates
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
    When user presses "CRM Customer Client Details Page Preferences Button" icon button
    Then "CRM Preferences" page is shown
    When user presses "CRM Customer Preferences Add Key Date Button" icon button
    Then "CRM Preferences Edit Key Date" page is shown
    When user selects "Birthday" from "CRM Customer Preferences Key Date Type Dropdown" combobox
    And user presses "CRM Customer Preferences Generate Reminder Checkbox" icon button
    And user presses "CRM Customer Preferences Recurs Annually Checkbox" checkbox
    When user enters "25/11/1997" into "CRM Customer Preferences Key Date" date field
    And user enters "Birthday Notes" into "CRM Customer Preferences Details Input" field
    And user presses "CRM Save Button" icon button
    Then "CRM Preferences" page is shown
    ## TODO: Need to add support to verify the text from table record
    When user presses "CRM Customer Preferences Key Date View Button" icon button
    Then "CRM Preferences Edit Key Date" page is shown
    And "CRM Customer Preferences Details Input" field displays the text "Birthday Notes"
    When user presses "Back Button" icon button
    Then "CRM Preferences" page is shown
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

  @PT-462 @CRMPreferences @POS @CRM @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Preferences - Edit Key Dates
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
    When user presses "CRM Customer Client Details Page Preferences Button" icon button
    Then "CRM Preferences" page is shown
    When user presses "CRM Customer Preferences Key Date View Button" icon button
    Then "CRM Preferences Edit Key Date" page is shown
    And user presses "CRM Edit Button" icon button
    Then "CRM Preferences Edit Key Date" page is shown
    When user selects "Anniversary" from "CRM Customer Preferences Key Date Type Dropdown" combobox
    And user presses "CRM Customer Preferences Recurs Annually Checkbox" checkbox
    When user enters "10/09/2023" into "CRM Customer Preferences Key Date" date field
    And user enters "Anniversary Notes" into "CRM Customer Preferences Details Input" field
    And user presses "CRM Save Button" icon button
    Then "CRM Preferences" page is shown
    When user presses "CRM Customer Preferences Key Date View Button" icon button
    Then "CRM Preferences Edit Key Date" page is shown
    And "CRM Customer Preferences Details Input" field displays the text "Anniversary Notes"
    When user presses "Back Button" icon button
    Then "CRM Preferences" page is shown
    #Reset Key Date to original value
    When user presses "CRM Customer Preferences Key Date View Button" icon button
    Then "CRM Preferences Edit Key Date" page is shown
    And user presses "CRM Edit Button" icon button
    Then "CRM Preferences Edit Key Date" page is shown
    When user selects "Birthday" from "CRM Customer Preferences Key Date Type Dropdown" combobox
    And user presses "CRM Customer Preferences Generate Reminder Checkbox" icon button
    And user presses "CRM Customer Preferences Recurs Annually Checkbox" checkbox
    When user enters "25/11/1997" into "CRM Customer Preferences Key Date" date field
    And user enters "Birthday Notes" into "CRM Customer Preferences Details Input" field
    And user presses "CRM Save Button" icon button
    Then "CRM Preferences" page is shown
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

  @PT-1364 @CRMNotesTab @CRMPreferences @CRM @POS @AUTOMATED @POSValidatedTest @POSSet1 @ToBeFixedAutTest
  Scenario: Check that user can add and view Notes
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
    When user presses "CRM Customer Client Details Page Preferences Button" icon button
    Then "CRM Preferences" page is shown
    When user presses "CRM Customer Preferences Notes Tab" icon button
    And user presses "CRM Customer Preferences Add Note Button" icon button
    Then "CRM Preferences Edit Note" page is shown
    And user enters "09/08/19" into "CRM Customer Preferences Note Date" date field
    And user presses "CRM Customer Preferences Notes Private Checkbox" icon button
    And user enters "Test Preference Notes" into "CRM Customer Preferences Notes Input" field
    And user presses "CRM Save Button" icon button
    Then "CRM Preferences" page is shown
    ## TODO: Need to add support to verify the text from table record
    When user presses "CRM Customer Preferences Notes View Button" icon button
    Then "CRM Preferences Edit Note" page is shown
    And "CRM Customer Preferences Notes Input" field displays the text "Test Preference Notes"
    When user presses "Back Button" icon button
    Then "CRM Preferences" page is shown
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

  @PT-464 @TobeFixedAutTest @CRMPreferences @POS @CRM @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Preferences - Edit Notes/WishList
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
    And user waits "3" seconds
    Then "CRM Client Details" page is shown
    When user presses "CRM Customer Client Details Page Preferences Button" icon button
    Then "CRM Preferences" page is shown
    When user presses "CRM Customer Preferences Notes Tab" icon button
    Then "CRM Preferences" page is shown
    When user presses "CRM Customer Preferences Notes View Button" icon button
    Then "CRM Preferences Edit Note" page is shown
    And user presses "CRM Edit Button" icon button
    Then "CRM Preferences Edit Note" page is shown
    And user enters "09/08/19" into "CRM Customer Preferences Note Date" date field
    And user presses "CRM Customer Preferences Notes Private Checkbox" icon button
    And user enters "Updated Notes" into "CRM Customer Preferences Notes Input" field
    And user presses "CRM Save Button" icon button
    Then "CRM Preferences" page is shown
    And user presses "CRM Customer Preferences Notes View Button" icon button
    And "CRM Preferences Edit Note" page is shown
    And "CRM Customer Preferences Notes Input" field displays the text "Updated Notes"
    #And "CRM Customer Preferences Note Year Input" field displays the text "2020"
    When user presses "Back Button" icon button
    Then "CRM Preferences" page is shown
    #Reset Notes to original value
    When user presses "CRM Customer Preferences Notes View Button" icon button
    Then "CRM Preferences Edit Note" page is shown
    And user presses "CRM Edit Button" icon button
    Then "CRM Preferences Edit Note" page is shown
    When user selects "9" from "CRM Customer Preferences Note Day Dropdown" combobox
    And user selects "August" from "CRM Customer Preferences Note Month Dropdown" combobox
    And user enters "2019" into "CRM Customer Preferences Note Year Input" field
    And user presses "CRM Customer Preferences Notes Private Checkbox" icon button
    And user enters "Test Preference Notes" into "CRM Customer Preferences Notes Input" field
    And user presses "CRM Save Button" icon button
    Then "CRM Preferences" page is shown
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

  @PT-222 @CRMPreferencesTab @CRMPreferences @CRM @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Check that user can add and view Preferences/Sizes
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
    When user presses "CRM Customer Client Details Page Preferences Button" icon button
    Then "CRM Preferences" page is shown
    When user presses "CRM Customer Preferences Preferences Tab" icon button
    And user presses "CRM Customer Preferences Add Pref Button" icon button
    Then "CRM Preferences Select Preference Option" page is shown
    And user selects "Preference Groups" from "CRM Customer Preferences Preference Type Dropdown" combobox
    And user selects "Marketing Preferences" from "CRM Customer Preferences Preference List" list
    And user presses "CRM Customer Preferences Select Button" icon button
    Then "CRM Preferences Select Preference Option" page is shown
    And user waits "2" seconds
    And user selects "Email Preferences" from "CRM Customer Preferences Preference List" list
    And user presses "CRM Customer Preferences Select Button" icon button
    Then "CRM Preferences Edit Preference" page is shown
    And "CRM Customer Preferences Edit Preference Type Input" field displays the text "Marketing Preferences"
    And "CRM Customer Preferences Edit Preference Input" field displays the text "Email Preferences"
    And user waits "2" seconds
    When user selects "Seasonal Trend" from "CRM Customer Preferences Preference Values List" list
    And user presses "CRM Save Button" icon button
    Then "CRM Preferences" page is shown
    ## TODO: Need to add support to verify the text from table record
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

  @PT-465 @CRMPreferences @POS @CRM @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Preferences - View Preferences/Sizes
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
    When user presses "CRM Customer Client Details Page Preferences Button" icon button
    Then "CRM Preferences" page is shown
    When user presses "CRM Customer Preferences Preferences Tab" icon button
    And user waits "5" seconds
    And user presses "CRM Customer Preferences View Row 1" icon button
    And user waits "2" seconds
    Then "CRM Preferences Edit Preference" page is shown
    Then "CRM Customer Preferences Edit Preference Type Input" field displays the text "Marketing Preferences"
    Then "CRM Customer Preferences Edit Preference Input" field displays the text "Email Preferences"
    When user presses "Back Button" icon button
    Then "CRM Preferences" page is shown
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

  @PT-466 @PreSales @CRMPreferences @POS @CRM @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Preferences - Edit Preferences/Sizes
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
    When user presses "CRM Customer Client Details Page Preferences Button" icon button
    Then "CRM Preferences" page is shown
    When user presses "CRM Customer Preferences Preferences Tab" icon button
    And user waits "5" seconds
    And user presses "CRM Customer Preferences View Row 1" icon button
    And user waits "1" seconds
    Then "CRM Preferences Edit Preference" page is shown
    And user presses "CRM Edit Button" icon button
    Then "CRM Preferences Edit Preference" page is shown
    And user presses "CRM Customer Preferences Change Pref Button" icon button
    Then "CRM Preferences Select Preference Option" page is shown
    And user selects "Preference Groups" from "CRM Customer Preferences Preference Type Dropdown" combobox
    And user waits "1" seconds
    And user selects "Contact Permissions" from "CRM Customer Preferences Preference List" list
    And user presses "CRM Customer Preferences Select Button" icon button
    Then "CRM Preferences Select Preference Option" page is shown
    And user waits "2" seconds
    And user selects "Phone" from "CRM Customer Preferences Preference List" list
    And user presses "CRM Customer Preferences Select Button" icon button
    Then "CRM Preferences Select Preference Option" page is shown
    And user waits "2" seconds
    And user selects "Phone Optin" from "CRM Customer Preferences Preference List" list
    And user presses "CRM Customer Preferences Select Button" icon button
    Then "CRM Preferences Edit Preference" page is shown
    And user presses "CRM Edit Button" icon button
    Then "CRM Preferences Edit Preference" page is shown
    And user presses "CRM Phone Optin Checkbox" icon button
    And user presses "CRM Save Button" icon button
    Then "CRM Preferences" page is shown
    #Reset Preference to original value
    And user presses "CRM Customer Preferences View Row 1" icon button
    Then "CRM Preferences Edit Preference" page is shown
    And user presses "CRM Edit Button" icon button
    Then "CRM Preferences Edit Preference" page is shown
    And user presses "CRM Customer Preferences Change Pref Button" icon button
    Then "CRM Preferences Select Preference Option" page is shown
    And user selects "Preference Groups" from "CRM Customer Preferences Preference Type Dropdown" combobox
    And user selects "Marketing Preferences" from "CRM Customer Preferences Preference List" list
    And user presses "CRM Customer Preferences Select Button" icon button
    Then "CRM Preferences Select Preference Option" page is shown
    And user waits "2" seconds
    And user selects "Email Preferences" from "CRM Customer Preferences Preference List" list
    And user presses "CRM Customer Preferences Select Button" icon button
    Then "CRM Preferences Edit Preference" page is shown
    And "CRM Customer Preferences Edit Preference Type Input" field displays the text "Marketing Preferences"
    And "CRM Customer Preferences Edit Preference Input" field displays the text "Email Preferences"
    And user presses "CRM Edit Button" icon button
    When user selects "Seasonal Trend" from "CRM Customer Preferences Preference Values List" list
    And user presses "CRM Save Button" icon button
    Then "CRM Preferences" page is shown
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

  @PT-11366 @CRMNotesTab @CRMPreferences @CRM @POS @AUTOMATED @POSValidatedTest @POSSet1 @ToBeFixedAutTest
  Scenario: Check that user can add and view Notes
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
    When user presses "CRM Customer Client Details Page Preferences Button" icon button
    Then "CRM Preferences" page is shown
    When user presses "CRM Customer Preferences Notes Tab" icon button
    And user presses "CRM Customer Preferences Add Note Button" icon button
    Then "CRM Preferences Edit Note" page is shown
    When user selects "9" from "CRM Customer Preferences Note Day Dropdown" combobox
    And user selects "August" from "CRM Customer Preferences Note Month Dropdown" combobox
    And user enters "2019" into "CRM Customer Preferences Note Year Input" field
    And user presses "CRM Customer Preferences Notes Private Checkbox" icon button
    And user enters "t" into "CRM Customer Preferences Notes Input" field
    And user presses "Toggle Alpha Keyboard" icon button
    Then "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter e button" icon button
    And user waits "1" seconds
    And user presses "Keyboard Letter s button" icon button
    And user waits "1" seconds
    And user presses "Keyboard Letter t button" icon button
    And user waits "1" seconds
    And user presses "Toggle Alpha Keyboard" icon button
    Then "CRM Capture Customer Details Hide Keyboard" page is shown
    And user presses "CRM Save Button" icon button
    Then "CRM Preferences" page is shown
    When user presses "CRM Customer Preferences Notes View Button" icon button
    Then "CRM Preferences Edit Note" page is shown
    And "CRM Customer Preferences Notes Input" field displays the text "test"
    When user presses "Back Button" icon button
    Then "CRM Preferences" page is shown
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
    
  @PT-11367 @CRMPreferences @POS @CRM @AUTOMATED @ToBeFixedAutTest
  Scenario: Preferences - Edit Notes/WishList
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
    And user waits "3" seconds
    Then "CRM Client Details" page is shown
    When user presses "CRM Customer Client Details Page Preferences Button" icon button
    Then "CRM Preferences" page is shown
    When user presses "CRM Customer Preferences Notes Tab" icon button
    Then "CRM Preferences" page is shown
    When user presses "CRM Customer Preferences Notes View Button" icon button
    Then "CRM Preferences Edit Note" page is shown
    And user presses "CRM Edit Button" icon button
    Then "CRM Preferences Edit Note" page is shown
    And user enters "t" into "CRM Customer Preferences Notes Input" field
    And user presses "Toggle Alpha Keyboard" icon button
    Then "Enter User with Keyboard" page is shown
    And user presses "Keyboard Letter e button" icon button
    And user waits "1" seconds
    And user presses "Keyboard Letter s button" icon button
    And user waits "1" seconds
    And user presses "Keyboard Letter t button" icon button
    And user waits "1" seconds
    And user presses "Keyboard Number 2 button" icon button
    And user waits "1" seconds
    And user presses "Toggle Alpha Keyboard" icon button
    Then "CRM Capture Customer Details Hide Keyboard" page is shown
    And user presses "CRM Save Button" icon button
    And user waits "2" seconds
    Then "CRM Preferences" page is shown
    And user presses "CRM Customer Preferences Notes View Button" icon button
    And "CRM Preferences Edit Note" page is shown
    And "CRM Customer Preferences Notes Input" field displays the text "test2"
    When user presses "Back Button" icon button
    Then "CRM Preferences" page is shown
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