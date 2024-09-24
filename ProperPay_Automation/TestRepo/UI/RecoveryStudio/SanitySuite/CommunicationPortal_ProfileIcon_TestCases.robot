*** Settings ***
Documentation     Communication Portal Record Analyst DashBoard Functioal test
Resource    ../ProperPay_Automation/Resource/UI/CommonFunctionality/CommonFunctionality.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/LoginPage.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/RecordAnalyst_Dashboard.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/BillingAnalyst_Dashboard.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/ProfileIcon.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/UserManagement.robot

Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//RecordAnalyst_DashBoard_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//RecordAnalyst_DashBoard_TestData.yaml
Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//ProfileIcon_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//ProfileIcon_TestData.yaml


Test Setup      CommonFunctionality.Launch Communication Portal Page
#Test Teardown   CommonFunctionality.Finish TestCase


*** Test Cases ***
Test 1 :ProperPay:Communication Portal Profile_icon Validate user is able to switch to desired payer from payer dropdown
   [Documentation]    This test case Verifies that user is able to switch to desired payer from payer dropdown
   [Tags]    TS29_TC_003

    LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
    LoginPage.Verify RA Dashboard is visible
    ProfileIcon.Click Profile Icon
    ProfileIcon.Select Payer from Payer dropdown in Profile Icon            ${Client_Name1}
    ProfileIcon.Verify selected Payer records are displayed


Test 2 :ProperPay:Communication Portal Profile_icon Validate user is sucessfully Logged out from CGI Communications Portal
   [Documentation]    This test case Verifies user is sucessfully Logged out from CGI Communications Portal
   [Tags]    TS29_TC_005

    LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
    LoginPage.Verify RA Dashboard is visible
    ProfileIcon.Click Profile Icon
    ProfileIcon.Click Logout Button
    ProfileIcon.Confim Logout popup with "Yes" option
    ProfileIcon.Verify Communication login page is displayed



