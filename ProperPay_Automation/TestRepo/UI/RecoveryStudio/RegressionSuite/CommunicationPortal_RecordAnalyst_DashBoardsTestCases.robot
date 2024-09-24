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


#Test Setup      CommonFunctionality.Launch Communication Portal Page
Test Setup      CommonFunctionality.Launch Cloud Communication Portal Page

Test Teardown   CommonFunctionality.Finish TestCase


*** Test Cases ***
#Test 1 :ProperPay:Communication Portal RA Dashboard_validate_RA dashboard along with the total number of Record request.
#    [Documentation]    This test case Verifies that Record analyst is able to see RA dashboard along with the total number of Record request mentioned in the braces ..
#    [Tags]     Functional-TS01_TC_001
#    CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity     ${raDashabordReviewOnlyQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
#    CommonFunctionality.Wait Untill Page Loads
#    RecordAnalyst_Dashboard.Click Record Request Tab
#    RecordAnalyst_Dashboard.Fetch Total count of Record Request Tile on RA dashboard
#    RecordAnalyst_Dashboard.Replace the dynamically fetched Record Request Tile total count number
#    RecordAnalyst_Dashboard.Validate the Record Request tab contains the total count of tiles
#
#
#Test 2 :ProperPay:Communication Portal RA Dashboard_validate_Review Button naviagates to Record Details
#    [Documentation]    This test case Verifies that user can view the details of the Medical Record Request and verify review button navigates to Record details.All 3 Sections - Claim Review Details,Upload Documents and Authorized eSignature are displayed.
#    [Tags]    Functional-TS02_TC_001
##    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity       ${raDashabordReviewOnlyQuery}
#    CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity     ${raDashabordReviewOnlyQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
#    RecordAnalyst_Dashboard.Click Record Request Tab
#    RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#    RecordAnalyst_Dashboard.Click Review button_RecordRequest
#    RecordAnalyst_Dashboard.Verify record details are present
#    RecordAnalyst_Dashboard.Scroll down to the bottom of Record details page
#    RecordAnalyst_Dashboard.Verify Submit Document button is present
#
#
#Test 3 :ProperPay:Communication Portal RA Dashboard_validate_patient details on a medical record tile.
#     [Documentation]    This test case Verifies that user can view record List in each tiles and  should have patient details
#     [Tags]    Functional-TS02_TC_002
#
##     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity       ${raDashabordReviewOnlyQuery}
#     CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity       ${raDashabordReviewOnlyQuery}
#     LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
#     CommonFunctionality.Wait Untill Page Loads
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Verify Patient details are present
#     Sleep    2
#
#
#Test 4 :ProperPay:Communication Portal RA Dashboard_validate_Uploading Medical Record for a specific Claim
#     [Documentation]    This test case Verifies that user can is able to upload Medical Record for a specific Claim.
#     [Tags]    Functional-TS04_TC_001
##     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#     CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#     LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Click Review button_RecordRequest
#     RecordAnalyst_Dashboard.Scroll down to the bottom of Record details page
#     RecordAnalyst_Dashboard.Remove the Existing attachment of Record details page
#     BillingAnalyst_Dashboard.Verify Browse File Button is visible
#     BillingAnalyst_Dashboard.Upload a File    PDF    Required   ${PdfFilepath}
#     BillingAnalyst_Dashboard.Verify PDF file is uploaded sucessfully
#     RecordAnalyst_Dashboard.Remove the Attached Document RA dashboard
#     Sleep    2
##
#
#
#Test 5 :ProperPay:Communication Portal RA Dashboard_validate_Submit Documents button is enabled.
#     [Documentation]    This test case Verifies that the Submit Documents button is enabled after uploading the documents and all the mandatory fields like Esignature ,TITLE and Date
#     [Tags]    Functional-TS04_TC_006
##     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#     CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#     LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Click Review button_RecordRequest
#     RecordAnalyst_Dashboard.Scroll down to the bottom of Record details page
#     BillingAnalyst_Dashboard.Verify Browse File Button is visible
#     RecordAnalyst_Dashboard.Verify Authorized eSignature details
#     BillingAnalyst_Dashboard.Upload a File    PDF    Required   ${PdfFilepath}
#     BillingAnalyst_Dashboard.Verify PDF file is uploaded sucessfully
#     RecordAnalyst_Dashboard.Verify Submit Documents button is enabled
#     RecordAnalyst_Dashboard.Remove the Attached Document RA dashboard
#     Sleep    5
#
#
#Test 6 :ProperPay:Communication Portal RA Dashboard_validate_patient record approaching the overdue date
#     [Documentation]    This test case Verifies that user can view record List approaching the overdue date
#     [Tags]    Functional-TS01_TC_004
##     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity       ${raDashabordReviewOnlyQuery}
#     CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#     LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     RecordAnalyst_Dashboard.Return Overdue locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Verify patient record request Overdue status
#     Sleep    5
#
##
#Test 7 :ProperPay:Communication Portal RA Dashboard_validate_record information and validate all the entries are made.
#     [Documentation]    This test case Verifies that user is able to view the record information and check all the entries are made.
#     [Tags]    Functional-TS02_TC_003
#
##     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordReviewOnlyQuery}
#     CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#     LoginPage.Valid User Login According to Test Data Availability   ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Click Review button_RecordRequest
#     RecordAnalyst_Dashboard.Verify all the Record information is entered
#     Sleep    5

#Test 8 :ProperPay:Communication Portal RA Dashboard_validate_request extension link available on the tile to request an extension and is clickable.
#     [Documentation]    This test case Verifies that request extension link available on the tile to request an extension and is clickable.
#     [Tags]    Functional-TS20_TC_002
#
#     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordExtensionQuery}
#     LoginPage.Valid User Login According to Test Data Availability    ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     RecordAnalyst_Dashboard.Return request extension Button locator with patient account number passed by user    ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Verify that the request extension button is present on the identified record request tile
#     RecordAnalyst_Dashboard.Click Request extension button and verify the Request Extension pop up is displayed
#     Sleep    5
#
#
#Test 9 :ProperPay:Communication Portal RA Dashboard_validate_remaining days to submit is reflected on tiles before requesting an extension for claim
#     [Documentation]    This test case Verifies that remaining days to submit is reflected on tiles before requesting an extension for claim
#     [Tags]    Functional-TS20_TC_001
#
#     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordExtensionQuery}
#     LoginPage.Valid User Login According to Test Data Availability   ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     RecordAnalyst_Dashboard.Return request extension Button locator with patient account number passed by user    ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Verify that the request extension button is present on the identified record request tile
#     RecordAnalyst_Dashboard.Return request extension Days Remaining locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Verify the number of days remaining to submit is reflected on tiles before requesting extension
#     Sleep    5
#
#Test 36 :ProperPay:Communication Portal RA Dashboard_Verify Cancel Extension Functionality
#    [Documentation]    This test case Verifies that Cancel Extension Functionality
#    [Tags]    Functional-TS30_TC_16
#    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordExtensionQuery}
#     LoginPage.Valid User Login According to Test Data Availability   ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     RecordAnalyst_Dashboard.Return request extension Button locator with patient account number passed by user    ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Verify that the request extension button is present on the identified record request tile
#     RecordAnalyst_Dashboard.Return request extension Days Remaining locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Verify the number of days remaining to submit is reflected on tiles before requesting extension
#     RecordAnalyst_Dashboard.Verify Cancel Extension Functionality
#
#Test 10 :ProperPay:Communication Portal RA Dashboard_validate_request extension link is no longer available on the tile after requesting one extesion for a claim
#     [Documentation]    This test case Verifies that request extension link is no longer available on the tile after requesting one extesion for a claim.
#     [Tags]    Functional-TS20_TC_005
#     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordExtensionQuery}
#     LoginPage.Valid User Login According to Test Data Availability   ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     RecordAnalyst_Dashboard.Return request extension Button locator with patient account number passed by user    ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Verify that the request extension button is present on the identified record request tile
#     RecordAnalyst_Dashboard.Click Request extension button and verify the Request Extension pop up is displayed
#     RecordAnalyst_Dashboard.Verify the Request Extension confirmation message       ${data_list[0]['PatientFirstName']}          ${data_list[0]['PatientLastName']}
#     RecordAnalyst_Dashboard.Return request extension Granted locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Click Confirm Request Button and verify the Request Extension is no longer available on the tile
#     Sleep    5
#
#
#Test 11 :ProperPay:Communication Portal RA Dashboard_validate_additional 14 days will be added to the days to submit record after clicking on Record Extension button
#     [Documentation]    This test case Verifies that additional 14 days will be added to the days to submit record after clicking on Record Extension button
#     [Tags]    Functional-TS20_TC_004
#
#     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordExtensionQuery}
#     LoginPage.Valid User Login According to Test Data Availability   ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     RecordAnalyst_Dashboard.Return request extension Button locator with patient account number passed by user    ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Verify that the request extension button is present on the identified record request tile
#     RecordAnalyst_Dashboard.Return request extension Days Remaining locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Verify the number of days remaining to submit is reflected on tiles before requesting extension
#     RecordAnalyst_Dashboard.Add 14 Days To The Number Of Day Remaining To Submit
#     RecordAnalyst_Dashboard.Click Request extension button and verify the Request Extension pop up is displayed
#     RecordAnalyst_Dashboard.Return request extension Granted locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Click Confirm Request Button and verify the Request Extension is no longer available on the tile
#     RecordAnalyst_Dashboard.Verify additional 14 days is added to number of days remaining to submit after requesting extension
#     Sleep    5
#
#
#Test 12 :ProperPay:Communication Portal RA Dashboard_Validate_Record Analyst is able to upload the Required documents before Documents are Submitted via the Portal
#     [Documentation]    This test case Verifies that RA is able to upload the Required documents before Documents are Submitted via the Portal
#     [Tags]    Functional-TS05_TC_001
#
##     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordReviewOnlyQuery}
#     CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#     LoginPage.Valid User Login According to Test Data Availability   ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Click Review button_RecordRequest
#     RecordAnalyst_Dashboard.Scroll down to the bottom of Record details page
#     BillingAnalyst_Dashboard.Verify Browse File Button is visible
#      RecordAnalyst_Dashboard.Remove the Existing attachment of Record details page
#     BillingAnalyst_Dashboard.Upload a File    PDF    Required   ${PdfFilepath}
#     BillingAnalyst_Dashboard.Verify PDF file is uploaded sucessfully
#     RecordAnalyst_Dashboard.Remove the Attached Document RA dashboard
#     Sleep    5
#
#
#Test 13 :ProperPay:Communication Portal RA Dashboard_Validate_ Record analyst is able to submit documents providing Optional documents and not the required documents.
#     [Documentation]    This test case Verifies that Record analyst is able to submit documents providing and not the required documents.
#     [Tags]    Functional-TS05_TC_002
#
##     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordReviewOnlyQuery}
#     CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#     LoginPage.Valid User Login According to Test Data Availability   ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Click Review button_RecordRequest
#     RecordAnalyst_Dashboard.Scroll down to the bottom of Record details page
#     BillingAnalyst_Dashboard.Verify Browse File Button is visible
#     RecordAnalyst_Dashboard.Remove the Existing attachment of Record details page
#     BillingAnalyst_Dashboard.Upload a File    PDF    Optional    ${PdfFilepath}
#     BillingAnalyst_Dashboard.Verify PDF file is uploaded sucessfully
#     RecordAnalyst_Dashboard.Remove the Attached Document RA dashboard
#     Sleep    5


#Test 14 :ProperPay:Communication Portal RA Dashboard_Validate_ Record analyst is able to upload the documents without specifying the document type
#     [Documentation]    This test case Verifies that Record analyst is able to upload the documents without specifying the document type
#     [Tags]    Functional-TS05_TC_003
#
##     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordReviewOnlyQuery}
#     CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#     LoginPage.Valid User Login According to Test Data Availability   ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Click Review button_RecordRequest
#     RecordAnalyst_Dashboard.Scroll down to the bottom of Record details page
#     BillingAnalyst_Dashboard.Verify Browse File Button is visible
#     RecordAnalyst_Dashboard.Remove the Existing attachment of Record details page
#     BillingAnalyst_Dashboard.Upload a File    PDF    None    ${PdfFilepath}
#     BillingAnalyst_Dashboard.Verify PDF file is uploaded sucessfully
#     RecordAnalyst_Dashboard.Remove the Attached Document RA dashboard
#     Sleep    5
#
#
#Test 15 :ProperPay:Communication Portal RA Dashboard_Validate_Submit Documents button is disbaled without uploading the documents(Record Request tile)
#    [Documentation]    This test case Verifies that ubmit Documents button is disbaled without uploading the documents(Record Request tile)
#    [Tags]    Functional-TS05_TC_004
#
##     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordReviewOnlyQuery}
#     CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#     LoginPage.Valid User Login According to Test Data Availability     ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Click Review button_RecordRequest
#     RecordAnalyst_Dashboard.Scroll down to the bottom of Record details page
#     BillingAnalyst_Dashboard.Verify Browse File Button is visible
#     RecordAnalyst_Dashboard.Remove the Existing attachment of Record details page
#     BillingAnalyst_Dashboard.Verify Authorized eSignature details
#    RecordAnalyst_Dashboard.Verify Submit Documents button is disabled
#
#Test 16:ProperPay:Communication Portal RA Dashboard_validate_validate_TITLE and DATE is auto filled On Record Request Tile
#     [Documentation]    This test case Verifies that validate_TITLE and DATE is auto filled On Record Request Tile
#     [Tags]    TS05_TC_006
#
##     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordReviewOnlyQuery}
#     CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#      LoginPage.Valid User Login According to Test Data Availability   ${RA_comm_usr_name}  ${RA_comm_pass}
#      RecordAnalyst_Dashboard.Click Record Request Tab
#      RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#      RecordAnalyst_Dashboard.Click Review button_RecordRequest
#      Scroll down to the bottom of Record details page
#      RecordAnalyst_Dashboard.Verify Authorized eSignature details
#
#Test 17 :ProperPay:Communication Portal RA Dashboard_validate_Upload of Non PDF file.
#    [Documentation]    This test case Verifies that user is not able to upload any files other than PDF files.
#    [Tags]    Functional-TS04_TC_007
#
##     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordReviewOnlyQuery}
#    CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#    LoginPage.Valid User Login According to Test Data Availability   ${RA_comm_usr_name}  ${RA_comm_pass}
#    RecordAnalyst_Dashboard.Click Record Request Tab
#    RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#    RecordAnalyst_Dashboard.Click Review button_RecordRequest
#    RecordAnalyst_Dashboard.Scroll down to the bottom of Record details page
#    BillingAnalyst_Dashboard.Verify Browse File Button is visible
#    RecordAnalyst_Dashboard.Remove the Existing attachment of Record details page
#    BillingAnalyst_Dashboard.Upload a File      NonPDF    None    ${NonPdfFilePath}
#    BillingAnalyst_Dashboard.Verify NonPDF file is not uploaded
#    Sleep    5
#
#
#Test 18 :ProperPay:Communication Portal RA Dashboard_validate_Upload PDF file.
#    [Documentation]    This test case Verifies that user is able to upload n number of documents and can upload pdf of any size
#    [Tags]    Functional-TS04_TC_003
#
##     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordReviewOnlyQuery}
#     CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#    LoginPage.Valid User Login According to Test Data Availability   ${RA_comm_usr_name}  ${RA_comm_pass}
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
##
#Test 19 :ProperPay:Communication Portal RA Dashboard_validate_Upload of duplicate PDF file.
#    [Documentation]    This test case Verifies that user is not able to upload duplicate files(same file)
#    [Tags]    Functional-TS04_TC_004
##     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordReviewOnlyQuery}
#    CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#    LoginPage.Valid User Login According to Test Data Availability   ${RA_comm_usr_name}  ${RA_comm_pass}
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
#Test 20 :ProperPay:Communication Portal RA Dashboard_validate_Record extension button is not present for overdue Patients
#     [Documentation]    This test case Verifies that Record extension button is not present for overdue Patients
#     [Tags]    Functional-TS20_TC_006
##     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordReviewOnlyQuery}
#     CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#     LoginPage.Valid User Login According to Test Data Availability   ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     RecordAnalyst_Dashboard.Return Overdue locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Return request extension Button locator with patient account number passed by user    ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Verify the request extension button is not present for overdue patient
#
#
#Test 21 :ProperPay:Communication Portal RA Dashboard_validate_Record Analyst can toggle between Grid View and List View by clicking on icons availabe for same in RA dashboard
#     [Documentation]    This test case Verifies that Record Analyst can toggle between Grid View and List View by clicking on icons availabe for same in RA dashboard
#     [Tags]    Functional-TS01_TC_005
#
##     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordReviewOnlyQuery}
#     CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#     LoginPage.Valid User Login According to Test Data Availability   ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     RecordAnalyst_Dashboard.Click List View Icon
#     RecordAnalyst_Dashboard.Verify auidts are diplayed in list view
#     RecordAnalyst_Dashboard.Verify auidts are not diplayed in Grid view
#     RecordAnalyst_Dashboard.Click Grid View Icon
#     RecordAnalyst_Dashboard.Verify auidts are diplayed in Grid view
#     RecordAnalyst_Dashboard.Verify auidts are not diplayed in List view


#Test 22 :ProperPay:Communication Portal RA Dashboard_validate_only Record Request Dashboard is displayed and AUDIT RESULTS and Payer Dashboard is not displayed when looged in as Record Analyst
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
#
#Test 23 :ProperPay:Communication Portal RA Dashboard_Validate_Upload document information are correct in the upload documents queue (Record Request Tiles)
#     [Documentation]    This test case Verifies that RA after Uploading documents, Verify the upload document information are correct in the upload documents queue (Record Request Tiles)
#     [Tags]    Functional-TS04_TC_008
#
##     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordReviewOnlyQuery}
#     CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#     LoginPage.Valid User Login According to Test Data Availability   ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Click Review button_RecordRequest
#     RecordAnalyst_Dashboard.Scroll down to the bottom of Record details page
#     BillingAnalyst_Dashboard.Upload a File    PDF   Required     ${PdfFilepath}
#     BillingAnalyst_Dashboard.Fetch FileUpload Details
#     BillingAnalyst_Dashboard.Validate FileUpload Details
#     RecordAnalyst_Dashboard.Remove the Attached Document RA dashboard
#     Sleep    5
#
#
#Test 24: ProperPay:Communication Portal FilterFunctionality_validate_User is able to clear the filter result by clicking on Clear Filters button
#        [Documentation]    This test case Verifies that User is able to clear the filter result by clicking on Clear Filters button
#        [Tags]    Functional-TS01_TC_003_11
##        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordReviewOnlyQuery}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#        LoginPage.Valid User Login According to Test Data Availability   ${RA_comm_usr_name}  ${RA_comm_pass}
#        RecordAnalyst_Dashboard.Click Record Request Tab
#        LoginPage.Verify RA Dashboard is visible
#        Sleep   5
#        BillingAnalyst_Dashboard.Validate filter clearing functionality
#
##
#Test 25 :ProperPay:Communication Portal FilterFunctionality_validate_Filter Options panel is visible in RA Dashboard
#         [Documentation]    This test case Verifies that in RA dashboard verify the filter pannel has follwing filter fields
#         [Tags]    Functional- TS01_TC_003_13
##         LoginPage.Valid User Login  ${RA_comm_usr_name}  ${RA_comm_pass}
#         CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#         LoginPage.Valid User Login According to Test Data Availability   ${RA_comm_usr_name}  ${RA_comm_pass}
#         RecordAnalyst_Dashboard.Click Record Request Tab
#         Sleep   5
#         BillingAnalyst_Dashboard.Click Filter Button
#         RecordAnalyst_Dashboard.Verify Filter Options panel is visible
#         Sleep    5
#
###
#Test 26 :ProperPay:Communication Portal RA Dashboard_validate_verify user is able to filter records by providing DAYS REMAINING UNTIL DUE DATE - OVERDUE
#     [Documentation]    This test case Verifies that user is able to filter records by providing DAYS REMAINING UNTIL DUE DATE - OVERDUE
#     [Tags]    Functional-TS01_TC_003_07
##     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordReviewOnlyQuery}
#     CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#     LoginPage.Valid User Login According to Test Data Availability   ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     LoginPage.Verify RA Dashboard is visible
#     Sleep   5
#     BillingAnalyst_Dashboard.Click Filter Button
#     RecordAnalyst_Dashboard.Verify filter Functionality by providing DAYS REMAINING UNTIL DUE DATE       ${DAYS REMAINING UNTIL DUE DATE OVERDUE}
#     RecordAnalyst_Dashboard.Verify data after applying filter Functionality by providing DAYS REMAINING UNTIL DUE DATE - OVERDUE
#     sleep  5
##
####
####
#Test 27 :ProperPay:Communication Portal RA Dashboard_validate_verify user is able to filter records by providing Claim Type as OUTPATIENT
#     [Documentation]    This test case Verifies that user is able to filter records by providing Claim Type as OUTPATIENT
#     [Tags]    Functional-TS01_TC_003_04
##         CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity    ${raDashabordOPRecordQuery}
#         CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordOPRecordQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
#        RecordAnalyst_Dashboard.Click Record Request Tab
#        LoginPage.Verify RA Dashboard is visible
#        Sleep  5
#        BillingAnalyst_Dashboard.Click Filter Button
#        RecordAnalyst_Dashboard.Verify filter Functionality by providing Claim Type           Outpatient
#        RecordAnalyst_Dashboard.Verify filter result by after providing Claim Type as outpatient
#
#
#Test 28 :ProperPay:Communication Portal RA Dashboard_validate_Verify Good Cause Lanaguage hyperlink
#     [Documentation]    This test case Verifies Good Cause Lanaguage hyperlink
#     [Tags]    Functional-TS04_TC_002
#
##     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordReviewOnlyQuery}
#     CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#     LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user    ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Click Review button_RecordRequest
#     Sleep  5
#     RecordAnalyst_Dashboard.Scroll down to the UploadDocuments Window
#     RecordAnalyst_Dashboard.Verify Good Cause Language Link
#
###
#Test 29 :ProperPay:Communication Portal RA Dashboard_validate_verify user is able to filter records by providing DAYS REMAINING UNTIL DUE DATE - 1 OR 2 OR 3 OR 4 OR 5
#     [Documentation]    This test case Verifies that user is able to filter records by providing DAYS REMAINING UNTIL DUE DATE - 1 OR 2 OR 3 OR 4 OR 5
#     [Tags]    Functional-TS01_TC_003_08
#
##     LoginPage.Valid User Login  ${RA_comm_usr_name}  ${RA_comm_pass}
#      CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#      LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     LoginPage.Verify RA Dashboard is visible
#     Sleep  5
#     BillingAnalyst_Dashboard.Click Filter Button
#     RecordAnalyst_Dashboard.Verify filter Functionality by providing DAYS REMAINING UNTIL DUE DATE         ${DAYS REMAINING UNTIL DUE DATE NON OVERDUE}
#     RecordAnalyst_Dashboard.Verify data after applying filter Functionality by providing DAYS REMAINING UNTIL DUE DATE - NON OVERDUE
#
#
#Test 30 :ProperPay:Communication Portal RA Dashboard_validate_verify user is able to filter records by providing Claim Type as INPATIENT
#     [Documentation]    This test case Verifies that user is able to filter records by providing Claim Type as INPATIENT
#     [Tags]    Functional-TS01_TC_003_05
##     LoginPage.Valid User Login  ${RA_comm_usr_name}  ${RA_comm_pass}
#      CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordIPRecordQuery}
#      LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     LoginPage.Verify RA Dashboard is visible
#     Sleep  5
#     BillingAnalyst_Dashboard.Click Filter Button
#     RecordAnalyst_Dashboard.Verify filter Functionality by providing Claim Type          Inpatient
#     RecordAnalyst_Dashboard.Verify filter result by after providing Claim Type as Inpatient
#
#
###AK
#Test 31 :ProperPay:Communication Portal RA Dashboard_Verify Record Analyst clicks on the 'Dashboard' breadcrumbs navigates to RA homepage
#    [Documentation]    This test case Verifies that user can click on the 'Dashboard' breadcrumbs which navigates to RA homepage.
#    [Tags]    Functional-
#
##     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordReviewOnlyQuery}
#    CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
#     CommonFunctionality.Wait Untill Page Loads
#    RecordAnalyst_Dashboard.Click Record Request Tab
#    RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#    RecordAnalyst_Dashboard.Click Review button_RecordRequest
#    History.Click on dashboard breadcrumbs
#    CommonFunctionality.Verify Record Requests tab is selected
#
#
#
#Test 32 :ProperPay:Communication Portal RA Dashboard_Verify Record Analyst is able to delete the uploaded document
#    [Documentation]    This test case Verifies that Record Analyst is able to delete the uploaded document
#    [Tags]    Functional-TS30_TC_03
#
##    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordReviewOnlyQuery}
#    CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
#    RecordAnalyst_Dashboard.Click Record Request Tab
#    RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#    RecordAnalyst_Dashboard.Click Review button_RecordRequest
#    RecordAnalyst_Dashboard.Scroll down to the bottom of Record details page
#    BillingAnalyst_Dashboard.Verify Browse File Button is visible
#    BillingAnalyst_Dashboard.Upload a File    PDF     Required   ${PdfFilepath}
#    BillingAnalyst_Dashboard.Verify PDF file is uploaded sucessfully
#    RecordAnalyst_Dashboard.Verify Record Analyst is able to delete the uploaded document
#
##
#Test 33 :ProperPay:Communication Portal RA Dashboard_Verify Record is not submitted when user clicks on Cancel Button
#    [Documentation]    This test case Verifies that Record is not submitted when user clicks on Cancel Button
#    [Tags]    Functional-TS30_TC_20
#
##     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordReviewOnlyQuery}
#    CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
#    RecordAnalyst_Dashboard.Click Record Request Tab
#    RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#    RecordAnalyst_Dashboard.Click Review button_RecordRequest
#    RecordAnalyst_Dashboard.Scroll down to the bottom of Record details page
#    RecordAnalyst_Dashboard.Click Cancel button on Record Request Page
#    RecordAnalyst_Dashboard.Click GoToDashboard button in cancel Record submission pop up
#    CommonFunctionality.Wait Untill Page Loads
#    RecordAnalyst_Dashboard.Verify the Record is not submitted and present in dashboard
##
##
#Test 34 :ProperPay:Communication Portal RA Dashboard_Verify after submitting record on RA dashbaord submited is not present on dashboard
#    [Documentation]    This test case Verifies that after submitting record on RA dashbaord   submited is not present on dashboard
#    [Tags]    Functional-TS30_TC_05
#
##     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordReviewOnlyQuery}
#    CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
#    RecordAnalyst_Dashboard.Click Record Request Tab
#    RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#    RecordAnalyst_Dashboard.Click Review button_RecordRequest
#    RecordAnalyst_Dashboard.Scroll down to the bottom of Record details page
#    BillingAnalyst_Dashboard.Verify Browse File Button is visible
#    BillingAnalyst_Dashboard.Upload a File    PDF     Required   ${PdfFilepath}
#    BillingAnalyst_Dashboard.Verify PDF file is uploaded sucessfully
#    RecordAnalyst_Dashboard.Click on Submit Documents button
#    RecordAnalyst_Dashboard.Verify that user is able to submit the documents after uploading the documents

Test 35 :ProperPay:Communication Portal RA Dashboard_Verify user is able to submit the documents after uploading the documents.
    [Documentation]    This test case Verifies that user is able to submit the documents after uploading the documents.
    [Tags]    Functional-TS30_TC_17

#    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordReviewOnlyQuery}
    CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
    LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
    RecordAnalyst_Dashboard.Click Record Request Tab
    RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
    RecordAnalyst_Dashboard.Click Review button_RecordRequest
    RecordAnalyst_Dashboard.Scroll down to the bottom of Record details page
    BillingAnalyst_Dashboard.Verify Browse File Button is visible
    BillingAnalyst_Dashboard.Upload a File    PDF     Required   ${PdfFilepath}
    BillingAnalyst_Dashboard.Verify PDF file is uploaded sucessfully
    RecordAnalyst_Dashboard.Click on Submit Documents button
    RecordAnalyst_Dashboard.Verify that user is able to submit the documents after uploading the documents
    RecordAnalyst_Dashboard.Verify submitted record is not present on Dashboard


#
Test 37 :ProperPay:Communication Portal RA Dashboard_Verify after submitted record presnet in audit history page with status "Record Request Submitted"
    [Documentation]    This test case Verifies that submitted record  presnet in audit history page with status "Record Request Submitted"
    [Tags]    Functional-TS30_TC_18
#	CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordReviewOnlyQuery}
    CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
    LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
    RecordAnalyst_Dashboard.Click Record Request Tab
    RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
    RecordAnalyst_Dashboard.Click Review button_RecordRequest
    RecordAnalyst_Dashboard.Scroll down to the bottom of Record details page
    BillingAnalyst_Dashboard.Verify Browse File Button is visible
    BillingAnalyst_Dashboard.Upload a File    PDF     Required   ${PdfFilepath}
    BillingAnalyst_Dashboard.Verify PDF file is uploaded sucessfully
    RecordAnalyst_Dashboard.Click on Submit Documents button
    RecordAnalyst_Dashboard.Verify that user is able to submit the documents after uploading the documents
    RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
    RecordAnalyst_Dashboard.Verify after submission of record presnet in audit history page      ${data_list[0]['PatientAccountNumber']}

#
Test 38 :ProperPay:Communication Portal BA Dashboard_validate_ Cancel Button is always enabled on RA Dashboard
    [Documentation]    This test case Verifies Cancel Button is always enabled on RA Dashboard
    [Tags]    Functional-TS30_TC_09
#   CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordReviewOnlyQuery}
    CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
    LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
    RecordAnalyst_Dashboard.Click Record Request Tab
    RecordAnalyst_Dashboard.Return Record Request Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
    RecordAnalyst_Dashboard.Click Review button_RecordRequest
    RecordAnalyst_Dashboard.Scroll down to the bottom of Record details page
    RecordAnalyst_Dashboard.Click Cancel button on Record Request Page
    RecordAnalyst_Dashboard.Verify CANCEL RECORDS SUBMISSION Pop up


Test 39: ProperPay:Communication Portal FilterFunctionality_validate_User is able to filter the results by providing Prepay
        [Documentation]    This test case Verifies that User is able to filter the results by providing Valid Prepay value
        [Tags]    Functional-TS31_TC_001_1
#        LoginPage.Valid User Login  ${RA_comm_usr_name}  ${RA_comm_pass}
        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
        LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
        RecordAnalyst_Dashboard.Click Record Request Tab
        BillingAnalyst_Dashboard.Click Filter Button
        BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Prepay value as No
        BillingAnalyst_Dashboard.Click Apply Filter Button
        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
        BillingAnalyst_Dashboard.Verify data after applying filter Functionality by selecting Prepay value as No
        Sleep  5
        BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Prepay value as Yes
        BillingAnalyst_Dashboard.Click Apply Filter Button
        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
        BillingAnalyst_Dashboard.Verify data after applying filter Functionality by selecting Prepay value as Yes


Test 40: ProperPay:Communication Portal ExportToExcel_validate_User is able to download the Record Requests using Export To Excel button
        [Documentation]    This test case Verifies that User is able to download the Record request  using Export To Excel button
        [Tags]    Functional-TS32_TC_001
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordReviewOnlyQuery}
        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
        LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
        RecordAnalyst_Dashboard.Click Record Request Tab
        CommonFunctionality.Wait Untill Page Loads
        RecordAnalyst_Dashboard.Fetch Total count of Record Request Tile on RA dashboard
        RecordAnalyst_Dashboard.Click Export Audit
        CommonFunctionality.Read from Excel          ${RecordRequestDownloadedExcelPath}
        RecordAnalyst_Dashboard.Verify the columns in the downloaded export
        RecordAnalyst_Dashboard.Verify the total records in the downloaded export


Test 41 :ProperPay:Communication Portal RA Dashboard_List_View_Verify Clicking on Review Button navigates to Record Details
   [Documentation]    This test case Verifies that Clicking on Review Displays Record Details Page in List View
   [Tags]    Functional-TS33_TC_001
#    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity       ${raDashabordReviewOnlyQuery}
    CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
    LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
    RecordAnalyst_Dashboard.Click Record Request Tab
    CommonFunctionality.Wait Untill Page Loads
    RecordAnalyst_Dashboard.Click List View Icon
    CommonFunctionality.Wait Untill Page Loads
    RecordAnalyst_Dashboard.Verify all the column headers are displayed
   RecordAnalyst_Dashboard.Fetch the First Audit Record From the List    ${raDashboardListAuditQuery}
   RecordAnalyst_Dashboard.Return AuditFindings List View Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
    RecordAnalyst_Dashboard.Click List View Review button
    RecordAnalyst_Dashboard.Verify record details are present
    RecordAnalyst_Dashboard.Scroll down to the bottom of Record details page
    RecordAnalyst_Dashboard.Verify Submit Document button is present

##
#Test 42 :ProperPay:Communication Portal RA Dashboard_List_View_Verify the Record Details
#   [Documentation]    This test case Verifies the Record details in List View
#   [Tags]    Functional-TS33_TC_002
##   CommonFunctionality.CommonFunctionalityConnect to DB to Read the Test Data According to TestData Avaialablity       ${raDashabordReviewOnlyQuery}
#    CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
#    RecordAnalyst_Dashboard.Click Record Request Tab
#    CommonFunctionality.Wait Untill Page Loads
#    RecordAnalyst_Dashboard.Click List View Icon
#    CommonFunctionality.Wait Untill Page Loads
#    RecordAnalyst_Dashboard.Fetch the First Audit Record From the List    ${raDashboardListAuditQuery}
#    RecordAnalyst_Dashboard.Verify Patient details in List View
#
#Test 43: ProperPay:Communication Portal RA dashbioard List View FilterFunctionality_validate_User is able to filter the results by providing Patient Account Number
#        [Documentation]    This test case Verifies that in List View User is able to filter the results by providing Valid Patient account number
#        [Tags]    Functional-TS34_TC_001
##         CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity       ${raDashabordReviewOnlyQuery}
#         CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
#        CommonFunctionality.Wait Untill Page Loads
#        RecordAnalyst_Dashboard.Click Record Request Tab
#        CommonFunctionality.Wait Untill Page Loads
#        RecordAnalyst_Dashboard.Click List View Icon
#        CommonFunctionality.Wait Untill Page Loads
#        BillingAnalyst_Dashboard.Click Filter Button
#        RecordAnalyst_Dashboard.Verify filter Functionality by providing Valid Patient Account Number In List View   ${data_list[0]['PatientAccountNumber']}
#        CommonFunctionality.Wait Untill Page Loads
#        RecordAnalyst_Dashboard.Validate the Count of Record After Applyiing filter
#        RecordAnalyst_Dashboard.Verify data after applying filter Functionality for Patient Account Number In List View
#
#
#Test 44: ProperPay:Communication Portal RA Dashboard List View FilterFunctionality_validate_User is able to filter the results by providing Audit Number
#        [Documentation]    This test case Verifies that in List View User is able to filter the results by providing Valid Audit number
#        [Tags]    Functional-TS34_TC_002
##         CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity       ${raDashabordReviewOnlyQuery}
#         CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
#        CommonFunctionality.Wait Untill Page Loads
#        RecordAnalyst_Dashboard.Click Record Request Tab
#        CommonFunctionality.Wait Untill Page Loads
#        RecordAnalyst_Dashboard.Click List View Icon
#        CommonFunctionality.Wait Untill Page Loads
#        BillingAnalyst_Dashboard.Click Filter Button
#        BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Audit Number
#        CommonFunctionality.Wait Untill Page Loads
#        RecordAnalyst_Dashboard.Validate the Count of Record After Applyiing filter
#        RecordAnalyst_Dashboard.Verify data after applying filter Functionality for Audit Number In List View
####
#Test 45: ProperPay:Communication Portal RA Dashboard_List_View_Verify_Filter_Functionality_validate_User is able to filter the results by providing Prepay
#     [Documentation]    This test case Verifies that In List View User is able to filter the results by providing Valid Prepay value
#     [Tags]    Functional-TS34_TC_003
##     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity       ${raDashabordReviewOnlyQuery}
#     CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#     LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
#     CommonFunctionality.Wait Untill Page Loads
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     CommonFunctionality.Wait Untill Page Loads
#     RecordAnalyst_Dashboard.Click List View Icon
#     CommonFunctionality.Wait Untill Page Loads
#     BillingAnalyst_Dashboard.Click Filter Button
#     BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Prepay value as No
#     RecordAnalyst_Dashboard.Scroll down to the bottom of page
#     BillingAnalyst_Dashboard.Verify data after applying filter Functionality In List View by selecting Prepay value as No
#     Sleep  5
#     BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Prepay value as Yes
#     BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#     BillingAnalyst_Dashboard.Verify data after applying filter Functionality In List View by selecting Prepay value as Yes
##
####
#Test 46: ProperPay:Communication Portal RA DashBoard List View FilterFunctionality_validate_User is able to filter the results by providing Provider Number
#        [Documentation]    This test case Verifies that in List View User is able to filter the results by providing Valid Provider number
#        [Tags]    Functional-TS34_TC_004
##         CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity       ${raDashabordReviewOnlyQuery}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
#        CommonFunctionality.Wait Untill Page Loads
#        RecordAnalyst_Dashboard.Click Record Request Tab
#        CommonFunctionality.Wait Untill Page Loads
#        RecordAnalyst_Dashboard.Click List View Icon
#        CommonFunctionality.Wait Untill Page Loads
#        BillingAnalyst_Dashboard.Click Filter Button
#        RecordAnalyst_Dashboard.Verify Filter Functionality By Providing Valid Provider Number In List View     ${data_list[0]['BillingProviderNumber']}
#        CommonFunctionality.Wait Untill Page Loads
#        RecordAnalyst_Dashboard.Verify data after applying filter Functionality for Provider Number In List View
#
#
#Test 47: ProperPay:Communication Portal RA Dashboard List View FilterFunctionality_validate_User is able to filter the results by providing Medical Record Number
#        [Documentation]    This test case Verifies that in List View User is able to filter the results by providing Valid Medical Record number
#        [Tags]    Functional-TS34_TC_005
##       CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity       ${raDashabordReviewOnlyQuery}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
#        CommonFunctionality.Wait Untill Page Loads
#        RecordAnalyst_Dashboard.Click Record Request Tab
#        CommonFunctionality.Wait Untill Page Loads
#        RecordAnalyst_Dashboard.Click List View Icon
#        CommonFunctionality.Wait Untill Page Loads
#        BillingAnalyst_Dashboard.Click Filter Button
#        BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Medical Record Number
#        CommonFunctionality.Wait Untill Page Loads
#        RecordAnalyst_Dashboard.Verify data after applying filter Functionality for Medical Record Number In List View
#
#Test 48 :ProperPay:Communication Portal RA Dashboard List_View RA Dashboard_verify user is able to filter records by providing Claim Type as InPATIENT
#     [Documentation]    This test case Verifies that user is able to filter records by providing Claim Type as INPATIENT in List View
#     [Tags]    Functional-TS34_TC_006
##         CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity    ${raDashabordIPRecordQuery}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
#        RecordAnalyst_Dashboard.Click Record Request Tab
#        LoginPage.Verify RA Dashboard is visible
#         CommonFunctionality.Wait Untill Page Loads
#        RecordAnalyst_Dashboard.Click List View Icon
#        CommonFunctionality.Wait Untill Page Loads
#        BillingAnalyst_Dashboard.Click Filter Button
#        RecordAnalyst_Dashboard.Verify filter Functionality by providing Claim Type         Inpatient
#        RecordAnalyst_Dashboard.Verify filter result In List View after providing Claim Type as Inpatient
#
#Test 49: ProperPay:Communication Portal RA dashboard List View FilterFunctionality_validate_User is able to filter the results by providing Days Remaining Untill Due Date
#    [Documentation]    This test case Verifies that in List View User is able to filter the results by providing Valid Days Remaining Untill Due Date
#    [Tags]    Functional-TS34_TC_007
##        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity       ${raDashabordReviewOnlyQuery}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
#        CommonFunctionality.Wait Untill Page Loads
#        RecordAnalyst_Dashboard.Click Record Request Tab
#        CommonFunctionality.Wait Untill Page Loads
#        RecordAnalyst_Dashboard.Click List View Icon
#        CommonFunctionality.Wait Untill Page Loads
#        BillingAnalyst_Dashboard.Click Filter Button
#        RecordAnalyst_Dashboard.Verify filter Functionality by providing DAYS REMAINING UNTIL DUE DATE      ${DAYS REMAINING UNTIL DUE DATE OVERDUE}
#        CommonFunctionality.Wait Untill Page Loads
#        RecordAnalyst_Dashboard.Verify data after applying filter Functionality In List View by providing DAYS REMAINING UNTIL DUE DATE - OVERDUE


#Test 50 :ProperPay:Communication Portal RA Dashboard List View_validate_request extension functinality
#     [Documentation]    This test case Verifies that request extension link is no longer available on the tile after requesting one extesion for a claim.
#     [Tags]    Functional-TS35_TC_001
#     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${raDashabordExtensionQuery}
#     LoginPage.Valid User Login According to Test Data Availability   ${RA_comm_usr_name}  ${RA_comm_pass}
#     RecordAnalyst_Dashboard.Click Record Request Tab
#     CommonFunctionality.Wait Untill Page Loads
#     RecordAnalyst_Dashboard.Click List View Icon
#     CommonFunctionality.Wait Untill Page Loads
#     BillingAnalyst_Dashboard.Click Filter Button
#     BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Audit Number
#     BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#     RecordAnalyst_Dashboard.Return request extension Button locator In List View with patient account number passed by user    ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Verify that the request extension button is present on the identified record request tile
#     RecordAnalyst_Dashboard.Return request extension Days Remaining locator In List View with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Verify the number of days remaining to submit is reflected on tiles before requesting extension
#     RecordAnalyst_Dashboard.Click Request extension button and verify the Request Extension pop up is displayed
#     RecordAnalyst_Dashboard.Verify the Request Extension confirmation message       ${data_list[0]['PatientFirstName']}          ${data_list[0]['PatientLastName']}
#     RecordAnalyst_Dashboard.Return request extension Granted locator In List View with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Click Confirm Request Button and verify the Request Extension is no longer available on the tile
#     Sleep    5

#
#Test 51 :ProperPay:Communication Portal RA Dashboard_List_View_Verify User can sort the list of available Record requests based on all the column header displayed
#    [Documentation]  This test case verifies User is able to sort the list of available Record requests based on all the column header displayed.
#    [Tags]  Functional TS36_TC_001
##    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${raDashabordReviewOnlyQuery}
#    CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity      ${raDashabordReviewOnlyQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    CommonFunctionality.Wait Untill Page Loads
#    RecordAnalyst_Dashboard.Click Record Request Tab
#    CommonFunctionality.Wait Untill Page Loads
#    RecordAnalyst_Dashboard.Click List View Icon
#    RecordAnalyst_Dashboard.Double Click Patient Name header in RA dashboard List View Tab and verify sorting is done in Ascending order
#    RecordAnalyst_Dashboard.Double Click Patient Account Number header in RA dashboard List View Tab and verify sorting is done in Ascending order
#    RecordAnalyst_Dashboard.Double Click prepay header in RA dashboard List View Tab and verify sorting is done in Ascending order
#    RecordAnalyst_Dashboard.Double Click Provider Name header in RA dashboard List View Tab and verify sorting is done in Ascending order
#    RecordAnalyst_Dashboard.Double click Birth Date header in RA dashboard List View Tab and verify sorting is done in Ascending order
#    RecordAnalyst_Dashboard.Double click Date Of Service header in RA dashboard List View Tab and verify sorting is done in Ascending order
#    RecordAnalyst_Dashboard.Double click Provider Number header in RA dashboard List View Tab and verify sorting is done in Ascending order
#    RecordAnalyst_Dashboard.Double click Audit Number header in RA dashboard List View Tab and verify sorting is done in Ascending order
#    RecordAnalyst_Dashboard.Double click Claim Number header in RA dashboard List View Tab and verify sorting is done in Ascending order
#    RecordAnalyst_Dashboard.Double click Medical Record Number header in RA dashboard List View Tab and verify sorting is done in Ascending order
#    RecordAnalyst_Dashboard.Double click Due Date header in RA dashboard List View Tab and verify sorting is done in Ascending order
#    RecordAnalyst_Dashboard.Double click Days Left header in RA dashboard List View Tab and verify sorting is done in Ascending order



Test 52:ProperPay:Communication Portal RA Dashboard_List_View_Verify the pagination links
    [Documentation]  This test case verifies User is able to navigate through the different paginations links
    [Tags]  Functional TS37_TC_001
#    BillingAnalyst_Dashboard.Connect to Db with more than 10 records        ${raDashabordReviewOnlyQuery}
     BillingAnalyst_Dashboard.Connect to Cloud Db with more than 10 records       ${raDashabordReviewOnlyQuery}
     LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
     CommonFunctionality.Wait Untill Page Loads
     RecordAnalyst_Dashboard.Click Record Request Tab
     RecordAnalyst_Dashboard.Click List View Icon
     CommonFunctionality.Wait Untill Page Loads
    RecordAnalyst_Dashboard.Verify that only 10 records per page are displayed
    BillingAnalyst_Dashboard.Verify clicking on Next displays next page
    BillingAnalyst_Dashboard.Verify clicking on Previous displays previous page