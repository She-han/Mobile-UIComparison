Feature: Rich Product Search Results Without Login

  @PT-822 @AUTOMATED @RichProductSearchWithoutLogin
  Scenario: Rich Product Search - Verify Product Search on Sign Out
  	Given "Enter User" page is shown
  	When user presses "Product Search" icon button
  	Then "Rich Product Search Result" page is shown
  	And user enters "${Product 30695}" into "Product Search Results Input" field
  	And user presses "Full Screen Product Search Button" icon button
  	And user waits "2" seconds
  	And user waits "Product Search Result Item 1" to display
  	And user waits "2" seconds
		When user presses "Product Search Result Item 1" icon button
		Then "Rich Product Details" page is shown
		And user presses "Back Button" icon button
		And "Rich Product Search Result" page is shown
		And user presses "Back Button" icon button
		And "Enter User" page is shown
    