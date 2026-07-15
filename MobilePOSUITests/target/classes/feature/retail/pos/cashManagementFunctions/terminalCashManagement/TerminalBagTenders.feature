Feature: Terminal Bag and Unbag tests

  @PT-147 @AutomationE2E @MVP @Support @AUTOMATED
  Scenario: Create terminal cash management tender bag
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Terminal Cash Management Screen Pickup Button" icon button
    Then "Terminal Cash Management Select Tender Option" page is shown
    And user presses "New Bag" button and "Enter New Bag ID" page shown    
    And user enters "8001" into "Input Box" field 
    And user presses "ENT" button and "Enter New Seal Number" page shown
    And user enters "8001" into "Input Box" field 
    And user presses "ENT" button and "Terminal Cash Management Select Tender" page shown
    And user enters "10.00" into "Input Box" field 
    When user presses "OK" button 
    Then "Terminal Cash Management Select Tender" page is shown  
    When user presses "Bag Tenders" button 
    Then "Terminal Cash Management Select Tender Option" page is shown
    And user presses "Complete" button and "Await Drawer Closed" page shown    
    When user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown       
    When user presses "Terminal Cash Management Screen More Button" icon button
    Then "Terminal Cash Management" page is shown       
    When user presses "Terminal Cash Management Screen Bag Button" icon button       
    Then "Enter Bag Id" page is shown
    And user enters "8001" into "Input Box" field 
    And user presses "ENT" button and "Enter Seal Number" page shown
    And user enters "8001" into "Input Box" field 
    And user presses "ENT" button and "Terminal Cash Management Select Tender" page shown
    And user enters "8.00" into "Input Box" field 
    And user presses "OK" button
    And user presses "Complete" button and "Await Drawer Closed" page shown  
    And receipt display with following details
      | text      | Terminal Pickup                            |
      | text      | Terminal 1989                              |
      | item      | Cards PDQ (Auto Picked Up),£0.00           |
      | item      | Cards UK (Auto Picked Up),£0.00            |
      | item      | Cash UK,£8.00                              |    
      | item      | Cheques UK,£0.00                           |
      | item      | Credit Note UK (Auto Picked Up,£0.00       |   
      | item      | Customer Account (Auto Picked,£0.00        |
      | item      | Employee Account (Auto Picked,£0.00        |
      | item      | Euro Cash UK,£0.00                         |
      | item      | Gift Card UK (Auto Picked Up),£0.00        |
      | item      | Loyalty Points UK (Auto Picked,£0.00       |
      | item      | PAYPAL (Auto Picked Up),£0.00              |
      | item      | Swedish Krona UK,£0.00                     |
      | item      | United States Dollar UK,£0.00              |      
    When user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    And user presses "Terminal Cash Management Screen Back Button" icon button
    And user presses "Terminal Cash Management Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    When user presses "Terminal Cash Management Screen More Button" icon button
    Then "Terminal Cash Management" page is shown       
    When user presses "Terminal Cash Management Screen Unbag Button" icon button      
    Then "Deselect Items" page is shown
    And user selects "8001" from "Selection List" list
    And user presses "Select" button 
    And user presses "Complete" button and "Await Drawer Closed" page shown    
    When user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    And user presses "Terminal Cash Management Screen Back Button" icon button
    And user presses "Terminal Cash Management Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
   
  @PT-148 @AutomationE2E @MVP @Support @AUTOMATED
  Scenario: Unbag terminal cash management tender bag
    Given user signs on as "Sales Assistant"
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    And user presses "Terminal Cash Management Screen Pickup Button" icon button
    Then "Terminal Cash Management Select Tender Option" page is shown
    And user presses "New Bag" button and "Enter New Bag ID" page shown    
    And user enters "8001" into "Input Box" field 
    And user presses "ENT" button and "Enter New Seal Number" page shown
    And user enters "8001" into "Input Box" field 
    And user presses "ENT" button and "Terminal Cash Management Select Tender" page shown
    And user enters "10.00" into "Input Box" field 
    When user presses "OK" button 
    Then "Terminal Cash Management Select Tender" page is shown  
    When user presses "Bag Tenders" button 
    Then "Terminal Cash Management Select Tender Option" page is shown
    And user presses "Complete" button and "Await Drawer Closed" page shown  
    And receipt display with following details
      | text      | Terminal Unbag                             |
      | text      | Terminal 1989                              |
    And following details are not displayed on the receipt
      | item      | Cards PDQ (Auto Picked Up),£0.00           |
      | item      | Cards UK (Auto Picked Up),£0.00            |
      | item      | Cash UK,£8.00                              |      
      | item      | Cheques UK,£0.00                           |
      | item      | Credit Note UK (Auto Picked Up,£0.00       |
      | item      | Customer Account (Auto Picked,£0.00        |
      | item      | Employee Account (Auto Picked,£0.00        |
      | item      | Euro Cash UK,£0.00                         |
      | item      | Gift Card UK (Auto Picked Up),£0.00        |
      | item      | Loyalty Points UK (Auto Picked,£0.00       |
      | item      | PAYPAL (Auto Picked Up),£0.00              |
      | item      | Swedish Krona UK,£0.00                     |
      | item      | United States Dollar UK,£0.00              |  
    When user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown       
    When user presses "Terminal Cash Management Screen More Button" icon button
    Then "Terminal Cash Management" page is shown       
    When user presses "Terminal Cash Management Screen Bag Button" icon button       
    Then "Enter Bag Id" page is shown
    And user enters "8001" into "Input Box" field 
    And user presses "ENT" button and "Enter Seal Number" page shown
    And user enters "8001" into "Input Box" field 
    And user presses "ENT" button and "Terminal Cash Management Select Tender" page shown
    And user enters "8.00" into "Input Box" field 
    And user presses "OK" button
    And user presses "Complete" button and "Await Drawer Closed" page shown    
    When user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    And user presses "Terminal Cash Management Screen Back Button" icon button
    And user presses "Terminal Cash Management Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    And user presses "Management" button
    And user presses "Terminal Cash Management" button and "Terminal Cash Management" page shown
    When user presses "Terminal Cash Management Screen More Button" icon button
    Then "Terminal Cash Management" page is shown       
    When user presses "Terminal Cash Management Screen Unbag Button" icon button      
    Then "Deselect Items" page is shown
    And user selects "8001" from "Selection List" list
    And user presses "Select" button 
    And user presses "Complete" button and "Await Drawer Closed" page shown    
    When user presses "Close" button on external "Cash Drawer" window
    Then "Terminal Cash Management" page is shown
    And user presses "Terminal Cash Management Screen Back Button" icon button
    And user presses "Terminal Cash Management Screen Back Button" icon button
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown
    