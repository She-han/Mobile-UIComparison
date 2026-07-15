Feature: Load the User Maintenance screen in the pos application

  @PT-538 @Regression @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Load the User Maintenance screen in the pos application
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Launch Screen Maintenance Button" icon button
    And user presses "Launch Screen User Maintenance Button" icon button
    And "Select User Screen" page is shown
    When user selects "${Sales Assistant Username}" from "List Box" list
    And user presses "View" button and "Edit User Screen" page shown
    Then "Maintenance View Display Name Field" field displays the text "${Sales Assistant Name}"
    And "Maintenance View Title Field" field displays the text "Mr"
    And "Maintenance View Surname Field" field displays the text "${Sales Assistant Surname}"
    And "Maintenance View Forename Field" field displays the text "${Sales Assistant Forename}"
    And user presses "Back" button and "Select User Screen" page shown
    And user presses "Back" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    And "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button

  @PT-817 @PreSales @Dune @Regression @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Verify ability to create and delete user from POS
    Given user signs on as "Manager 2"
    And user presses "Management" button
    When user presses "Admin" button and "Administration Screen" page shown
    And user presses "Launch Screen Maintenance Button" icon button
    And user presses "Launch Screen User Maintenance Button" icon button
    Then "Select User Screen" page is shown
    And user presses "Other Options" button
    And user presses "New" button and "New User Screen" page shown
    And user enters "Test_1" into "Maintenance New User Id Field" field
    And user presses "OK" button and "Edit User Screen" page shown
    And user enters "Sam" into "Maintenance View Display Name Field" field
    And user enters "Mr" into "Maintenance View Title Field" field
    And user enters "Fernando" into "Maintenance View Surname Field" field
    And user enters "Sam" into "Maintenance View Forename Field" field
    When user presses "Save" button and "User Maintenance Enter New Password Screen" page shown
    And user enters "abc" into "Maintenance New User Password Field" field
    And user enters "abc" into "Maintenance New User Reenter Password Field" field
    And user presses "OK" button and "Select User Screen" page shown
    And "TEST_1" is displayed in "List Box" list
    And user selects "TEST_1" from "List Box" list
    And user presses "Remove" button and "User Maintenance Remove User Confirm Screen" page shown
    And user presses "OK" button and "Select User Screen" page shown
    And "TEST_1" is not displayed in "List Box" list
    Then user presses "Back" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button

  @PT-820 @Dune @Regression @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Verify the ability to assign roles for a user
    Given user signs on as "Manager 2"
    And user presses "Management" button
    When user presses "Admin" button and "Administration Screen" page shown
    And user presses "Launch Screen Maintenance Button" icon button
    And user presses "Launch Screen User Maintenance Button" icon button
    Then "Select User Screen" page is shown
    And user presses "Other Options" button
    And user presses "New" button and "New User Screen" page shown
    And user enters "Test_12" into "Maintenance New User Id Field" field
    And user presses "OK" button and "Edit User Screen" page shown
    And user enters "Ham" into "Maintenance View Display Name Field" field
    And user enters "Mr" into "Maintenance View Title Field" field
    And user enters "Fernando" into "Maintenance View Surname Field" field
    And user enters "Ham" into "Maintenance View Forename Field" field
    When user presses "Save" button and "User Maintenance Enter New Password Screen" page shown
    And user enters "aba" into "Maintenance New User Password Field" field
    And user enters "aba" into "Maintenance New User Reenter Password Field" field
    And user presses "OK" button and "Select User Screen" page shown
    And "TEST_12" is displayed in "List Box" list
    And user selects "TEST_12" from "List Box" list
    And user presses "Edit" button and "Edit User Screen" page shown
    And user presses "Roles" button and "User Maintenance Edit User Roles Screen" page shown
    And user selects "Pos Admin" from "Maintenance User Role List Box" list
    And button with label "Exclude" is not displayed
    Then user presses "Include" button
    And button with label "Include" is not displayed
    And user presses "OK" button and "Edit User Screen" page shown
    And user presses "Save" button and "Select User Screen" page shown
    And user selects "TEST_12" from "List Box" list
    And user presses "Remove" button and "User Maintenance Remove User Confirm Screen" page shown
    And user presses "OK" button and "Select User Screen" page shown
    When user presses "Back" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    Then user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button

  @PT-818 @Dune @ManualVerification @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Verify the ability to edit a user
    Given user signs on as "Manager 2"
    And user presses "Management" button
    When user presses "Admin" button and "Administration Screen" page shown
    And user presses "Launch Screen Maintenance Button" icon button
    And user presses "Launch Screen User Maintenance Button" icon button
    Then "Select User Screen" page is shown
    And user presses "Other Options" button
    And user presses "New" button and "New User Screen" page shown
    And user enters "Test_10" into "Maintenance New User Id Field" field
    And user presses "OK" button and "Edit User Screen" page shown
    And user enters "Finch" into "Maintenance View Display Name Field" field
    And user enters "Mr" into "Maintenance View Title Field" field
    And user enters "Fernando" into "Maintenance View Surname Field" field
    And user enters "10/04/88" into "Maintenance View Dob Field" field
    And user enters "Finch" into "Maintenance View Forename Field" field
    When user presses "Save" button and "User Maintenance Enter New Password Screen" page shown
    And user enters "abc" into "Maintenance New User Password Field" field
    And user enters "abc" into "Maintenance New User Reenter Password Field" field
    And user presses "OK" button and "Select User Screen" page shown
    And "TEST_10" is displayed in "List Box" list
    And user selects "TEST_10" from "List Box" list
    And user presses "Edit" button and "Edit User Screen" page shown
    And user enters "Roy" into "Maintenance View Surname Field" field
    And user enters "Fernando" into "Maintenance View Forename Field" field
    And user enters "12/04/88" into "Maintenance View Dob Field" field
    And user presses "Save" button and "Select User Screen" page shown
    And user presses "Other Options" button 
    And user presses "Next Page" button 
    Then "TEST_10" is displayed in "List Box" list
    And user selects "TEST_10" from "List Box" list
    And user presses "View" button and "Edit User Screen" page shown
    And "Maintenance View Surname Field" field displays the text "Roy"
    And "Maintenance View Forename Field" field displays the text "Fernando"
    And "Maintenance View Dob Field" field displays the text "12/04/88"
    And user presses "Back" button and "Select User Screen" page shown
    And user selects "TEST_10" from "List Box" list
    And user presses "Other Options" button
    And user presses "Remove" button and "User Maintenance Remove User Confirm Screen" page shown
    And user presses "OK" button and "Select User Screen" page shown
    When user presses "Back" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    Then user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button

  @PT-6972 @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Creating new user - Using a pos terminal created without pos terminal template
    Given user signs on as "Manager 2"
    And user presses "Management" button
    When user presses "Admin" button and "Administration Screen" page shown
    And user presses "Launch Screen Maintenance Button" icon button
    And user presses "Launch Screen User Maintenance Button" icon button
    Then "Select User Screen" page is shown
    And user presses "Other Options" button
    And user presses "New" button and "New User Screen" page shown
    And user enters "Test_1" into "Maintenance New User Id Field" field
    And user presses "OK" button and "Edit User Screen" page shown
    And user enters "Sam" into "Maintenance View Display Name Field" field
    And user enters "Mr" into "Maintenance View Title Field" field
    And user enters "Fernando" into "Maintenance View Surname Field" field
    And user enters "Sam" into "Maintenance View Forename Field" field
    When user presses "Save" button and "User Maintenance Enter New Password Screen" page shown
    And user enters "abc" into "Maintenance New User Password Field" field
    And user enters "abc" into "Maintenance New User Reenter Password Field" field
    And user presses "OK" button and "Select User Screen" page shown
    And "TEST_1" is displayed in "List Box" list
    And user selects "TEST_1" from "List Box" list
    And user presses "Remove" button and "User Maintenance Remove User Confirm Screen" page shown
    And user presses "OK" button and "Select User Screen" page shown
    Then user presses "Back" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button

  @PT-6974 @ManualVerification @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Creating new user - Using a pos terminal created with pos terminal template
    Given user signs on as "Manager 2"
    And user presses "Management" button
    When user presses "Admin" button and "Administration Screen" page shown
    And user presses "Launch Screen Maintenance Button" icon button
    And user presses "Launch Screen User Maintenance Button" icon button
    Then "Select User Screen" page is shown
    And user presses "Other Options" button
    And user presses "New" button and "New User Screen" page shown
    And user enters "Test_1" into "Maintenance New User Id Field" field
    And user selects "Sales Assistant" from "Maintenance User Template Field" combobox
    And user presses "OK" button and "Edit User Screen" page shown
    And user enters "Sam" into "Maintenance View Display Name Field" field
    And user enters "Mr" into "Maintenance View Title Field" field
    And user enters "Fernando" into "Maintenance View Surname Field" field
    And user enters "Sam" into "Maintenance View Forename Field" field
    When user presses "Save" button and "User Maintenance Enter New Password Screen" page shown
    And user enters "abcd" into "Maintenance New User Password Field" field
    And user enters "abcd" into "Maintenance New User Reenter Password Field" field
    And user presses "OK" button and "Select User Screen" page shown
    And "TEST_1" is displayed in "List Box" list
    Then user presses "Back" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button

  @PT-6975 @ManualVerification @POS @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Editing a user - Using a pos terminal created with pos terminal template
    Given user signs on as "Manager 2"
    And user presses "Management" button
    When user presses "Admin" button and "Administration Screen" page shown
    And user presses "Launch Screen Maintenance Button" icon button
    And user presses "Launch Screen User Maintenance Button" icon button
    Then "Select User Screen" page is shown
	When user presses "Filters" button
	And "User Maintenance Criteria Screen" page is shown
	And user enters "T" into "User ID" field
	And user presses "OK" button
	Then "Select User Screen" page is shown
    And "TEST_1" is displayed in "List Box" list
    And user selects "TEST_1" from "List Box" list
    And user presses "Other Options" button
    And user presses "Edit" button and "Edit User Screen" page shown
    And user enters "Roy" into "Maintenance View Surname Field" field
    And user enters "Fernando" into "Maintenance View Forename Field" field
    And user presses "Save" button and "Select User Screen" page shown
    And "Roy" is displayed in "List Box" list
    And user selects "TEST_1" from "List Box" list
    And user presses "Remove" button and "User Maintenance Remove User Confirm Screen" page shown
    And user presses "OK" button and "Select User Screen" page shown
    Then user presses "Back" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    
    @PT-9744 @POS @AUTOMATED 
    Scenario: Verify Access Times Field validations
    Given user signs on as "Manager 2"
    And user presses "Management" button
    When user presses "Admin" button and "Administration Screen" page shown
    And user presses "Launch Screen Maintenance Button" icon button
    And user presses "Launch Screen User Maintenance Button" icon button and "Select User Screen" page shown
    And user presses "Other Options" button
    And user presses "Edit" button and "Edit User Screen" page shown
    And user presses "Access Times" button and "Edit User Access Times Screen" page shown
    And user enters "6100" into "Maintenance Sunday End Time Field" field
    And user presses "OK" button
    And "Sunday End Time Error" label displays the text "Invalid time"
    And user presses "Cancel" button and "Edit User Screen" page shown
    And user presses "Access Times" button and "Edit User Access Times Screen" page shown
    And user enters "    " into "Maintenance Sunday End Time Field" field
    And user presses "OK" button
    And "Sunday End Time Error" label displays the text "Invalid time"
    And user presses "Cancel" button and "Edit User Screen" page shown
    And user presses "Access Times" button and "Edit User Access Times Screen" page shown
    And user enters "1600" into "Maintenance Sunday End Time Field" field
    And user presses "OK" button and "Edit User Screen" page shown
    And user presses "Save" button and "Select User Screen" page shown
    Then user presses "Back" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
   
    @PT-24127 @POS @AUTOMATED @Maintenance @Maintenance-User
    Scenario: Verifying the Email page in the User Maintenance in the POS
    Given user signs on as "Manager2"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Launch Screen Maintenance Button" icon button
    And user presses "Launch Screen User Maintenance Button" icon button
    And "Select User Screen" page is shown
    When user selects "${Manager 2 Username}" from "List Box" list
    And user presses "View" button and "Edit User Screen" page shown
    And user presses "Email" button and "User Maintenance Edit Email Screen" page shown
    And user presses "Back" button and "Edit User Screen" page shown
    And user presses "Back" button and "Select User Screen" page shown
    And user presses "Back" button and "Administration Screen" page shown
    And user presses "Administration Screen Back Button" icon button
    And "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    