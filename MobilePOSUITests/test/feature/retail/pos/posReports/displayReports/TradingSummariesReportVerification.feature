Feature: Trading Summaries Report Verification

  @PT-2858 @ManualVerification @Regression @Reports @AUTOMATED
  Scenario: POS Reports | Display Trading Summaries Report for a Selected Date Range
    Given user signs on as "Sales Assistant"
    #####-----------------#--Normal sale with Merchadise product--#--------------#############
    When user enters "${Merchandise Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And "${Merchandise Product 1 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #####-----------------#--Normal sale with Non Merchadise product--#--------------#########
    When user enters "${Product 3}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And "${Product 3 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #########-----------------#--Normal sale with Promotion--#-----------------------#########
    When user enters "${Product 6}" into "Input Box" field
    Then user presses "ENT" button
    And "${Product 6 Description}" is displayed in "Receipt" list
    And "${Product 6 Promotion}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "${Product 6 Description}" is displayed in "Receipt" list
    And "${Product 6 Price}" is displayed in "Receipt" list
    And "${Product 6 Promotion}" is displayed in "Receipt" list
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #########-----------------#--Item Discount--#------------------------------------#########
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Manager Item Discount (%)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    And user enters "50%" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Manager Item Discount (%) 50% -£9.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #########-----------------#--Transaction Discount--#------------------------------#########
    When user enters "${Product 2}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Transaction Discount (Amount)" from "Selection List" list
    Then user presses "OK" button and "Enter Transaction Discount Amount" page shown
    When user enters "2.00" into "Input Box" field
    Then user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Transaction Discount (Amount)) -£2.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #########-----------------#--Price Override--#------------------------------------#########
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Price Override" button and "Select Basket Item" page shown
    When user selects "${Product 1 Description}" from "Selection List" list
    Then user presses "OK" button and "Select Reason" page shown
    And user selects "Fixed Price" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Fixed Price ( £18.00 to £10.00 )" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #########-----------------#--Keyed Items--#-----------------------------------------#########
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    #########-----------------#--Items Void--#-----------------------------------------##########
    When user enters "${Product 2}" into "Input Box" field
    Then user presses "ENT" button
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button
    When user selects "${Product 2 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Item Void" button and "Select Reason" page shown
    Then user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    #########-----------------#--Transaction Void--#-----------------------------------###########
    And user enters "${Product 2}" into "Input Box" field
    When user presses "ENT" button
    Then user enters "${Product 1}" into "Input Box" field
    When user presses "ENT" button
    Then user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    #########-----------------#--No Sales--#-------------------------------------------############
    And user presses "Management" button
    And user presses "No Sale" button
    And "Select Reason" page is shown
    And user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #########-----------------#--Item Return--#-------------------------------------------#########
    And user presses "Returns" button
    When user presses "Quantity Return" button and "Enter Return Quantity" page shown
    Then user enters "5" into "Input Box" field
    And user presses "OK" button and "Enter Return Item" page shown
    And user enters "${Product 2}" into "Input Box" field
    When user presses "Return Item" button and "Select Reason" page shown
    Then user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Sell Unknown Product" page shown
    And "Refund" is displayed in "Receipt" list
    And "Return" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "-5 @ ${Product 2 Price}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Refund Item" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #########-----------------#--Sale in Training mode--#---------------------------------#########
    And user presses "Management" button
    When user presses "Training Mode" button
    Then "Enter Authorising User" page is shown
    And user enters "${Manager 2}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Manager 2}" into "Input Box" field
    When user presses "ENT" button
    Then "Transaction Basket" page is shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "Management" button
    And user presses "Training Mode" button
    And "Enter Authorising User" page is shown
    And user enters "${Manager 2}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Manager 2}" into "Input Box" field
    And user presses "ENT" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2857 @ManualVerification @Regression @Reports @AUTOMATED
  Scenario: POS Reports | Display Trading Summaries Report for Today
    Given user signs on as "Sales Assistant"
    #####-----------------#--Normal sale with Merchadise product--#--------------#############
    When user enters "${Merchandise Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And "${Merchandise Product 1 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #####-----------------#--Normal sale with Non Merchadise product--#--------------#########
    When user enters "${Product 3}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And "${Product 3 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #########-----------------#--Normal sale with Promotion--#-----------------------#########
    When user enters "${Product 6}" into "Input Box" field
    Then user presses "ENT" button
    And "${Product 6 Description}" is displayed in "Receipt" list
    And "${Product 6 Promotion}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "${Product 6 Description}" is displayed in "Receipt" list
    And "${Product 6 Price}" is displayed in "Receipt" list
    And "${Product 6 Promotion}" is displayed in "Receipt" list
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #########-----------------#--Item Discount--#------------------------------------#########
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Manager Item Discount (%)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    And user enters "50%" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Manager Item Discount (%) 50% -£9.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #########-----------------#--Transaction Discount--#------------------------------#########
    When user enters "${Product 2}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Transaction Discount (Amount)" from "Selection List" list
    Then user presses "OK" button and "Enter Transaction Discount Amount" page shown
    When user enters "2.00" into "Input Box" field
    Then user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Transaction Discount (Amount)) -£2.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #########-----------------#--Price Override--#------------------------------------#########
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Price Override" button and "Select Basket Item" page shown
    When user selects "${Product 1 Description}" from "Selection List" list
    Then user presses "OK" button and "Select Reason" page shown
    And user selects "Fixed Price" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Fixed Price ( £18.00 to £10.00 )" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #########-----------------#--Keyed Items--#-----------------------------------------#########
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    #########-----------------#--Items Void--#-----------------------------------------##########
    When user enters "${Product 2}" into "Input Box" field
    Then user presses "ENT" button
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button
    When user selects "${Product 2 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Item Void" button and "Select Reason" page shown
    Then user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    #########-----------------#--Transaction Void--#-----------------------------------###########
    And user enters "${Product 2}" into "Input Box" field
    When user presses "ENT" button
    Then user enters "${Product 1}" into "Input Box" field
    When user presses "ENT" button
    Then user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    #########-----------------#--No Sales--#-------------------------------------------############
    And user presses "Management" button
    And user presses "No Sale" button
    And "Select Reason" page is shown
    And user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #########-----------------#--Item Return--#-------------------------------------------#########
    And user presses "Returns" button
    When user presses "Quantity Return" button and "Enter Return Quantity" page shown
    Then user enters "5" into "Input Box" field
    And user presses "OK" button and "Enter Return Item" page shown
    And user enters "${Product 2}" into "Input Box" field
    When user presses "Return Item" button and "Select Reason" page shown
    Then user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Sell Unknown Product" page shown
    And "Refund" is displayed in "Receipt" list
    And "Return" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "-5 @ ${Product 2 Price}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Refund Item" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #########-----------------#--Sale in Training mode--#---------------------------------#########
    And user presses "Management" button
    When user presses "Training Mode" button
    Then "Enter Authorising User" page is shown
    And user enters "${Manager 2}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Manager 2}" into "Input Box" field
    When user presses "ENT" button
    Then "Transaction Basket" page is shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "Management" button
    And user presses "Training Mode" button
    And "Enter Authorising User" page is shown
    And user enters "${Manager 2}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Manager 2}" into "Input Box" field
    And user presses "ENT" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2856 @ManualVerification @Regression @Reports @AUTOMATED
  Scenario: POS Reports | Display Trading Summaries Report for This Week
    Given user signs on as "Sales Assistant"
    #####-----------------#--Normal sale with Merchadise product--#--------------#############
    When user enters "${Merchandise Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And "${Merchandise Product 1 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #####-----------------#--Normal sale with Non Merchadise product--#--------------#########
    When user enters "${Product 3}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And "${Product 3 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #########-----------------#--Normal sale with Promotion--#-----------------------#########
    When user enters "${Product 6}" into "Input Box" field
    Then user presses "ENT" button
    And "${Product 6 Description}" is displayed in "Receipt" list
    And "${Product 6 Promotion}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "${Product 6 Description}" is displayed in "Receipt" list
    And "${Product 6 Price}" is displayed in "Receipt" list
    And "${Product 6 Promotion}" is displayed in "Receipt" list
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #########-----------------#--Item Discount--#------------------------------------#########
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Manager Item Discount (%)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    And user enters "50%" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Manager Item Discount (%) 50% -£9.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #########-----------------#--Transaction Discount--#------------------------------#########
    When user enters "${Product 2}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Transaction Discount (Amount)" from "Selection List" list
    Then user presses "OK" button and "Enter Transaction Discount Amount" page shown
    When user enters "2.00" into "Input Box" field
    Then user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Transaction Discount (Amount)) -£2.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #########-----------------#--Price Override--#------------------------------------#########
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Price Override" button and "Select Basket Item" page shown
    When user selects "${Product 1 Description}" from "Selection List" list
    Then user presses "OK" button and "Select Reason" page shown
    And user selects "Fixed Price" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Fixed Price ( £18.00 to £10.00 )" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #########-----------------#--Keyed Items--#-----------------------------------------#########
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    #########-----------------#--Items Void--#-----------------------------------------##########
    When user enters "${Product 2}" into "Input Box" field
    Then user presses "ENT" button
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button
    When user selects "${Product 2 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Item Void" button and "Select Reason" page shown
    Then user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    #########-----------------#--Transaction Void--#-----------------------------------###########
    And user enters "${Product 2}" into "Input Box" field
    When user presses "ENT" button
    Then user enters "${Product 1}" into "Input Box" field
    When user presses "ENT" button
    Then user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    #########-----------------#--No Sales--#-------------------------------------------############
    And user presses "Management" button
    And user presses "No Sale" button
    And "Select Reason" page is shown
    And user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #########-----------------#--Item Return--#-------------------------------------------#########
    And user presses "Returns" button
    When user presses "Quantity Return" button and "Enter Return Quantity" page shown
    Then user enters "5" into "Input Box" field
    And user presses "OK" button and "Enter Return Item" page shown
    And user enters "${Product 2}" into "Input Box" field
    When user presses "Return Item" button and "Select Reason" page shown
    Then user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Sell Unknown Product" page shown
    And "Refund" is displayed in "Receipt" list
    And "Return" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "-5 @ ${Product 2 Price}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Refund Item" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #########-----------------#--Sale in Training mode--#---------------------------------#########
    And user presses "Management" button
    When user presses "Training Mode" button
    Then "Enter Authorising User" page is shown
    And user enters "${Manager 2}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Manager 2}" into "Input Box" field
    When user presses "ENT" button
    Then "Transaction Basket" page is shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "Management" button
    And user presses "Training Mode" button
    And "Enter Authorising User" page is shown
    And user enters "${Manager 2}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Manager 2}" into "Input Box" field
    And user presses "ENT" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2855 @ManualVerification @Regression @Reports @AUTOMATED
  Scenario: POS Reports | Display Trading Summaries Report for a Selected Month
    Given user signs on as "Sales Assistant"
    #####-----------------#--Normal sale with Merchadise product--#--------------#############
    When user enters "${Merchandise Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And "${Merchandise Product 1 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #####-----------------#--Normal sale with Non Merchadise product--#--------------#########
    When user enters "${Product 3}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And "${Product 3 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #########-----------------#--Normal sale with Promotion--#-----------------------#########
    When user enters "${Product 6}" into "Input Box" field
    Then user presses "ENT" button
    And "${Product 6 Description}" is displayed in "Receipt" list
    And "${Product 6 Promotion}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "${Product 6 Description}" is displayed in "Receipt" list
    And "${Product 6 Price}" is displayed in "Receipt" list
    And "${Product 6 Promotion}" is displayed in "Receipt" list
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #########-----------------#--Item Discount--#------------------------------------#########
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Manager Item Discount (%)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    And user enters "50%" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Manager Item Discount (%) 50% -£9.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #########-----------------#--Transaction Discount--#------------------------------#########
    When user enters "${Product 2}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Transaction Discount (Amount)" from "Selection List" list
    Then user presses "OK" button and "Enter Transaction Discount Amount" page shown
    When user enters "2.00" into "Input Box" field
    Then user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Transaction Discount (Amount)) -£2.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #########-----------------#--Price Override--#------------------------------------#########
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Price Override" button and "Select Basket Item" page shown
    When user selects "${Product 1 Description}" from "Selection List" list
    Then user presses "OK" button and "Select Reason" page shown
    And user selects "Fixed Price" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Fixed Price ( £18.00 to £10.00 )" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #########-----------------#--Keyed Items--#-----------------------------------------#########
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    #########-----------------#--Items Void--#-----------------------------------------##########
    When user enters "${Product 2}" into "Input Box" field
    Then user presses "ENT" button
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button
    When user selects "${Product 2 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Item Void" button and "Select Reason" page shown
    Then user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    #########-----------------#--Transaction Void--#-----------------------------------###########
    And user enters "${Product 2}" into "Input Box" field
    When user presses "ENT" button
    Then user enters "${Product 1}" into "Input Box" field
    When user presses "ENT" button
    Then user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    #########-----------------#--No Sales--#-------------------------------------------############
    And user presses "Management" button
    And user presses "No Sale" button
    And "Select Reason" page is shown
    And user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #########-----------------#--Item Return--#-------------------------------------------#########
    And user presses "Returns" button
    When user presses "Quantity Return" button and "Enter Return Quantity" page shown
    Then user enters "5" into "Input Box" field
    And user presses "OK" button and "Enter Return Item" page shown
    And user enters "${Product 2}" into "Input Box" field
    When user presses "Return Item" button and "Select Reason" page shown
    Then user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Sell Unknown Product" page shown
    And "Refund" is displayed in "Receipt" list
    And "Return" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "-5 @ ${Product 2 Price}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Refund Item" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #########-----------------#--Sale in Training mode--#---------------------------------#########
    And user presses "Management" button
    When user presses "Training Mode" button
    Then "Enter Authorising User" page is shown
    And user enters "${Manager 2}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Manager 2}" into "Input Box" field
    When user presses "ENT" button
    Then "Transaction Basket" page is shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "Management" button
    And user presses "Training Mode" button
    And "Enter Authorising User" page is shown
    And user enters "${Manager 2}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Manager 2}" into "Input Box" field
    And user presses "ENT" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2854 @ManualVerification @Regression @Reports @AUTOMATED
  Scenario: POS Reports | Display Trading Summaries Report for a Selected Period - Current Fiscal Period
    Given user signs on as "Sales Assistant"
    #####-----------------#--Normal sale with Merchadise product--#--------------#############
    When user enters "${Merchandise Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And "${Merchandise Product 1 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #####-----------------#--Normal sale with Non Merchadise product--#--------------#########
    When user enters "${Product 3}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And "${Product 3 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #########-----------------#--Normal sale with Promotion--#-----------------------#########
    When user enters "${Product 6}" into "Input Box" field
    Then user presses "ENT" button
    And "${Product 6 Description}" is displayed in "Receipt" list
    And "${Product 6 Promotion}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "${Product 6 Description}" is displayed in "Receipt" list
    And "${Product 6 Price}" is displayed in "Receipt" list
    And "${Product 6 Promotion}" is displayed in "Receipt" list
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #########-----------------#--Item Discount--#------------------------------------#########
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Manager Item Discount (%)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    And user enters "50%" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Manager Item Discount (%) 50% -£9.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #########-----------------#--Transaction Discount--#------------------------------#########
    When user enters "${Product 2}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Transaction Discount (Amount)" from "Selection List" list
    Then user presses "OK" button and "Enter Transaction Discount Amount" page shown
    When user enters "2.00" into "Input Box" field
    Then user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Transaction Discount (Amount)) -£2.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #########-----------------#--Price Override--#------------------------------------#########
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Price Override" button and "Select Basket Item" page shown
    When user selects "${Product 1 Description}" from "Selection List" list
    Then user presses "OK" button and "Select Reason" page shown
    And user selects "Fixed Price" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Fixed Price ( £18.00 to £10.00 )" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #########-----------------#--Keyed Items--#-----------------------------------------#########
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    #########-----------------#--Items Void--#-----------------------------------------##########
    When user enters "${Product 2}" into "Input Box" field
    Then user presses "ENT" button
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button
    When user selects "${Product 2 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Item Void" button and "Select Reason" page shown
    Then user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    #########-----------------#--Transaction Void--#-----------------------------------###########
    And user enters "${Product 2}" into "Input Box" field
    When user presses "ENT" button
    Then user enters "${Product 1}" into "Input Box" field
    When user presses "ENT" button
    Then user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    #########-----------------#--No Sales--#-------------------------------------------############
    And user presses "Management" button
    And user presses "No Sale" button
    And "Select Reason" page is shown
    And user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #########-----------------#--Item Return--#-------------------------------------------#########
    And user presses "Returns" button
    When user presses "Quantity Return" button and "Enter Return Quantity" page shown
    Then user enters "5" into "Input Box" field
    And user presses "OK" button and "Enter Return Item" page shown
    And user enters "${Product 2}" into "Input Box" field
    When user presses "Return Item" button and "Select Reason" page shown
    Then user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Sell Unknown Product" page shown
    And "Refund" is displayed in "Receipt" list
    And "Return" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "-5 @ ${Product 2 Price}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Refund Item" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #########-----------------#--Sale in Training mode--#---------------------------------#########
    And user presses "Management" button
    When user presses "Training Mode" button
    Then "Enter Authorising User" page is shown
    And user enters "${Manager 2}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Manager 2}" into "Input Box" field
    When user presses "ENT" button
    Then "Transaction Basket" page is shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "Management" button
    And user presses "Training Mode" button
    And "Enter Authorising User" page is shown
    And user enters "${Manager 2}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Manager 2}" into "Input Box" field
    And user presses "ENT" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown

  @PT-2853 @ManualVerification @Regression @Reports @AUTOMATED
  Scenario: POS Reports | Display Trading Summaries Report for a Selected Single Date
    Given user signs on as "Sales Assistant"
    #####-----------------#--Normal sale with Merchadise product--#--------------#############
    When user enters "${Merchandise Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And "${Merchandise Product 1 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #####-----------------#--Normal sale with Non Merchadise product--#--------------#########
    When user enters "${Product 3}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And "${Product 3 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #########-----------------#--Normal sale with Promotion--#-----------------------#########
    When user enters "${Product 6}" into "Input Box" field
    Then user presses "ENT" button
    And "${Product 6 Description}" is displayed in "Receipt" list
    And "${Product 6 Promotion}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And "${Product 6 Description}" is displayed in "Receipt" list
    And "${Product 6 Price}" is displayed in "Receipt" list
    And "${Product 6 Promotion}" is displayed in "Receipt" list
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #########-----------------#--Item Discount--#------------------------------------#########
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Item Discount" button and "Select Basket Item" page shown
    And user presses "OK" button and "Select Reason" page shown
    And user selects "Manager Item Discount (%)" from "Selection List" list
    And user presses "OK" button and "Enter Item Discount Percentage" page shown
    And user enters "50%" into "Input Box" field
    And user presses "OK" button and "Transaction Basket" page shown
    And "Manager Item Discount (%) 50% -£9.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #########-----------------#--Transaction Discount--#------------------------------#########
    When user enters "${Product 2}" into "Input Box" field
    Then user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Transaction Discount" button and "Select Reason" page shown
    When user selects "Transaction Discount (Amount)" from "Selection List" list
    Then user presses "OK" button and "Enter Transaction Discount Amount" page shown
    When user enters "2.00" into "Input Box" field
    Then user presses "OK" button and "Transaction Basket" page shown
    And "Transaction Discount (Transaction Discount (Amount)) -£2.00" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #########-----------------#--Price Override--#------------------------------------#########
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button and "Transaction Basket" page shown
    And user presses "Discount / Overrides" button
    And user presses "Price Override" button and "Select Basket Item" page shown
    When user selects "${Product 1 Description}" from "Selection List" list
    Then user presses "OK" button and "Select Reason" page shown
    And user selects "Fixed Price" from "Selection List" list
    And user presses "OK" button and "Transaction Basket" page shown
    And "Fixed Price ( £18.00 to £10.00 )" is displayed in "Receipt" list
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #########-----------------#--Keyed Items--#-----------------------------------------#########
    And user enters "${Product 3}" into "Input Box" field
    And user presses "ENT" button
    #########-----------------#--Items Void--#-----------------------------------------##########
    When user enters "${Product 2}" into "Input Box" field
    Then user presses "ENT" button
    When user enters "${Product 1}" into "Input Box" field
    Then user presses "ENT" button
    When user selects "${Product 2 Description}" from "Receipt" list
    Then "Modify Item" page is shown
    When user presses "Item Void" button and "Select Reason" page shown
    Then user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    #########-----------------#--Transaction Void--#-----------------------------------###########
    And user enters "${Product 2}" into "Input Box" field
    When user presses "ENT" button
    Then user enters "${Product 1}" into "Input Box" field
    When user presses "ENT" button
    Then user presses "Voids" button
    And user presses "Void Transaction" button and "Select Reason" page shown
    And user selects "Operator Error" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    #########-----------------#--No Sales--#-------------------------------------------############
    And user presses "Management" button
    And user presses "No Sale" button
    And "Select Reason" page is shown
    And user selects "Incorrect change given" from "Selection List" list
    And user presses "OK" button and "Await Drawer Closed" page shown
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    #########-----------------#--Item Return--#-------------------------------------------#########
    And user presses "Returns" button
    When user presses "Quantity Return" button and "Enter Return Quantity" page shown
    Then user enters "5" into "Input Box" field
    And user presses "OK" button and "Enter Return Item" page shown
    And user enters "${Product 2}" into "Input Box" field
    When user presses "Return Item" button and "Select Reason" page shown
    Then user selects "Damaged / Faulty" from "Selection List" list
    And user presses "OK" button and "Sell Unknown Product" page shown
    And "Refund" is displayed in "Receipt" list
    And "Return" is displayed in "Receipt" list
    And "${Product 2 Description}" is displayed in "Receipt" list
    And "-5 @ ${Product 2 Price}" is displayed in "Receipt" list
    And "Ret Reason: Damaged / Faulty" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Refund Item" page shown
    Then user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Signature Verification" page shown
    And user presses "Signature OK" button and "Await Drawer Closed" page shown
    And user presses "Close" button on external "Cash Drawer" window
    And "Transaction Basket" page is shown
    #########-----------------#--Sale in Training mode--#---------------------------------#########
    And user presses "Management" button
    When user presses "Training Mode" button
    Then "Enter Authorising User" page is shown
    And user enters "${Manager 2}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Manager 2}" into "Input Box" field
    When user presses "ENT" button
    Then "Transaction Basket" page is shown
    And user enters "${Product 1}" into "Input Box" field
    And user presses "ENT" button
    And user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Transaction Basket" page shown
    And user presses "Management" button
    And user presses "Training Mode" button
    And "Enter Authorising User" page is shown
    And user enters "${Manager 2}" into "Input Box" field
    And user presses "ENT" button and "Enter Authorising Pin" page shown
    And user enters "${Manager 2}" into "Input Box" field
    And user presses "ENT" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
