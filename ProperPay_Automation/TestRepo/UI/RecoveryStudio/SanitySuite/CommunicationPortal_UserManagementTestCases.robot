*** Settings ***
Documentation     Communication Portal Record Analyst DashBoard Functioal test
Resource    ../ProperPay_Automation/Resource/UI/CommonFunctionality/CommonFunctionality.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/LoginPage.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/RecordAnalyst_Dashboard.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/BillingAnalyst_Dashboard.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/UserManagement.robot

Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//RecordAnalyst_DashBoard_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//RecordAnalyst_DashBoard_TestData.yaml
Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//UserManagement_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//UserManagement_TestData.yaml


Test Setup      CommonFunctionality.Launch Communication Portal Page
Test Teardown   CommonFunctionality.Finish TestCase


*** Test Cases ***
##AK
Test 5 :ProperPay:Communication Portal UserManagemet_Verify Confirmation window pops up when User Edits the information in User management and saves new changes by clicking save on Confirm Profile Changes popup.
        [Documentation]    This test case Verifies that Confirmation window pops up when User Edits the information in User management and saves new changes by clicking save on Confirm Profile Changes popup.
        [Tags]   Functional-TS27_TC_008

        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
        UserManagement.Click Edit User Button
        UserManagement.Verify Edit User Info Page is displayed
        UserManagement.Verify Edit User Info Page information
        UserManagement.Click paperless No option button
        UserManagement.Click on Save Button
        UserManagement.Verify Confirm Profile Changes window is displayed with buttons
        UserManagement.Verify Confirm Profile Changes pop up message is displayed
        UserManagement.Click Save Button on Confirm profile change popup
        UserManagement.Verify Profile Saved Confirmation window is displayed with buttons
        UserManagement.Verify Profile Saved Pop Up Message Is Displayed

Test 16:ProperPay:Communication Portal UserManagemet_Verify after user is disabled from User Management page Disable button is disbaled
        [Documentation]    This test case Verifies that Verify after user is disabled from User Management page Disable button is disbaled
        [Tags]   Functional-TS27_TC_011

        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
        UserManagement.Click Disable Button
        UserManagement.Verify Confirm Disable window is displayed with buttons
        UserManagement.Click Disable User Button
#        UserManagement.Verify User disable Confirmation window is displayed with OK button
#        UserManagement.Click OK on User Disable confirmation PopUp
        UserManagement.Verify Disable Button is disabled
        #Reset Build
        CommonFunctionality.Launch Communication Portal Page
        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
        UserManagement.Click Edit User Button
        UserManagement.Verify Edit User Info Page is displayed
        UserManagement.Click Enable user button
        UserManagement.Click on Save Button
        UserManagement.Verify Confirm Profile Changes window is displayed with buttons
        UserManagement.Verify Confirm Profile Changes pop up message is displayed
        UserManagement.Click Save Button on Confirm profile change popup
        UserManagement.Verify Profile Saved Pop Up Message Is Displayed



#####*****************VV important Note:DO Not Execute This as it deletes user***************************************
Test 19:ProperPay:Communication Portal UserManagemet_Verify after removing user it will not displayed on user managemet page
        [Documentation]    This test case Verifies that after removing user  it will not displayed on user managemet page
        [Tags]   Functional-TS27_TC_014

        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
        BillingAnalyst_Dashboard.Scroll down to the bottom of page
        Sleep   5
        UserManagement.Click Next Button
        Sleep    10
        UserManagement.Click Next Button
        UserManagement.Click Remove Button
        UserManagement.Verify Confirm Removal window is displayed with buttons
        Usermanagement.Click Remove User Button
        UserManagement.Verify User Removed Confirmation window is displayed with OK button
        UserManagement.Click OK on User Removed confirmation PopUp
        UserManagement.Verify removed user is not displayed on the user management pages

##In Progress, Not yet completed as a defect is logged
Test 22:ProperPay:Communication Portal UserManagemet_Verify Confirmation pop up is displayed with message when clicked on submit button on Confirm Invitation Pop Up
        [Documentation]    This test case Verifies that Confirmation pop up is displayed with message when clicked on submit button on Confirm Invitation Pop Up
        [Tags]   Functional-TS27_TC_005

        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
        UserManagement.Click on Invite New User Button
        UserManagement.Verify user is navigated to Invite New User Page
        UserManagement.Enter all the Required user info on Invite New User page
        UserManagement.Enter all the Optional user info on Invite New User page
        UserManagement.Verify Send Invitation button is enabled
        UserManagement.Click Send Invitation Button
        UserManagement.Verify Confirm Invitation window is displayed with buttons
        UserManagement.Click Submit button on confirm invitation popup
#AN
Test 23 :ProperPay:Communication Portal UserManagemet_Verify when user clicks on 'Invite New User' button then it should navigate to invite New User page
        [Documentation]    This test case Verifies that when user clicks on 'Invite New User' button then it should navigate to invite New User page
        [Tags]   Functional-TS27_TC_002
        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
        UserManagement.Click on Invite New User Button
        UserManagement.Verify user is navigated to Invite New User Page
        UserManagement.Verify Invite New User Page information
