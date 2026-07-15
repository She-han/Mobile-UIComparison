Feature: CRM Product Search

  @PT-240 @PreSales @CRMProductSearch @POS @CRM @AUTOMATED @POSValidatedTest @POSSet1
  Scenario: Navigate to Rich Product Search through CRM and perform a product search and complete a sale
    Given user signs on as "Sales Assistant"
    When user presses "Transaction Basket CRM button" icon button
    Then "CRM Menu Screen" page is shown
    When user presses "Products" icon button
    Then "Rich Product Search" page is shown
    When user enters "${Merchandise Product 1 Description}" into "Product Search Input" field
    And user presses "Product Search Button" icon button
    And user waits "2" seconds
    Then "Rich Product Search Result" page is shown
    And "Product Search Results Input" field displays the text "${Merchandise Product 1 Description}"
    When user presses "Product Search Result Item 1" icon button
    And user waits "2" seconds
    Then "Rich Product Details" page is shown
    And "Product Description Field" field displays the text "${Merchandise Product 1 Description}"
    And "Product ID Field" field displays the text "PRODUCT NO ${Merchandise Product 1}"
    And "Product Long Description Field" field displays the text "${Merchandise Product 1 Long Description}"
    And "Product Price Field" field displays the text "${Merchandise Product 1 Price}"
    And "Product Info Field" field displays the text "${Merchandise Product 1 Extended Description}"
    When user presses "ADD TO BAG" button
    Then "Transaction Basket" page is shown
    And "${Merchandise Product 1 Description}" is displayed in "Receipt" list
    And "${Merchandise Product 1 Price}" is displayed in "Receipt" list
    When user presses "TOTAL" button and "Select Tender" page shown
    And user presses "Cash" button and "Enter Cash Tender Amount" page shown
    And user presses "OK" button and "Await Drawer Closed" page shown
    And receipt display with following details
      | address   | ${Street 1},${Street 2},${Town},${County},${Postcode}               |
      | telephone | Tel: ${Store Phone 1}                                               |
      | item      | ${Merchandise Product 1 Description},${Merchandise Product 1 Price} |
    When user presses "Close" button on external "Cash Drawer" window
    Then "Transaction Basket" page is shown
    When user presses "SignOff" button
    Then "Enter User" page is shown


    