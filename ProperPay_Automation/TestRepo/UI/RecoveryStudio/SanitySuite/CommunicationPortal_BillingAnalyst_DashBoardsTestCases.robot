*** Settings ***
Documentation     Communication Portal Billing Analyst DashBoard Functional test
Resource    ../ProperPay_Automation/Resource/UI/CommonFunctionality/CommonFunctionality.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/LoginPage.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/BillingAnalyst_Dashboard.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/RecordAnalyst_Dashboard.robot
Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//BillingAnalyst_DashBoard_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//BillingAnalyst_DashBoard_TestData.yaml


Test Setup      CommonFunctionality.Launch Communication Portal Page
Test Teardown   CommonFunctionality.Finish TestCase

*** Test Cases ***

Test 1 :ProperPay:Communication Portal BA Dashboard_validate_Upload of Non PDF file. (Appeal findings tile)
    [Documentation]    This test case Verifies that When Billing Analyst clicks on the Browse Files , only .PFD files will be allowed to attach. Files with any other extension will not be allowed or not visible in the browsing location.(Appeal Finding Tiles)
    [Tags]    Functional-TS14_TC_002

    CommonFunctionality.Connect to DB to Read the Test Data     ${baDashabordAppealQuery}
    LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
    BillingAnalyst_Dashboard.Click Audit Results Tab
    Return AppealFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
    BillingAnalyst_Dashboard.Click Review button_AppealFindings
    BillingAnalyst_Dashboard.Click latest Appeal tab
    BillingAnalyst_Dashboard.Scroll down to the bottom of audit detail page
    BillingAnalyst_Dashboard.Click Appeal Findings button
    BillingAnalyst_Dashboard.Verify Upload Documents Tab is visible
    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
    BillingAnalyst_Dashboard.Verify Browse File Button is visible
    BillingAnalyst_Dashboard.Upload a File      NonPDF    None    ${PdfFilepath}
    BillingAnalyst_Dashboard.Verify NonPDF file is not uploaded


Test 2 :ProperPay:Communication Portal BA Dashboard_validate_Upload of duplicate PDF file.(Appeal Findings Tile)
    [Documentation]    This test case Verifies that user is not able to upload duplicate files(same file) (Appeal Findings Tile)
    [Tags]    Functional-TS14_TC_005

	CommonFunctionality.Connect to DB to Read the Test Data     ${baDashabordAppealQuery}
    LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
    BillingAnalyst_Dashboard.Click Audit Results Tab
    Return AppealFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
    BillingAnalyst_Dashboard.Click Review button_AppealFindings
    BillingAnalyst_Dashboard.Click latest Appeal tab
    BillingAnalyst_Dashboard.Scroll down to the bottom of audit detail page
    BillingAnalyst_Dashboard.Click Appeal Findings button
    BillingAnalyst_Dashboard.Verify Upload Documents Tab is visible
    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
    BillingAnalyst_Dashboard.Verify Browse File Button is visible
    BillingAnalyst_Dashboard.Upload a File    PDF   Required   ${PdfFilepath}
    BillingAnalyst_Dashboard.Upload a File    PDF   Required   ${PdfFilepath}
    BillingAnalyst_Dashboard.Verify Document uploading errors window appears with FileAlreadyExists error message
    BillingAnalyst_Dashboard.Remove the Attached Document
#
Test 3 :ProperPay:Communication Portal BA Dashboard_validate_Upload of Non PDF file. (Audit findings tile)
    [Documentation]    This test case Verifies that When Billing Analyst clicks on the Browse Files , only .PFD files will be allowed to attach. Files with any other extension will not be allowed or not visible in the browsing location.(Audit Finding Tiles)
    [Tags]    Functional-TS14_TC_007
     CommonFunctionality.Connect to DB to Read the Test Data     ${baDashabordAuditQuery}
    LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
    BillingAnalyst_Dashboard.Click Audit Results Tab
    BillingAnalyst_Dashboard.Return AuditFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
    BillingAnalyst_Dashboard.Click Review button_AuditFinding
    BillingAnalyst_Dashboard.Scroll down to the bottom of audit detail page
    BillingAnalyst_Dashboard.Click Appeal Findings button
    BillingAnalyst_Dashboard.Verify Upload Documents Tab is visible
    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
    BillingAnalyst_Dashboard.Verify Browse File Button is visible
    BillingAnalyst_Dashboard.Upload a File      NonPDF    None   ${PdfFilepath}
    BillingAnalyst_Dashboard.Verify NonPDF file is not uploaded


Test 4 :ProperPay:Communication Portal BA Dashboard_validate_AUDIT FINDINGS Details are visible clicking on Review button of the AUDIT FINDINGS Tile
    [Documentation]    This test case Verifies that User can click on the Review button of the AUDIT FINDINGS Tile and  can view the audit findings details.
    [Tags]    Functional-TS9_TC_004
    CommonFunctionality.Connect to DB to Read the Test Data     ${baDashabordAuditQuery}
    LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
    BillingAnalyst_Dashboard.Click Audit Results Tab
    BillingAnalyst_Dashboard.Return AuditFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
    BillingAnalyst_Dashboard.Click Review button_AuditFinding
    BillingAnalyst_Dashboard.Verify Audit findings details entered is visible
    Sleep    5

Test 5 :ProperPay:Communication Portal BA Dashboard_validate_APPEAL FINDINGS Details are visible clicking on Review button of the APPEAL FINDINGS Tile
    [Documentation]    This test case Verifies that User can click on the Review button of the APPEAL FINDINGS Tile and  can view the appeal findings details.
    [Tags]    Functional-TS9_TC_005

    CommonFunctionality.Connect to DB to Read the Test Data     ${baDashabordAppealQuery}
    LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
    BillingAnalyst_Dashboard.Click Audit Results Tab
    Return AppealFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
    BillingAnalyst_Dashboard.Click Review button_AppealFindings
    BillingAnalyst_Dashboard.Verify Appeal findings details entered is visible
    Sleep    5


Test 6 :ProperPay:Communication Portal BA Dashboard_validate_only AUDIT RESULTS Dashboard is displayed and RECORD REQUEST and Payer Dashboard is not displayed when looged in as Record Analyst
     [Documentation]    This test case Verifies that validate_only Record Request Dashboard is displayed and Billing Analyst and Payer Dashboard is not displayed when looged in as Record Analyst
     [Tags]    Functional-TS08_TC_001

     #Pre-Req
     CommonFunctionality.Launch AdminUI Page
     CommonFunctionality.Login AdmiUI Page   ${BA_comm_usr_name}  ${BA_comm_pass}
     CommonFunctionality.Open the required user in Admin page   ${BA_comm_usr_name}
     CommonFunctionality.Scroll down to the bottom of Admin Ui page
     CommonFunctionality.User Role Configuration in Admin page  ${Required_Role2}
     #Steps
     CommonFunctionality.Launch Communication Portal Page
     LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
     LoginPage.Verify BA Dashboard is visible
     LoginPage.Verify Payer Dashboard is not visible
     LoginPage.Verify RA Dashboard is not visible
     #Reset build
     CommonFunctionality.Launch AdminUI Page
     CommonFunctionality.Login AdmiUI Page   ${BA_comm_usr_name}  ${BA_comm_pass}
     CommonFunctionality.Open the required user in Admin page   ${BA_comm_usr_name}
     CommonFunctionality.Scroll down to the bottom of Admin Ui page
     CommonFunctionality.Reset User Role Configuration in Admin page     ${Reset_Role2}


Test 7 :ProperPay:Communication Portal BA Dashboard_validate_Billing analyst is able to see BA dashboard along with the total number of Audit Results mentioned in the braces
    [Documentation]    This test case Verifies that Billi ng analyst is able to see BA dashboard along with the total number of Audit Results mentioned in the braces.
    [Tags]    Functional-TS08_TC_004

    LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
    BillingAnalyst_Dashboard.Click Audit Results Tab
    BillingAnalyst_Dashboard.Fetch Total count of Audit Results Tile on BA dashboard
    BillingAnalyst_Dashboard.Replace the dynamically fetched Audit Results Tile total count number
    BillingAnalyst_Dashboard.Validate the Audit Results tab contains the total count of tiles
    Sleep    5

Test 8 :ProperPay:Communication Portal BA Dashboard_validate_request extension link is no longer available on the Audit finding and Appeal finding tiles after requesting one extesion for a audit.
     [Documentation]    This test case Verifies that request extension link is no longer available on the Audit finding and Appeal finding tiles after requesting one extesion for a audit.
     [Tags]    Functional-TS21_TC_006

     CommonFunctionality.Connect to DB to Read the Test Data     ${baDashabordAppealExtensionQuery}
     LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
     BillingAnalyst_Dashboard.Click Audit Results Tab

     BillingAnalyst_Dashboard.Return request extension Button locator on AppealFindings Tile with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
     BillingAnalyst_Dashboard.Verify that the request extension button is present on the identified AppealFindings Tile
     BillingAnalyst_Dashboard.Click Request extension button on the AppealFindings Tile and verify the Request Extension pop up is displayed
     BillingAnalyst_Dashboard.Verify the Request Extension pop up of a appeal contains a message and confirm request button        ${data_list[0]['PatientFirstName']}          ${data_list[0]['PatientLastName']}
     BillingAnalyst_Dashboard.Return AppealFindings request extension Granted locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
     BillingAnalyst_Dashboard.Click Confirm Request Button and verify the Request Extension is no longer available on the AppealFindings tile
     Sleep    5
     CommonFunctionality.Connect to DB to Read the Test Data     ${baDashabordAuditExtensionQuery}
     BillingAnalyst_Dashboard.Return request extension Button locator on AuditFindings Tile with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
     BillingAnalyst_Dashboard.Verify that the request extension button is present on the identified AuditFindings Tile
     BillingAnalyst_Dashboard.Click Request extension button on the AuditFindings Tile and verify the Request Extension pop up is displayed
     BillingAnalyst_Dashboard.Verify the Request Extension pop up of a audit contains a message and confirm request button      ${data_list[0]['PatientFirstName']}          ${data_list[0]['PatientLastName']}
     BillingAnalyst_Dashboard.Return AuditFindings request extension Granted locator with patient account number passed by user  ${data_list[0['PatientAccountNumber']}
     BillingAnalyst_Dashboard.Click Confirm Request Button and verify the Request Extension is no longer available on the AuditFindings tile


Test 9 :ProperPay:Communication Portal BA Dashboard_validate_additional 14 days will be added to the days to submit audits and appeals after clicking on Record Extension button.
     [Documentation]    This test case Verifies that additional 14 days will be added to the days to submit audits and appeals after clicking on Record Extension button.
     [Tags]    Functional-TS21_TC_005

     LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
     BillingAnalyst_Dashboard.Click Audit Results Tab
     BillingAnalyst_Dashboard.Return request extension Button locator on AppealFindings Tile with patient account number passed by user   ${AppealREPtAccNum}
     BillingAnalyst_Dashboard.Verify that the request extension button is present on the identified AppealFindings Tile
     BillingAnalyst_Dashboard.Return AppealFindings request extension Days Remaining locator with patient account number passed by user   ${AppealREPtAccNum}
     BillingAnalyst_Dashboard.Verify the number of days remaining to submit is reflected on Appeal tiles before requesting extension
     BillingAnalyst_Dashboard.Add 14 days to the number of day remaining to submit on Appeal tiles
     BillingAnalyst_Dashboard.Click Request extension button on the AppealFindings Tile and verify the Request Extension pop up is displayed
     BillingAnalyst_Dashboard.Verify the Request Extension pop up of a appeal contains a message and confirm request button
     BillingAnalyst_Dashboard.Return AppealFindings request extension Granted locator with patient account number passed by user  ${AppealREPtAccNum}
     BillingAnalyst_Dashboard.Click Confirm Request Button and verify the Request Extension is no longer available on the AppealFindings tile
     BillingAnalyst_Dashboard.Verify additional 14 days is added to number of days remaining to submit after requesting extension on Appeal tile
     Sleep    5
     BillingAnalyst_Dashboard.Return request extension Button locator on AuditFindings Tile with patient account number passed by user   ${AuditREPtAccNum}
     BillingAnalyst_Dashboard.Verify that the request extension button is present on the identified AuditFindings Tile
     BillingAnalyst_Dashboard.Return AuditFindings request extension Days Remaining locator with patient account number passed by user   ${AuditREPtAccNum}
     BillingAnalyst_Dashboard.Verify the number of days remaining to submit is reflected on Audit tiles before requesting extension
     BillingAnalyst_Dashboard.Add 14 days to the number of day remaining to submit on Audit tiles
     BillingAnalyst_Dashboard.Click Request extension button on the AuditFindings Tile and verify the Request Extension pop up is displayed
     BillingAnalyst_Dashboard.Verify the Request Extension pop up of a audit contains a message and confirm request button
     BillingAnalyst_Dashboard.Return AuditFindings request extension Granted locator with patient account number passed by user  ${AuditREPtAccNum}
     BillingAnalyst_Dashboard.Click Confirm Request Button and verify the Request Extension is no longer available on the AuditFindings tile
     BillingAnalyst_Dashboard.Verify additional 14 days is added to number of days remaining to submit after requesting extension on Audit tile



##AN
##DEFECT ON HOLD INCOMPLETE
Test 10 :ProperPay:Communication Portal BA Dashboard_validate_that agreement which is successfully submited presnet in audit history page with audit status as "Provider aggrement"
    [Documentation]    This test case Verifies that agreement which is successfully submited presnet in audit history page with audit status as "Provider aggrement"
    [Tags]    Functional-TS30_TC_04

	CommonFunctionality.Connect to DB to Read the Test Data     ${baDashabordLevel1AppealQuery}
    LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
    BillingAnalyst_Dashboard.Click Audit Results Tab
    Return AppealFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
    BillingAnalyst_Dashboard.Click Review button_AppealFindings
    BillingAnalyst_Dashboard.Click latest Appeal tab
    BillingAnalyst_Dashboard.Scroll down to the bottom of audit detail page
    BillingAnalyst_Dashboard.Click Agree with Findings button
    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
    BillingAnalyst_Dashboard.Click Confirm Agreement Button
    BillingAnalyst_Dashboard.Verify CONFIRM FINDINGS AGREEMENT pop up
    BillingAnalyst_Dashboard.Click YES button in Confirm FIndings Agreement pop up
   #BillingAnalyst_Dashboard.Click GoToDashboard button in the appeal submission success pop up
    History.Verify History page is displayed on clicking History Icon
    CommonFunctionality.Wait Untill Page Loads
    RecordAnalyst_Dashboard.Verify after submission of record presnet in audit history page    ${data_list[0]['PatientAccountNumber']}
#
###
Test 11 :ProperPay:Communication Portal BA Dashboard_validate_that agreement which is successfully submited presnet in audit history page with audit status as " Appeal Submitted"
    [Documentation]    This test case Verifies that agreement which is successfully submited presnet in audit history page with audit status as " Appeal Submitted"
    [Tags]    Functional-TS30_TC_015
    CommonFunctionality.Connect to DB to Read the Test Data     ${baDashabordAuditQuery}
    LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
    BillingAnalyst_Dashboard.Click Audit Results Tab
    BillingAnalyst_Dashboard.Return AuditFindings Review Button locator with patient account number passed by user    ${data_list[0]['PatientAccountNumber']}
    BillingAnalyst_Dashboard.Click Review button_AuditFinding
    BillingAnalyst_Dashboard.Click Agree with Findings button
    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
    BillingAnalyst_Dashboard.Verify Authorized eSignature details for AgreeWithFindings
    BillingAnalyst_Dashboard.Click Confirm Agreement Button
    BillingAnalyst_Dashboard.Verify CONFIRM FINDINGS AGREEMENT pop up
    BillingAnalyst_Dashboard.Click YES button in Confirm FIndings Agreement pop up
    BillingAnalyst_Dashboard.Click GoToDashboard button in the submission success pop up
    CommonFunctionality.Wait Untill Page Loads
    RecordAnalyst_Dashboard.Verify after submission of record presnet in audit history page    ${data_list[0]['PatientAccountNumber']}


##Satheesh
##DEFECT on HOLD INCOMPLETE
Test 12 :ProperPay:Communication Portal BA Dashboard_validate_user is able to Confirm Appeal and submited appeal is not present on dashboard
    [Documentation]    This test case Verifies user is able to Confirm Appeal and submited appeal is not present on dashboard
    [Tags]    Functional-TS30_TC_013

    CommonFunctionality.Connect to DB to Read the Test Data     ${baDashabordLevel1AppealQuery}
    LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
    BillingAnalyst_Dashboard.Click Audit Results Tab
    Return AppealFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
    BillingAnalyst_Dashboard.Click Review button_AppealFindings
    BillingAnalyst_Dashboard.Click latest Appeal tab
    BillingAnalyst_Dashboard.Scroll down to the bottom of audit detail page
    BillingAnalyst_Dashboard.Click Appeal Findings button
    BillingAnalyst_Dashboard.Verify Browse File Button is visible
    BillingAnalyst_Dashboard.Remove the Existing attachment of Appeal details page
    BillingAnalyst_Dashboard.Upload a File    PDF     Required   ${PdfFilepath}
    BillingAnalyst_Dashboard.Verify PDF file is uploaded sucessfully
    BillingAnalyst_Dashboard.Enter reason for appeal
    BillingAnalyst_Dashboard.Click Confirm Appeal Button
    BillingAnalyst_Dashboard.Verify Confirm Findings Appeal Pop up and Click Yes button
    BillingAnalyst_Dashboard.Click GoToDashboard Button In The Submission Success Pop Up
    CommonFunctionality.Wait Untill Page Loads
    BillingAnalyst_Dashboard.Verify the Appeal submitted is not present in dashboard

##DEFECT ON HOLD INCOMPLETE
Test 13 :ProperPay:Communication Portal BA Dashboard_validate_user is able to Confirm Aggrement and submited agreement is not present on dashboard
    [Documentation]    This test case Verifies user is able to Confirm Aggrement and submited agreement is not present on dashboard
    [Tags]    Functional-TS30_TC_014

    CommonFunctionality.Connect to DB to Read the Test Data     ${baDashabordLevel1AppealQuery}
    LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
    BillingAnalyst_Dashboard.Click Audit Results Tab
    Return AppealFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
    BillingAnalyst_Dashboard.Click Review button_AppealFindings
    BillingAnalyst_Dashboard.Click latest Appeal tab
    BillingAnalyst_Dashboard.Scroll down to the bottom of audit detail page
    BillingAnalyst_Dashboard.Click Agree with Findings button
    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
    Verify BillingAnalyst_AppealFindings_Authorized_eSignature Tab is visible
    BillingAnalyst_Dashboard.Click Confirm Agreement Button
    BillingAnalyst_Dashboard.Click YES button in Confirm FIndings Agreement pop up
    BillingAnalyst_Dashboard.Click GoToDashboard button in the submission success pop up
    CommonFunctionality.Wait Untill Page Loads
    RecordAnalyst_Dashboard.Verify after submission of record presnet in audit history page    ${data_list[0]['PatientAccountNumber']}


