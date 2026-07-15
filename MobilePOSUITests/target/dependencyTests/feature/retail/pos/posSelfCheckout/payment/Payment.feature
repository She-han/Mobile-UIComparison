Feature: Pos Self Checkout Payment

  @PT-13969 @Payment @SCO_Test
  Scenario: Once items added, verify whether payment method is displayed
    Given "Sco Laneclose" page is shown
    When user presses "Sco Hidden Button" icon button
    And "Sco Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Sco laneopen" page is shown
    When user presses "Sco open lane button" icon button
    Then "Sco Start Transaction" page is shown
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    Then "Scanner" page is shown
    And user enters "${Sco Product 1}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Sco Transaction Basket" page is shown
    Given "${Sco Product 1 Description}" is displayed in "Receipt Basket" list
    And "${Sco Product 1 Price}" is displayed in "Receipt" list
    Given "Payment" is displayed in "Sco Sale Buttons" panel
    When user presses "Payment" button
    Then "Sco Select Tender" page is shown
    Given "Card" is displayed in "Sco Select Tender Buttons" panel
    Given "Gift Card" is displayed in "Sco Select Tender Buttons" panel
    Given "Loyalty" is displayed in "Sco Select Tender Buttons" panel
    And user presses "Card" button
    Then "Sco Insert Card" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Given user waits "5" seconds
    And user presses "E" button
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Then "Sco Receipt" page is shown
    And user presses "Sco No Print" icon button
    Then "Sco Transaction End" page is shown
    And user presses "Sco Next Customer" icon button
    Then "Sco start transaction" page is shown
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    And user presses "Sco Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Operator Sale" page is shown
    And user presses "Log Out Button" icon button
    Then "Sco Laneclose" page is shown

  @PT-13970 @Payment @SCO_Test
  Scenario: Verify the total items count and basket amount displayed correctly
    Given "Sco Laneclose" page is shown
    When user presses "Sco Hidden Button" icon button
    And "Sco Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Sco laneopen" page is shown
    When user presses "Sco open lane button" icon button
    Then "Sco Start Transaction" page is shown
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    Then "Scanner" page is shown
    And user enters "${Sco Product 1}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Given user waits "4" seconds
    And user enters "${Sco Bakery Product 1}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Given user waits "4" seconds
    And user enters "${Sco Bakery Product 2}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    Then "Sco Transaction Basket" page is shown
    Given "${Sco Product 1 Description}" is displayed in "Receipt Basket" list
    Given "${Sco Bakery Product 1 Description}" is displayed in "Receipt Basket" list
    Given "${Sco Bakery Product 2 Description}" is displayed in "Receipt Basket" list
    And "Sco Total Items" label displays the text "3"
    When user presses "Payment" button
    Then "Sco Select Tender" page is shown
    And "Sco Select Tender Item Count" label displays the text "3"
    And user presses "Card" button
    Then "Sco Insert Card" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Given user waits "5" seconds
    And user presses "E" button
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    Then "Sco Receipt" page is shown
    And user presses "Sco No Print" icon button
    Then "Sco Transaction End" page is shown
    And user presses "Sco Next Customer" icon button
    Then "Sco start transaction" page is shown
    And user presses "Sco Start Transaction Button" icon button
    Then "Sco Transaction Basket" page is shown
    And user presses "Sco Hidden Div" icon button
    Then "Sco Attendant Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    Then "Operator Sale" page is shown
    And user presses "Log Out Button" icon button
    Then "Sco Laneclose" page is shown
    
  @PT-22809 @Payment @SCO_Test
  Scenario: Verify partial payment using loyaty account tender
    Given "Sco Laneclose" page is shown
    When user presses "Sco Hidden Button" icon button
    And "Sco Signon" page is shown
    When user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    When user presses "Sco sign on button" icon button
    Then "Sco laneopen" page is shown
    When user presses "Sco open lane button" icon button
    Then "Sco Start Transaction" page is shown
    And user presses "Sco Start Transaction Button" icon button
    And "Sco Transaction Basket" page is shown
    And "Scanner" page is shown
    And user enters "${Sco Product 1}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    And user waits "4" seconds
    And user enters "${Sco Bakery Product 1}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    And user waits "4" seconds
    And user enters "${Sco Bakery Product 2}" into "Scan Text" field
    When user presses "Test Scanner Scan Button" icon button
    Then "Sco Transaction Basket" page is shown
    And "${Sco Product 1 Description}" is displayed in "Receipt Basket" list
    And "${Sco Bakery Product 1 Description}" is displayed in "Receipt Basket" list
    And "${Sco Bakery Product 2 Description}" is displayed in "Receipt Basket" list
    And "Sco Total Items" label displays the text "3"
    When user presses "Payment" button
    Then "Sco Select Tender" page is shown
    And "Sco Select Tender Item Count" label displays the text "3"
    And user presses "Loyalty" button
    And "Sco Capture Loyalty" page is shown
    And "Scanner" page is shown
    And user enters "${Sco Loyalty Card Capture}" into "Scan Text" field
    And user presses "Test Scanner Scan Button" icon button
    And user waits "5" seconds
    And "Sco Enter Tender Amount" page is shown
    And user presses "1" button
    And user presses "0" button
    And user presses "0" button
    When user presses "ENT" button
    Then "Sco Select Tender" page is shown
    And "${Sco Loyalty Customer Account Id}" is displayed in "Receipt Basket" list
    And user presses "Card" button
    And "Sco Insert Card" page is shown
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    And user waits "5" seconds
    And user presses "E" button
    And "ICCReader" page is shown
    And user presses "Card Inserted" checkbox
    And "Sco Receipt" page is shown
    And user presses "Sco No Print" icon button
    And "Sco Transaction End" page is shown
    And user presses "Sco Next Customer" icon button
    And "Sco start transaction" page is shown
    And user presses "Sco Start Transaction Button" icon button
    And "Sco Transaction Basket" page is shown
    And user presses "Sco Hidden Div" icon button
    And "Sco Attendant Signon" page is shown
    And user enters "${Sales Assistant Username}" into "Sco User Id Input Text" field
    And user enters "${Sales Assistant Password}" into "Sco password input text" field
    And user presses "Sco sign on button" icon button
    And "Operator Sale" page is shown
    When user presses "Log Out Button" icon button
    Then "Sco Laneclose" page is shown
 
