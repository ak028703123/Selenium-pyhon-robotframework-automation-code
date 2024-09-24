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


#Test Setup      CommonFunctionality.Launch Communication Portal Page
Test Setup      CommonFunctionality.Launch Cloud Communication Portal Page

Test Teardown   CommonFunctionality.Finish TestCase


*** Test Cases ***
#AK

Test 1:ProperPay:Communication Portal UserManagemet_Verify when user clicks on the manage User option in the Hamburger Menu or settings on menue it navigates to User Management page
        [Documentation]    This test case Verifies that user is navigated to User Management page when clicked on the manage User option in the Hamburger Menu or settings on menue
        [Tags]   Functional-TS27_TC_001

        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
        UserManagement.Verify User Management Page information

Test 2 :ProperPay:Communication Portal UserManagemet_verify Send Invitation button is enabled After entering all Required details(Optional details not mandatory)
        [Documentation]    This test case Verifies that Send Invitation button is enabled After entering all Required details(Optional details not mandatory)
        [Tags]   Functional-TS27_TC_003

        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
        UserManagement.Click on Invite New User Button
        UserManagement.Verify user is navigated to Invite New User Page
        UserManagement.Enter all the Required user info on Invite New User page
        UserManagement.Verify Send Invitation button is enabled

Test 3:ProperPay:Communication Portal UserManagemet_Verify when user clicks on 'edit' button it s navigate to Edit User Information page
        [Documentation]    This test case Verifies that when user clicks on 'edit' button it s navigate to Edit User Information page
        [Tags]   Functional-TS27_TC_006

        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
        UserManagement.Click Edit User Button
        UserManagement.Verify Edit User Info Page is displayed
        UserManagement.Verify Edit User Info Page information


Test 4:ProperPay:Communication Portal UserManagemet_Verify User is able to Edit the information in User management and able to save new changes and Confirm Profile Changes pops up.
        [Documentation]    This test case Verifies that User is able to Edit the information in User management and able to save new changes and Confirm Profile Changes pops up.
        [Tags]   Functional-TS27_TC_007

        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
        UserManagement.Click Edit User Button
        UserManagement.Verify Edit User Info Page is displayed
        UserManagement.Verify Edit User Info Page information
        UserManagement.Click paperless Yes option button
        UserManagement.Click on Save Button
        UserManagement.Verify Confirm Profile Changes window is displayed with buttons
        UserManagement.Verify Confirm Profile Changes pop up message is displayed


Test 5 :ProperPay:Communication Portal UserManagemet_Verify Confirmation window pops up when User Edits the information in User management and saves new changes by clicking save on Confirm Profile Changes popup.
        [Documentation]    This test case Verifies that Confirmation window pops up when User Edits the information in User management and saves new changes by clicking save on Confirm Profile Changes popup.
        [Tags]   Functional-TS27_TC_008

        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
        UserManagement.Click Edit User Button
        UserManagement.Verify Edit User Info Page is displayed
        UserManagement.Verify Edit User Info Page information
        UserManagement.Click paperless Yes option button
        UserManagement.Click on Save Button
        UserManagement.Verify Confirm Profile Changes window is displayed with buttons
        UserManagement.Verify Confirm Profile Changes pop up message is displayed
        UserManagement.Click Save Button on Confirm profile change popup
        UserManagement.Verify Profile Saved Confirmation window is displayed with buttons
        UserManagement.Verify Profile Saved Pop Up Message Is Displayed


Test 6 :ProperPay:Communication Portal UserManagemet_Verify the filter panel has filter option fields in User Management page
        [Documentation]    This test case Verifies that the filter panel has filter option fields in User Management page
        [Tags]   Functional-TS27_TC_016

        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
        UserManagement.Click on the filter button
        UserManagement.Verify Filter panel is visible with filter option fields


Test 7: ProperPay:Communication Portal UserManagemet_FilterFunctionality_validate_User is able to filter the results by providing Valid Patient Name
        [Documentation]    This test case Verifies that User is able to filter the results by providing Valid providing Valid Patient Name
        [Tags]    Functional-TS27_TC_017

        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
        UserManagement.Click on the filter button
        UserManagement.Verify filter Functionality by providing Valid Patient Name   ${UserManagement_Name}
        BillingAnalyst_Dashboard.Click Apply Filter Button
        UserManagement.Verify data after applying filter Functionality by providing Valid Patient Name
        Sleep    5


Test 8: ProperPay:Communication Portal UserManagemet_FilterFunctionality_validate_User is able to filter the results by providing Valid Email
        [Documentation]    This test case Verifies that User is able to filter the results by providing Valid providing Valid Email
        [Tags]    Functional-TS27_TC_018

        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
        UserManagement.Click on the filter button
        UserManagement.Verify filter Functionality by providing Valid Email   ${UserManagement_Email}
        BillingAnalyst_Dashboard.Click Apply Filter Button
        UserManagement.Verify data after applying filter Functionality by providing Valid Email
        Sleep    5


Test 9: ProperPay:Communication Portal UserManagemet_FilterFunctionality_validate_User is able to filter the results by providing Valid Provider Number/NPI
        [Documentation]    This test case Verifies that User is able to filter the results by providing Valid providing Valid Provider Number/NPI
        [Tags]    Functional-TS27_TC_019

        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
        UserManagement.Click on the filter button
        UserManagement.Verify filter Functionality by providing valid Provider Number or NPI   ${UserManagement_ProviderNumber}
        BillingAnalyst_Dashboard.Click Apply Filter Button
        UserManagement.Verify data after applying filter Functionality by providing Valid Provider Number
        BillingAnalyst_Dashboard.Click Clear Filter Button
        UserManagement.Verify filter Functionality by providing valid Provider Number or NPI   ${UserManagement_NPI}
        BillingAnalyst_Dashboard.Click Apply Filter Button
        UserManagement.Verify data after applying filter Functionality by providing Valid NPI
        Sleep    5


#defect
Test 10: ProperPay:Communication Portal UserManagemet_FilterFunctionality_validate_User is able to filter the results by providing Role Type
        [Documentation]    This test case Verifies that User is able to filter the results by providing Role Type
        [Tags]    Functional-TS27_TC_020

        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
        UserManagement.Click on the filter button
        UserManagement.Verify filter Functionality by providing Role Type
        BillingAnalyst_Dashboard.Click Apply Filter Button
        UserManagement.Scroll down to the bottom of page
        UserManagement.Verify data after applying filter Functionality by Role Type
        Sleep    5

Test 11: ProperPay:Communication Portal UserManagemet_FilterFunctionality_validate_User is able to filter the results by providing Account Status
        [Documentation]    This test case Verifies that User is able to filter the results by providing Account Status
        [Tags]    Functional-TS27_TC_021

        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
        UserManagement.Click on the filter button
        UserManagement.Verify filter Functionality by providing Account Status
        BillingAnalyst_Dashboard.Click Apply Filter Button
        UserManagement.Verify data after applying filter Functionality by Account Status
        Sleep    5


Test 12: ProperPay:Communication Portal UserManagemet_validate_User is able to clear the filter result by clicking on Clear Filters button
        [Documentation]    This test case Verifies that User is able to clear the filter result by clicking on Clear Filters button
        [Tags]    Functional-TS27_TC_022
        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
        UserManagement.Click on the filter button
        Sleep   5
        UserManagement.Validate filter clearing functionality


Test 13:ProperPay:Communication Portal UserManagemet_Verify Confirm Disable Popup is displayed when user click on Disable Button.
        [Documentation]    This test case Verifies that Confirm Disable Popup is displayed when user click on Disable Button.
        [Tags]   Functional-TS27_TC_009

        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
        UserManagement.Click Disable Button
        UserManagement.Verify Confirm Disable window is displayed with buttons


Test 14:ProperPay:Communication Portal UserManagemet_Verify User is disabled from User Management Page when user clicks on 'disable User' button.
        [Documentation]    This test case Verifies that User is disabled from User Management Page when user clicks on 'disable User' button.
        [Tags]   Functional-TS27_TC_010

        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
        UserManagement.Click Disable Button
        UserManagement.Verify Confirm Disable window is displayed with buttons
        UserManagement.Click Disable User Button
#        UserManagement.Verify User disable Confirmation window is displayed with OK button
#        UserManagement.Click OK on User Disable confirmation PopUp
        #Reset Build
        CommonFunctionality.Launch Communication Portal Page
        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
        UserManagement.Click Edit User Button
        UserManagement.Verify Edit User Info Page is displayed
        UserManagement.Click paperless yes option button
        UserManagement.Click Enable user button
        UserManagement.Click on Save Button
        UserManagement.Verify Confirm Profile Changes window is displayed with buttons
        UserManagement.Verify Confirm Profile Changes pop up message is displayed
        UserManagement.Click Save Button on Confirm profile change popup
        UserManagement.Verify Profile Saved Pop Up Message Is Displayed


Test 15:ProperPay:Communication Portal UserManagemet_Verify when user clicks on the name it is navigated to user Details page
        [Documentation]    This test case Verifies that when user clicks on the name it is navigated to user Details page
        [Tags]   Functional-TS27_TC_015

        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
        UserManagement.Click on the name in User management
        UserManagement.Verify User Detail page is displayed
        UserManagement.Verify User Detail Page Info


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


Test 17:ProperPay:Communication Portal UserManagemet_Verify Confirm Removal Popup is diplayed when user click on Remove Button
        [Documentation]    This test case Verifies that Confirm Removal Popup is diplayed when user click on Remove Button
        [Tags]   Functional-TS27_TC_012

        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
         BillingAnalyst_Dashboard.Scroll down to the bottom of page
        UserManagement.Click Next Button
        Sleep    5
        UserManagement.Scroll to the right
        UserManagement.Click Remove Button
        UserManagement.Verify Confirm Removal window is displayed with buttons


#####*****************VV important Note:DO Not Execute This as it deletes user***************************************
Test 18:ProperPay:Communication Portal UserManagemet_Verify when User clicks on 'Remove User' button it remove the user from user management Page
        [Documentation]    This test case Verifies when User clicks on 'Remove User' button it remove the user from user management Page
        [Tags]   Functional-TS27_TC_013

        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
        BillingAnalyst_Dashboard.Scroll down to the bottom of page
        UserManagement.Click Next Button
        Sleep    5
        UserManagement.Click Next Button
        UserManagement.Scroll to the right
        UserManagement.Click Remove Button
        UserManagement.Verify Confirm Removal window is displayed with buttons
        Usermanagement.Click Remove User Button
        UserManagement.Verify User Removed Confirmation window is displayed with OK button


#*****************VV important Note:DO Not Execute This as it deletes user***************************************
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
        UserManagement.Scroll to the right
        UserManagement.Click Remove Button
        UserManagement.Verify Confirm Removal window is displayed with buttons
        Usermanagement.Click Remove User Button
        UserManagement.Verify User Removed Confirmation window is displayed with OK button
        UserManagement.Click OK on User Removed confirmation PopUp
        UserManagement.Verify removed user is not displayed on the user management pages



Test 20:ProperPay:Communication Portal UserManagemet_Verify when user clicks on the name it is navigated to user Details page
        [Documentation]    This test case Verifies that when user clicks on the name it is navigated to user Details page
        [Tags]   Functional-TS27_TC_015

        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
        UserManagement.Click on the name in User management
        UserManagement.Verify User Detail page is displayed
        UserManagement.Verify User Detail Page Info


Test 21 :ProperPay:Communication Portal UserManagemet_Verify Send Inivation Functionality and Confirm invitation popup with "submit" and "cancel"button
        [Documentation]    This test case Verifies that Send Inivation Functionality and Confirm invitation popup with "submit" and "cancel"button
        [Tags]   Functional-TS27_TC_004

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
##AN
Test 23 :ProperPay:Communication Portal UserManagemet_Verify when user clicks on 'Invite New User' button then it should navigate to invite New User page
        [Documentation]    This test case Verifies that when user clicks on 'Invite New User' button then it should navigate to invite New User page
        [Tags]   Functional-TS27_TC_002
        LoginPage.Valid User Login  ${UM_comm_usr_name}   ${UM_comm_pass}
        UserManagement.Click User Management Setting_ManageUser Icon
        UserManagement.Verify user is navigated to User Management Page
        UserManagement.Click on Invite New User Button
        UserManagement.Verify user is navigated to Invite New User Page
        UserManagement.Verify Invite New User Page information
