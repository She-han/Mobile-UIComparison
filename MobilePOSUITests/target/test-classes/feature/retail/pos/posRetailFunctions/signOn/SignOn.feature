Feature: Sign on/off

  @PT-1352 @Login_without_details @POS @AUTOMATED @SignOn @POSValidatedTest @POSSet3
  Scenario: Attempt to sign on without entering any credentials
    Given "Enter User" page is shown
    # press ENT button to move to password field without entering username
    When user presses "ENT" button
    # press ENT button again to login without entering password
    And user presses "ENT" button
    Then "Enter User Required Error" page is shown
    And user presses "OK" button
    Then "Enter User" page is shown

  @PT-885 @PreSales @Login_valid-details @POS @Dunelm @AUTOMATED @SignOn @Smoke @ReactPOS @POSValidatedTest @POSSet3
  Scenario: Sign on with a valid user id and password
    Given "Enter User" page is shown
    When user enters "${Sales Assistant Username}" into "User Name Text" field
    And user enters "${Sales Assistant Password}" into "Password Text" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1353 @Login_invalid-username @POS @AUTOMATED @SignOn @ReactPOS @POSValidatedTest @POSSet3
  Scenario: Attempt to sign on with an invalid user id and a valid password
    Given "Enter User" page is shown
    When user enters "InvalidUser" into "User Name Text" field
    And user enters "${Sales Assistant Password}" into "Password Text" field
    And user presses "ENT" button
    Then "Enter User Invalid Error 2" page is shown
    And user presses "OK" button
    Then "Enter User" page is shown

  @PT-1354 @Login_invalid-details @Dune @POS @AUTOMATED @SignOn @ReactPOS @POSValidatedTest @POSSet3
  Scenario: Attempt to sign on with an invalid user id and password
    Given "Enter User" page is shown
    When user enters "InvalidUser" into "User Name Text" field
    And user enters "1100" into "Password Text" field
    And user presses "ENT" button
    Then "Enter User Invalid Error 2" page is shown
    And user presses "OK" button
    Then "Enter User" page is shown

  @PT-1355 @Login_invalid-password @POS @AUTOMATED @SignOn @ReactPOS @POSValidatedTest @POSSet3
  Scenario: Attempt to sign on with a valid user id and an invalid password
    Given "Enter User" page is shown
    When user enters "${Sales Assistant Username}" into "User Name Text" field
    And user enters "1100" into "Password Text" field
    And user presses "ENT" button
    Then "Enter User Invalid Error" page is shown
    And user presses "OK" button
    Then "Enter User" page is shown

  @PT-1820 @AUTOMATED @POS @SignOn @POSValidatedTest @POSSet3
  Scenario: User trying to exit from sign on screen results in a prompt
    Given "Enter User" page is shown
    When user presses "Exit Button" icon button
    Then "Confirm Exit" page is shown
    And user presses "No" button
    And "Enter User" page is shown

  @PT-1819 @AUTOMATED @POS @SignOn @POSValidatedTest @POSSet4
  Scenario: Pressing CLR button on Login screen
    Given "Enter User" page is shown
    When user enters "Username1" into "User Name Text" field
    And "User Name Text" field displays the text "Username1"
    And user presses "User Name Text" icon button
    And user waits "1" seconds
    And user presses "User Name Text" icon button
    And user presses "CLR" button
    And user waits "2" seconds
    And "User Name Text" field displays the text "Username"
    When user enters "Password1" into "Password Text" field
    And "Password Text" field displays the text "Password1"
    And user presses "Password Text" icon button
    And user waits "1" seconds
    And user presses "Password Text" icon button
    And user presses "CLR" button
    And user waits "2" seconds
    And "Password Text" field displays the text "Password"

  @PT-1818 @SignOn @POS @AUTOMATED @TobeFixedAutTest
  Scenario: User Change password - verify that password complexity requirements are enforced
    Given "Enter User" page is shown
    And user enters "FCP1" into "User Name Text" field
    And user enters "Fcp@1" into "Password Text" field
    And user presses "ENT" button and "Enter New Password Screen" page shown
    And user enters "1" into "Input Box" field
    And user presses "ENT" button and "Reenter A New Password" page shown
    And user enters "1" into "Input Box" field
    And user presses "ENT" button and "Minimum Password Length Prompt" page shown
    And user presses "OK" button and "Enter New Password Screen" page shown
    And user enters "1111" into "Input Box" field
    And user presses "ENT" button and "Reenter A New Password" page shown
    And user enters "1111" into "Input Box" field
    And user presses "ENT" button and "Password Alphanumeric Prompt" page shown
    And user presses "OK" button and "Enter New Password Screen" page shown
    And user enters "fcp1" into "Input Box" field
    And user presses "ENT" button and "Reenter A New Password" page shown
    And user enters "fcp1" into "Input Box" field
    And user presses "ENT" button and "Password Upper And Lower Case Prompt" page shown
    And user presses "OK" button and "Enter New Password Screen" page shown
    And user enters "Fcp@1" into "Input Box" field
    And user presses "ENT" button and "Reenter A New Password" page shown
    And user enters "Fcp@1" into "Input Box" field
    And user presses "ENT" button and "Password Must Be Different Prompt" page shown
    And user presses "OK" button and "Enter New Password Screen" page shown
    And user enters "Fcp@2" into "Input Box" field
    And user presses "ENT" button and "Reenter A New Password" page shown
    And user enters "Fcp@2" into "Input Box" field
    And user presses "ENT" button and "Password Successfully Changed Prompt" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Launch Screen Maintenance Button" icon button
    And user presses "Change Your Password" icon button
    Then "Enter New Password Screen" page is shown
    And user enters "Fcp@1" into "Input Box" field
    And user presses "ENT" button and "Reenter A New Password" page shown
    And user enters "Fcp@1" into "Input Box" field
    And user presses "ENT" button and "Password Successfully Changed Prompt" page shown
    And user presses "OK" button and "Administration Screen" page shown
    When user presses "BAG Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-1906 @AUTOMATED @SignOn @POS @TobeFixedAutTest
  Scenario: Password entered are masked with asterisks in the text box
    Given "Enter User" page is shown
    When user enters "${Sales Assistant Username}" into "User Name Text" field
    And user enters "${Sales Assistant Password}" into "Password Text" field
    Then "Password Text" field displays the text "***"

  @PT-910 @PreSales @AUTOMATED @SignOn @Dunelm @JYSK @MVP @ReactPOS
  Scenario: Force Password Change and Reset Password on User
    Given "Enter User" page is shown
    And user enters "${Sales Assistant 5 Username}" into "User Name Text" field
    When user enters "${Sales Assistant 5 Password}" into "Password Text" field
    And user presses "ENT" button and "Enter New Password Screen" page shown
    And user enters "${Sales Assistant 5 New Password}" into "Input Box" field
    And user presses "ENT" button
    Then "Reenter A New Password" page is shown
    When user enters "${Sales Assistant 5 New Password}" into "Input Box" field
    And user presses "ENT" button
    Then "Password Successfully Changed Prompt" page is shown
    And user presses "OK" button
    Then "Transaction Basket" page is shown
    Then user presses "Log Out Button" icon button
    Then "Enter User" page is shown
    #Reset Password from POS
    And user enters "${Sales Assistant 5 Username}" into "User Name Text" field
    When user enters "${Sales Assistant 5 New Password}" into "Password Text" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
    And user presses "Other Functions" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Maintenance" button
    And user presses "Change User Password" button
    And "Enter New Password Screen" page is shown
    When user enters "${Sales Assistant 5 Password}" into "Input Box" field
    And user presses "ENT" button
    Then "Reenter A New Password" page is shown
    When user enters "${Sales Assistant 5 Password}" into "Input Box" field
    And user presses "ENT" button
    Then "Password Successfully Changed Prompt" page is shown
    And user presses "OK" button and "Administration Screen" page shown
    Then user presses "Log Out Button" icon button
    And "Enter User" page is shown
    Given user signs on as "Manager 2"
    When user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Launch Screen Maintenance Button" icon button
    And user presses "Launch Screen User Maintenance Button" icon button
    Then "Select User Screen" page is shown
    And user presses "Next Page" button
    And user selects "${Sales Assistant 5 Name}" from "List Box" list
    And user presses "Other Options" button
    And user presses "Edit" button and "Edit User Screen" page shown
    And user presses "Security" button and "User Maintenance Edit User Security Screen" page shown
    And user presses "Force Change Password" checkbox
    And user presses "OK" button and "Edit User Screen" page shown
    And user presses "Save" button and "Select User Screen" page shown
    And user presses "Back" button and "Administration Screen" page shown
    And user presses "Home Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-3180 @PreSales @POS @AUTOMATED @Spurs
  Scenario: Verify Sign Off operation
    Given user signs on as "Sales Assistant"
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown

  @PT-9287 @POS @AUTOMATED @SignOn @SkipValidationForCard
  Scenario: Verify Sign On Operation with Card Scan - with SkipValidationForCard property
    Given "Enter User" page is shown
    Then "Scanner" page is shown
    When user enters "${Pos Operator 7 Username}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-9289 @POS @AUTOMATED @SignOn
  Scenario: Verify Sign On Operation with User Id Scan - without SkipValidationForCard property
    Given "Enter User" page is shown
    Then "Scanner" page is shown
    When user enters "${Pos Operator 6 Username}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    And "Enter User After Scan" page is shown
    And user enters "${Pos Operator 6 Password}" into "Password Input Text" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-9291 @POS @AUTOMATED @SignOn
  Scenario: Verify Sign On Operation with Card Scan
    Given "Enter User" page is shown
    Then "Scanner" page is shown
    When user enters "${Pos Operator 7 Card Number}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-5514 @POS @AUTOMATED
  Scenario: Verify that Exit from POS button is shown
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Exit" button
    #When Confirm Exit button is clicked POS is closed directly and there is no way of testing that
    And user waits "Confirm Exit" to display
    And user presses "Cancel" button
    And user presses "Back" button
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-18218 @POS @AUTOMATED
  Scenario: Verify Product Search on Sign Out and validate that previously logged user details are still displayed
    Given user signs on as "Sales Assistant"
    And "Michael Browne" is displayed in "Header Panel" panel
    When user presses "SignOff" button
    Then "Enter User" page is shown
    And user presses "Product Search" icon button
    And "Rich Product Search Result" page is shown
    And "Michael Browne" is not displayed in "Header Panel" panel
    And user presses "Back Button" icon button
    And "Enter User" page is shown 
    
  @PT-17655 @POS @AUTOMATED
  Scenario: Verify the authorization message when exiting from the POS
    Given "Enter User" page is shown
    When user presses "Exit Button" icon button
    Then "Confirm Exit" page is shown
    And user presses "Yes" button
    And "Enter Authorising User" page is shown
    And "Display Authorising User Message" field displays the text "You are not allowed to run this function. Please enter the name or scan the card of the authorising user."
    And user presses "Cancel" button
    And "Enter User" page is shown
    
  @PT-13665 @POS @AUTOMATED
  Scenario: Verify that location information is available on the header when 'Show Location in Header' flag is enabled
    Given user signs on as "Sales Assistant"
    Then "Transaction Basket" page is shown
    And "${Location Id} - ${Location}" is displayed in "Header Panel" panel
    When user presses "SignOff" button
    Then "Enter User" page is shown
