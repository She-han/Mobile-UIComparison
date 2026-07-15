Feature: Tender Related Witness Capture

  @PT-22770 @Automated @POS @Regression
  Scenario: Witness capture - Verify Already signed on user
    Given user signs on as "Sales Assistant"
    And user enters "${Witness Capture Product}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Debit Amount Over Limit" page shown
    And user presses "Authorise" button and "User Authorisation" page shown
    And user enters "${Sales Assistant Username}" into "Input Box" field
    And user presses "Sign On" button and "User Authorisation Enter Pin" page shown
    And user enters "${Sales Assistant Password}" into "Input Box" field
    And user presses "OK" button and "User Already Signed On" page shown
    And user presses "OK" button and "Enter Authorising User" page shown
    And user presses "Cancel" button and "Select Tender" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "Voids" button and "Transaction Basket" page shown
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
      
  @PT-22771 @Automated @POS @Regression
  Scenario: Witness Capture screen - Verify Disabled user
    Given user signs on as "Sales Assistant"
    And user enters "${Witness Capture Product}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Debit Amount Over Limit" page shown
    And user presses "Authorise" button and "User Authorisation" page shown
    And user enters "${Disabled Sales Assistant Username}" into "Input Box" field
    And user presses "Sign On" button and "User Already Disabled" page shown
    And user presses "OK" button and "Enter Authorising User" page shown
    And user presses "Cancel" button and "Select Tender" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "Voids" button and "Transaction Basket" page shown
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-22773 @Automated @POS @Regression
  Scenario: Witness Capture screen - Verify Cancel pressed in the Enter password prompt
    Given user signs on as "Sales Assistant"
    And user enters "${Witness Capture Product}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Debit Amount Over Limit" page shown
    And user presses "Authorise" button and "User Authorisation" page shown
    And user enters "${Sales Assistant Username}" into "Input Box" field
    And user presses "Sign On" button and "User Authorisation Enter Pin" page shown
    And user presses "Cancel" button and "Enter Authorising User" page shown
    And user presses "Cancel" button and "Select Tender" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "Voids" button and "Transaction Basket" page shown
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-22775 @Automated @POS @Regression
  Scenario: Witness Capture screen - Verify Too many attempts with incorrect username
    Given user signs on as "Sales Assistant"
    And user enters "${Witness Capture Product}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Debit Amount Over Limit" page shown
    And user presses "Authorise" button and "User Authorisation" page shown
    And user enters "${Incorrect Sales Assistant Username}" into "Input Box" field
    And user presses "Sign On" button and "Invalid User Recognized" page shown
    And user presses "OK" button and "Enter Authorising User" page shown
    And user enters "${Incorrect Sales Assistant Username}" into "Input Box" field
    And user presses "Sign On" button and "Invalid User Recognized" page shown
    And user presses "OK" button and "Enter Authorising User" page shown
    And user enters "${Incorrect Sales Assistant Username}" into "Input Box" field
    And user presses "Sign On" button and "Invalid User Recognized" page shown
    And user presses "OK" button and "User Too Many Attempts" page shown
    And user presses "OK" button and "Enter Authorising User" page shown    
    And user presses "Cancel" button and "Select Tender" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "Voids" button and "Transaction Basket" page shown
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-22778 @Automated @POS @Regression
  Scenario: Witness Capture screen - Verify Too many attempts with incorrect Password
    Given user signs on as "Sales Assistant"
    And user enters "${Witness Capture Product}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Debit Amount Over Limit" page shown
    And user presses "Authorise" button and "User Authorisation" page shown
    And user enters "${Sales Assistant Username}" into "Input Box" field
    And user presses "Sign On" button and "User Authorisation Enter Pin" page shown
    And user enters "${Sales Assistant Wrong Password}" into "Input Box" field
    And user presses "OK" button and "User Invalid Pin" page shown
    And user presses "OK" button and "User Authorisation Enter Pin" page shown
    And user enters "${Sales Assistant Wrong Password}" into "Input Box" field
    And user presses "OK" button and "User Invalid Pin" page shown
    And user presses "OK" button and "User Authorisation Enter Pin" page shown
    And user enters "${Sales Assistant Wrong Password}" into "Input Box" field
    And user presses "OK" button and "User Invalid Pin" page shown
    And user presses "OK" button and "User Too Many Attempts" page shown
    And user presses "OK" button and "Enter Authorising User" page shown    
    And user presses "Cancel" button and "Select Tender" page shown
    And user presses "Back" button and "Transaction Basket" page shown
    And user presses "Voids" button and "Transaction Basket" page shown
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-22779 @Automated @POS @Regression
  Scenario: Witness Capture screen - Verify Card only sign on
    Given user signs on as "Sales Assistant"
    And user enters "${Witness Capture Product}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Debit Amount Over Limit" page shown
    And user presses "Authorise" button and "User Authorisation" page shown
    And user enters "${Allow Sign On Card Only Username}" into "Input Box" field
    And user presses "Sign On" button and "User Card Sign Only" page shown
    And user presses "OK" button and "User Authorisation" page shown
    And "Scanner" page is shown
    And user enters "${Allow Sign On Card Only Username}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    And "User Authorisation Enter Pin" page is shown
    And user enters "${Allow Sign On Card Only Password}" into "Input Box" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown