Feature: Training Mode On/Off

  @PT-915 @Harrods_Restaurant @JYSK @ReactPOS @Regression @Support @AUTOMATED 
  Scenario: Perform a sale when Training Mode is On
    Given user signs on as "Sales Assistant" 
    And user presses "Management" button and "Transaction Basket" page shown
    And user presses "Training Mode" button and "Enter Authorising User" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "Sign On" button and "Enter Authorising PIN" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown 
    And "** TRAINING MODE **" is displayed in "Receipt" list        
    And user enters "${Product 17}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown        
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button 
    And "Transaction Basket" page is shown   
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 |
      | text      | ** TRAINING MODE **                                   | 
      | text      | Sale                                                  |  
      | item      | ${Product 17 Description},${Product 17 Price}         |
      | item      | Cash UK,-£7.25                                        |        
    And user presses "SignOff" button
    And "Enter User" page is shown
    Given user signs on as "Sales Assistant" 
    And user presses "Management" button and "Transaction Basket" page shown
    And user presses "Training Mode" button and "Enter Authorising User" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "Sign On" button and "Enter Authorising PIN" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown      
    And user presses "SignOff" button
    And "Enter User" page is shown     
    
  @PT-916 @Harrods @JYSK @ReactPOS @Regression @Support @AUTOMATED 
  Scenario: Perform a sale when Training Mode is Off
    Given user signs on as "Sales Assistant" 
    And user presses "Management" button and "Transaction Basket" page shown
    And user presses "Training Mode" button and "Enter Authorising User" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "Sign On" button and "Enter Authorising PIN" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown   
    And "** TRAINING MODE **" is displayed in "Receipt" list         
    And user presses "Management" button and "Transaction Basket" page shown
    And user presses "Training Mode" button and "Enter Authorising User" page shown
    And user enters "${Manager 2 Username}" into "Input Box" field
    And user presses "Sign On" button and "Enter Authorising PIN" page shown
    And user enters "${Manager 2 Password}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown     
    And "** TRAINING MODE **" is not displayed in "Receipt" list             
    And user enters "${Product 17}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown    
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    Then receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode} |
      | telephone | Tel: ${Store Phone 1}                                 | 
      | text      | Sale                                                  |  
      | item      | ${Product 17 Description},${Product 17 Price}         |
      | item      | Cash UK,-£7.25                                        |        
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
  