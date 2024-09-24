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





Test Setup      CommonFunctionality.Launch Communication Portal Page
#Test Teardown   CommonFunctionality.Finish TestCase


*** Test Cases ***
Test 1 :ProperPay:Communication Portal ContactUs_validate_User is able to submit in contact us form
    [Documentation]    This test case Verifies User is able to submit in contact us form
    [Tags]   TS30_TC_21
   LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
    LoginPage.Verify RA Dashboard is visible
    ContactUs.Click Contact Us option
    ContactUs.Enter all the mandatory fields in ContactUs page
    ContactUs.Verify Submit button is enabled
    ContactUs.Click On Submit Button
    ContactUs.Verify Confirmation Popup
