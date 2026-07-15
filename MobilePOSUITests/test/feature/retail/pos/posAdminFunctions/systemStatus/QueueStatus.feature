Feature: Queue Status
  Check the ability to view the queue status and details

  @PT-16711 @AUTOMATED
  Scenario:  Run Queue status
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "System Status Button" icon button
    And user presses "Queue Status Button" icon button and "Queue Information Screen" page shown
    When user presses "Back" button 
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button

  @PT-16712 @AUTOMATED
  Scenario:  View Active Queues
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "System Status Button" icon button
    And user presses "Queue Status Button" icon button and "Queue Information Screen" page shown
    And "Queue Information" field displays the text "All active queues are listed below"
    And user presses "Local Queue" button
    And user presses "All Active" button
    And "Queue Information" field displays the text "All active queues are listed below"    
    When user presses "Back" button 
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
		
  @PT-16713 @AUTOMATED
  Scenario:  View Local Queues
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Admin" button and "Administration Screen" page shown
    And user presses "System Status Button" icon button
    And user presses "Queue Status Button" icon button and "Queue Information Screen" page shown
    And user presses "Local Queue" button
    And "Queue Information" field displays the text "All local queues are listed below"    
    When user presses "Back" button 
    Then "Administration Screen" page is shown
    When user presses "Administration Screen Back Button" icon button
    Then "Administration Screen" page is shown
    And user presses "Administration Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button