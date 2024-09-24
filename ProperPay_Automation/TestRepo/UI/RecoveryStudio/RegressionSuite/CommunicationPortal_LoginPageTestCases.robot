*** Settings ***
Documentation     Communication Portal Login Page Functional test
Resource    ../ProperPay_Automation/Resource/UI/CommonFunctionality/CommonFunctionality.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/LoginPage.robot
Variables   ..//ProperPay_Automation//TestData//UI//RecoveryStudio//LoginPage_TestData.yaml
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/History.robot
Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//History_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//AuditHistory_TestData.yaml

#Library   DataDriver  Loginpage_TestData.xlsx  sheet_name=InvalidCredential_Login

#Test Setup      CommonFunctionality.Launch Communication Portal Page
Test Setup      CommonFunctionality.Launch Cloud Communication Portal Page
#Test Teardown   CommonFunctionality.Finish TestCase

*** Test Cases ***
Test 1 :ProperPay:Communication Portal login page_Valid User login.
    [Documentation]    This test case verifies if a user is able to login with a valid username and Valid password.
    [Tags]    Functional-TSA_TC_001
    LoginPage.Valid User Login   ${BA_comm_usr_name}    ${BA_comm_pass}
    LoginPage.Verify dashboard icon and dashboards are visible on sucessful login

Test 2 :ProperPay:Communication Portal login page_Invalid User login.
    [Documentation]    This test case verifies if a user will not be able to login with a valid username and invalid password.
    [Tags]    Functional-TSA_TC_002

    LoginPage.Invalid User login
    LoginPage.Validate Portal Login Unsuccessful Message
    LoginPage.Close Login Portal Unsuccessful popup


Test 3 :ProperPay:Communication Portal login page_ login button is not enabled without entering both userId and password.
    [Documentation]    This test case verifies if a user will not be able to login without entering both userId and password.
    [Tags]    Functional-TSA_TC_003


    Login Button Not enabled without entering username and password

# To be fixed once the ticket PPAYAD-15308 is resolved
Test 4 :ProperPay:Communication Portal login page_Validate ‘Reset Password? functionality
    [Documentation]    This test case verifies the ‘Reset Password?’ functionality
    [Tags]    Functional-TSA_TC_004

    LoginPage.Click Reset password link
    LoginPage.Enter email and click send request button
    LoginPage.Login to Outlook
    LoginPage.click on the password reset code email
    LoginPage.Fetch password reset code from email
    LoginPage.Enter Reset code and click validate
    LoginPage.Create new password and click submit
    LoginPage.Zoom in zoom Out communication Portal
    LoginPage.Validate Create New Password Message
    LoginPage.Scroll down to the bottom of page Reset Password Page
    LoginPage.Validate Password reset Sucess Message

Test 5 :ProperPay:Communication Portal login page_validate_password filed is masked.
    [Documentation]    This test case Verifies that the password field is encrypted.
    [Tags]    Functional-TSA_TC_005

    LoginPage.Password Field Encrypted


#
##Test 6 :
##    [Documentation]
##    [Tags]    Functional-TSA_TC_007
#

Test 7:ProperPay:Communication Portal login page_validate Sign Up Now functionality
       [Documentation]    This test case verifies Sign Up Now functionality
       [Tags]    Functional-TSA_TC_007


        LoginPage.Click Sign Up Now link and validate the message
        LoginPage.Check certifed person checkbox and click on Continue Registration button and verify registarion page is displayed
        Loginpage.Verify registration form is displayed with the Submit button disbaled
        Loginpage.Enter all the non mandatory fields and verify that the submit button is not enabled
#        Loginpage.Enter all the mandatory fields and verify that the submit button is enabled
#        Loginpage.Click submit button and Verify REGISTRATION CONFIRMATION window is displayed with buttons
#        Loginpage.Click on No and verify REGISTRATION CONFIRMATION window is closed
#        Loginpage.Click on the Submit and click on the button Yes and Verify REGISTRATION SUCCESSFUL window is diaplyed with the message

Test 8:ProperPay:Communication Portal login simultaneously on different browser
    [Documentation]    This test case verifies if a user is able to log in simultaneously with different credentials in a different browser.
    [Tags]    Functional-TSA_TC_008

    LoginPage.Valid User Login   ${ RA_comm_usr_name}    ${RA_comm_pass}
    LoginPage.Verify dashboard icon and dashboards are visible on sucessful login
    Sleep   5
##    CommonFunctionality. Launch Communication Portal Page Edge Browser
##    LoginPage.Valid User Login   ${comm_usr_name1}    ${comm_pass1}
##    LoginPage.Verify dashboard icon and dashboards are visible on sucessful login
#
Test 10:ProperPay:Communication Portal login Page Verify tool tip message of textboxes present on registration page
     [Documentation]    This test case verifies Verify tool tip message of textboxes present on registration page for below fields : EMAIL ADDRESS,PROVIDER NUMBER ,CONTACT EMAILS TO RECEIVE MEDICAL RECORD REQUESTS FROM CGI,CONTACT EMAILS TO AUDIT FINDINGS/APPEAL DECISIONS FROM CGI
     [Tags]    Functional-TSA_TC_010

        LoginPage.Click Sign Up Now link and validate the message
        LoginPage.Check certifed person checkbox and click on Continue Registration button and verify registarion page is displayed
        LoginPage.Verify tooltip message for Email Address
        LoginPage.Scroll down PAPERLESS OPTION Site Administrator Registration

Test 11 :ProperPay:Communication Portal login page_Visibility eye icon functionality
    [Documentation]    This test case validates the visibility eye icon functionality
    [Tags]    Functional-TSA_TC_011

    LoginPage.Visibility eye icon functionality

Test 12 :ProperPay:Communication Portal login page_Visibility eye icon functionality
    [Documentation]    This test case validates the visibility eye icon functionality
    [Tags]    Functional-TSA_TC_012

    LoginPage.Visibility eye icon functionality


#Satheesh
Test 13 :ProperPay:Communication Portal login page_Validate the checkbox functionality of End User Policy & Privacy Notice and CGI Cookie Policy
    [Documentation]    This test case Verifies the checkbox functionality of End User Policy & Privacy Notice and CGI Cookie Policy
    [Tags]    Functional-TSA_TC_006

    LoginPage.Checkbox validation for End User Policy & Privacy Notice
    LoginPage.Click End User Policy & Privacy Notice and validate the message
    Loginpage.Click CGI Cookie Policy and validate the message
    sleep   5


Test 14:ProperPay:Communication Portal login Page Verify Site Administrator Agreement pop up window message
     [Documentation]    This test case verifies Site Administrator Agreement pop up window message
     [Tags]    Functional-TSA_TC_012

      LoginPage.Click Sign Up Now link and validate the message
      LoginPage.Click Site Administrator Agreement and validate the message
      LoginPage.Close button for Site Administrator Agreement popup window
      sleep     5

Test 15:ProperPay:Communication Portal login Page verify hyperlinks on the login page which is at the bottom is navigated to respective pages
     [Documentation]    This test case verifies hyperlinks on the login page which is at the bottom is navigated to respective pages: Communications Portal Demo, User Guide and CGI Help DesK: HelpDeskEmail@cgi.com
     [Tags]    Functional-TSA_TC_009

     LoginPage.Click Portal Demonstration Hyperlink and Validate the URL
     LoginPage.Click User Quick Start Guide and Validate the URL
     LoginPage.Click HIPAA Privacy Policy and Validate the URL
     Sleep  5

