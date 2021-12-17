*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary
Resource         switch.robot

*** Variable ***
${login_btn}    dt_login_button
${option}       dt_core_account-info_acc-info
${demo1}        dt_core_account-switcher_demo-tab
${demo2}        acc-switcher__id
${underlying}   cq-symbol

*** Keywords ***

*** Test Cases ***
Login
    [arguments]     ${email}    ${pw}
     Open Browser    url=https://app.deriv.com   browser=chrome
#	 Set window     1280    1028
     wait until page does not contain element    dt_core_header_acc-info-preloader   60
	 wait until page contains element   ${login_btn}     60
	 Click Element   ${login_btn}
     wait until page contains element   txtEmail      15
	 input text     txtEmail     ${my_email}
	 input text     txtPass      ${my_pw}
	 Click Element   //*[@type='submit']
	# wait until page does not contain element    dt_core_header_acc-info-preloader   60
	 wait until page contains element  dt_core_account-info_acc-info  20
	 Click Element   dt_core_account-info_acc-info
	 wait until page contains element    dt_core_account-switcher_demo-tab  20
	 wait until element contains    dt_core_account-switcher_demo-tab, "Demo"
	 Click Element   dt_core_account-switcher_demo-tab
	 wait until page contains element    dt_VRTC5191574  5
     Click Element   dt_VRTC5191574

#   Close Browser