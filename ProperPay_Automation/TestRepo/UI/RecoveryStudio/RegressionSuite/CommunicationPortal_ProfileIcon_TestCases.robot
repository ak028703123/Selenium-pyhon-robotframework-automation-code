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


#Test Setup      CommonFunctionality.Launch Communication Portal Page
Test Setup      CommonFunctionality.Launch Cloud Communication Portal Page
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


Test 3 :ProperPay:Communication Portal Profile_icon Validate User should able to click Profile icon on the top right corner
   [Documentation]    This test case Verifies user should able to click Profile icon on the top right corner to view details
   [Tags]    TS29_TC_001

    LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
    LoginPage.Verify RA Dashboard is visible
    ProfileIcon.Click Profile Icon
    ProfileIcon.Verify Profile icon details entered is visible


Test 4 :ProperPay:Communication Portal Profile_icon Validate User clicks on 'update profile' hyperlink it should navigate to edit User Information page
   [Documentation]    This test case Verifies user clicks on 'update profile' hyperlink it should navigate to edit User Information page
   [Tags]    TS29_TC_002

    LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
    LoginPage.Verify RA Dashboard is visible
    ProfileIcon.Click Profile Icon
    ProfileIcon.Click Update profile hyperlink
    UserManagement.Verify Edit User Info Page is displayed
    UserManagement.Verify Edit User Info Page information

#
Test 5 :ProperPay:Communication Portal Profile_icon Validate Confirm Logout Popup with message when User clicks on log out button
   [Documentation]    This test case Verifies Confirm Logout Popup with message when User clicks on log out button
   [Tags]    TS29_TC_004

    LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
    LoginPage.Verify RA Dashboard is visible
    ProfileIcon.Click Profile Icon
    ProfileIcon.Click Logout Button
    ProfileIcon.Verify Confirm Logout popup
#





