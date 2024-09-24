*** Settings ***
Documentation     Communication Portal Billing Analyst DashBoard Functioal test
Resource    ../ProperPay_Automation/Resource/UI/CommonFunctionality/CommonFunctionality.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/LoginPage.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/BillingAnalyst_Dashboard.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/RecordAnalyst_Dashboard.robot
Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//BillingAnalyst_DashBoard_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//BillingAnalyst_DashBoard_TestData.yaml


#Test Setup      Launch Communication Portal Page
Test Setup      CommonFunctionality.Launch Cloud Communication Portal Page
Test Teardown   CommonFunctionality.Finish TestCase



*** Test Cases ***

Test 1 :ProperPay:Communication Portal BA Dashboard_validate_Respond to the Audit Findings.
   [Documentation]    This test case Verifies that the Appeal Findings and Agree with Findings  button is present to respond to Audit findings.
   [Tags]    TS11_TC_001
#    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditQuery}
    CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditQuery}
    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
    BillingAnalyst_Dashboard.Click Audit Results Tab

    Return AuditFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
    BillingAnalyst_Dashboard.Click Review button_AuditFinding
    BillingAnalyst_Dashboard.Scroll down to the bottom of page
    BillingAnalyst_Dashboard.Verify Agree with Findings button is present
    BillingAnalyst_Dashboard.Verify Appeal Findings button is present



#Test 2 :ProperPay:Communication Portal BA Dashboard_validate_Respond to the Appeal Findings.
#    [Documentation]    This test case Verifies that the Appeal Findings ad Agree with Findings  button is present to respond to Appeal findings.
#    [Tags]    Functional-TS11_TC_002
#
##    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity       ${baDashabordAppealQuery}
#    CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAppealQuery}
#    LoginPage.Valid User Login According to Test Data Availability     ${BA_comm_usr_name}  ${BA_comm_pass}
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    CommonFunctionality.Wait Untill Page Loads
#    Return AppealFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Review button_AppealFindings
#    BillingAnalyst_Dashboard.Click latest Appeal tab
#    BillingAnalyst_Dashboard.Scroll down to the bottom of audit detail page
#    BillingAnalyst_Dashboard.Verify Agree with Findings button is present
#    BillingAnalyst_Dashboard.Verify Appeal Findings button is present
#
####
#Test 3 :ProperPay:Communication Portal BA Dashboard_validate_Upload Documents and Comments and Authorized eSignature is enabled when clicked on Appeal Findings.
#    [Documentation]    This test case Verifies that Upload Documents and Comments and Authorized eSignature is enabled when clicked on Appeal Findings.
#    [Tags]    Functional-TS11_TC_003
#
##    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${baDashabordAppealQuery}
#    CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAppealQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    Return AppealFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Review button_AppealFindings
#    BillingAnalyst_Dashboard.Click latest Appeal tab
#    BillingAnalyst_Dashboard.Scroll down to the bottom of audit detail page
#    BillingAnalyst_Dashboard.Verify Appeal Findings button is present
#    BillingAnalyst_Dashboard.Verify Upload Documents Tab is not visible
#    BillingAnalyst_Dashboard.Click Appeal Findings button
#    BillingAnalyst_Dashboard.Verify Upload Documents Tab is visible
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
#    BillingAnalyst_Dashboard.Verify Browse File Button is visible
#    BillingAnalyst_Dashboard.Verify BillingAnalyst_AppealFindings_Comments_Authorized_eSignature Tab is visible
#
####
#Test 4 :ProperPay:Communication Portal BA Dashboard_validate_Upload Documents and Comments and Authorized eSignature is enabled when clicked on Agree with Findings.
#    [Documentation]    This test case Verifies that Authorized eSignature is enabled when clicked on Agree with Findings.
#    [Tags]    Functional-TS11_TC_004
#
#    CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAppealQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    Return AppealFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Review button_AppealFindings
#    BillingAnalyst_Dashboard.Click latest Appeal tab
#    BillingAnalyst_Dashboard.Scroll down to the bottom of audit detail page
#    BillingAnalyst_Dashboard.Click Agree with Findings button
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
#    Verify BillingAnalyst_AppealFindings_Authorized_eSignature Tab is visible
#
##
#Test 5 :ProperPay:Communication Portal BA Dashboard_validate_Billing Analyst is allowed to upload the documents while a appeal.(Appeal findings tile)
#    [Documentation]    This test case Verifies that Billing Analyst is allowed to upload the documents while a appeal.When User clicks on the option Appeal Findings, 'Upload Documents' tab  will be enabled to upload the Required Documents and Optional Documents.
#    [Tags]    Functional-TS14_TC_001
#
##     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity      ${baDashabordAppealQuery}
#    CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAppealQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    Return AppealFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Review button_AppealFindings
#    BillingAnalyst_Dashboard.Click latest Appeal tab
#    BillingAnalyst_Dashboard.Scroll down to the bottom of audit detail page
#    BillingAnalyst_Dashboard.Click Appeal Findings button
#    BillingAnalyst_Dashboard.Verify Upload Documents Tab is visible
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
#    BillingAnalyst_Dashboard.Verify Browse File Button is visible
#    BillingAnalyst_Dashboard.Upload a File    PDF     Required   ${PdfFilepath}
#    BillingAnalyst_Dashboard.Verify PDF file is uploaded sucessfully
#    BillingAnalyst_Dashboard.Remove the Attached Document
#
###
#Test 6 :ProperPay:Communication Portal BA Dashboard_validate_Upload of Non PDF file. (Appeal findings tile)
#    [Documentation]    This test case Verifies that When Billing Analyst clicks on the Browse Files , only .PFD files will be allowed to attach. Files with any other extension will not be allowed or not visible in the browsing location.(Appeal Finding Tiles)
#    [Tags]    Functional-TS14_TC_002
#
##   CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity      ${baDashabordAppealQuery}
#    CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAppealQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    Return AppealFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Review button_AppealFindings
#    BillingAnalyst_Dashboard.Click latest Appeal tab
#    BillingAnalyst_Dashboard.Scroll down to the bottom of audit detail page
#    BillingAnalyst_Dashboard.Click Appeal Findings button
#    BillingAnalyst_Dashboard.Verify Upload Documents Tab is visible
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
#    BillingAnalyst_Dashboard.Verify Browse File Button is visible
#    BillingAnalyst_Dashboard.Upload a File      NonPDF    None    ${NonPdfFilePath}
#    BillingAnalyst_Dashboard.Verify NonPDF file is not uploaded
#
#
#Test 7 :ProperPay:Communication Portal BA Dashboard_validate_confirm Appeal button is enabled.
#    [Documentation]    This test case Verifies that after uploading the documents and entering the reason for appeal and all the mandatory feilds like Esignature ,TITLE and Date, the confirm Appeal button is enabled .
#    [Tags]    Functional-TS14_TC_003
##    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity      ${baDashabordAppealQuery}
#    CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAppealQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    Return AppealFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Review button_AppealFindings
#    BillingAnalyst_Dashboard.Click latest Appeal tab
#    BillingAnalyst_Dashboard.Scroll down to the bottom of audit detail page
#    BillingAnalyst_Dashboard.Click Appeal Findings button
#    BillingAnalyst_Dashboard.Verify Upload Documents Tab is visible
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
#    BillingAnalyst_Dashboard.Verify Browse File Button is visible
#    BillingAnalyst_Dashboard.Upload a File    PDF    Required   ${PdfFilepath}
#    BillingAnalyst_Dashboard.Verify PDF file is uploaded sucessfully
#    BillingAnalyst_Dashboard.Verify Authorized eSignature details
#    BillingAnalyst_Dashboard.Enter reason for appeal
#    BillingAnalyst_Dashboard.Verify Confirm Appeal button is enabled
#    BillingAnalyst_Dashboard.Remove the Attached Document
#
####
#Test 8 :ProperPay:Communication Portal BA Dashboard_validate_After uploading the document, Document type dropdown with the multiple option is enabled to select the type of document
#    [Documentation]    This test case Verifies that after uploading the document, Document type dropdown with the multiple option is enabled to select the type of document.
#    [Tags]    Functional-TS14_TC_004
##    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity      ${baDashabordAppealQuery}
#    CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAppealQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    Return AppealFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Review button_AppealFindings
#    BillingAnalyst_Dashboard.Click latest Appeal tab
#    BillingAnalyst_Dashboard.Scroll down to the bottom of audit detail page
#    BillingAnalyst_Dashboard.Click Appeal Findings button
#    BillingAnalyst_Dashboard.Verify Upload Documents Tab is visible
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
#    BillingAnalyst_Dashboard.Verify Browse File Button is visible
#    BillingAnalyst_Dashboard.Upload document and verify Document type dropdown with the multiple option is enabled
#
##
#Test 9 :ProperPay:Communication Portal BA Dashboard_validate_Upload of duplicate PDF file.(Appeal Findings Tile)
#    [Documentation]    This test case Verifies that user is not able to upload duplicate files(same file) (Appeal Findings Tile)
#    [Tags]    Functional-TS14_TC_005
##    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity      ${baDashabordAppealQuery}
#    CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAppealQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    Return AppealFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Review button_AppealFindings
#    BillingAnalyst_Dashboard.Click latest Appeal tab
#    BillingAnalyst_Dashboard.Scroll down to the bottom of audit detail page
#    BillingAnalyst_Dashboard.Click Appeal Findings button
#    BillingAnalyst_Dashboard.Verify Upload Documents Tab is visible
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
#    BillingAnalyst_Dashboard.Verify Browse File Button is visible
#    RecordAnalyst_Dashboard.Remove the Existing attachment of Record details page
#    BillingAnalyst_Dashboard.Upload a File    PDF   Required   ${PdfFilepath}
#    BillingAnalyst_Dashboard.Upload a File    PDF   Required   ${PdfFilepath}
#    BillingAnalyst_Dashboard.Verify Document uploading errors window appears with FileAlreadyExists error message
#    BillingAnalyst_Dashboard.Remove the Attached Document
#
##
#Test 10 :ProperPay:Communication Portal BA Dashboard_validate_Billing Analyst is allowed to upload the documents while a Audit.(Audit findings tiles)
#    [Documentation]    This test case Verifies that Billing Analyst is allowed to upload the documents while a Audit.When User clicks on the option Appeal Findings, 'Upload Documents' tab  will be enabled to upload the Required Documents and Optional Documents.
#    [Tags]    Functional-TS14_TC_006
##    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${baDashabordAuditQuery}
#    CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditQuery}
#
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    CommonFunctionality.wait untill Page Loads
#    BillingAnalyst_Dashboard.Return AuditFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Review button_AuditFinding
#    BillingAnalyst_Dashboard.Scroll down to the bottom of audit detail page
#    BillingAnalyst_Dashboard.Click Appeal Findings button
#    BillingAnalyst_Dashboard.Verify Upload Documents Tab is visible
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
#    BillingAnalyst_Dashboard.Verify Browse File Button is visible
#    RecordAnalyst_Dashboard.Remove the Existing attachment of Record details page
#    BillingAnalyst_Dashboard.Upload a File    PDF     Required   ${PdfFilepath}
#    BillingAnalyst_Dashboard.Verify PDF file is uploaded sucessfully
#    BillingAnalyst_Dashboard.Remove the Attached Document
####
###
#Test 11 :ProperPay:Communication Portal BA Dashboard_validate_Upload of Non PDF file. (Audit findings tile)
#    [Documentation]    This test case Verifies that When Billing Analyst clicks on the Browse Files , only .PFD files will be allowed to attach. Files with any other extension will not be allowed or not visible in the browsing location.(Audit Finding Tiles)
#    [Tags]    Functional-TS14_TC_007
##    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${baDashabordAuditQuery}
#    CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditQuery}
#
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    BillingAnalyst_Dashboard.Return AuditFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Review button_AuditFinding
#    BillingAnalyst_Dashboard.Scroll down to the bottom of audit detail page
#    BillingAnalyst_Dashboard.Click Appeal Findings button
#    BillingAnalyst_Dashboard.Verify Upload Documents Tab is visible
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
#    BillingAnalyst_Dashboard.Verify Browse File Button is visible
#    BillingAnalyst_Dashboard.Upload a File      NonPDF    None   ${NonPdfFilePath}
#    BillingAnalyst_Dashboard.Verify NonPDF file is not uploaded
##
##
#Test 12 :ProperPay:Communication Portal BA Dashboard_validate_Upload of duplicate PDF file. (Audit Findings Tile)
#    [Documentation]    This test case Verifies that user is not able to upload duplicate files(same file) (Audit Findings Tile)
#    [Tags]    Functional-TS14_TC_008
#    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${baDashabordAuditQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    BillingAnalyst_Dashboard.Return AuditFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Review button_AuditFinding
#    BillingAnalyst_Dashboard.Scroll down to the bottom of audit detail page
#    BillingAnalyst_Dashboard.Click Appeal Findings button
#    BillingAnalyst_Dashboard.Verify Upload Documents Tab is visible
#    RecordAnalyst_Dashboard.Remove the Existing attachment of Record details page
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
#    BillingAnalyst_Dashboard.Verify Browse File Button is visible
#    BillingAnalyst_Dashboard.Upload a File    PDF   Required    ${PdfFilepath}
#    BillingAnalyst_Dashboard.Upload a File    PDF   Required    ${PdfFilepath}
#    BillingAnalyst_Dashboard.Verify Document uploading errors window appears with FileAlreadyExists error message
#    BillingAnalyst_Dashboard.Remove the Attached Document

###
#
#Test 13: ProperPay:Communication Portal BA Dashboard_validate_TITLE and DATE is auto filled On Audit Findings Tile
#        [Documentation]    This test case Verifies that TITLE and DATE is auto filled On Audit  Findings Tile
#        [Tags]    Functional-TS14_TC_009
#
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${baDashabordAuditQuery}
#        LoginPage.Valid User Login According to Test Data Availability   ${BA_comm_usr_name}  ${BA_comm_pass}
#        BillingAnalyst_Dashboard.Click Audit Results Tab
#        BillingAnalyst_Dashboard.Return AuditFindings Review Button locator with patient account number passed by user    ${data_list[0]['PatientAccountNumber']}
#        BillingAnalyst_Dashboard.Click Review button_AuditFinding
#
####BA AGREEWITHFINDING
#        BillingAnalyst_Dashboard.Click Agree with Findings button
#        BillingAnalyst_Dashboard. Scroll down to the bottom of Appeal details page
#        BillingAnalyst_Dashboard.Verify Authorized eSignature details for AgreeWithFindings
#        BillingAnalyst_Dashboard.Click Cancel Button on Latest Appeal Level
##
####BA APPEALFINDING
#        BillingAnalyst_Dashboard.Click Appeal Findings button
#        BillingAnalyst_Dashboard. Scroll down to the bottom of Appeal details page
#        sleep   5
#        BillingAnalyst_Dashboard.Verify Authorized eSignature details
#
###
#Test 14: ProperPay:Communication Portal BA Dashboard_validate_TITLE and DATE is auto filled On Appeal Findings Tile
#       [Documentation]    This test case Verifies that TITLE and DATE is auto filled On Appeal Findings Tile
#        [Tags]    Functional-TS14_TC_010
#            CommonFunctionality.Connect to DB to Read the Test Data     ${baDashabordLevel1AppealQuery}
#            LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
#            BillingAnalyst_Dashboard.Click Audit Results Tab
#            BillingAnalyst_Dashboard.Return AppealFindings Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#            BillingAnalyst_Dashboard.Click Review button_AppealFindings
#            BillingAnalyst_Dashboard.Click latest Appeal tab
##          BA AGREEWITHFINDING
#            BillingAnalyst_Dashboard.Click Agree with Findings button
#            BillingAnalyst_Dashboard. Scroll down to the bottom of Appeal details page
#            Sleep   5
#            BillingAnalyst_Dashboard.Verify Authorized eSignature details for AgreeWithFindings
#            Sleep   5
#            BillingAnalyst_Dashboard.Click Cancel Button on Latest Appeal Level
#            Sleep   5
##         BA APPEALFINDING
#           BillingAnalyst_Dashboard.Click Appeal Findings button
#           BillingAnalyst_Dashboard. Scroll down to the bottom of Appeal details page
#           sleep   5
#           BillingAnalyst_Dashboard.Verify Authorized eSignature details

###
#Test 15 :ProperPay:Communication Portal BA Dashboard_Validate_Confirm Appeal button disabled and thus can not submit the appeal without the documents attached(Audit findings Tiles)
#    [Documentation]    This test case Verifies that Confirm Appeal button disabled and thus can not submit the appeal without the documents attached(Audit findings Tiles)
#    [Tags]    Functional-TS14_TC_011
#
#     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    BillingAnalyst_Dashboard.Return AuditFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Review button_AuditFinding
#    BillingAnalyst_Dashboard.Scroll down to the bottom of audit detail page
#    BillingAnalyst_Dashboard.Click Appeal Findings button
#    BillingAnalyst_Dashboard.Verify Upload Documents Tab is visible
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
#    BillingAnalyst_Dashboard.Verify Browse File Button is visible
#    BillingAnalyst_Dashboard.Verify Authorized eSignature details
#    BillingAnalyst_Dashboard.Enter reason for appeal
#    BillingAnalyst_Dashboard.Verify Confirm Appeal button is disabled
#
##
#Test 16 :ProperPay:Communication Portal BA Dashboard_Validate_Confirm Appeal button disabled and thus can not submit the appeal without the documents attached(Appeal findings Tiles)
#    [Documentation]    This test case Verifies that Confirm Appeal button disabled and thus can not submit the appeal without the documents attached(Appeal findings Tiles)
#    [Tags]    Functional-TS14_TC_012
#     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordLevel1AppealQuery}
#     LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#     BillingAnalyst_Dashboard.Click Audit Results Tab
#    Return AppealFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Review button_AppealFindings
#    BillingAnalyst_Dashboard.Click latest Appeal tab
#    BillingAnalyst_Dashboard.Scroll Down To The Bottom Of Page
#    BillingAnalyst_Dashboard.Click Appeal Findings button
#    BillingAnalyst_Dashboard.Verify Upload Documents Tab is visible
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
#    BillingAnalyst_Dashboard.Remove the Existing attachment of Appeal details page
#    BillingAnalyst_Dashboard.Verify Browse File Button is visible
#    BillingAnalyst_Dashboard.Verify Authorized eSignature details
#    BillingAnalyst_Dashboard.Enter reason for appeal
#    BillingAnalyst_Dashboard.Verify Confirm Appeal button is disabled
#
##
#Test 17 :ProperPay:Communication Portal BA Dashboard_validate_patient details on a AUDIT FINDINGS Tile.
#     [Documentation]    This test case Verifies that user can view patient details on a AUDIT FINDINGS Tile
#     [Tags]    Functional-TS9_TC_001
#
#     CommonFunctionality.Connect to DB to Read the Test Data     ${baDashabordAuditQuery}
#     LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
#     sleep          10
#     BillingAnalyst_Dashboard.Click Audit Results Tab
#     BillingAnalyst_Dashboard.Return AuditFindings Patient Account locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#     BillingAnalyst_Dashboard.Verify Audit findings tile has details with its corresponding values
#     Sleep    5
#
#####
#Test 18 :ProperPay:Communication Portal BA Dashboard_validate_patient details on a APPEAL FINDINGS Tile.
#     [Documentation]    This test case Verifies that user can view tient details on a Appeal FINDINGS Tile
#     [Tags]    Functional-TS9_TC_002
#     CommonFunctionality.Connect to DB to Read the Test Data     ${baDashabordAppealQuery}
#     LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
#     sleep         10
#     BillingAnalyst_Dashboard.Click Audit Results Tab
#     CommonFunctionality.Wait Untill Page Loads
#     BillingAnalyst_Dashboard.Return AppealFindings Patient Account locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#     BillingAnalyst_Dashboard.Scroll down to the bottom of page
#     BillingAnalyst_Dashboard.Verify Appeal findings tile has details with its corresponding values
#
##
#Test 19 :ProperPay:Communication Portal BA Dashboard_validate_Both AUDIT FINDINGS and APPEAL FINDINGS tiles has Review Button in the bottom Right
#    [Documentation]    This test case Verifies that Both AUDIT FINDINGS and APPEAL FINDINGS tiles has Review Button in the bottom Right.
#    [Tags]    Functional-TS9_TC_003
#
#    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAppealQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#     BillingAnalyst_Dashboard.Click Audit Results Tab
#    BillingAnalyst_Dashboard.Return AppealFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Verify Review button is present_AppealFindings
#    CommonFunctionality.Connect to DB to Read the Test Data     ${baDashabordAuditQuery}
#    BillingAnalyst_Dashboard.Return AuditFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Verify Review button is present_AuditFinding
#
#
#
#####
#Test 20 :ProperPay:Communication Portal BA Dashboard_validate_AUDIT FINDINGS Details are visible clicking on Review button of the AUDIT FINDINGS Tile
#    [Documentation]    This test case Verifies that User can click on the Review button of the AUDIT FINDINGS Tile and  can view the audit findings details.
#    [Tags]    Functional-TS9_TC_004
#     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
#    sleep                    5
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    BillingAnalyst_Dashboard.Return AuditFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Review button_AuditFinding
#    BillingAnalyst_Dashboard.Verify Audit findings details entered is visible
#
#
###
#Test 21 :ProperPay:Communication Portal BA Dashboard_validate_APPEAL FINDINGS Details are visible clicking on Review button of the APPEAL FINDINGS Tile
#    [Documentation]    This test case Verifies that User can click on the Review button of the APPEAL FINDINGS Tile and  can view the appeal findings details.
#    [Tags]    Functional-TS9_TC_005
#
#    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordApppealQuery}
#     LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    sleep             5
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    Return AppealFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Review button_AppealFindings
#    BillingAnalyst_Dashboard.Verify Appeal findings details entered is visible
#
#
###
#Test 22 :ProperPay:Communication Portal BA Dashboard_validate_only AUDIT RESULTS Dashboard is displayed and RECORD REQUEST and Payer Dashboard is not displayed when looged in as Record Analyst
#     [Documentation]    This test case Verifies that validate_only Record Request Dashboard is displayed and Billing Analyst and Payer Dashboard is not displayed when looged in as Record Analyst
#     [Tags]    Functional-TS08_TC_001
#
#     #Pre-Req
#     CommonFunctionality.Launch AdminUI Page
#     CommonFunctionality.Login AdmiUI Page   ${BA_comm_usr_name}  ${BA_comm_pass}
#     CommonFunctionality.Open the required user in Admin page   ${BA_comm_usr_name}
#     CommonFunctionality.Scroll down to the bottom of Admin Ui page
#     CommonFunctionality.User Role Configuration in Admin page  ${Required_Role2}
#     #Steps
#     CommonFunctionality.Launch Communication Portal Page
#     LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
#     LoginPage.Verify BA Dashboard is visible
#     LoginPage.Verify Payer Dashboard is not visible
#     LoginPage.Verify RA Dashboard is not visible
#     #Reset build
#     CommonFunctionality.Launch AdminUI Page
#     CommonFunctionality.Login AdmiUI Page   ${BA_comm_usr_name}  ${BA_comm_pass}
#     CommonFunctionality.Open the required user in Admin page   ${BA_comm_usr_name}
#     CommonFunctionality.Scroll down to the bottom of Admin Ui page
#     CommonFunctionality.Reset User Role Configuration in Admin page     ${Reset_Role2}
#
###
#Test 23 :ProperPay:Communication Portal BA Dashboard_validate_Billing analyst is able to see BA dashboard along with the total number of Audit Results mentioned in the braces
#    [Documentation]    This test case Verifies that Billing analyst is able to see BA dashboard along with the total number of Audit Results mentioned in the braces.
#    [Tags]    Functional-TS08_TC_004
#    LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    BillingAnalyst_Dashboard.Fetch Total count of Audit Results Tile on BA dashboard
#    BillingAnalyst_Dashboard.Replace the dynamically fetched Audit Results Tile total count number
#    BillingAnalyst_Dashboard.Validate the Audit Results tab contains the total count of tiles
#    Sleep    5
#
#
#Test 24 :ProperPay:Communication Portal BA Dashboard_validate_Upload document information are correct in the upload documents queue (Appeal Findings Tiles)
#    [Documentation]    This test case Verifies that Billing Analyst after Uploading documents, Verify the upload document information are correct in the upload documents queue (Appeal Findings Tiles)
#    [Tags]    Functional-TS14_TC_013
#
#     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAppealQuery}
#     LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    Return AppealFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Review button_AppealFindings
#    BillingAnalyst_Dashboard.Click latest Appeal tab
#    BillingAnalyst_Dashboard.Scroll down to the bottom of audit detail page
#    BillingAnalyst_Dashboard.Click Appeal Findings button
#    BillingAnalyst_Dashboard.Verify Upload Documents Tab is visible
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
#    BillingAnalyst_Dashboard.Remove the Existing attachment of Appeal details page
#    BillingAnalyst_Dashboard.Upload a File    PDF   Required     ${PdfFilepath}
#    BillingAnalyst_Dashboard.Fetch FileUpload Details
#    BillingAnalyst_Dashboard.Validate FileUpload Details
#    BillingAnalyst_Dashboard.Remove the Attached Document
#
##
#Test 25 :ProperPay:Communication Portal BA Dashboard_validate_Upload document information are correct in the upload documents queue (Audit Findings Tiles)
#    [Documentation]    This test case Verifies that Billing Analyst after Uploading documents, Verify the upload document information are correct in the upload documents queue (Audit Findings Tiles)
#    [Tags]    Functional-TS14_TC_014
#
#    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditQuery}
#     LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    BillingAnalyst_Dashboard.Return AuditFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Review button_AuditFinding
#    BillingAnalyst_Dashboard.Scroll down to the bottom of audit detail page
#    BillingAnalyst_Dashboard.Click Appeal Findings button
#    BillingAnalyst_Dashboard.Verify Upload Documents Tab is visible
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
#    BillingAnalyst_Dashboard.Upload a File    PDF   Required     ${PdfFilepath}
#    BillingAnalyst_Dashboard.Fetch FileUpload Details
#    BillingAnalyst_Dashboard.Validate FileUpload Details
#    BillingAnalyst_Dashboard.Remove the Attached Document
#
#
##
#Test 36 :ProperPay:Communication Portal BA Dashboard_validate_remaining days to submit is reflected on tiles before requesting an extension for claim
#     [Documentation]    This test case Verifies that remaining days to submit is reflected on tiles before requesting an extension for claim in BA dashboard
#     [Tags]    Functional-TS21_TC_002
#      CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditExtensionQuery}
#     LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#     BillingAnalyst_Dashboard.Click Audit Results Tab
#     BillingAnalyst_Dashboard.Return request extension Button locator on AuditFindings Tile with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#     BillingAnalyst_Dashboard.Verify that the request extension button is present on the identified AuditFindings Tile
#     BillingAnalyst_Dashboard.Return AuditFindings request extension Days Remaining locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#     BillingAnalyst_Dashboard.Verify the number of days remaining to submit is reflected on Audit tiles before requesting extension
#     Sleep    5
#
#
#
#Test 38 :ProperPay:Communication Portal BA Dashboard_validate_request extension link available on the tile to request an extension and is clickable.
#     [Documentation]    This test case Verifies that request extension link available on the tile to request an extension and is clickable.
#     [Tags]    Functional-TS21_TC_003
#     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditExtensionQuery}
#      LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#     BillingAnalyst_Dashboard.Click Audit Results Tab
#     RecordAnalyst_Dashboard.Return request extension Button locator with patient account number passed by user    ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Verify that the request extension button is present on the identified record request tile
#     RecordAnalyst_Dashboard.Click Request extension button and verify the Request Extension pop up is displayed
#     Sleep    5
#
#
#Test 26 :ProperPay:Communication Portal BA Dashboard_validate_request extension link is no longer available on the Audit finding and Appeal finding tiles after requesting one extesion for a audit.
#     [Documentation]   This test case Verifies that request extension link is no longer available on the Audit finding and Appeal finding tiles after requesting one extesion for a audit.
#     [Tags]    Functional-TS21_TC_006
#     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAppealExtensionQuery}
#      LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#     BillingAnalyst_Dashboard.Click Audit Results Tab
#
#     BillingAnalyst_Dashboard.Return request extension Button locator on AppealFindings Tile with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#     BillingAnalyst_Dashboard.Verify that the request extension button is present on the identified AppealFindings Tile
#     BillingAnalyst_Dashboard.Click Request extension button on the AppealFindings Tile and verify the Request Extension pop up is displayed
#     BillingAnalyst_Dashboard.Verify the Request Extension pop up of a appeal contains a message and confirm request button        ${data_list[0]['PatientFirstName']}          ${data_list[0]['PatientLastName']}
#     BillingAnalyst_Dashboard.Return AppealFindings request extension Granted locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#     BillingAnalyst_Dashboard.Click Confirm Request Button and verify the Request Extension is no longer available on the AppealFindings tile
#     Sleep    5
#     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditExtensionQuery}
#      LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#     BillingAnalyst_Dashboard.Click Audit Results Tab
#     BillingAnalyst_Dashboard.Return request extension Button locator on AuditFindings Tile with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#     BillingAnalyst_Dashboard.Verify that the request extension button is present on the identified AuditFindings Tile
#     BillingAnalyst_Dashboard.Click Request extension button on the AuditFindings Tile and verify the Request Extension pop up is displayed
#     BillingAnalyst_Dashboard.Verify the Request Extension pop up of a audit contains a message and confirm request button      ${data_list[0]['PatientFirstName']}          ${data_list[0]['PatientLastName']}
#     BillingAnalyst_Dashboard.Return AuditFindings request extension Granted locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#     BillingAnalyst_Dashboard.Click Confirm Request Button and verify the Request Extension is no longer available on the AuditFindings tile
#
#
#Test 27 :ProperPay:Communication Portal BA Dashboard_validate_additional 14 days will be added to the days to submit audits and appeals after clicking on Record Extension button.
#     [Documentation]    This test case Verifies that additional 14 days will be added to the days to submit audits and appeals after clicking on Record Extension button.
#     [Tags]    Functional-TS21_TC_005
#     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAppealExtensionQuery}
#      LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#     BillingAnalyst_Dashboard.Click Audit Results Tab
#     BillingAnalyst_Dashboard.Return request extension Button locator on AppealFindings Tile with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#     BillingAnalyst_Dashboard.Verify that the request extension button is present on the identified AppealFindings Tile
#     BillingAnalyst_Dashboard.Return AppealFindings request extension Days Remaining locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#     BillingAnalyst_Dashboard.Verify the number of days remaining to submit is reflected on Appeal tiles before requesting extension
#     BillingAnalyst_Dashboard.Add 14 days to the number of day remaining to submit on Appeal tiles
#     BillingAnalyst_Dashboard.Click Request extension button on the AppealFindings Tile and verify the Request Extension pop up is displayed
#     BillingAnalyst_Dashboard.Verify the Request Extension pop up of a appeal contains a message and confirm request button                ${data_list[0]['PatientFirstName']}          ${data_list[0]['PatientLastName']}
#     BillingAnalyst_Dashboard.Return AppealFindings request extension Granted locator with patient account number passed by user            ${data_list[0]['PatientAccountNumber']}
#     BillingAnalyst_Dashboard.Click Confirm Request Button and verify the Request Extension is no longer available on the AppealFindings tile
#     BillingAnalyst_Dashboard.Verify additional 14 days is added to number of days remaining to submit after requesting extension on Appeal tile
#     Sleep    5
#      CommonFunctionality.Connect to DB to Read the Test Data     ${baDashabordAuditExtensionQuery}
#     LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
#     BillingAnalyst_Dashboard.Click Audit Results Tab
#     BillingAnalyst_Dashboard.Return request extension Button locator on AuditFindings Tile with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#     BillingAnalyst_Dashboard.Verify that the request extension button is present on the identified AuditFindings Tile
#     BillingAnalyst_Dashboard.Return AuditFindings request extension Days Remaining locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#     BillingAnalyst_Dashboard.Verify the number of days remaining to submit is reflected on Audit tiles before requesting extension
#     BillingAnalyst_Dashboard.Add 14 days to the number of day remaining to submit on Audit tiles
#     BillingAnalyst_Dashboard.Click Request extension button on the AuditFindings Tile and verify the Request Extension pop up is displayed
#     BillingAnalyst_Dashboard.Verify the Request Extension pop up of a audit contains a message and confirm request button          ${data_list[0]['PatientFirstName']}          ${data_list[0]['PatientLastName']}
#     BillingAnalyst_Dashboard.Return AuditFindings request extension Granted locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#     BillingAnalyst_Dashboard.Click Confirm Request Button and verify the Request Extension is no longer available on the AuditFindings tile
#     BillingAnalyst_Dashboard.Verify additional 14 days is added to number of days remaining to submit after requesting extension on Audit tile
#
#
#
#Test 28: ProperPay:Communication Portal FilterFunctionality_validate_User is able to filter the results by providing Valid Patient Account Number
#        [Documentation]    This test case Verifies that User is able to filter the results by providing Valid Patient Account Number
#        [Tags]    Functional-TS01_TC_003_01
#
#       CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#        LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
#        LoginPage.Verify BA Dashboard is visible
#        CommonFunctionality.Wait Untill Page Loads
#        BillingAnalyst_Dashboard.Click Filter Button
#        BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Patient Account Number   ${data_list[0]['PatientAccountNumber']}
#        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#        BillingAnalyst_Dashboard.Verify data after applying filter Functionality by providing Valid Patient Account Number    ${data_list[0]['PatientAccountNumber']}
#        Sleep    5
#
###
#Test 29: ProperPay:Communication Portal FilterFunctionality_validate_User is able to filter the results by providing Valid Medical Record Number
#        [Documentation]    This test case Verifies that User is able to filter the results by providing Valid Medical Record Number
#        [Tags]    Functional-TS01_TC_003_02
#
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditQuery}
#         LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#        LoginPage.Verify BA Dashboard is visible
#        BillingAnalyst_Dashboard.Click Filter Button
#        BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Medical Record Number
#\        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#        BillingAnalyst_Dashboard.Verify data after applying filter Functionality by providing Valid Medical Record Number
#        Sleep    5
#
#
#Test 30: ProperPay:Communication Portal FilterFunctionality_validate_User is able to filter the results by providing Valid Audit Number
#        [Documentation]    This test case Verifies that User is able to filter the results by providing Valid Audit Number
#        [Tags]    Functional-TS01_TC_003_03
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#        LoginPage.Verify BA Dashboard is visible
#        BillingAnalyst_Dashboard.Click Filter Button
#        BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Audit Number
#\        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#        BillingAnalyst_Dashboard.Verify data after applying filter Functionality by providing Valid Audit Number
#        Sleep    5
#
#
#Test 31: ProperPay:Communication Portal FilterFunctionality_validate_User is able to filter the results by providing Valid Appeal Decesion
#        [Documentation]    This test case Verifies that User is able to filter the results by providing Valid Appeal Decesion
#        [Tags]    Functional-TS01_TC_003_10
#
#        LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
#        LoginPage.Verify BA Dashboard is visible
#        CommonFunctionality.Wait Untill Page Loads
#        BillingAnalyst_Dashboard.Click Filter Button
#        BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Appeal Decesion
#        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#        BillingAnalyst_Dashboard.Verify data after applying filter Functionality by providing Valid Appeal Decesion
#        Sleep    5
#
#
#Test 32:ProperPay:Communication Portal FilterFunctionality_validate_User is able to filter the results by providing Provider Number
#        [Documentation]    This test case Verifies that User is able to filter the results by providing Valid Provider Number
#        [Tags]    Functional-TS01_TC_003_06
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#        LoginPage.Verify BA Dashboard is visible
#        BillingAnalyst_Dashboard.Click Filter Button
#        BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Provider Number
#        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#        BillingAnalyst_Dashboard.Verify data after applying filter Functionality by providing Valid Provider Number
#        Sleep    5
#
##
#Test 33: ProperPay:Communication Portal FilterFunctionality_validate_User is able to filter the results by providing Calim Number
#        [Documentation]    This test case Verifies that User is able to filter the results by providing Valid Calim Number
#        [Tags]    Functional-TS01_TC_003_09
#         CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#        LoginPage.Verify BA Dashboard is visible
#        BillingAnalyst_Dashboard.Click Filter Button
#        BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Claim Number
#        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#        BillingAnalyst_Dashboard.Verify data after applying filter Functionality by providing Valid Claim Number
#        Sleep  5
#
#
##AK
####
#Test 34: ProperPay:Communication Portal FilterFunctionality_validate_filter fileds present in filter pannel of BA dashboard
#        [Documentation]    This test case Verifies filter fileds present in filter pannel of BA dashboard.
#        [Tags]    Functional-TS01_TC_003_12
#
#        LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
#        LoginPage.Verify BA Dashboard is visible
#        BillingAnalyst_Dashboard.Click Filter Button
#        BillingAnalyst_Dashboard.Verify Filter Options panel is visible
#
####
#Test 35 :ProperPay:Communication Portal BA Dashboard_validate_Billing Analyst can toggle between Grid View and List View by clicking on icons availabe for same in BA dashboard
#     [Documentation]    This test case Verifies that Billing Analyst can toggle between Grid View and List View by clicking on icons availabe for same in BA dashboard
#     [Tags]    Functional-TS8_TC_003
#
#     LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
#     BillingAnalyst_Dashboard.Click Audit Results Tab
#     RecordAnalyst_Dashboard.Click List View Icon
#     RecordAnalyst_Dashboard.Verify auidts are diplayed in list view
#     RecordAnalyst_Dashboard.Verify auidts are not diplayed in Grid view
#     RecordAnalyst_Dashboard.Click Grid View Icon
#     RecordAnalyst_Dashboard.Verify auidts are diplayed in Grid view
#     RecordAnalyst_Dashboard.Verify auidts are not diplayed in List view
#
#
##
#Test 37 :ProperPay:Communication Portal BA Dashboard_validate_Record extension button is not present for overdue Patients on BA dashboard
#     [Documentation]    This test case Verifies that Record extension button is not present for overdue Patients on BA dashboard
#     [Tags]    Functional-TS21_TC_007
#      CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditOverdueQuery}
#     LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#     BillingAnalyst_Dashboard.Click Audit Results Tab
#     RecordAnalyst_Dashboard.Return Overdue locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Return request extension Button locator with patient account number passed by user     ${data_list[0]['PatientAccountNumber']}
#     RecordAnalyst_Dashboard.Verify the request extension button is not present for overdue patient
#
#
#
#
###AN
###
#Test 39 :ProperPay:Communication Portal BA Dashboard_validate_BA can toggle between both the dashboards present by clicking on each tabs
#   [Documentation]    This test case Verifies that BA can  toggle between both the dashboards present by clicking on each tabs
#   [Tags]    TS30_TC_08
#
#    LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    BillingAnalyst_Dashboard.Verify Audit Result tab is selected by default
#    RecordAnalyst_Dashboard.Click Record Request Tab
#    RecordAnalyst_Dashboard.Verify Record Analyst Page is displayed
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    BillingAnalyst_Dashboard.Verify Billing Analyst Page is displayed
####
#Test 40 :ProperPay:Communication Portal BA Dashboard_validate_Billing Analyst is able to see AUDIT RESULTS tab is selected by default when login
#   [Documentation]    This test case Verifies that Billing Analyst is able to see AUDIT RESULTS  tab is selected by default when login
#   [Tags]    TS30_TC_07
#
#    LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    BillingAnalyst_Dashboard.Verify Audit Result tab is selected by default
#
###satheesh
#####
#Test 41: ProperPay:Communication Portal BA Dashboard_validate_Confirm Agreement button is clickable
#    [Documentation]    This test case Verifies Confirm Agreement button is clickable
#    [Tags]    Functional-TS30_TC_12
#     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity    ${baDashabordAppealQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    BillingAnalyst_Dashboard.Return AppealFindings Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Review button_AppealFindings
#    BillingAnalyst_Dashboard.Click latest Appeal tab
#    BillingAnalyst_Dashboard.Click Agree with Findings button
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
#    BillingAnalyst_Dashboard.Click Confirm Agreement Button
#    BillingAnalyst_Dashboard.Verify CONFIRM FINDINGS AGREEMENT pop up
#
##
#Test 42: ProperPay:Communication Portal BA Dashboard_validate_User is able to toggal between Appeal Levels
#     [Documentation]    This test case Verifies User is able to toggal between Appeal Levels
#     [Tags]    Functional-TS30_TC_11
#     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity    ${baDashabordLevel2AppealQuery}
#     LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#     BillingAnalyst_Dashboard.Click Audit Results Tab
#     BillingAnalyst_Dashboard.Return AppealFindings Review Button locator with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#     BillingAnalyst_Dashboard.Click Review button_AppealFindings
#     BillingAnalyst_Dashboard.Click First level Appeal findings tab
#     BillingAnalyst_Dashboard.Verify First Appeal Findings tab is displayed
#     BillingAnalyst_Dashboard.Click Second level Appeal findings tab
#     BillingAnalyst_Dashboard.Verify Second Appeal Findings tab is displayed
#     BillingAnalyst_Dashboard.Click Initial findings tab
#     BillingAnalyst_Dashboard.Verify Intial Findings tab is displayed
#
#Test 43 :ProperPay:Communication Portal BA Dashboard_validate_ Cancel Button is always enabled
#    [Documentation]    This test case Verifies Cancel Button is always enabled
#    [Tags]    Functional-TS30_TC_10
#     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity    ${baDashabordLevel1AppealQuery}
#     LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}  #
#     BillingAnalyst_Dashboard.Click Audit Results Tab
#    Return AppealFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Review button_AppealFindings
#    BillingAnalyst_Dashboard.Click latest Appeal tab
#    BillingAnalyst_Dashboard.Scroll down to the bottom of audit detail page
#    BillingAnalyst_Dashboard.Click Appeal Findings button
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
#    BillingAnalyst_Dashboard.Click Cancel button on Appeal findings page
#    BillingAnalyst_Dashboard.Verify Cancel Appeal Submission Pop up
#
####
#Test 44 :ProperPay:Communication Portal BA Dashboard_validate_ appeal is not submited when user clicks on Cancel Button
#    [Documentation]    This test case Verifies appeal is not submited when user clicks on Cancel Button
#    [Tags]    Functional-TS30_TC_19
#     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity    ${baDashabordLevel1AppealQuery}
#     LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    Return AppealFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Review button_AppealFindings
#    BillingAnalyst_Dashboard.Click latest Appeal tab
#    BillingAnalyst_Dashboard.Scroll down to the bottom of audit detail page
#    BillingAnalyst_Dashboard.Click Appeal Findings button
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
#    BillingAnalyst_Dashboard.Click Cancel button on Appeal findings page
#    BillingAnalyst_Dashboard.Click GoToDashboard button in cancel appeal submission pop up
#
#    CommonFunctionality.Wait Untill Page Loads
#    BillingAnalyst_Dashboard.Verify the Appeal is not submitted and present in dashboard
#
##AN
###
#Test 45 :ProperPay:Communication Portal BA Dashboard_validate_that agreement which is successfully submited presnet in audit history page with audit status as "Provider aggrement"
#    [Documentation]    This test case Verifies that agreement which is successfully submited presnet in audit history page with audit status as "Provider aggrement"
#    [Tags]    Functional-TS30_TC_04
#      CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity    ${baDashabordLevel1AppealQuery}
#     LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    CommonFunctionality.Wait Untill Page Loads
#    Return AppealFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Review button_AppealFindings
#    BillingAnalyst_Dashboard.Click latest Appeal tab
#    BillingAnalyst_Dashboard.Scroll down to the bottom of audit detail page
#    BillingAnalyst_Dashboard.Click Agree with Findings button
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
#    BillingAnalyst_Dashboard.Click Confirm Agreement Button
#    BillingAnalyst_Dashboard.Verify CONFIRM FINDINGS AGREEMENT pop up
#    BillingAnalyst_Dashboard.Click YES button in Confirm FIndings Agreement pop up
#    BillingAnalyst_Dashboard.Click GoToDashboard button in the submission success pop up
#    CommonFunctionality.Wait Untill Page Loads
#    RecordAnalyst_Dashboard.Verify after submission of record presnet in audit history page    ${data_list[0]['PatientAccountNumber']}
#
###
#Test 46 :ProperPay:Communication Portal BA Dashboard_validate_that agreement which is successfully submited presnet in audit history page with audit status as " Appeal Submitted"
#    [Documentation]    This test case Verifies that agreement which is successfully submited presnet in audit history page with audit status as " Appeal Submitted"
#    [Tags]    Functional-TS30_TC_015
#    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity    ${baDashabordAuditQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    BillingAnalyst_Dashboard.Return AuditFindings Review Button locator with patient account number passed by user    ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Review button_AuditFinding
#    BillingAnalyst_Dashboard.Click Agree with Findings button
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
#    BillingAnalyst_Dashboard.Verify Authorized eSignature details for AgreeWithFindings
#    BillingAnalyst_Dashboard.Click Confirm Agreement Button
#    BillingAnalyst_Dashboard.Verify CONFIRM FINDINGS AGREEMENT pop up
#    BillingAnalyst_Dashboard.Click YES button in Confirm FIndings Agreement pop up
#    BillingAnalyst_Dashboard.Click GoToDashboard button in the submission success pop up
#    CommonFunctionality.Wait Untill Page Loads
#    BillingAnalyst_Dashboard.Verify after submission of record presnet in audit history page    ${data_list[0]['PatientAccountNumber']}
#
#
#
##Satheesh
## done but appeal submission window not coming
#Test 47 :ProperPay:Communication Portal BA Dashboard_validate_user is able to Confirm Appeal and submited appeal is not present on dashboard
#    [Documentation]    This test case Verifies user is able to Confirm Appeal and submited appeal is not present on dashboard
#    [Tags]    Functional-TS30_TC_013
#   CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity    ${baDashabordLevel1AppealQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    Return AppealFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Review button_AppealFindings
#    BillingAnalyst_Dashboard.Click latest Appeal tab
#    BillingAnalyst_Dashboard.Scroll down to the bottom of audit detail page
#    BillingAnalyst_Dashboard.Click Appeal Findings button
#    BillingAnalyst_Dashboard.Verify Browse File Button is visible
#    BillingAnalyst_Dashboard.Remove the Existing attachment of Appeal details page
#    BillingAnalyst_Dashboard.Upload a File    PDF     Required   ${PdfFilepath}
#    BillingAnalyst_Dashboard.Verify PDF file is uploaded sucessfully
#    BillingAnalyst_Dashboard.Enter reason for appeal
#    BillingAnalyst_Dashboard.Click Confirm Appeal Button
#    BillingAnalyst_Dashboard.Verify Confirm Findings Appeal Pop up and Click Yes button
#    BillingAnalyst_Dashboard.Click GoToDashboard Button In The Submission Success Pop Up
#    CommonFunctionality.Wait Untill Page Loads
#    BillingAnalyst_Dashboard.Verify the Appeal submitted is not present in dashboard
#
#
#
#
##
#Test 48 :ProperPay:Communication Portal BA Dashboard_validate_user is able to Confirm Aggrement and submited agreement is not present on dashboard
#    [Documentation]    This test case Verifies user is able to Confirm Aggrement and submited agreement is not present on dashboard
#    [Tags]    Functional-TS30_TC_014
#
#    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity    ${baDashabordLevel1AppealQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    Return AppealFindings Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Review button_AppealFindings
#    BillingAnalyst_Dashboard.Click latest Appeal tab
#    BillingAnalyst_Dashboard.Scroll down to the bottom of audit detail page
#    BillingAnalyst_Dashboard.Click Agree with Findings button
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Appeal details page
#    Verify BillingAnalyst_AppealFindings_Authorized_eSignature Tab is visible
#    BillingAnalyst_Dashboard.Click Confirm Agreement Button
#    BillingAnalyst_Dashboard.Click YES button in Confirm FIndings Agreement pop up
#    BillingAnalyst_Dashboard.Click GoToDashboard button in the submission success pop up
#    CommonFunctionality.Wait Untill Page Loads
#    RecordAnalyst_Dashboard.Verify after submission of record presnet in audit history page    ${data_list[0]['PatientAccountNumber']}
#
#
#
###
#Test 49: ProperPay:Communication Portal FilterFunctionality_validate_User is able to filter the results by providing Prepay
#        [Documentation]    This test case Verifies that User is able to filter the results by providing Valid Prepay value
#        [Tags]    Functional-TS31_TC_001
#        LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
#        LoginPage.Verify BA Dashboard is visible
#        BillingAnalyst_Dashboard.Click Filter Button
#        BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Prepay value as No
#        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#        BillingAnalyst_Dashboard.Verify data after applying filter Functionality by selecting Prepay value as No
#        Sleep  5
#        BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Prepay value as Yes
#        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#        BillingAnalyst_Dashboard.Verify data after applying filter Functionality by selecting Prepay value as Yes
#
#
#Test 50: ProperPay:Communication Portal ExportToExcel_validate_User is able to download the audit results using Export To excel button
#        [Documentation]    This test case Verifies that User is able to download the audit results using Export To excel button
#        [Tags]    Functional-TS32_TC_001
#
#        LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
#        LoginPage.Verify BA Dashboard is visible
#        CommonFunctionality.Wait Untill Page Loads
#        BillingAnalyst_Dashboard.Fetch Total count of Audit Results Tile on BA dashboard
#        BillingAnalyst_Dashboard.Click Export Audit
#        CommonFunctionality.Read from Excel          ${AuditResultsDownloadedExcelPath}
#        BillingAnalyst_Dashboard.Verify the columns in the downloaded export
#        BillingAnalyst_Dashboard.Verify the total records in the downloaded export
#
#Test 51 :ProperPay:Communication Portal BA Dashboard_List_View_Verify Clicking on Review Displays Audit Details Page
#   [Documentation]    This test case Verifies that Clicking on Review Displays Audit Details Page in List View
#   [Tags]    Functional-TS33_TC_001
#    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    CommonFunctionality.Wait Untill Page Loads
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    RecordAnalyst_Dashboard.Click List View Icon
#    CommonFunctionality.Wait Untill Page Loads
#    BillingAnalyst_Dashboard.Verify all the column headers are displayed
#    BillingAnalyst_Dashboard.Fetch the First Audit Record From the List    ${baDashboardListAuditQuery}
#    BillingAnalyst_Dashboard.Return AuditFindings List View Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click List View Review button
#    BillingAnalyst_Dashboard.Scroll down to the bottom of page
#    BillingAnalyst_Dashboard.Verify Agree with Findings button is present
#    BillingAnalyst_Dashboard.Verify Appeal Findings button is present
#
#
#Test 52 :ProperPay:Communication Portal BA Dashboard_List_View_Verify the Audit Details
#   [Documentation]    This test case Verifies that Clicking on Review Displays Audit Details Page in List View
#   [Tags]    Functional-TS33_TC_001
#    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    CommonFunctionality.Wait Untill Page Loads
#    BillingAnalyst_Dashboard.Click Audit Results Tab
#    RecordAnalyst_Dashboard.Click List View Icon
#    CommonFunctionality.Wait Untill Page Loads
#    BillingAnalyst_Dashboard.Verify all the column headers are displayed
#     BillingAnalyst_Dashboard.Fetch the First Audit Record From the List    ${baDashboardListAuditQuery}
#    BillingAnalyst_Dashboard.Return AuditFindings List View Review Button locator with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Verify Audit finding details with its corresponding values in List View
#
#Test 53 :ProperPay:Communication Portal BA Dashboard_List_View_Verify_Filter_Functionality_validate_User is able to filter the results by providing Valid Patient Account Number
#    [Documentation]    This test case Verifies that In List View User is able to filter the results by providing Valid Patient Account Number
#    [Tags]    Functional-TS34_TC_001
#    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    CommonFunctionality.Wait Untill Page Loads
#    RecordAnalyst_Dashboard.Click List View Icon
#    CommonFunctionality.Wait Untill Page Loads
#    BillingAnalyst_Dashboard.Click Filter Button
#    CommonFunctionality.Wait Untill Page Loads
#    BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Patient Account Number   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#    BillingAnalyst_Dashboard.Verify data after applying filter Functionality In List View by providing Valid Patient Account Number    ${data_list[0]['PatientAccountNumber']}
#    Sleep    5
#
#
#Test 54 :ProperPay:Communication Portal BA Dashboard_List_View_Verify_Filter_Functionality_validate_User is able to filter the results by providing Valid Medical Record Number
#   [Documentation]    This test case Verifies that In List View User is able to filter the results by providing Valid Medical Record Number
#   [Tags]    Functional-TS34_TC_002
#    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    CommonFunctionality.Wait Untill Page Loads
#    RecordAnalyst_Dashboard.Click List View Icon
#    BillingAnalyst_Dashboard.Click Filter Button
#    BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Medical Record Number
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#    BillingAnalyst_Dashboard.Verify data after applying filter Functionality In List View by providing Valid Medical Record Number    ${data_list[0]['MRNumber']}
#    Sleep    5
#
#Test 55 :ProperPay:Communication Portal BA Dashboard_List_View_Verify_Filter_Functionality_validate_User is able to filter the results by providing Valid Audit Number
#   [Documentation]    This test case Verifies that In List View User is able to filter the results by providing Valid Audit Number
#   [Tags]    Functional-TS34_TC_003
#    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    CommonFunctionality.Wait Untill Page Loads
#    RecordAnalyst_Dashboard.Click List View Icon
#    BillingAnalyst_Dashboard.Click Filter Button
#    BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Audit Number
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#    BillingAnalyst_Dashboard.Verify data after applying filter Functionality In List View by providing Valid Audit Number    ${data_list[0]['AuditNumber']}
#    Sleep    5
#
#Test 56 :ProperPay:Communication Portal BA Dashboard_List_View_Verify_Filter_Functionality_validate_User is able to filter the results by providing Valid Appeal Decission
#   [Documentation]    This test case Verifies that In List View User is able to filter the results by providing Valid Appeal Decission
#   [Tags]    Functional-TS34_TC_004
#    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    CommonFunctionality.Wait Untill Page Loads
#    RecordAnalyst_Dashboard.Click List View Icon
#    BillingAnalyst_Dashboard.Click Filter Button
#    BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Appeal Decesion
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#    BillingAnalyst_Dashboard.Verify data after applying filter Functionality In List View by providing Valid Appeal Decesion
#    Sleep    5
#
#
#Test 57 :ProperPay:Communication Portal BA Dashboard_List_View_Verify_Filter_Functionality_validate_User is able to filter the results by providing Valid Provider Number
#   [Documentation]    This test case Verifies that In List View User is able to filter the results by providing Valid Provider Number
#   [Tags]    Functional-TS34_TC_005
#    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    CommonFunctionality.Wait Untill Page Loads
#    RecordAnalyst_Dashboard.Click List View Icon
#    BillingAnalyst_Dashboard.Click Filter Button
#    BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Provider Number
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#    BillingAnalyst_Dashboard.Verify data after applying filter Functionality In List View by providing Valid Provider Number     ${data_list[0]['BillingProviderNumber']}
#    Sleep    5
##
#Test 58: ProperPay:Communication Portal BA Dashboard_List_View_Verify_Filter_Functionality_validate_User is able to filter the results by providing Prepay
#     [Documentation]    This test case Verifies that In List View User is able to filter the results by providing Valid Prepay value
#     [Tags]    Functional-TS33_TC_006
#     LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
#     LoginPage.Verify BA Dashboard is visible
#     CommonFunctionality.Wait Untill Page Loads
#     RecordAnalyst_Dashboard.Click List View Icon
#     BillingAnalyst_Dashboard.Click Filter Button
#     BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Prepay value as No
#     BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#     BillingAnalyst_Dashboard.Verify data after applying filter Functionality In List View by selecting Prepay value as No
#     Sleep  5
#     BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Prepay value as Yes
#     BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#     BillingAnalyst_Dashboard.Verify data after applying filter Functionality In List View by selecting Prepay value as Yes
#
##
#Test 59 :ProperPay:Communication Portal BA Dashboard_List_View_Verify_Filter_Functionality_validate_User is able to filter the result by providing Claim Type as OUTPATIENT
#     [Documentation]    This test case Verifies that In List View user is able to filter records by providing Claim Type as OUTPATIENT
#     [Tags]    Functional-TS33_TC_007
#     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity    ${baDashboardOutpatientRecordQuery}
#     LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
#     CommonFunctionality.Wait Untill Page Loads
#     RecordAnalyst_Dashboard.Click List View Icon
#     BillingAnalyst_Dashboard.Click Filter Button
#     RecordAnalyst_Dashboard.Verify filter Functionality by providing Claim Type           Outpatient
#     BillingAnalyst_Dashboard.Verify filter result In List View by after providing Claim Type as outpatient
#
#
#Test 60 :ProperPay:Communication Portal BA Dashboard_List_View_Verify_Filter_Functionality_verify user is able to filter records by providing DAYS REMAINING UNTIL DUE DATE - 1 OR 2 OR 3 OR 4 OR 5
#     [Documentation]    This test case Verifies that in List View user is able to filter records by providing DAYS REMAINING UNTIL DUE DATE - 1 OR 2 OR 3 OR 4 OR 5
#     [Tags]    [Tags]    Functional-TS33_TC_008
#
#     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${baDashabordAuditQuery}
#     LoginPage.Valid User Login According to Test Data Availability  ${RA_comm_usr_name}  ${RA_comm_pass}
#     CommonFunctionality.Wait Untill Page Loads
#     RecordAnalyst_Dashboard.Click List View Icon
#     BillingAnalyst_Dashboard.Click Filter Button
#     RecordAnalyst_Dashboard.Verify filter Functionality by providing DAYS REMAINING UNTIL DUE DATE         ${DAYS REMAINING UNTIL DUE DATE NON OVERDUE}
#     RecordAnalyst_Dashboard.Verify data after applying filter Functionality by providing DAYS REMAINING UNTIL DUE DATE - NON OVERDUE
#
#Test 61 :ProperPay:Communication Portal BA Dashboard_List_View_Verify_Filter_Functionality_validate_User is able to filter the results by providing Valid CLaim Number
#   [Documentation]    This test case Verifies that In List View User is able to filter the results by providing Valid Provider Number
#   [Tags]    Functional-TS34_TC_009
#    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    CommonFunctionality.Wait Untill Page Loads
#    RecordAnalyst_Dashboard.Click List View Icon
#    BillingAnalyst_Dashboard.Click Filter Button
#    BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Claim Number
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#    BillingAnalyst_Dashboard.Verify data after applying filter Functionality In List View by providing Valid Claim Number    ${data_list[0]['ClaimNumber']}
#
#
#Test 62 :ProperPay:Communication Portal BA Dashboard_List_View_Verify_Filter_Functionality_validate_User is able to clear filters
#   [Documentation]    This test case Verifies the clear filter functionality  In List View
#   [Tags]    Functional-TS34_TC_010
#    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    CommonFunctionality.Wait Untill Page Loads
#    RecordAnalyst_Dashboard.Click List View Icon
#    CommonFunctionality.Wait Untill Page Loads
#    BillingAnalyst_Dashboard.Validate filter clearing functionality in List View
#
#
#
#Test 63 :ProperPay:Communication Portal BA Dashboard_List_View_Verify User can sort the list of available audit history based on all the column header displayed
#    [Documentation]  This test case verifies User is able to sort the list of available audit history based on all the column header displayed.
#    [Tags]  Functional TS36_TC_001
#
#    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    CommonFunctionality.Wait Untill Page Loads
#    RecordAnalyst_Dashboard.Click List View Icon
#    BillingAnalyst_Dashboard.Double click patient Name header in BA dashboard List View Tab and verify sorting is done in Ascending order
#    BillingAnalyst_Dashboard.Double click patient Account Number header in BA dashboard List View Tab and verify sorting is done in Ascending order
#    BillingAnalyst_Dashboard.Double click prepay header in BA dashboard List View Tab and verify sorting is done in Ascending order
#    BillingAnalyst_Dashboard.Double click Provider Name header in BA dashboard List View Tab and verify sorting is done in Ascending order
#    BillingAnalyst_Dashboard.Double click Audit Type header in BA dashboard List View Tab and verify sorting is done in Ascending order
#    BillingAnalyst_Dashboard.Double click Appeal Decision header in BA dashboard List View Tab and verify sorting is done in Ascending order
#    BillingAnalyst_Dashboard.Double click Birth Date header in BA dashboard List View Tab and verify sorting is done in Ascending order
#    BillingAnalyst_Dashboard.Double click Date Of Service header in BA dashboard List View Tab and verify sorting is done in Ascending order
#    BillingAnalyst_Dashboard.Double click Provider Number header in BA dashboard List View Tab and verify sorting is done in Ascending order
#    BillingAnalyst_Dashboard.Double click Audit Number header in BA dashboard List View Tab and verify sorting is done in Ascending order
#    BillingAnalyst_Dashboard.Double click Claim Number header in BA dashboard List View Tab and verify sorting is done in Ascending order
#    BillingAnalyst_Dashboard.Double click Medical Record Number header in BA dashboard List View Tab and verify sorting is done in Ascending order
#    BillingAnalyst_Dashboard.Double click Due Date header in BA dashboard List View Tab and verify sorting is done in Ascending order
#
#
#Test 64:ProperPay:Communication Portal BA Dashboard_List_View Validate the Request Extension Functionality for an Audit
#     [Documentation]    This test case Verifies Request Extension Functionality for an Audit in BA dashboard List View
#     [Tags]    Functional-TS01_TC_001
#     CommonFunctionality.Connect to DB to Read the Test Data     ${baDashabordAuditExtensionQuery}
#     LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
#     CommonFunctionality.Wait Untill Page Loads
#     RecordAnalyst_Dashboard.Click List View Icon
#     CommonFunctionality.Wait Untill Page Loads
#     BillingAnalyst_Dashboard.Click Filter Button
#     BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Audit Number
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#    BillingAnalyst_Dashboard.Return request extension Button locator on AuditFindings In List View with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Verify that the request extension button is present on the identified AuditFindings Tile
#    BillingAnalyst_Dashboard.Return AuditFindings request extension Days Remaining locator In List View with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Verify the number of days remaining to submit is reflected on Audit tiles before requesting extension
#    BillingAnalyst_Dashboard.Click Request extension button on the AuditFindings Tile and verify the Request Extension pop up is displayed
#    BillingAnalyst_Dashboard.Return AuditFindings request extension Granted locator In List View with patient account number passed by user      ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Confirm Request Button and verify the Request Extension is no longer available on the AuditFindings tile
#    Sleep    5
#
#
#Test 65:ProperPay:Communication Portal BA Dashboard_List_View Validate the Request Extension Functionality for an Appeal
#     [Documentation]    This test case Verifies Request Extension Functionality for an Appeal in BA dashboard List View
#     [Tags]    Functional-TS01_TC_001
#     CommonFunctionality.Connect to DB to Read the Test Data     ${baDashabordAppealExtensionQuery}
#     LoginPage.Valid User Login  ${BA_comm_usr_name}  ${BA_comm_pass}
#     CommonFunctionality.Wait Untill Page Loads
#     RecordAnalyst_Dashboard.Click List View Icon
#     CommonFunctionality.Wait Untill Page Loads
#     BillingAnalyst_Dashboard.Click Filter Button
#     BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Audit Number
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#    BillingAnalyst_Dashboard.Return request extension Button locator on AuditFindings In List View with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Verify that the request extension button is present on the identified AuditFindings Tile
#    BillingAnalyst_Dashboard.Return AuditFindings request extension Days Remaining locator In List View with patient account number passed by user   ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Verify the number of days remaining to submit is reflected on Audit tiles before requesting extension
#    BillingAnalyst_Dashboard.Click Request extension button on the AuditFindings Tile and verify the Request Extension pop up is displayed
#    BillingAnalyst_Dashboard.Return AuditFindings request extension Granted locator In List View with patient account number passed by user  ${data_list[0]['PatientAccountNumber']}
#    BillingAnalyst_Dashboard.Click Confirm Request Button and verify the Request Extension is no longer available on the AuditFindings tile
#    Sleep    5
#
#####
#Test 66 :ProperPay:Communication Portal BA Dashboard_List_View_Verify User can view the Provider name tool tip information
#    [Documentation]  This test case verifies User is able to sort the list of available audit history based on all the column header displayed.
#    [Tags]  Functional TS01_TC_001
#
#    CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity   ${baDashabordAuditQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    CommonFunctionality.Wait Untill Page Loads
#    RecordAnalyst_Dashboard.Click List View Icon
#     CommonFunctionality.Wait Untill Page Loads
#     BillingAnalyst_Dashboard.Click Filter Button
#     BillingAnalyst_Dashboard.Verify filter Functionality by providing Valid Audit Number
#    BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#    BillingAnalyst_Dashboard.mouse over on ProviderName and verify the tooltip information      ${data_list[0]['PatientAccountNumber']}
###
#
#Test 67 :ProperPay:Communication Portal BA Dashboard_List_View_Verify the pagination links
#    [Documentation]  This test case verifies User is able to navigate through the different paginations links
#    [Tags]  Functional TS01_TC_001
#
#    BillingAnalyst_Dashboard.Connect to Db with more than 10 records        ${baDashabordPaginationQuery}
#    LoginPage.Valid User Login According to Test Data Availability  ${BA_comm_usr_name}  ${BA_comm_pass}
#    CommonFunctionality.Wait Untill Page Loads
#    RecordAnalyst_Dashboard.Click List View Icon
#    CommonFunctionality.Wait Untill Page Loads
#    BillingAnalyst_Dashboard.Fetch the Number of Record on BA dashboard List View
#    BillingAnalyst_Dashboard.Verify clicking on Next displays next page
#    BillingAnalyst_Dashboard.Verify clicking on Previous displays previous page