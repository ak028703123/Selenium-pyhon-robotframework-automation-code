*** Settings ***
Documentation     Communication Portal Billing Analyst DashBoard Functioal test
Resource    ../ProperPay_Automation/Resource/UI/CommonFunctionality/CommonFunctionality.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/LoginPage.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/BillingAnalyst_Dashboard.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/RecordAnalyst_Dashboard.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/History.robot
Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//BillingAnalyst_DashBoard_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//BillingAnalyst_DashBoard_TestData.yaml
Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//History_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//AuditHistory_TestData.yaml



Test Setup      CommonFunctionality.Launch Communication Portal Page
Test Teardown   CommonFunctionality.Finish TestCase


*** Test Cases ***

#Satheesh
#Test 1 :ProperPay:Communication Portal History tab_validate history icon can be clicked to view list of Audit history
#    [Documentation]  This test case verifies User can click on the history icon to view the list of audit history
#    [Tags]  Functional TS03_TC_001
#
#     LoginPage.Valid User Login      ${BA_comm_usr_name}    ${BA_comm_pass}
#     History.Verify History page is displayed on clicking History Icon
#
#
#Test 2 :ProperPay:Communication Portal History tab_validate_that update document button is enabled when the patient tile is not present on either RA and BA dashboard
#    [Documentation]  This test case verifies that in History tab that update document button is enabled when the patient tile is not present on either RA and BA dashboard
#    [Tags]  Functional TS03_TC_007_01
#
#    CommonFunctionality.Connect to DB to Read the Test Data     ${UploadDocumentEnabled}
#    LoginPage.Valid User Login      ${BA_comm_usr_name}    ${BA_comm_pass}
#    History.Verify History page is displayed on clicking History Icon
#    History.Verify Upload Documents Tab is enabled         ${data_list[0]['PatientAccountNumber']}
#    History.Navigate to Homepage of portal
#    sleep  2
#    BillingAnalyst_Dashboard.Click Filter Button
#    History.Verify patient tile is not present on either RA and BA dashboard
#
#
#Test 3 :ProperPay:Communication Portal History tab_validate_that update document button is disabled when the patient tile is present on either RA and BA dashboard
#    [Documentation]  This test case verifies that in History tab that update document button is disabled when the patient tile is present on either RA and BA dashboard
#    [Tags]  Functional TS03_TC_007_02
#
#    CommonFunctionality.Connect to DB to Read the Test Data     ${UploadDocumentDisabled}
#    LoginPage.Valid User Login      ${BA_comm_usr_name}    ${BA_comm_pass}
#    History.Verify History page is displayed on clicking History Icon
#    History.Verify Upload Documents Tab is disable                  ${data_list[0]['PatientAccountNumber']}
#    History.Navigate to Homepage of portal
#    sleep  2
#    BillingAnalyst_Dashboard.Click Filter Button
#    History.Verify patient tile is present on either RA and BA dashboard
#