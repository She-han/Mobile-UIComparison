Feature: Log on to Locations
   
  @PT-1085 @JYSK @SignOn @POS @AUTOMATED @POSValidatedTest @POSSet2
  Scenario: Log On To Main Location
    Given "Enter User" page is shown
    When user signs on as "POS Operator 4" 
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
   
  @PT-1086 @JYSK @SignOn @AUTOMATED
  Scenario: Log On To First Associated Location
    Given "Enter User" page is shown
    When user signs on as "POS Operator 4" 
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-1095 @JYSK @SignOn @AUTOMATED
  Scenario: Log On To Third Associated Location
    Given "Enter User" page is shown
    When user signs on as "POS Operator 4" 
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    
  @PT-1087 @JYSK @SignOn @AUTOMATED
  Scenario: Log On To Unspecified Location
    Given "Enter User" page is shown
    When user enters "${POS Operator 4 Username}" into "User Name Text" field
    And user enters "${POS Operator 4 Password}" into "Password Text" field    
    And user presses "ENT" button
    Then "User Not valid for Location" page is shown
    And user presses "OK" button
    Then "Enter User" page is shown