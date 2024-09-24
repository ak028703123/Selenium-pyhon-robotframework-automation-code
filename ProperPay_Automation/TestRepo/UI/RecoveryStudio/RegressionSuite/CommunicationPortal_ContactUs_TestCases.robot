*** Settings ***
Documentation     Communication Portal Billing Analyst DashBoard Functioal test
Resource    ../ProperPay_Automation/Resource/UI/CommonFunctionality/CommonFunctionality.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/LoginPage.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/BillingAnalyst_Dashboard.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/RecordAnalyst_Dashboard.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/ContactUs.robot
Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//BillingAnalyst_DashBoard_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//BillingAnalyst_DashBoard_TestData.yaml
Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//ContactUs_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//ContactUs_TestData.yaml




#Test Setup      CommonFunctionality.Launch Communication Portal Page
Test Setup      CommonFunctionality.Launch Cloud Communication Portal Page
#Test Teardown   CommonFunctionality.Finish TestCase


*** Test Cases ***
Test 1 :ProperPay:Communication Portal ContactUs_validate_User clicks on "Hamburger menu icon" it displays CONTACT US Option
   [Documentation]    This test case Verifies that User clicks on "Hamburger menu icon" it displays CONTACT US Option
   [Tags]    TS28_TC_001
        LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
        LoginPage.Verify RA Dashboard is visible
        ContactUs.Click On Hameburger Icon and Verify Contact Us Option


Test 2 :ProperPay:Communication Portal ContactUs_validate_User clicks on Contact Us option and it navigate to CONTACT US page
    [Documentation]    This test case Verifies when user clicks on Contact Us option and it navigate to CONTACT US page
    [Tags]    TS28_TC_002
    LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
    LoginPage.Verify RA Dashboard is visible
    ContactUs.Click Contact Us option
    ContactUs.Verify ContactUs page details


Test 3 :ProperPay:Communication Portal ContactUs_validate_SUBMIT Button is enabled after providing Mandatory fields
    [Documentation]    This test case Verifies SUBMIT Button is enabled after providing Mandatory fields
    [Tags]    TS28_TC_003
    LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
    LoginPage.Verify RA Dashboard is visible
    ContactUs.Click Contact Us option
    ContactUs.Enter all the mandatory fields in ContactUs page
    ContactUs.Verify Submit button is enabled


Test 4 :ProperPay:Communication Portal ContactUs_validate_CANCEL button clears all the field
    [Documentation]    This test case Verifies CANCEL button clears all the field
    [Tags]    TS28_TC_004
    LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
    LoginPage.Verify RA Dashboard is visible
    ContactUs.Click Contact Us option
    ContactUs.Enter all the mandatory fields in ContactUs page
    ContactUs.Click on cancel button
    ContactUs.Verify the data is cleared


Test 5 :ProperPay:Communication Portal ContactUs_validate_Notification is displayed when mandatory fields are not entered
    [Documentation]    This test case Verifies Notification is displayed when mandatory fields are not entered
    [Tags]    TS28_TC_005
    LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
    LoginPage.Verify RA Dashboard is visible
    ContactUs.Click Contact Us option
    ContactUs.Enter all the mandatory fields in ContactUs page and delete
    ContactUs.Verify mandatory field notification

Test 6 :ProperPay:Communication Portal ContactUs_validate_User is able to submit in contact us form
    [Documentation]    This test case Verifies User is able to submit in contact us form
    LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
    LoginPage.Verify RA Dashboard is visible
    ContactUs.Click Contact Us option
    ContactUs.Enter all the mandatory fields in ContactUs page
    ContactUs.Verify Submit button is enabled
    ContactUs.Click On Submit Button
    ContactUs.Verify Confirmation Popup
