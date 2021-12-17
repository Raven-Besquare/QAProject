*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Keyword ***
Switch
    [arguments]     ${option}
    Open Browser    url=https://app.deriv.com   browser=chrome
#   Set window      1280    1028
    wait until page contains element    ${option}       20
    click element   dt_core_account-info_acc-info


    [arguments]     ${email}    ${pw}
     Open Browser    url=https://app.deriv.com   browser=chrome
#	 Set window     1280    1028
     wait until page does not contain element    dt_core_header_acc-info-preloader   60
	 wait until page contains element   ${login_btn}     60
	 Click Element   ${login_btn}
     wait until page contains element   ${email_field}      15
	 input text     ${email_field}      ${email}
	 input text     ${pw_field}      ${pw}
	 Click Element   ${login_oauth_btn}

select underlying
    [arguments] ${underlying}
    click market
    click underlying    ${underlying}

Open Deriv
    Open Browser    url=https://app.deriv.com   browser=chrome
#   Set window      1280    1028
    wait until page contains element    ${option}       20
    click element   ${option}
    wait until page contains element    ${demo}         20
    click element   ${demo}
    wait until page contains element    ${demo2}        20
    click element   ${demo2}

Clear Input Field
    [Arguments]     $[input_field]
    wait until page contains element        ${input_field}
    ${current_value} = Get Element Attribute    ${input_field}

//*[text()="Payments"]//parent::label