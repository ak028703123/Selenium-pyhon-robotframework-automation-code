*** Settings ***
Documentation     Communication Portal Login Page Functioal test
Resource    ../ProperPay_Automation/Resource/UI/CommonFunctionality/CommonFunctionality.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/LoginPage.robot
Variables   ..//ProperPay_Automation//TestData//UI//RecoveryStudio//LoginPage_TestData.yaml
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/History.robot
Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//History_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//AuditHistory_TestData.yaml


#Library   DataDriver  Loginpage_TestData.xlsx  sheet_name=InvalidCredential_Login

Test Setup      CommonFunctionality.Launch Communication Portal Page
#Test Teardown   CommonFunctionality.Finish TestCase

*** Test Cases ***
Test 1 :ProperPay:Communication Portal login page_Valid User login.
    [Documentation]    This test case verifies if a user is able to login with a valid username and Valid password.
    [Tags]    Functional-TSA_TC_001

    LoginPage.Valid User Login   ${BA_comm_usr_name}    ${BA_comm_pass}
    LoginPage.Verify dashboard icon and dashboards are visible on sucessful login

Test 2 :ProperPay:Communication Portal login page_Validate ‘Reset Password? functionality
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
#    LoginPage.Validate Password reset Sucess Message

Test 3 :ProperPay:Communication Portal login page_validate_password filed is masked.
    [Documentation]    This test case Verifies that the password field is encrypted.
    [Tags]    Functional-TSA_TC_005

    LoginPage.Password Field Encrypted
###Logged defect for this#####
Test 4 :ProperPay:Communication Portal login page_validate Sign Up Now functionality
       [Documentation]    This test case verifies Sign Up Now functionality
       [Tags]    Functional-TSA_TC_007


        LoginPage.Click Sign Up Now link and validate the message
        LoginPage.Check certifed person checkbox and click on Continue Registration button and verify registarion page is displayed
        Loginpage.Verify registration form is displayed with the Submit button disbaled
        Loginpage.Enter all the non mandatory fields and verify that the submit button is not enabled
        Loginpage.Enter all the mandatory fields and verify that the submit button is enabled
        Loginpage.Click submit button and Verify REGISTRATION CONFIRMATION window is displayed with buttons
        Loginpage.Click on No and verify REGISTRATION CONFIRMATION window is closed
        Loginpage.Click on the Submit and click on the button Yes and Verify REGISTRATION SUCCESSFUL window is diaplyed with the message



Test 5 :ProperPay:Communication Portal login page_Visibility eye icon functionality
    [Documentation]    This test case validates the visibility eye icon functionality
    [Tags]    Functional-TSA_TC_011

    LoginPage.Visibility eye icon functionality

