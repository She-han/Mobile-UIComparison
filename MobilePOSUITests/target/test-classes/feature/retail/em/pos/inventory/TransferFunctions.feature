@PT-12123 @NUI_ScriptToBeUpdated
    Scenario: PT-12123
        And "EnterUser" page is shown
        And user enters "000101" into "Input Text 1" field
        And user enters "000101" into "Input Text 2" field
        #And user enters "000115" into "UserID" field
        #And user enters "000115" into "Password" field
        When user presses "Sign On" icon button
        And "LaunchScreen" page is shown
        When user presses "Sell" button
        And "Sale" page is shown
        When user presses "Product" icon button
        And "RichProductSearchMainCategories" page is shown
        And user enters "Df517xm" into "Search" field
        When user presses Enter key
        And "RichProductSearchFullScreenResults" page is shown
        When user presses "Button Down Collar Western Sh" button
        And "DisplayRichProductDetails" page is shown
        When user presses "S" icon button
        #When user presses "Component" icon button
        When user presses "Order" icon button
        And "Sale" page is shown
        When user presses "NativeSaleHeader Exit" icon button
        And "Enteruser" page is shown
        And user enters "000101" into "Input Text 1" field
        And user enters "000101" into "Input Text 2" field
        #And user enters "000115" into "UserID" field
        #And user enters "000115" into "Password" field
        When user presses "Sign On" icon button 
        And "Sale" page is shown
        And user selects "Button Down Collar Red" from "Selection" list
        And "ModifyItemOptionsPrompt" page is shown
        When user presses "Void" button
        And "VoidModalYesNo" page is shown
        When user presses "Ok" icon button
        And "SelectReason" page is shown
        And user selects "Customer Left Store" from "Selection" list
        When user presses "SelectReasonConfirm" icon button
        And "Launchscreen" page is shown
        When user presses "NativeSaleHeader Exit" icon button
        And "Enteruser" page is shown