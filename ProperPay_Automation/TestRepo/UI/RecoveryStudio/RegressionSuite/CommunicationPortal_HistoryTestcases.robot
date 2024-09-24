*** Settings ***
Documentation     Communication Portal Billing Analyst DashBoard Functional test
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
###
Test 1 :ProperPay:Communication Portal History tab_validate history icon can be clicked to view list of Audit history
    [Documentation]  This test case verifies User can click on the history icon to view the list of audit history
    [Tags]  Functional TS03_TC_001

     LoginPage.Valid User Login      ${BA_comm_usr_name}    ${BA_comm_pass}
     History.Verify History page is displayed on clicking History Icon


Test 2 :ProperPay:Communication Portal History tab_Validate record information is displayed upon clicking Patient Name in AuditHistory Tab
    [Documentation]  This test case verifies User can click the name on the history tab to view the record information
    [Tags]  Functional TS03_TC_003

    CommonFunctionality.Connect to DB to Read the Test Data from required Table number     ${AuditHistoryDashabordSqlQuery1}       2
    LoginPage.Valid User Login      ${BA_comm_usr_name}    ${BA_comm_pass}
    History.Verify History page is displayed on clicking History Icon
    History.Return Patient name hyperlink locator with patient account number passed by user        ${data_list[0]['PatientLastName']}
    History.Click Patient Hyperlink in History tab
    History.Verify Patient details in History page
    sleep  5


Test 3 :ProperPay:Communication Portal History tab_Validate Audit histories listed are sorted alphabetically based on Patient name by default
    [Documentation]  This test case verifies User is able to see the Audit histories listed are sorted reverse alphabetically based on Patient name by default
    [Tags]  Functional TS03_TC_004

    LoginPage.Valid User Login      ${BA_comm_usr_name}    ${BA_comm_pass}
    History.Verify History page is displayed on clicking History Icon
    History.Ascending order sort verification for Patient name by default in History Tab
    sleep  5


Test 4 :ProperPay:Communication Portal History tab_Validate User can sort the list of available audit history based on all the column header displayed
    [Documentation]  This test case verifies User is able to sort the list of available audit history based on all the column header displayed.
    [Tags]  Functional TS03_TC_005

    LoginPage.Valid User Login      ${BA_comm_usr_name}    ${BA_comm_pass}
    History.Verify History page is displayed on clicking History Icon
    History.Double click patient Name header in History Tab and verify sorting is done in Ascending order
    History.Double Click patient Account Number Header in History Tab and verify sorting is done in Ascending order
    History.Double Click Medical Record Number header in History Tab and verify sorting is done in Ascending order
    History.Double Click Provider Number header in History Tab and verify sorting is done in Ascending order
    History.Double Click Dates of Service header in History Tab and verify sorting is done in Ascending order
    History.Double Click Portal Status header in History Tab and verify sorting is done in Ascending order
    History.Double Click Status Date header in History Tab and verify sorting is done in Ascending order
    History.Double Click Audit Number header in History Tab and verify sorting is done in Ascending order
    History.Double Click Claim Number header in History Tab and verify sorting is done in Ascending order
    sleep  5

Test 5 :ProperPay:Communication Portal History tab_Validate User can view the drop down 'items per page' and it contains 10 by default .Also, user have option to select 20 items per page.
    [Documentation]  This test case verifies User is able to to select 20 as items per page and verfies 20 records are displayed
    [Tags]  Functional TS03_TC_006

    LoginPage.Valid User Login      ${BA_comm_usr_name}    ${BA_comm_pass}
    History.Verify History page is displayed on clicking History Icon
    History.Scroll down to the bottom of Audit History Page
    History.Verify Items Per Page is present and contains 10 by default
    History.Selects Item Per Page as 20
    History.Verifies History Tab displays 20 records
    sleep  5


Test 6 :ProperPay:Communication Portal History tab_Validate Audit Status of Overdue and Non- Overdue Medical Record Requests
    [Documentation]  This test case verifies the Audit Status of Overdue and Non- Overdue Medical Record Requests
    [Tags]  Functional TS25_TC_001

    CommonFunctionality.Connect to DB to Read the Test Data     ${RaOverdueRecords}
    LoginPage.Valid User Login      ${BA_comm_usr_name}    ${BA_comm_pass}
    History.Verify History page is displayed on clicking History Icon
    History.Clicks on filter icon
    History.Verify filter Functionality by providing Valid Patient Account Number for RA and BA        ${data_list[0]['PatientAccountNumber']}
    History.Scroll down to the bottom of Audit History Page
    History.Verify for Audit Status of Overdue record for RA
    CommonFunctionality.Connect to DB to Read the Test Data     ${RaNonOverdueRecords}
    History.Verify filter Functionality by providing Valid Patient Account Number for RA and BA         ${data_list[0]['PatientAccountNumber']}
    History.Scroll down to the bottom of Audit History Page
    History.Verify for Audit Status of Non_Overdue record for RA
    sleep  5

Test 7 :ProperPay:Communication Portal History tab_Validate Audit Status of Overdue and Non- Overdue Audit Results
    [Documentation]  This test case verifies the Audit Status of Overdue and Non- Overdue Audit Results
    [Tags]  Functional TS25_TC_002

    CommonFunctionality.Connect to DB to Read the Test Data     ${BaOverdueRecords}
    LoginPage.Valid User Login      ${BA_comm_usr_name}    ${BA_comm_pass}
    History.Verify History page is displayed on clicking History Icon
    History.Clicks on filter icon
    History.Verify filter Functionality by providing Valid Patient Account Number for RA and BA         ${data_list[0]['PatientAccountNumber']}
    History.Scroll down to the bottom of Audit History Page
    History.Verify for Audit Status of Overdue record for BA
    CommonFunctionality.Connect to DB to Read the Test Data     ${BaNonOverdueRecords}
    History.Verify filter Functionality by providing Valid Patient Account Number for RA and BA         ${data_list[0]['PatientAccountNumber']}
    History.Scroll down to the bottom of Audit History Page
    History.Verify for Audit Status of Non_Overdue record for BA
    sleep  5

Test 8 :ProperPay:Communication Portal History tab_Validate User is able to filter the Audit History results by providing Portal Status (Dropdown)
    [Documentation]  This test case verifies User is able to filter the Audit History results by providing Portal Status (Dropdown)
    [Tags]  Functional TS03_TC_009

    LoginPage.Valid User Login      ${BA_comm_usr_name}    ${BA_comm_pass}
    History.Verify History page is displayed on clicking History Icon
    History.Clicks on filter icon
    History.Verify filter Functionality by providing Portal Status (Dropdown)
    History.Scroll down to desired element
    History.Verify result is displayed for Portal Status
    sleep   5

##AK
#
##AN
#
Test 9 :ProperPay:Communication Portal History tab_validate User is able to filter the Audit History results by providing FROM STATUS DATE and TO STATUS DATE
    [Documentation]  This test case verifies User can filter the Audit History results by providing FROM STATUS DATE and TO STATUS DATE
     [Tags]  Functional TS03_TC_008
     LoginPage.Valid User Login      ${BA_comm_usr_name}    ${BA_comm_pass}
     History.Verify History page is displayed on clicking History Icon
     History.Click Filter Button
     History.Verify filter Functionality by providing From status Date and To Status Date
     History.Click Apply Filter Button
     History.Zoom in zoom Out communication Portal
     History.Scroll down to the bottom of Audit History Page
     History.Verify data after applying filter Functionality providing From status Date and To Status Date


Test 10 :ProperPay:Communication Portal History tab_FilterFunctionality_validate_Filter Options panel is visible in RA Dashboard
    [Documentation]  This test case verifies that in History tab verify that filter pannel has follwing filter fields
    [Tags]  Functional TS01_TC_003_14

     LoginPage.Valid User Login      ${BA_comm_usr_name}    ${BA_comm_pass}
     History.Verify History page is displayed on clicking History Icon
     History.Click Filter Button
     History.Verify Filter Options panel is visible

Test 11 :ProperPay:Communication Portal History tab_validate_that update document button is enabled when the patient tile is not present on either RA and BA dashboard
    [Documentation]  This test case verifies that in History tab that update document button is enabled when the patient tile is not present on either RA and BA dashboard
    [Tags]  Functional TS03_TC_007_01

    CommonFunctionality.Connect to DB to Read the Test Data     ${UploadDocumentEnabled}
    LoginPage.Valid User Login      ${BA_comm_usr_name}    ${BA_comm_pass}
    History.Verify History page is displayed on clicking History Icon
    History.Verify Upload Documents Tab is enabled         ${data_list[0]['PatientAccountNumber']}
    History.Navigate to Homepage of portal
    sleep  2
    BillingAnalyst_Dashboard.Click Filter Button
    History.Verify patient tile is not present on either RA and BA dashboard


Test 12 :ProperPay:Communication Portal History tab_validate_that update document button is disabled when the patient tile is present on either RA and BA dashboard
    [Documentation]  This test case verifies that in History tab that update document button is disabled when the patient tile is present on either RA and BA dashboard
    [Tags]  Functional TS03_TC_007_02

    CommonFunctionality.Connect to DB to Read the Test Data     ${UploadDocumentDisabled}
    LoginPage.Valid User Login      ${BA_comm_usr_name}    ${BA_comm_pass}
    History.Verify History page is displayed on clicking History Icon
    History.Verify Upload Documents Tab is disable                  ${data_list[0]['PatientAccountNumber']}
    History.Navigate to Homepage of portal
    sleep  2
    BillingAnalyst_Dashboard.Click Filter Button
    History.Verify patient tile is present on either RA and BA dashboard

#Satheesh
Test 13 :ProperPay:Communication Portal History tab_validate_user is able to navigate to corresponding pages by clicking on the page numbers
    [Documentation]  This test case verifies User is able to navigate to corresponding pages by clicking on the page numbers
    [Tags]  Functional TS30_TC_06

    LoginPage.Valid User Login      ${BA_comm_usr_name}    ${BA_comm_pass}
    History.Verify History page is displayed on clicking History Icon
    History.Scroll down to the bottom of Audit History Page
    History.Click on page number
    History.Verify the selected page number is displayed


Test 15: ProperPay:Communication Portal ExportToExcel_validate_User is able to download the audit History results using Export To Excel button
        [Documentation]    This test case Verifies that User is able to download the audit History results using Export To Excel button
        [Tags]    Functional-TS31_TC_001

        LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
        History.Verify History page is displayed on clicking History Icon
        CommonFunctionality.Wait Untill Page Loads
        History.Fetch the Number of Records in History Page
        History.Click Export Audit
        CommonFunctionality.Read from Excel          ${AuditHistoryDownloadedExcelPath}
        History.Verify the columns in the downloaded export
        History.Verify the record in the downloaded export