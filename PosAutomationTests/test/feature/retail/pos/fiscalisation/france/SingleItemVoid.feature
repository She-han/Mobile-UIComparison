Feature: Item Void from a single item sale.

  @PT-17368 @Fiscalisation @France @FiscalFranceItemVoid @No_Printer @AUTOMATED
  Scenario: Item Void from a single item sale.
    Given user signs on as "France Fiscal Sales Assistant"
    And user enters "${Product Fiscal Fr 1}" into "Input Box" field
    And user presses "ENT" button
    When user selects "${Product Fiscal Fr 1 Description}" from "Receipt" list
    And "Modify Item" page is shown
    And user presses "Item Void" button and "Cannot Void Last Item" page shown
    And user presses "Yes" button and "Select Reason" page shown
    And user selects "Item Faulty" from "Selection List" list
    And user presses "OK" button
    And "Transaction Basket" page is shown
    And user presses "SignOff" button
    And "Enter User" page is shown