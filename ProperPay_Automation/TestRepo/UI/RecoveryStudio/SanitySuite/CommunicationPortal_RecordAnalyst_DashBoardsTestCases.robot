*** Settings ***
Documentation     Communication Portal Record Analyst DashBoard Functioal test
Resource    ../ProperPay_Automation/Resource/UI/CommonFunctionality/CommonFunctionality.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/LoginPage.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/RecordAnalyst_Dashboard.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/BillingAnalyst_Dashboard.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/History.robot

Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//RecordAnalyst_DashBoard_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//RecordAnalyst_DashBoard_TestData.yaml

Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//UserManagement_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//UserManagement_TestData.yaml


Test Setup      CommonFunctionality.Launch Communication Portal Page
#Test Teardown   CommonFunctionality.Finish TestCase


*** Test Cases ***
#Test 1 :ProperPay:Communication Portal RA Dashboard_validate_Review Button naviagates to Record Details
#    [Documentation]    This test case Verifies that user can view the details of the Medical Record Request and verify review button navigates to Record details.All 3 Sections - Claim Review Details,Upload Documents and Authorized eSignature are displayed.
#    [Tags]    Functional-TS02_TC_001
#
#    CommonFunctionality.Connect to DB to Read the Test Data     ${raDashabordReviewOnlyQuery}
#    LoginPage.Valid User Login  ${RA_comm_usr_name}  ${RA_comm_pass}
#    RecordAnalyst_Dashboard.Click Record Request Tab
#    RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#    RecordAnalyst_Dashboard.Click Review button_RecordRequest
#    RecordAnalyst_Dashboard.Verify record details are present
#    RecordAnalyst_Dashboard.Scroll down to the bottom of Record details page
#    RecordAnalyst_Dashboard.Verify Submit Document button is present
#
#
#Test 2 :ProperPay:Communication Portal RA Dashboard_validate_patient details on a medical record tile.
#     [Documentation]    This test case Verifies that user can view record List in each tiles and  should have patient details
#     [Tags]     Priority: 1    Functional-TS02_TC_002
#
#     CommonFunctionality.Connect to DB to Read the Test Data     ${raDashabordReviewOnlyQuery}
#     LoginPage.Valid User Login  ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[1]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Verify Patient details are present
#     Sleep    10
#
#Test 3 :ProperPay:Communication Portal RA Dashboard_validate_Uploading Medical Record for a specific Claim
#     [Documentation]    This test case Verifies that user can is able to upload Medical Record for a specific Claim.
#     [Tags]    Functional-TS04_TC_001
#     CommonFunctionality.Connect to DB to Read the Test Data     ${raDashabordReviewOnlyQuery}
#     LoginPage.Valid User Login  ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[1]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Click Review button_RecordRequest
#     RecordAnalyst_Dashboard.Scroll down to the bottom of Record details page
#     RecordAnalyst_Dashboard.Remove the Existing attachment of Record details page
#     BillingAnalyst_Dashboard.Verify Browse File Button is visible
#     BillingAnalyst_Dashboard.Upload a File    PDF    Required   ${PdfFilepath}
#     BillingAnalyst_Dashboard.Verify PDF file is uploaded sucessfully
#     RecordAnalyst_Dashboard.Remove the Attached Document RA dashboard
#     Sleep    10
#
#Test 4 :ProperPay:Communication Portal RA Dashboard_validate_record information and validate all the entries are made.
#     [Documentation]    This test case Verifies that user is able to view the record information and check all the entries are made.
#     [Tags]    Functional-TS02_TC_003
#
#     CommonFunctionality.Connect to DB to Read the Test Data     ${raDashabordReviewOnlyQuery}
#     LoginPage.Valid User Login  ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Click Review button_RecordRequest
#     RecordAnalyst_Dashboard.Verify all the Record information is entered
#     Sleep    5
##
#Test 5 :ProperPay:Communication Portal RA Dashboard_validate_remaining days to submit is reflected on tiles before requesting an extension for claim
#     [Documentation]    This test case Verifies that remaining days to submit is reflected on tiles before requesting an extension for claim
#     [Tags]    Functional-TS20_TC_001
#
#     CommonFunctionality.Connect to DB to Read the Test Data     ${raDashabordExtensionQuery}
#     LoginPage.Valid User Login  ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     RecordAnalyst_Dashboard.Return request extension Button locator with patient account number passed by user    ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Verify that the request extension button is present on the identified record request tile
#     RecordAnalyst_Dashboard.Return request extension Days Remaining locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Verify the number of days remaining to submit is reflected on tiles before requesting extension
#     Sleep    5

#Test 6 :ProperPay:Communication Portal RA Dashboard_validate_request extension link is no longer available on the tile after requesting one extesion for a claim
#     [Documentation]    This test case Verifies that request extension link is no longer available on the tile after requesting one extesion for a claim.
#     [Tags]    Functional-TS20_TC_005
#     CommonFunctionality.Connect to DB to Read the Test Data     ${raDashabordExtensionQuery}
#     LoginPage.Valid User Login  ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     RecordAnalyst_Dashboard.Return request extension Button locator with patient account number passed by user    ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Verify that the request extension button is present on the identified record request tile
#     RecordAnalyst_Dashboard.Click Request extension button and verify the Request Extension pop up is displayed
#     RecordAnalyst_Dashboard.Verify the Request Extension confirmation message       ${data_list[0]['PatientFirstName']}          ${data_list[0]['PatientLastName']}
#     RecordAnalyst_Dashboard.Return request extension Granted locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Click Confirm Request Button and verify the Request Extension is no longer available on the tile
#     Sleep    5


#Test 7 :ProperPay:Communication Portal RA Dashboard_validate_additional 14 days will be added to the days to submit record after clicking on Record Extension button
#     [Documentation]    This test case Verifies that additional 14 days will be added to the days to submit record after clicking on Record Extension button
#     [Tags]    Functional-TS20_TC_004
#
#     CommonFunctionality.Connect to DB to Read the Test Data     ${raDashabordExtensionQuery}
#     LoginPage.Valid User Login  ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     RecordAnalyst_Dashboard.Return request extension Button locator with patient account number passed by user    ${data_list[1]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Verify that the request extension button is present on the identified record request tile
#     RecordAnalyst_Dashboard.Return request extension Days Remaining locator with patient account number passed by user  ${data_list[1]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Verify the number of days remaining to submit is reflected on tiles before requesting extension
#     RecordAnalyst_Dashboard.Add 14 Days To The Number Of Day Remaining To Submit
#     RecordAnalyst_Dashboard.Click Request extension button and verify the Request Extension pop up is displayed
#     RecordAnalyst_Dashboard.Return request extension Granted locator with patient account number passed by user  ${data_list[1]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Click Confirm Request Button and verify the Request Extension is no longer available on the tile
#     RecordAnalyst_Dashboard.Verify additional 14 days is added to number of days remaining to submit after requesting extension
#     Sleep    5
#
#Test 8 :ProperPay:Communication Portal RA Dashboard_validate_Upload of Non PDF file.
#    [Documentation]    This test case Verifies that user is not able to upload any files other than PDF files.
#    [Tags]    Functional-TS04_TC_007
#
#     CommonFunctionality.Connect to DB to Read the Test Data     ${raDashabordReviewOnlyQuery}
#    LoginPage.Valid User Login  ${RA_comm_usr_name}  ${RA_comm_pass}
#    RecordAnalyst_Dashboard.Click Record Request Tab
#    RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#    RecordAnalyst_Dashboard.Click Review button_RecordRequest
#    RecordAnalyst_Dashboard.Scroll down to the bottom of Record details page
#    BillingAnalyst_Dashboard.Verify Browse File Button is visible
#    BillingAnalyst_Dashboard.Upload a File      NonPDF    None    ${PdfFilepath}
#    BillingAnalyst_Dashboard.Verify NonPDF file is not uploaded
#    Sleep    5
#
#Test 9 :ProperPay:Communication Portal RA Dashboard_validate_Upload PDF file.
#    [Documentation]    This test case Verifies that user is able to upload n number of documents and can upload pdf of any size
#    [Tags]    Functional-TS04_TC_003
#
#     CommonFunctionality.Connect to DB to Read the Test Data     ${raDashabordReviewOnlyQuery}
#    LoginPage.Valid User Login  ${RA_comm_usr_name}  ${RA_comm_pass}
#    RecordAnalyst_Dashboard.Click Record Request Tab
#    RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#    RecordAnalyst_Dashboard.Click Review button_RecordRequest
#    RecordAnalyst_Dashboard.Scroll down to the bottom of Record details page
#    BillingAnalyst_Dashboard.Verify Browse File Button is visible
#   BillingAnalyst_Dashboard.Upload a File    PDF     Required   ${PdfFilepath}
#   BillingAnalyst_Dashboard.Verify PDF file is uploaded sucessfully
#   RecordAnalyst_Dashboard.Remove the Attached Document RA dashboard
#    Sleep    5
#
#Test 10 :ProperPay:Communication Portal RA Dashboard_validate_Upload of duplicate PDF file.
#    [Documentation]    This test case Verifies that user is not able to upload duplicate files(same file)
#    [Tags]    Functional-TS04_TC_004
#
#     CommonFunctionality.Connect to DB to Read the Test Data     ${raDashabordReviewOnlyQuery}
#    LoginPage.Valid User Login  ${RA_comm_usr_name}  ${RA_comm_pass}
#    RecordAnalyst_Dashboard.Click Record Request Tab
#    RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#    RecordAnalyst_Dashboard.Click Review button_RecordRequest
#    RecordAnalyst_Dashboard.Scroll down to the bottom of Record details page
#    RecordAnalyst_Dashboard.Remove the Existing attachment of Record details page
#    BillingAnalyst_Dashboard.Verify Browse File Button is visible
#    BillingAnalyst_Dashboard.Upload a File    PDF   Required    ${PdfFilepath}
#    BillingAnalyst_Dashboard.Upload a File    PDF   Required    ${PdfFilepath}
#    RecordAnalyst_Dashboard.Verify Document uploading errors window appears with FileAlreadyExists error message in RA dashboard
#    RecordAnalyst_Dashboard.Remove the Attached Document RA dashboard
#    Sleep    5
#
#
#
#Test 11 :ProperPay:Communication Portal RA Dashboard_validate_Record extension button is not present for overdue Patients
#     [Documentation]    This test case Verifies that Record extension button is not present for overdue Patients
#     [Tags]    Functional-TS20_TC_006
#
#     CommonFunctionality.Connect to DB to Read the Test Data     ${raDashabordReviewOnlyQuery}
#     LoginPage.Valid User Login  ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     RecordAnalyst_Dashboard.Return Overdue locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Return request extension Button locator with patient account number passed by user    ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Verify the request extension button is not present for overdue patient
#
#
#Test 12 :ProperPay:Communication Portal RA Dashboard_validate_only Record Request Dashboard is displayed and AUDIT RESULTS and Payer Dashboard is not displayed when looged in as Record Analyst
#     [Documentation]    This test case Verifies that validate_only Record Request Dashboard is displayed and AUDIT RESULTS and Payer Dashboard is not displayed when looged in as Record Analyst
#     [Tags]    TS01_TC_002
#
#     #Pre-Req
#     CommonFunctionality.Launch AdminUI Page
#     CommonFunctionality.Login AdmiUI Page   ${RA_comm_usr_name}  ${RA_comm_pass}
#     CommonFunctionality.Open the required user in Admin page   ${RA_comm_usr_name}
#     CommonFunctionality.User Role Configuration in Admin page  ${Required_Role}
#     #Steps
#     CommonFunctionality.Launch Communication Portal Page
#     LoginPage.Valid User Login  ${RA_comm_usr_name}  ${RA_comm_pass}
#     LoginPage.Verify RA Dashboard is visible
#     LoginPage.Verify Payer Dashboard is not visible
#     LoginPage.Verify BA Dashboard is not visible
#     #Reset build
#     CommonFunctionality.Launch AdminUI Page
#     CommonFunctionality.Login AdmiUI Page   ${RA_comm_usr_name}  ${RA_comm_pass}
#     CommonFunctionality.Open the required user in Admin page   ${RA_comm_usr_name}
#     CommonFunctionality.Reset User Role Configuration in Admin page     ${Reset_Role}
#     Sleep  5
#
#Test 13 :ProperPay:Communication Portal RA Dashboard_Verify after submitting record on RA dashbaord submited is not present on dashboard
#    [Documentation]    This test case Verifies that after submitting record on RA dashbaord   submited is not present on dashboard
#    [Tags]    Functional-TS30_TC_05
#
#     CommonFunctionality.Connect to DB to Read the Test Data     ${raDashabordReviewOnlyQuery}
#    LoginPage.Valid User Login  ${RA_comm_usr_name}  ${RA_comm_pass}
#    RecordAnalyst_Dashboard.Click Record Request Tab
#    RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#    RecordAnalyst_Dashboard.Click Review button_RecordRequest
#    RecordAnalyst_Dashboard.Scroll down to the bottom of Record details page
#    BillingAnalyst_Dashboard.Verify Browse File Button is visible
#    BillingAnalyst_Dashboard.Upload a File    PDF     Required   ${PdfFilepath}
#    BillingAnalyst_Dashboard.Verify PDF file is uploaded sucessfully
#    RecordAnalyst_Dashboard.Click on Submit Documents button
#    RecordAnalyst_Dashboard.Verify that user is able to submit the documents after uploading the documents
#
#Test 14 :#Test 35 :ProperPay:Communication Portal RA Dashboard_Verify user is able to submit the documents after uploading the documents.
#    [Documentation]    This test case Verifies that user is able to submit the documents after uploading the documents.
#    [Tags]    Functional-TS30_TC_17
#
#    CommonFunctionality.Connect to DB to Read the Test Data     ${raDashabordReviewOnlyQuery}
#    LoginPage.Valid User Login  ${RA_comm_usr_name}  ${RA_comm_pass}
#    RecordAnalyst_Dashboard.Click Record Request Tab
#    RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#    RecordAnalyst_Dashboard.Click Review button_RecordRequest
#    RecordAnalyst_Dashboard.Scroll down to the bottom of Record details page
#    BillingAnalyst_Dashboard.Verify Browse File Button is visible
#    BillingAnalyst_Dashboard.Upload a File    PDF     Required   ${PdfFilepath}
#    BillingAnalyst_Dashboard.Verify PDF file is uploaded sucessfully
#    RecordAnalyst_Dashboard.Click on Submit Documents button
#    RecordAnalyst_Dashboard.Verify that user is able to submit the documents after uploading the documents
#    RecordAnalyst_Dashboard.Verify submitted record is not present on Dashboard
#
#Test 15 :ProperPay:Communication Portal RA Dashboard_Verify after submitted record presnet in audit history page with status "Record Request Submitted"
#    [Documentation]    This test case Verifies that submitted record  presnet in audit history page with status "Record Request Submitted"
#    [Tags]    Functional-TS30_TC_18
#    CommonFunctionality.Connect to DB to Read the Test Data     ${raDashabordReviewOnlyQuery}
#    LoginPage.Valid User Login  ${RA_comm_usr_name}  ${RA_comm_pass}
#    RecordAnalyst_Dashboard.Click Record Request Tab
#    RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    RecordAnalyst_Dashboard.Click Review button_RecordRequest
#    RecordAnalyst_Dashboard.Scroll down to the bottom of Record details page
#    BillingAnalyst_Dashboard.Verify Browse File Button is visible
#    BillingAnalyst_Dashboard.Upload a File    PDF     Required   ${PdfFilepath}
#    BillingAnalyst_Dashboard.Verify PDF file is uploaded sucessfully
#    RecordAnalyst_Dashboard.Click on Submit Documents button
#    RecordAnalyst_Dashboard.Verify that user is able to submit the documents after uploading the documents
#    RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    RecordAnalyst_Dashboard.Verify after submission of record presnet in audit history page      ${data_list[0]['PatientAccountNumber']}

