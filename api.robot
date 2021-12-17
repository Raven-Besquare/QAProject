*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

# Manual Test Cases
# 1. Select Check Boxes
# 2. Enter a token name into text field and click “CREATE” to create a token
# 3. Enter a token name with 1 character
# 4. Enter a token name with special symbols
# 5. Enter a token name with a number
# 6. Enter a token name with characters exceeding 32
# 7. Delete a token by clicking on the “DELETE” button

*** Test Cases ***
Login
    Open Browser    url=https://app.deriv.com/account/api-token   browser=chrome
#	 Set window     1280    1028
    wait until page contains element   txtEmail      15
	input text     txtEmail     ${my_email}
	input text     txtPass      ${my_pw}
	Click Element   //*[@type='submit']
CheckBox Selection For Read
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    #wait until page contains element    //*[text()="Read"]//parent::label, 5
    click element   //*[text()="Read"]//parent::label
CheckBox Selection For Trade
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    #wait until page contains element    //*[text()="Read"]//parent::label, 5
    click element   //*[text()="Trade"]//parent::label
CheckBox Selection For Payments
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    #wait until page contains element    //*[text()="Read"]//parent::label, 5
    click element   //*[text()="Payments"]//parent::label
CheckBox Selection For Admin
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    #wait until page contains element    //*[text()="Read"]//parent::label, 5
    click element   //*[text()="Admin"]//parent::label
CheckBox Selection For Trading Information
    wait until page does not contain element    dt_core_header_acc-info-preloader   60
    #wait until page contains element    //*[text()="Read"]//parent::label, 5
    click element   //*[text()="Trading information"]//parent::label
Token Name
    input text     //*[@name='token_name']      R
    input text     //*[@name='token_name']      $
    input text     //*[@name='token_name']      4
    input text     //*[@name='token_name']      CouldThisBeMoreThanThirtyTwoCharactersNotReallyAsWeNeedMore
    input text     //*[@name='token_name']      RogueNation
    Click Element   //*[@type='submit']
Delete Token
    Click Element   //*[@type='button']

*** Keywords ***