Feature: Verify Report feature - Serbia

  @PT-1485 @No_Printer @AUTOMATED @Fiscalisation @FiscalSerbia
  Scenario: Verify X report on Serbia fiscal POS
    Given user signs on as "Serbia Fiscal Sales Assistant"
    When user presses "Sales" button and "empty basket" page shown
    And user presses "More" button
    And user presses "Fiscal Reports" button
    And user presses "Fiscal X Report" button and "Fiscal Serbia Print Report" page shown
    Then "Fiscal Serbia Report Success Prompt" page is shown
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
    
  @PT-1486 @No_Printer @Fiscalisation @FiscalSerbia @AUTOMATED
  Scenario: Verify Z report on Serbia fiscal POS
    Given user signs on as "Serbia Fiscal Sales Assistant"
    When user presses "Sales" button and "empty basket" page shown
    And user presses "More" button
    And user presses "Fiscal Reports" button
    And user presses "Fiscal Z Report" button and "Fiscal Serbia Print Report" page shown
    Then "Fiscal Serbia Report Success Prompt" page is shown
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown
   
  @PT-1487 @No_Printer @AUTOMATED @Serbia @Fiscalisation @FiscalSerbia
  Scenario: Verify Periodic Report By Date report on Serbia fiscal POS  
		Given user signs on as "Serbia Fiscal Sales Assistant"
    When user presses "Sales" button and "Empty Basket" page shown
    And user presses "More" button 
    And user presses "Fiscal Reports" button
    And user presses "Periodic Report" button and "Serbia Fiscal Report Enter Date Time" page shown
    And user selects "${Serbia Report Start Date}" from "Start Date Day field" combobox
    And user selects "${Serbia Report Start Month}" from "Start Date Month Field" combobox
    And user enters "${Serbia Report Start Year}" into "Start Date Year Field" field
    And user enters "${Serbia Report Start Time Hour}" into "Start Date Hour Field" field
    And user enters "${Serbia Report Start Time Minute}" into "Start Date Minute Field" field
    And user selects "${Serbia Report End Date}" from "End Date Day Field" combobox
    And user selects "${Serbia Report End Month}" from "End Date Month Field" combobox
    And user enters "${Serbia Report End Year}" into "End Date Year Field" field
    And user enters "${Serbia Report End Time Hour}" into "End Date Hour Field" field
    And user enters "${Serbia Report End Time Minute}" into "End Date Minute Field" field
    And user presses "OK" button and "Serbia Print Report Soft Copy" page shown
    And user presses "Cancel" button and "Fiscal Serbia Print Report" page shown
    Then "Fiscal Serbia Report Success Prompt" page is shown
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown