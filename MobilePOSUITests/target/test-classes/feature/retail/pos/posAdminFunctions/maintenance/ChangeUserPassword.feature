Feature: Change User/ User's Password

  @PT-16683 @POS @AUTOMATED @Regression
  Scenario: Verify Changing Own Password from POS
    Given user signs on as "Manager 2"
    When user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Launch Screen Maintenance Button" icon button
    And user presses "Change User Password" icon button
    And "Enter New Password Screen" page is shown
    And user enters "${Manager 2 New Password}" into "Input Box" field
    And user presses "OK" button
    And "ReEnter a New Password" page is shown
    And user enters "${Manager 2 New Password}" into "Input Box" field
    And user presses "OK" button and "Password Successfully Changed Prompt" page shown            
    And user presses "OK" button
    And "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    #Verify Password Change    
    Given "Enter User" page is shown
    And user enters "${Manager 2 Username}" into "User Name Text" field
    And user enters "${Manager 2 New Password}" into "Password Text" field
    And user presses "ENT" button
    And "Transaction Basket" page is shown
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Launch Screen Maintenance Button" icon button
    #ReSetting the password to previous password    
    And user presses "Change User Password" icon button
    And "Enter New Password Screen" page is shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "OK" button 
    And "ReEnter a New Password" page is shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "OK" button and "Password Successfully Changed Prompt" page shown            
    And user presses "OK" button
    And "Administration Screen" page is shown    
    And user presses "Administration Screen Back Button" icon button
    And "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    
  @PT-16704 @POS @AUTOMATED @Regression
  Scenario: Verify Changing User Password from POS
    Given user signs on as "Manager 2"
    When user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Launch Screen Maintenance Button" icon button
    And user presses "Change A Users Password" icon button
    And "Select A User Prompt" page is shown
    And user enters "${Sales Assistant Username}" into "Input Box" field
    And user presses "ENT" button and "Enter New User Password Prompt" page shown
    And user enters "${Sales Assistant New Password}" into "Input Box" field        
    And user presses "OK" button 
    And "ReEnter New User Password Prompt" page is shown
    And user enters "${Sales Assistant New Password}" into "Input Box" field
    And user presses "OK" button and "Password Successfully Changed Prompt" page shown            
    And user presses "OK" button
    And "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    #Verify Password Change    
    Given "Enter User" page is shown
    When user enters "${Sales Assistant Username}" into "User Name Text" field
    And user enters "${Sales Assistant New Password}" into "Password Text" field
    And user presses "ENT" button
    Then "Transaction Basket" page is shown
    #ReSetting the password to previous password        
    And user presses "Management" button        
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "Launch Screen Maintenance Button" icon button
    And user presses "Change User Password" icon button
    And "Enter New Password Screen" page is shown
    And user enters "${Sales Assistant Password}" into "Input Box" field
    And user presses "OK" button and "ReEnter a New Password" page shown
    And user enters "${Sales Assistant Password}" into "Input Box" field
    And user presses "OK" button and "Password Successfully Changed Prompt" page shown            
    And user presses "OK" button
    And "Administration Screen" page is shown    
    And user presses "Administration Screen Back Button" icon button
    And "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button