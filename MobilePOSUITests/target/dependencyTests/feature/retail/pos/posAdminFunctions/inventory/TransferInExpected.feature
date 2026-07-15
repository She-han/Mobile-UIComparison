Feature: Transfer In Expected 

 @PT-9307 @POS @POSSet1 @MVP @AUTOMATED @Sprint41-Week5
 Scenario: Verify Edit Items button displayed when privilege is granted-expected path
  Given user signs on as "Sales Assistant"
  And user presses "Management" button
  And user presses "Admin" button and "Administration Screen" page shown
  And user presses "Inventory" icon button
  And user presses "Receive" icon button
  And user presses "Transfer In" icon button
  And "Unsubmited Transfer In" page is shown
  And user presses "Expected" button and "Select Expected Transfer In" page shown
  And user selects "ID900001" from "Expected Transfer In Requests List" list
  And user presses "Select" button and "Transfer In Summary" page shown
  And user waits "Edit Items" to display
  And user presses "Back" button and "Select Expected Transfer In" page shown
  And user presses "Back" button and "Unsubmited Transfer In" page shown
  And user presses "Cancel" button and "Administration Screen" page shown 
  When user presses "Administration Screen Back Button" icon button
  Then "Administration Screen" page is shown
  When user presses "Administration Screen Back Button" icon button
  Then "Administration Screen" page is shown
  When user presses "Administration Screen Back Button" icon button
  And "Transaction Basket" page is shown
  And user presses "SignOff" button
  And "Enter User" page is shown
 
 @PT-9306 @POS @POSSet1 @MVP @AUTOMATED @Sprint41-Week5
 Scenario: Verify Edit Items button is not displayed when privilege is not granted-expected path
  Given user signs on as "Sales Assistant 6"
  And user presses "Management" button
  And user presses "Admin" button and "Administration Screen" page shown
  And user presses "Inventory" icon button
  And user presses "Receive" icon button
  And user presses "Transfer In" icon button
  And "Unsubmited Transfer In" page is shown
  And user presses "Expected" button and "Select Expected Transfer In" page shown
  And user selects "ID900002" from "Expected Transfer In Requests List" list
  And user presses "Select" button and "Transfer In Summary" page shown
  And user confirms "Edit Items" not display
  And user presses "Back" button and "Select Expected Transfer In" page shown
  And user presses "Back" button and "Unsubmited Transfer In" page shown
  And user presses "Cancel" button and "Administration Screen" page shown 
  When user presses "Administration Screen Back Button" icon button
  Then "Administration Screen" page is shown
  When user presses "Administration Screen Back Button" icon button
  Then "Administration Screen" page is shown
  When user presses "Administration Screen Back Button" icon button
  And "Transaction Basket" page is shown
  And user presses "SignOff" button
  And "Enter User" page is shown
  
 @PT-9308 @POS @POSSet1 @MVP @AUTOMATED @Sprint41-Week5
 Scenario: Verify Edit Items button displayed when privilege is granted-unsubmitted path
  Given user signs on as "Sales Assistant"
  And user presses "Management" button
  And user presses "Admin" button and "Administration Screen" page shown
  And user presses "Inventory" icon button
  And user presses "Receive" icon button
  And user presses "Transfer In" icon button
  And "Unsubmited Transfer In" page is shown
  And user presses "Expected" button and "Select Expected Transfer In" page shown
  And user presses "Ad Hoc" button
  And user presses "Location Ad Hoc" button and "Delivery Header Summary" page shown
  And user presses "Back" button and "Expected Transfer In Select Delivery" page shown
  And user presses "Back" button and "Select Expected Transfer In" page shown
  And user presses "Back" button and "Select Receipt Prompt" page shown
  And user presses "Select" button and "Transfer In Summary" page shown
  And user waits "Edit Items" to display
  And user presses "Back" button and "Unsubmited Transfer In" page shown
  And user presses "Cancel" button and "Administration Screen" page shown 
  When user presses "Administration Screen Back Button" icon button
  Then "Administration Screen" page is shown
  When user presses "Administration Screen Back Button" icon button
  Then "Administration Screen" page is shown
  When user presses "Administration Screen Back Button" icon button
  Then "Transaction Basket" page is shown
  And user presses "SignOff" button
  And "Enter User" page is shown  
 
 @PT-9309 @POS @POSSet1 @MVP @AUTOMATED @Sprint41-Week5
 Scenario: Verify Edit Items button is not displayed when privilege is not granted-unsubmitted path
  Given user signs on as "Sales Assistant 6"
  And user presses "Management" button
  And user presses "Admin" button and "Administration Screen" page shown
  And user presses "Inventory" icon button
  And user presses "Receive" icon button
  And user presses "Transfer In" icon button
  And "Unsubmited Transfer In" page is shown
  And user presses "Expected" button and "Select Expected Transfer In" page shown
  And user presses "Ad Hoc" button
  And user presses "Location Ad Hoc" button and "Delivery Header Summary" page shown
  And user presses "Back" button and "Expected Transfer In Select Delivery" page shown
  And user presses "Back" button and "Select Expected Transfer In" page shown
  And user presses "Back" button and "Select Receipt Prompt" page shown
  And user presses "Select" button and "Transfer In Summary" page shown 
  And user confirms "Edit Items" not display
  And user presses "Back" button and "Unsubmited Transfer In" page shown
  And user presses "Cancel" button and "Administration Screen" page shown 
  When user presses "Administration Screen Back Button" icon button
  Then "Administration Screen" page is shown
  When user presses "Administration Screen Back Button" icon button
  Then "Administration Screen" page is shown
  When user presses "Administration Screen Back Button" icon button
  Then "Transaction Basket" page is shown
  And user presses "SignOff" button
  And "Enter User" page is shown
    