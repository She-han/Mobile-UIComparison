Feature: Outlay

    @PT-12210 @TerminalCashManagement @POS @Outlay
  Scenario: Cash Management - outlay- Verify mandatory notes entry when "Force Notes Entry" is enabled
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Outlay Button" icon button
    And "Cash Management Select Outlay Reason" page is shown
    Then user selects "Test Outlay Reason 123" from "Selection List" list
    And user presses "OK" button
    And "Terminal Cash Management Select Tender" page is shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "25.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button
    And "Terminal Cash Management Select Tender" page is shown
    And user presses "Continue" button    
    Then "Cash Management confirm Tender" page is shown
    And user presses "Confirm" button
    And "Cash Management Enter Notes" page is shown
    And user presses "OK" button 
    And "Cash Management Empty Notes Error" page is shown
    And user presses "OK" button
    And "Cash Management Enter Notes" page is shown
    And user enters "Outlay Note" into "Cash Management Note Text" field
    And user presses "OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    And receipt display with following details
    	| item | Terminal Outlay |
      | item | Terminal,${Terminal Number} |
      | item | Cash UK,ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â£25.00             |
      | text | Outlay Note            |
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
    
    @PT-12213 @TerminalCashManagement @POS @Outlay
  Scenario: Cash Management - outlay - Verify non-mandatory notes entry when "Force Notes Entry" is disabled
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Outlay Button" icon button
    And "Cash Management Select Outlay Reason" page is shown
    Then user selects "Test Outlay Reason 456" from "Selection List" list
    And user presses "OK" button
    And "Terminal Cash Management Select Tender" page is shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "25.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button
    And "Terminal Cash Management Select Tender" page is shown
    And user presses "Complete" button    
    Then "Cash Management confirm Tender" page is shown
    And user presses "Confirm" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    And receipt display with following details
    	| item | Terminal Outlay |
      | item | Terminal,${Terminal Number} |
      | item | Cash UK,ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â£25.00             |
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

    @PT-17256 @TerminalCashManagement @POS @Outlay 	
  Scenario: Cash Management - Outlay - Verify the Notes button functionality (Manual Entry) when "Force Notes Entry" flag is disabled
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Outlay Button" icon button
    And "Cash Management Select Outlay Reason" page is shown
    Then user selects "Test Outlay Reason 456" from "Selection List" list
    And user presses "OK" button
    And "Terminal Cash Management Select Tender" page is shown
    And user presses "Notes" button
    And "Cash Management Enter Notes" page is shown
    And user presses "OK" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Notes" button
    And "Cash Management Enter Notes" page is shown
    And user enters "Outlay Note" into "Cash Management Note Text" field
    And user presses "OK" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "25.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button
    And "Terminal Cash Management Select Tender" page is shown
    And user presses "Complete" button    
    Then "Cash Management confirm Tender" page is shown
    And user presses "Confirm" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    And receipt display with following details
    	| item | Terminal Outlay |
      | item | Terminal,${Terminal Number} |
      | item | Cash UK,ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â£25.00             |
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
    @PT-12212 @TerminalCashManagement @POS @Outlay
  Scenario: Cash Management - Outlay - Verify the Notes button functionality (Manual Entry) when "Force Notes Entry" flag is enabled
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Cash Management Screen More Button" icon button
    And user presses "Terminal Cash Management Outlay Button" icon button
    And "Cash Management Select Outlay Reason" page is shown
    Then user selects "Test Outlay Reason 123" from "Selection List" list
    And user presses "OK" button
    And "Terminal Cash Management Select Tender" page is shown
    And user presses "Notes" button
    And "Cash Management Enter Notes" page is shown
    And user presses "OK" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Notes" button
    And "Cash Management Enter Notes" page is shown
    And user enters "Outlay Note" into "Cash Management Note Text" field
    And user presses "OK" button and "Terminal Cash Management Select Tender" page shown
    And user selects "Cash UK" from "Selection List" list
    And user presses "OK" button
    Then "Cash Management Edit Denomination By Value" page is shown
    And user selects "Pence" from "Selection List" list
    And user enters "25.00" into "Input Box" field
    And user presses "OK" button
    And user presses "Confirm" button
    And "Terminal Cash Management Select Tender" page is shown
    And user presses "Complete" button    
    Then "Cash Management confirm Tender" page is shown
    And user presses "Confirm" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    And receipt display with following details
    	| item | Terminal Outlay |
      | item | Terminal,${Terminal Number} |
      | item | Cash UK,ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â£25.00             |
      | text | Outlay Note            |
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And user presses "Cash Management Screen Back Button" icon button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-1562 @TerminalCashManagement @POS @Outlay
  Scenario: Balancing Outlays - Balance a POS outlay on the POS
    Given user signs on as "Manager 2"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button
    Then "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen More Button" icon button
    Then "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen More Button" icon button
    Then "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen More Button" icon button
    Then "Terminal Cash Management" page is shown
    And user presses "Cash Management Screen More Button" icon button
    Then "Terminal Cash Management" page is shown
    When user presses "Terminal Cash Management Outlay Button" icon button
    Then "Cash Management Select Outlay Reason" page is shown
    And user selects "${Outlay Reason 1}" from "Selection List" list
    Then user presses "OK" button and "Terminal Cash Management Select Tender" page shown
    And user presses "Notes" button and "Enter Notes" page shown
    And user enters "This is a sample outlay note" into "Outlay Note Text Area" field
    Then user presses "OK" button and "Terminal Cash Management Select Tender" page shown
    And user selects "${Tender Cash UK}" from "Selection List" list
    And user presses "OK" button and "Cash Management Edit Denomination By Value" page shown
    And user enters "${Outlay Price}" into "Input Box" field
    And user presses "ENT" button
    Then user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
		And user presses "Complete Button" icon button 
		And "Enter Reference User" page is shown
		And user enters "${Manager 4 Username}" into "Input Box" field		
    And user presses "ENT" button and "Await Drawer Closed" page shown  
    When user presses "Close" button on external "Cash Drawer" window
    And "Terminal Cash Management" page is shown
    When user presses "Terminal Cash Management Outlay Return Button" icon button 
		And "Cash Management Select Outlay Return" page is shown
    And user selects "${Outlay Price}" from "Selection List" list
    And user presses "Select" button and "Select Outlay Return Reason" page shown
    And user selects "${Outlay Return Reason 1}" from "Selection List" list
		Then user presses "OK" button and "Capture Reason Witness Authorising Username" page shown
    Then user presses "Skip" button and "Outlay Return Capture Expense" page shown			
    Then user presses "Add Expense" button and "Cash Management Select Expense Reason" page shown
    And user selects "${Expense Reason}" from "Selection List" list
    And user presses "OK" button 
		And user waits "1" seconds
		And "Terminal Cash Management Select Tender" page is shown
    And user selects "${Tender Cash UK}" from "Selection List" list		
    And user presses "OK" button and "Cash Management Edit Denomination By Value" page shown
    And user enters "${Outlay Price}" into "Input Box" field
    And user presses "ENT" button
    Then user presses "Confirm" button and "Terminal Cash Management Select Tender" page shown
    Then user presses "Complete" button and "Outlay Return Capture Expense" page shown
    Then user presses "Complete" button and "Outlay Balanced Prompt" page shown
    And user presses "OK" button and "Cash Management Add Notes" page shown
    And user enters "This is a balanced outlay" into "Outlay Note Text Area" field
    And user presses "OK" button and "Await Drawer Closed" page shown  
    When user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    When user presses "Terminal Cash Management Screen Back Button" icon button
    Then "Terminal Cash Management" page is shown
    When user presses "Terminal Cash Management Screen Back Button" icon button
    Then "Terminal Cash Management" page is shown
    When user presses "Terminal Cash Management Screen Back Button" icon button
    Then "Terminal Cash Management" page is shown
    When user presses "Terminal Cash Management Screen Back Button" icon button
    Then "Terminal Cash Management" page is shown
    When user presses "Terminal Cash Management Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown        
    