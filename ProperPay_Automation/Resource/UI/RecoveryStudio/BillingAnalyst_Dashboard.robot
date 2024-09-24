*** Settings ***
Documentation    Script to Test Communication Portal
Library    SeleniumLibrary
Library    Easter
Library    String
Library    Collections
Library    os
#Library    RPA.PDF
Library    ..//ProperPay_Automation//Resource/Database//TestDataFormatter.py


Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//BillingAnalyst_DashBoard_Elements.py
Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//RecordAnalyst_DashBoard_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//BillingAnalyst_DashBoard_TestData.yaml

*** Variables ***
${substringToReplace}    texttoreplace


*** Keywords ***

Return AuditFindings Review Button locator with patient account number passed by user
     [Arguments]   ${PtAccNumAudit_PassedByUser}
     ${BillingAnalyst_AuditFindings_ReviewButton_Locator_New}=     Replace String      ${BillingAnalyst_AuditFindings_ReviewButton_Locator}   ${PtAccNumAudit}   ${PtAccNumAudit_PassedByUser}
     ${BillingAnalyst_AuditFindings_ReviewButton_Locator_New}=     Replace String      ${BillingAnalyst_AuditFindings_ReviewButton_Locator}   ${PtAccNumAudit}   ${PtAccNumAudit_PassedByUser}
     Set Global Variable    ${BillingAnalyst_AuditFindings_ReviewButton_Locator_New}


Return AppealFindings Review Button locator with patient account number passed by user
     [Arguments]   ${PtAccNumAppeal_PassedByUser}
     ${BillingAnalyst_AppealFindings_ReviewButton_Locator_New}=     Replace String      ${BillingAnalyst_AppealFindings_ReviewButton_Locator}   ${PtAccNumAppeal}    ${PtAccNumAppeal_PassedByUser}
     Set Global Variable    ${BillingAnalyst_AppealFindings_ReviewButton_Locator_New}

Return AuditFindings request extension Granted locator with patient account number passed by user
     [Arguments]   ${PtAccNumAudit_PassedByUser}
     ${BillingAnalyst_AuditFindings_RequestExtension_ExtensionGranted_Locator_New}=     Replace String      ${BillingAnalyst_AuditFindings_RequestExtension_ExtensionGranted_Locator}   ${PtAccNumAudit}    ${PtAccNumAudit_PassedByUser}
     Set Global Variable    ${BillingAnalyst_AuditFindings_RequestExtension_ExtensionGranted_Locator_New}

Return AppealFindings request extension Granted locator with patient account number passed by user
     [Arguments]   ${PtAccNumAppeal_PassedByUser}
     ${BillingAnalyst_AppealFindings_RequestExtension_ExtensionGranted_Locator_New}=     Replace String      ${BillingAnalyst_AppealFindings_RequestExtension_ExtensionGranted_Locator}   ${PtAccNumAppeal}    ${PtAccNumAppeal_PassedByUser}
     Set Global Variable    ${BillingAnalyst_AppealFindings_RequestExtension_ExtensionGranted_Locator_New}


Return AuditFindings request extension Days Remaining locator with patient account number passed by user
     [Arguments]   ${RequestExtensionPtAccAudit_PassedByUserAudit}
     ${BillingAnalyst_DaysRemaining_Audit_Locator_New}=     Replace String      ${BillingAnalyst_DaysRemaining_Audit_Locator}   ${PtAccNumAudit}    ${RequestExtensionPtAccAudit_PassedByUserAudit}
     Set Global Variable    ${BillingAnalyst_DaysRemaining_Audit_Locator_New}


Return AppealFindings request extension Days Remaining locator with patient account number passed by user
     [Arguments]   ${RequestExtensionPtAccAppeal_PassedByUser}
     ${BillingAnalyst_DaysRemaining_Appeal_Locator_New}=     Replace String      ${BillingAnalyst_DaysRemaining_Appeal_Locator}   ${PtAccNumAppeal}    ${RequestExtensionPtAccAppeal_PassedByUser}
     Set Global Variable    ${BillingAnalyst_DaysRemaining_Appeal_Locator_New}



Verify the number of days remaining to submit is reflected on Audit tiles before requesting extension
    Wait Until Element Is Visible    ${BillingAnalyst_DaysRemaining_Audit_Locator_New}     timeout=120
    ${BillingAnalyst_DaysRemaining_Audit_Actual}=    Get Text    ${BillingAnalyst_DaysRemaining_Audit_Locator_New}
    ${BillingAnalyst_DaysRemaining_Audit_Actual_Firstline} =     Get Line    ${BillingAnalyst_DaysRemaining_Audit_Actual}    0
    log    ${BillingAnalyst_DaysRemaining_Audit_Actual_Firstline}
    Set Global Variable    ${BillingAnalyst_DaysRemaining_Audit_Actual_Firstline}


Verify the number of days remaining to submit is reflected on Appeal tiles before requesting extension
    Wait Until Element Is Visible    ${BillingAnalyst_DaysRemaining_Appeal_Locator_New}     timeout=120
    ${BillingAnalyst_DaysRemaining_Appeal_Actual}=    Get Text    ${BillingAnalyst_DaysRemaining_Appeal_Locator_New}
    ${BillingAnalyst_DaysRemaining_Appeal_Actual_Firstline} =     Get Line    ${BillingAnalyst_DaysRemaining_Appeal_Actual}    0
    log    ${BillingAnalyst_DaysRemaining_Appeal_Actual_Firstline}
    Set Global Variable    ${BillingAnalyst_DaysRemaining_Appeal_Actual_Firstline}


Add 14 days to the number of day remaining to submit on Audit tiles
    ${Additionaldays_audit} =     Set Variable   ${14}
    ${number only_audit}=     Evaluate    "${BillingAnalyst_DaysRemaining_Audit_Actual_Firstline}".split(" ")[0]
    ${number only_audit}=     Convert To Number    ${number only_audit}
    log    ${number only_audit}
    ${TotalDaysAfterExtension_audit}=     Evaluate    ${number only_audit}+${Additionaldays_audit}
    log    ${TotalDaysAfterExtension_audit}
    Set Global Variable    ${TotalDaysAfterExtension_audit}

Add 14 days to the number of day remaining to submit on Appeal tiles
    ${Additionaldays_appeal} =     Set Variable   ${14}
    ${number only_appeal}=     Evaluate    "${BillingAnalyst_DaysRemaining_Appeal_Actual_Firstline}".split(" ")[0]
    ${number only_appeal}=     Convert To Number    ${number only_appeal}
    log    ${number only_appeal}
    ${TotalDaysAfterExtension_appeal}=     Evaluate    ${number only_appeal}+${Additionaldays_appeal}
    log    ${TotalDaysAfterExtension_appeal}
    Set Global Variable    ${TotalDaysAfterExtension_appeal}



Verify additional 14 days is added to number of days remaining to submit after requesting extension on Audit tile

    Wait Until Element Is Visible    ${BillingAnalyst_DaysRemaining_Audit_Locator_New}     timeout=120
    ${BillingAnalyst_DaysRemaining_Audit_Actual_AfterRequestExtns}=    Get Text    ${BillingAnalyst_DaysRemaining_Audit_Locator_New}
    ${BillingAnalyst_DaysRemaining_Audit_Actual_AfterRequestExtns_Firstline} =     Get Line    ${BillingAnalyst_DaysRemaining_Audit_Actual_AfterRequestExtns}    0
    log    ${BillingAnalyst_DaysRemaining_Audit_Actual_AfterRequestExtns_Firstline}
    ${number only_Audit}=     Evaluate    "${BillingAnalyst_DaysRemaining_Audit_Actual_AfterRequestExtns_Firstline}".split(" ")[0]
    ${NumberofDaysAftrExtns_Audit}=     Convert To Number    ${number only_Audit}
    Run Keyword If    "${TotalDaysAfterExtension_Audit}" == "${NumberofDaysAftrExtns_Audit}"   log    additional 14 days is added


Verify additional 14 days is added to number of days remaining to submit after requesting extension on Appeal tile

    Wait Until Element Is Visible    ${BillingAnalyst_DaysRemaining_Appeal_Locator_New}     timeout=120
    ${BillingAnalyst_DaysRemaining_Appeal_Actual_AfterRequestExtns}=    Get Text    ${BillingAnalyst_DaysRemaining_Appeal_Locator_New}
    ${BillingAnalyst_DaysRemaining_Appeal_Actual_AfterRequestExtns_Firstline} =     Get Line    ${BillingAnalyst_DaysRemaining_Appeal_Actual_AfterRequestExtns}    0
    log    ${BillingAnalyst_DaysRemaining_Appeal_Actual_AfterRequestExtns_Firstline}
    ${number only_Appeal}=     Evaluate    "${BillingAnalyst_DaysRemaining_Appeal_Actual_AfterRequestExtns_Firstline}".split(" ")[0]
    ${NumberofDaysAftrExtns_Appeal}=     Convert To Number    ${number only_Appeal}
    Run Keyword If    "${TotalDaysAfterExtension_Appeal}" == "${NumberofDaysAftrExtns_Appeal}"   log    additional 14 days is added



Click Audit Results Tab
    Wait Until Element Is Visible    ${Comm_Portal_HomePage_AuditResultsTab_Locator}   timeout=120
    Click Element    ${Comm_Portal_HomePage_AuditResultsTab_Locator}

Click Review button_AuditFinding

    Wait Until Element Is Visible    ${BillingAnalyst_AuditFindings_ReviewButton_Locator_New}    timeout=120
    wait until element is enabled     ${BillingAnalyst_AuditFindings_ReviewButton_Locator_New}    timeout=120
    Click Element    ${BillingAnalyst_AuditFindings_ReviewButton_Locator_New}


Click Review button_AppealFindings

    Wait Until Element Is Visible    ${BillingAnalyst_AppealFindings_ReviewButton_Locator_New}    timeout=120
    Click Element    ${BillingAnalyst_AppealFindings_ReviewButton_Locator_New}


Verify Review button is present_AuditFinding

    Wait Until Element Is Visible    ${BillingAnalyst_AuditFindings_ReviewButton_Locator_New}    timeout=120
    Element Should Be Visible    ${BillingAnalyst_AuditFindings_ReviewButton_Locator_New}


Verify Review button is present_AppealFindings

    Wait Until Element Is Visible    ${BillingAnalyst_AppealFindings_ReviewButton_Locator_New}    timeout=120
    Element Should Be Visible    ${BillingAnalyst_AppealFindings_ReviewButton_Locator_New}


Scroll down to the bottom of audit detail page
    Wait Until Element Is Visible   ${BillingAnalyst_AgreeWithFindings_Button_Locator}        timeout=120
    Scroll Element Into View    ${BillingAnalyst_AgreeWithFindings_Button_Locator}



Verify Agree with Findings button is present
   Wait Until Element Is Visible    ${BillingAnalyst_AgreeWithFindings_Button_Locator}
   Element Should Be Visible      ${BillingAnalyst_AgreeWithFindings_Button_Locator}

Verify Appeal Findings button is present
   Wait Until Element Is Visible    ${BillingAnalyst_AppealFindings_Button_Locator}
   Element Should Be Visible    ${BillingAnalyst_AppealFindings_Button_Locator}
   
Click latest Appeal tab
  Wait Until Element Is Visible    ${BillingAnalyst_AppealFindings_latestAppeal_Tab_Locator}            timeout=120
  Click Element   ${BillingAnalyst_AppealFindings_latestAppeal_Tab_Locator}

Click Appeal Findings button
   Wait Until Element Is Visible    ${BillingAnalyst_AppealFindings_Button_Locator}
   Click Button   ${BillingAnalyst_AppealFindings_Button_Locator}

Click Agree with Findings button
   Wait Until Element Is Visible    ${BillingAnalyst_AgreeWithFindings_Button_Locator}
   Click Button   ${BillingAnalyst_AgreeWithFindings_Button_Locator}

Verify Upload Documents Tab is not visible
     Element Should Not Be Visible    ${BillingAnalyst_AppealFindings_UploadDocuments_Tab_Locator}

Verify Upload Documents Tab is visible
     Wait Until Element Is Visible    ${BillingAnalyst_AppealFindings_UploadDocuments_Tab_Locator}   timeout=120
     Element Should Be Visible    ${BillingAnalyst_AppealFindings_UploadDocuments_Tab_Locator}
     Element Should Be Enabled    ${BillingAnalyst_AppealFindings_UploadDocuments_Tab_Locator}

Verify Browse File button is visible
     Wait Until Element Is Visible    ${BillingAnalyst_AppealFindings_BrowseFile_Locator}   timeout=120
     Element Should Be Visible    ${BillingAnalyst_AppealFindings_BrowseFile_Locator}


Upload document and verify Document type dropdown with the multiple option is enabled
     Wait Until Element Is Visible     ${BillingAnalyst_AppealFindings_BrowseFile_Locator}  timeout=120
     ${path}              TestDataFormatter.getSystemPath
      ${PdfFilepath_Initial} =          BuiltIn.Catenate     ${path}   ${PdfFilepath}
     ${filepath_Required} =   Replace String        ${PdfFilepath_Initial}       ProperPay_Automation \     ProperPay_Automation\
     Choose File    ${BillingAnalyst_AppealFindings_BrowseFileTab_Locator}  ${filepath_Required}
     Wait Until Element Is Visible    ${BillingAnalyst_UploadDocuments_DocumentType_dropDown_Locator}   timeout=120
     Element Should Be Visible    ${BillingAnalyst_UploadDocuments_DocumentType_dropDown_Locator}
     Element Should Be Enabled    ${BillingAnalyst_UploadDocuments_DocumentType_dropDown_Locator}
     Click Element    ${BillingAnalyst_UploadDocuments_DocumentType_dropDown_Locator}
     Element Should Be Enabled    ${BillingAnalyst_UploadDocuments_DocumentType_dropDownCheckboxOptions1_Locator}
     Wait Until Element Is Visible    ${BillingAnalyst_UploadDocuments_Window_Locator}
     Click Element    ${BillingAnalyst_UploadDocuments_Cancel_Button_Locator}


Upload a File

     [Arguments]   ${fileType}    ${DocumentType}  ${PdfFilepath}
     ${path}              TestDataFormatter.getSystemPath

     ${PdfFilepath_Initial} =          BuiltIn.Catenate     ${path}   ${PdfFilepath}
     ${filepath_Required} =   Replace String        ${PdfFilepath_Initial}       ProperPay_Automation \     ProperPay_Automation\
     Wait Until Element Is Visible     ${BillingAnalyst_AppealFindings_BrowseFile_Locator}  timeout=120
     Run Keyword If    "${fileType}"=="PDF" and "${DocumentType}"=="Required"
     ...    Run Keywords
     ...    Choose File    ${BillingAnalyst_AppealFindings_BrowseFileTab_Locator}  ${filepath_Required}
     #...    AND    Click Element    ${BillingAnalyst_UploadDocuments_DocumentType_dropDown_Locator}
     ...    AND    Click Element    ${BillingAnalyst_UploadDocuments_DocumentType_dropDownCheckboxOptions1_Locator}
     ...    AND    Click Element    ${BillingAnalyst_UploadDocuments_DocumentType_dropDownCheckboxOptions2_Locator}
     ...    AND    Click Element    ${BillingAnalyst_UploadDocuments_Button_Locator}
#     ...    AND    Click Button     ${BillingAnalyst_UploadDocuments_Done_Button_Locator}

     ...    ELSE IF       "${fileType}"=="PDF" and "${DocumentType}"=="Optional"
     ...    Run Keywords
     ...    Choose File    ${BillingAnalyst_AppealFindings_BrowseFileTab_Locator}  ${filepath_Required}
     #...    AND    Click Element    ${BillingAnalyst_UploadDocuments_DocumentType_dropDown_Locator}
     ...    AND    Click Element    ${BillingAnalyst_UploadDocuments_DocumentType_dropDownCheckboxOptions3_Locator}
     ...    AND    Click Element    ${BillingAnalyst_UploadDocuments_Button_Locator}
#     ...    AND    Click Button     ${BillingAnalyst_UploadDocuments_Done_Button_Locator}

     ...    ELSE IF       "${fileType}"=="PDF" and "${DocumentType}"=="None"
     ...    Run Keywords
     ...    Choose File    ${BillingAnalyst_AppealFindings_BrowseFileTab_Locator}  ${filepath_Required}
     ...    AND    Click Element    ${BillingAnalyst_UploadDocuments_Button_Locator}
#    ...    AND    Click Button     ${BillingAnalyst_UploadDocuments_Done_Button_Locator}

     ...    ELSE IF    "${fileType}"=="NonPDF" and "${DocumentType}"=="None"
     ...    Choose File    ${BillingAnalyst_AppealFindings_BrowseFileTab_Locator}  ${filepath_Required}
     sleep        10

Remove the Attached Document
     Wait Until Element Is Visible     ${RecordAnalyst_Remove_Attachment_Cancle_Locator}       timeout=120
     Click Element    ${RecordAnalyst_Remove_Attachment_Cancle_Locator}
     Element Should Be Visible    ${BillingAnalyst_window_Confirm_Delete_Document_Locator}   timeout=120
     Click Element     ${BillingAnalyst_Button_Yes_Confirm_Delete_Document_window_Locator}
     Wait Until Element Is Visible    ${BillingAnalyst_Window_Document_Delete_Locator}     timeout=120
     Click Element    ${BillingAnalyst_button_close_Document_delete_windw_locator}


Remove the Attached Document 100MB
     Wait Until Element Is Visible     ${file100MB_Remove_Attachment_Close_Locator}       timeout=120
     Click Element    ${file100MB_Remove_Attachment_Close_Locator}
     Element Should Be Visible    ${BillingAnalyst_window_Confirm_Delete_Document_Locator}   timeout=120
     Click Element     ${BillingAnalyst_Button_Yes_Confirm_Delete_Document_window_Locator}
     Wait Until Element Is Visible    ${BillingAnalyst_Window_Document_Delete_Locator}     timeout=120
     Click Element    ${BillingAnalyst_button_close_Document_delete_windw_locator}

Verify PDF file is uploaded sucessfully
     Wait Until Element Is Visible   ${BillingAnalyst_UploadDocuments_fileAttached_Locator}                 timeout=120
     Element Should Be Visible    ${BillingAnalyst_UploadDocuments_fileAttached_Locator}

Verify file upload is in progress
     Wait Until Element Is Visible     ${fileupload_Inprogress_locator}
     Element Should Be Visible      ${fileupload_Inprogress_locator}


Verify 100 MB file is uploaded sucessfully
     Wait Until Element Is Visible   ${BillingAnalyst_UploadDocuments_fileAttached_100MB_Locator}    timeout=180
     Element Should Be Visible    ${BillingAnalyst_UploadDocuments_fileAttached_100MB_Locator}


Verify NonPDF file is not uploaded
     Wait Until Element Is Visible    ${BillingAnalyst_UploadDocuments_DocumentSelectionErrors_window_Locator}
     Element Should Be Visible    ${BillingAnalyst_UploadDocuments_DocumentSelectionErrors_window_Locator}

Verify BillingAnalyst_AppealFindings_Comments_Authorized_eSignature Tab is visible
     Wait Until Element Is Visible    ${BillingAnalyst_AppealFindings_Comments_Authorized_eSignature_Locator}   timeout=120
     Element Should Be Visible    ${BillingAnalyst_AppealFindings_Comments_Authorized_eSignature_Locator}
     Element Should Be Enabled    ${BillingAnalyst_AppealFindings_Comments_Authorized_eSignature_Locator}

Verify BillingAnalyst_AppealFindings_Authorized_eSignature Tab is visible
     Wait Until Element Is Visible    ${BillingAnalyst_AppealFindings_Authorized_eSignature_Locator}   timeout=120
     Element Should Be Visible    ${BillingAnalyst_AppealFindings_Authorized_eSignature_Locator}
     Element Should Be Enabled    ${BillingAnalyst_AppealFindings_Authorized_eSignature_Locator}


Scroll down to the bottom of page
   Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
   Sleep    5


Scroll down to the bottom of Appeal details page
    Element Should Be Visible    ${BillingAnalyst_AppealFindings_Cancel_Button_Locator}     timeout=120
    Scroll Element Into View    ${BillingAnalyst_AppealFindings_Cancel_Button_Locator}



Verify Confirm Appeal button is enabled
    Sleep    5
    Wait Until Element Is Visible    ${BillingAnalyst_AppealFindings_ConfirmAppeal_Button_Locator}    timeout=120
    Element Should Be Enabled    ${BillingAnalyst_AppealFindings_ConfirmAppeal_Button_Locator}

Verify Confirm Appeal button is disabled
    Sleep    5
    Wait Until Element Is Visible    ${BillingAnalyst_AppealFindings_ConfirmAppeal_Button_Locator}    timeout=120
    Element Should Be Disabled    ${BillingAnalyst_AppealFindings_ConfirmAppeal_Button_Locator}

Verify Authorized eSignature details

   Textfield Value Should Be     ${BillingAnalyst_Esignature_Locator}    ${Esignature}
   Textfield Value Should Be     ${BillingAnalyst_Title_Locator}    ${Title}
   ${date}=      Get Current Date     result_format=%Y-%m-%d
   Textfield Value Should Be     ${BillingAnalyst_date_Locator}    ${date}

Enter reason for appeal
    sleep  10
    Input Text    ${BillingAnalyst_AppealFindings_appealReasonComments_Locator}    ${AppealReason}

Verify Document uploading errors window appears with FileAlreadyExists error message
      Wait Until Element Is Visible    ${BillingAnalyst_window_Document_uploading_error_locator}   timeout=120
      Element Should Be Visible     ${BillingAnalyst_window_Document_uploading_error_locator}
      ${BillingAnalyst_window_Document_uploading_error_locator_msg_Actual}=    Get Text    ${BillingAnalyst_window_Document_uploading_error_locator}
      Should Contain    ${BillingAnalyst_window_Document_uploading_error_locator_msg_Actual}     Document Not Saved Successfully.
 #     Should Contain    ${BillingAnalyst_window_Document_uploading_error_locator_msg_Actual}     The following files listed below are already exists for the Audit
#     Wait Until Element Is Visible     ${BillingAnalyst_button_close_Document_uploading_error_locator}
#     Click Button     ${BillingAnalyst_button_close_Document_uploading_error_locator}
      Wait Until Element Is Visible     ${BillingAnalyst_button_OK_Document_uploading_error_locator}
      Click Button     ${BillingAnalyst_button_OK_Document_uploading_error_locator}
      wait until element is not visible  ${BillingAnalyst_button_OK_Document_uploading_error_locator}
#      Wait Until Element Is Visible    ${BillingAnalyst_UploadDocuments_Window_Locator}
#      wait until element is enabled    ${BillingAnalyst_UploadDocuments_Window_Locator}
#      sleep 10
#      Click Element    ${BillingAnalyst_UploadDocuments_Cancel_Button_Locator}
#      Wait Until Element Is Visible    ${BillingAnalyst_UploadDocuments_Done_Button_Locator}
#      Click Element  ${BillingAnalyst_UploadDocuments_Done_Button_Locator}



Verify Audit findings details entered is visible

   ${formattedDOB}             TestDataFormatter.formatDate           ${data_list[0]['DateOfBirth']}
   ${BillingAnalyst_AuditInfo_DOB_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditInfo_DOB_Detail_Locator}   ${substringToReplace}    ${formattedDOB}
   Wait Until Element Is Visible    ${BillingAnalyst_AuditInfo_DOB_Detail_Locator_New}            timeout=120
   Element Should Be Visible      ${BillingAnalyst_AuditInfo_DOB_Detail_Locator_New}
   ${BillingAnalyst_AuditInfo_SubscriberID_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditInfo_SubscriberID_Detail_Locator}   ${substringToReplace}    ${data_list[0]['SubscriberId']}
   Wait Until Element Is Visible    ${BillingAnalyst_AuditInfo_SubscriberID_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AuditInfo_SubscriberID_Detail_Locator_New}
   ${BillingAnalyst_AuditInfo_GroupID_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditInfo_GroupID_Detail_Locator}   ${substringToReplace}    ${data_list[0]['PolicyNumber']}
   Wait Until Element Is Visible    ${BillingAnalyst_AuditInfo_GroupID_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AuditInfo_GroupID_Detail_Locator_New}
   ${BillingAnalyst_AuditInfo_ClaimNum_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditInfo_ClaimNum_Detail_Locator}   ${substringToReplace}    ${data_list[0]['ClaimNumber']}
   Wait Until Element Is Visible    ${BillingAnalyst_AuditInfo_ClaimNum_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AuditInfo_ClaimNum_Detail_Locator_New}
   ${BillingAnalyst_AuditInfo_ClaimType_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditInfo_ClaimType_Detail_Locator}   ${substringToReplace}    ${data_list[0]['ClaimType']}
   Wait Until Element Is Visible    ${BillingAnalyst_AuditInfo_ClaimType_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AuditInfo_ClaimType_Detail_Locator_New}
  ${BillingAnalyst_AuditInfo_MediRecNum_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditInfo_MediRecNum_Detail_Locator}   ${substringToReplace}    ${data_list[0]['MRNumber']}
  Wait Until Element Is Visible    ${BillingAnalyst_AuditInfo_MediRecNum_Detail_Locator_New}
  Element Should Be Visible      ${BillingAnalyst_AuditInfo_MediRecNum_Detail_Locator_New}
   ${BillingAnalyst_AuditInfo_AuditNum_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditInfo_AuditNum_Detail_Locator}   ${substringToReplace}    ${data_list[0]['AuditNumber']}
   Wait Until Element Is Visible    ${BillingAnalyst_AuditInfo_AuditNum_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AuditInfo_AuditNum_Detail_Locator_New}
   ${formattedAuditStatus}             TestDataFormatter.formatAuditStatus           ${data_list[0]['AuditStatus']}
   ${BillingAnalyst_AuditInfo_AuditStatus_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditInfo_AuditStatus_Detail_Locator}   ${substringToReplace}    ${formattedAuditStatus}
   Wait Until Element Is Visible    ${BillingAnalyst_AuditInfo_AuditStatus_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AuditInfo_AuditStatus_Detail_Locator_New}
   ${BillingAnalyst_AuditInfo_AuditType_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditInfo_AuditType_Detail_Locator}   ${substringToReplace}    ${data_list[0]['AuditType']}
   Wait Until Element Is Visible    ${BillingAnalyst_AuditInfo_AuditType_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AuditInfo_AuditType_Detail_Locator_New}
   ${BillingAnalyst_AuditInfo_ProviderName_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditInfo_ProviderName_Detail_Locator}   ${substringToReplace}    ${data_list[0]['ProviderName']}
   Wait Until Element Is Visible    ${BillingAnalyst_AuditInfo_ProviderName_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AuditInfo_ProviderName_Detail_Locator_New}
   ${BillingAnalyst_AuditInfo_ProviderNum_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditInfo_ProviderNum_Detail_Locator}   ${substringToReplace}    ${data_list[0]['ProviderId']}
   Wait Until Element Is Visible    ${BillingAnalyst_AuditInfo_ProviderNum_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AuditInfo_ProviderNum_Detail_Locator_New}
   ${BillingAnalyst_AuditInfo_DivisionCode_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditInfo_DivisionCode_Detail_Locator}   ${substringToReplace}    ${data_list[0]['DivisionCode']}
   Wait Until Element Is Visible    ${BillingAnalyst_AuditInfo_DivisionCode_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AuditInfo_DivisionCode_Detail_Locator_New}
   ${formattedAdmitDate}             TestDataFormatter.formatDate           ${data_list[0]['AdmitDate']}
   ${BillingAnalyst_AuditInfo_AdmitDate_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditInfo_AdmitDate_Detail_Locator}   ${substringToReplace}    ${formattedAdmitDate}
   Wait Until Element Is Visible    ${BillingAnalyst_AuditInfo_AdmitDate_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AuditInfo_AdmitDate_Detail_Locator_New}
   ${formattedDischargeDate}             TestDataFormatter.formatDate           ${data_list[0]['DischargeDate']}
   ${BillingAnalyst_AuditInfo_DischargeDate_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditInfo_DischargeDate_Detail_Locator}   ${substringToReplace}    ${formattedDischargeDate}
   Wait Until Element Is Visible    ${BillingAnalyst_AuditInfo_DischargeDate_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AuditInfo_DischargeDate_Detail_Locator_New}
   ${BillingAnalyst_AuditInfo_Prepay_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditInfo_Prepay_Detail_Locator}   ${substringToReplace}   ${data_list[0]['Prepay']}
   Wait Until Element Is Visible    ${BillingAnalyst_AuditInfo_Prepay_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AuditInfo_Prepay_Detail_Locator_New}


Verify Appeal findings details entered is visible
    ${formattedDOB}             TestDataFormatter.formatDate           ${data_list[0]['DateOfBirth']}
   ${BillingAnalyst_AppealInfo_DOB_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealInfo_DOB_Detail_Locator}   ${substringToReplace}    ${formattedDOB}
   Wait Until Element Is Visible    ${BillingAnalyst_AppealInfo_DOB_Detail_Locator_New}                  timeout=120
   Element Should Be Visible      ${BillingAnalyst_AppealInfo_DOB_Detail_Locator_New}
   ${BillingAnalyst_AppealInfo_SubscriberID_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealInfo_SubscriberID_Detail_Locator}   ${substringToReplace}    ${data_list[0]['SubscriberId']}
   Wait Until Element Is Visible    ${BillingAnalyst_AppealInfo_SubscriberID_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AppealInfo_SubscriberID_Detail_Locator_New}
   ${BillingAnalyst_AppealInfo_GroupID_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealInfo_GroupID_Detail_Locator}   ${substringToReplace}    ${data_list[0]['PolicyNumber']}
   Wait Until Element Is Visible    ${BillingAnalyst_AppealInfo_GroupID_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AppealInfo_GroupID_Detail_Locator_New}
   ${BillingAnalyst_AppealInfo_ClaimNum_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealInfo_ClaimNum_Detail_Locator}   ${substringToReplace}    ${data_list[0]['ClaimNumber']}
   Wait Until Element Is Visible    ${BillingAnalyst_AppealInfo_ClaimNum_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AppealInfo_ClaimNum_Detail_Locator_New}
   ${BillingAnalyst_AppealInfo_ClaimType_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealInfo_ClaimType_Detail_Locator}   ${substringToReplace}    ${data_list[0]['ClaimType']}
   Wait Until Element Is Visible    ${BillingAnalyst_AppealInfo_ClaimType_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AppealInfo_ClaimType_Detail_Locator_New}
  ${BillingAnalyst_AppealInfo_MediRecNum_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealInfo_MediRecNum_Detail_Locator}   ${substringToReplace}    ${data_list[0]['MRNumber']}
   Wait Until Element Is Visible    ${BillingAnalyst_AppealInfo_MediRecNum_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AppealInfo_MediRecNum_Detail_Locator_New}
   ${BillingAnalyst_AppealInfo_AuditNum_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealInfo_AuditNum_Detail_Locator}   ${substringToReplace}    ${data_list[0]['AuditNumber']}
   Wait Until Element Is Visible    ${BillingAnalyst_AppealInfo_AuditNum_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AppealInfo_AuditNum_Detail_Locator_New}
   ${formattedAuditStatus}             TestDataFormatter.formatAuditStatus           ${data_list[0]['AuditStatus']}
   ${BillingAnalyst_AppealInfo_AuditStatus_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealInfo_AuditStatus_Detail_Locator}   ${substringToReplace}    ${formattedAuditStatus}
   Wait Until Element Is Visible    ${BillingAnalyst_AppealInfo_AuditStatus_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AppealInfo_AuditStatus_Detail_Locator_New}
   ${BillingAnalyst_AppealInfo_AuditType_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealInfo_AuditType_Detail_Locator}   ${substringToReplace}    ${data_list[0]['AuditType']}
   Wait Until Element Is Visible    ${BillingAnalyst_AppealInfo_AuditType_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AppealInfo_AuditType_Detail_Locator_New}
   ${BillingAnalyst_AppealInfo_ProviderName_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealInfo_ProviderName_Detail_Locator}   ${substringToReplace}    ${data_list[0]['ProviderName']}
   Wait Until Element Is Visible    ${BillingAnalyst_AppealInfo_ProviderName_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AppealInfo_ProviderName_Detail_Locator_New}
   ${BillingAnalyst_AppealInfo_ProviderNum_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealInfo_ProviderNum_Detail_Locator}   ${substringToReplace}    ${data_list[0]['ProviderId']}
   Wait Until Element Is Visible    ${BillingAnalyst_AppealInfo_ProviderNum_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AppealInfo_ProviderNum_Detail_Locator_New}
   ${BillingAnalyst_AppealInfo_DivisionCode_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealInfo_DivisionCode_Detail_Locator}   ${substringToReplace}    ${data_list[0]['DivisionCode']}
   Wait Until Element Is Visible    ${BillingAnalyst_AppealInfo_DivisionCode_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AppealInfo_DivisionCode_Detail_Locator_New}
   ${formattedAdmitDate}             TestDataFormatter.formatDate           ${data_list[0]['AdmitDate']}
   ${BillingAnalyst_AppealInfo_AdmitDate_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealInfo_AdmitDate_Detail_Locator}   ${substringToReplace}    ${formattedAdmitDate}
   Wait Until Element Is Visible    ${BillingAnalyst_AppealInfo_AdmitDate_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AppealInfo_AdmitDate_Detail_Locator_New}
   ${formattedDischargeDate}             TestDataFormatter.formatDate           ${data_list[0]['DischargeDate']}
   ${BillingAnalyst_AppealInfo_DischargeDate_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealInfo_DischargeDate_Detail_Locator}   ${substringToReplace}    ${formattedDischargeDate}
   Wait Until Element Is Visible    ${BillingAnalyst_AppealInfo_DischargeDate_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AppealInfo_DischargeDate_Detail_Locator_New}
    ${BillingAnalyst_AppealInfo_Prepay_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealInfo_Prepay_Detail_Locator}   ${substringToReplace}    ${data_list[0]['Prepay']}
   Wait Until Element Is Visible    ${BillingAnalyst_AppealInfo_Prepay_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AppealInfo_Prepay_Detail_Locator_New}


Return AuditFindings Patient Account locator with patient account number passed by user
     [Arguments]   ${PtAccNumAudit_PassedByUser}
     ${BillingAnalyst_AuditFindingsTile_PtAccNum_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditFindingsTile_PtAccNum_Detail_Locator}   ${PtAccNumAudit}   ${PtAccNumAudit_PassedByUser}
     Set Global Variable    ${BillingAnalyst_AuditFindingsTile_PtAccNum_Detail_Locator_New}


Return AppealFindings Patient Account locator with patient account number passed by user
     [Arguments]   ${PtAccNumAppeal_PassedByUser}
     ${BillingAnalyst_AppealFindingsTile_PtAccNum_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealFindingsTile_PtAccNum_Detail_Locator}   ${PtAccNumAppeal}    ${PtAccNumAppeal_PassedByUser}
     Set Global Variable     ${BillingAnalyst_AppealFindingsTile_PtAccNum_Detail_Locator_New}




Verify Audit findings tile has details with its corresponding values
    ${PatientName}             TestDataFormatter.formatPatientName          ${data_list[0]['PatientFirstName']}    ${data_list[0]['PatientLastName']}
   ${BillingAnalyst_AuditFindingsTile_PtName_Locator_New} =  Replace String   ${BillingAnalyst_AuditFindingsTile_PtName_Locator}  ${substringToReplace}  ${PatientName}
   Wait Until Element Is Visible    ${BillingAnalyst_AuditFindingsTile_PtName_Locator_New}            timeout=120
   Element Should Be Visible      ${BillingAnalyst_AuditFindingsTile_PtName_Locator_New}
   ${formattedDOB}             TestDataFormatter.formatDate           ${data_list[0]['DateOfBirth']}
   ${BillingAnalyst_AuditFindingsTile_DOB_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditFindingsTile_DOB_Detail_Locator}   ${substringToReplace}    ${formattedDOB}
   Wait Until Element Is Visible    ${BillingAnalyst_AuditFindingsTile_DOB_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AuditFindingsTile_DOB_Detail_Locator_New}
   ${BillingAnalyst_AuditFindingsTile_PtAccNum_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditFindingsTile_PtAccNum_Detail_Locator}   ${substringToReplace}    ${data_list[0]['PatientAccountNumber']}
   Wait Until Element Is Visible    ${BillingAnalyst_AuditFindingsTile_PtAccNum_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AuditFindingsTile_PtAccNum_Detail_Locator_New}
   ${BillingAnalyst_AuditFindingsTile_AuditNum_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditFindingsTile_AuditNum_Detail_Locator}   ${substringToReplace}    ${data_list[0]['AuditNumber']}
   Wait Until Element Is Visible    ${BillingAnalyst_AuditFindingsTile_AuditNum_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AuditFindingsTile_AuditNum_Detail_Locator_New}
   ${dateOfService}             TestDataFormatter.formatDateOfService          ${data_list[0]['AdmitDate']}    ${data_list[0]['DischargeDate']}
   ${BillingAnalyst_AuditFindingsTile_DOS_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditFindingsTile_DOS_Detail_Locator}   ${substringToReplace}    ${dateOfService}
   Wait Until Element Is Visible    ${BillingAnalyst_AuditFindingsTile_DOS_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AuditFindingsTile_DOS_Detail_Locator_New}
   ${BillingAnalyst_AuditFindingsTile_MediRecNum_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditFindingsTile_MediRecNum_Detail_Locator}   ${substringToReplace}    ${data_list[0]['MRNumber']}
   Wait Until Element Is Visible    ${BillingAnalyst_AuditFindingsTile_MediRecNum_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AuditFindingsTile_MediRecNum_Detail_Locator_New}
   ${BillingAnalyst_AuditFindingsTile_ClaimNum_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditFindingsTile_ClaimNum_Detail_Locator}   ${substringToReplace}    ${data_list[0]['ClaimNumber']}
   Wait Until Element Is Visible    ${BillingAnalyst_AuditFindingsTile_ClaimNum_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AuditFindingsTile_ClaimNum_Detail_Locator_New}
   ${BillingAnalyst_AuditFindingsTile_ProviderName_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditFindingsTile_ProviderName_Detail_Locator}   ${substringToReplace}    ${data_list[0]['ProviderName']}
   Wait Until Element Is Visible    ${BillingAnalyst_AuditFindingsTile_ProviderName_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AuditFindingsTile_ProviderName_Detail_Locator_New}
   ${BillingAnalyst_AuditFindingsTile_ProviderID_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditFindingsTile_ProviderID_Detail_Locator}   ${substringToReplace}    ${data_list[0]['ProviderId']}
   Wait Until Element Is Visible    ${BillingAnalyst_AuditFindingsTile_ProviderID_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AuditFindingsTile_ProviderID_Detail_Locator_New}

    IF  '${data_list[0]['Prepay']}=False'
       ${PrepayValue}=     Set Variable    No
       Set Global Variable     ${PrepayValue}
    ELSE IF   '${data_list[0]['Prepay']}=True'
       ${PrepayValue}=     Set Variable    Yes
       Set Global Variable     ${PrepayValue}
    END
    ${BillingAnalyst_AuditFindingsTile_Prepay_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditFindingsTile_Prepay_Detail_Locator}   ${substringToReplace}    ${PrepayValue}
   Wait Until Element Is Visible    ${BillingAnalyst_AuditFindingsTile_Prepay_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AuditFindingsTile_Prepay_Detail_Locator_New}
   ${baDashabordAppealReasonQueryNew}            replace string       ${baDashabordAppealReasonQuery}        ${substringToReplace}           ${data_list[0]['AuditNumber']}
   CommonFunctionality.Connect to DB for a specific Database     ${baDashabordAppealReasonQueryNew}    ${DBName}
   ${BillingAnalyst_AuditFindingsTile_AppealDecision_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AuditFindingsTile_AppealDecision_Detail_Locator}   ${substringToReplace}    ${data_list[0]['AppealDecision']}
    Wait Until Element Is Visible    ${BillingAnalyst_AuditFindingsTile_AppealDecision_Detail_Locator_New}
    Element Should Be Visible      ${BillingAnalyst_AuditFindingsTile_AppealDecision_Detail_Locator_New}




Verify Appeal findings tile has details with its corresponding values

   ${PatientName}             TestDataFormatter.formatPatientName          ${data_list[0]['PatientFirstName']}    ${data_list[0]['PatientLastName']}
   ${BillingAnalyst_AppealFindingsTile_PtName_Locator_New} =  Replace String   ${BillingAnalyst_AppealFindingsTile_PtName_Locator}  ${substringToReplace}  ${PatientName}
   Wait Until Element Is Visible    ${BillingAnalyst_AppealFindingsTile_PtName_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AppealFindingsTile_PtName_Locator_New}
   ${formattedDOB}             TestDataFormatter.formatDate           ${data_list[0]['DateOfBirth']}
   ${BillingAnalyst_AppealFindingsTile_DOB_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealFindingsTile_DOB_Detail_Locator}   ${substringToReplace}    ${formattedDOB}
   Wait Until Element Is Visible    ${BillingAnalyst_AppealFindingsTile_DOB_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AppealFindingsTile_DOB_Detail_Locator_New}
   ${BillingAnalyst_AppealFindingsTile_PtAccNum_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealFindingsTile_PtAccNum_Detail_Locator}   ${substringToReplace}    ${data_list[0]['PatientAccountNumber']}
   Wait Until Element Is Visible    ${BillingAnalyst_AppealFindingsTile_PtAccNum_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AppealFindingsTile_PtAccNum_Detail_Locator_New}
   ${BillingAnalyst_AppealFindingsTile_AuditNum_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealFindingsTile_AuditNum_Detail_Locator}   ${substringToReplace}    ${data_list[0]['AuditNumber']}
   Wait Until Element Is Visible    ${BillingAnalyst_AppealFindingsTile_AuditNum_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AppealFindingsTile_AuditNum_Detail_Locator_New}
   ${dateOfService}             TestDataFormatter.formatDateOfService          ${data_list[0]['AdmitDate']}    ${data_list[0]['DischargeDate']}
   ${BillingAnalyst_AppealFindingsTile_DOS_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealFindingsTile_DOS_Detail_Locator}   ${substringToReplace}    ${dateOfService}
   Wait Until Element Is Visible    ${BillingAnalyst_AppealFindingsTile_DOS_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AppealFindingsTile_DOS_Detail_Locator_New}
   ${BillingAnalyst_AppealFindingsTile_MediRecNum_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealFindingsTile_MediRecNum_Detail_Locator}  ${substringToReplace}    ${data_list[0]['MRNumber']}
   Wait Until Element Is Visible    ${BillingAnalyst_AppealFindingsTile_MediRecNum_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AppealFindingsTile_MediRecNum_Detail_Locator_New}
   ${BillingAnalyst_AppealFindingsTile_ClaimNum_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealFindingsTile_ClaimNum_Detail_Locator}   ${substringToReplace}    ${data_list[0]['ClaimNumber']}
   Wait Until Element Is Visible    ${BillingAnalyst_AppealFindingsTile_ClaimNum_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AppealFindingsTile_ClaimNum_Detail_Locator_New}
   ${BillingAnalyst_AppealFindingsTile_ProviderName_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealFindingsTile_ProviderName_Detail_Locator}   ${substringToReplace}    ${data_list[0]['ProviderName']}
   Wait Until Element Is Visible    ${BillingAnalyst_AppealFindingsTile_ProviderName_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AppealFindingsTile_ProviderName_Detail_Locator_New}
   ${BillingAnalyst_AppealFindingsTile_ProviderID_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealFindingsTile_ProviderID_Detail_Locator}   ${substringToReplace}    ${data_list[0]['ProviderId']}
   Wait Until Element Is Visible    ${BillingAnalyst_AppealFindingsTile_ProviderID_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AppealFindingsTile_ProviderID_Detail_Locator_New}

#   IF  "${data_list[0]['Prepay']}"=="FALSE"
#       ${PrepayValue}  =     Set Variable    No
#       Set Global Variable     ${PrepayValue}
#   ELSE IF   "${data_list[0]['Prepay']}"=="TRUE"
#       ${PrepayValue}  =     Set Variable    Yes
#       Set Global Variable     ${PrepayValue}
#   END
#   ${BillingAnalyst_AppealFindingsTile_Prepay_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealFindingsTile_Prepay_Detail_Locator}   ${substringToReplace}    ${PrepayValue}
#   Wait Until Element Is Visible    ${BillingAnalyst_AppealFindingsTile_Prepay_Detail_Locator_New}
#   Element Should Be Visible      ${BillingAnalyst_AppealFindingsTile_Prepay_Detail_Locator_New}
#    ${baDashabordAppealReasonQueryNew}            replace string       ${baDashabordAppealReasonQuery}        ${substringToReplace}           ${data_list[0]['AuditNumber']}
#   CommonFunctionality.Connect to DB to Read the Test Data     ${baDashabordAppealReasonQueryNew}
#   ${BillingAnalyst_AppealFindingsTile_AppealDecision_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealFindingsTile_AppealDecision_Detail_Locator}   ${substringToReplace}    ${data_list[0]['AppealDecision']}
#  Wait Until Element Is Visible    ${BillingAnalyst_AppealFindingsTile_AppealDecision_Detail_Locator_New}
#  Element Should Be Visible      ${BillingAnalyst_AppealFindingsTile_AppealDecision_Detail_Locator_New}



Fetch Total count of Audit Results Tile on BA dashboard
    Wait Until Element Is Visible    ${AuditResults_Tile_Locator}
    ${AuditResults_Tile_count} =   Get Element Count   ${AuditResults_Tile_Locator}
    ${AuditResults_Tile_count_New}=    Convert To String     ${AuditResults_Tile_count}
    Set Global Variable     ${AuditResults_Tile_count_New}


Replace the dynamically fetched Audit Results Tile total count number
     ${Comm_Portal_HomePage_AuditResultsTab_Locator_WithTotalCount_Locator_New}=     Replace String      ${Comm_Portal_HomePage_AuditResultsTab_Locator_WithTotalCount_Locator}   ${AuditResults_Tile_count}    ${AuditResults_Tile_count_New}
     Set Global Variable    ${Comm_Portal_HomePage_AuditResultsTab_Locator_WithTotalCount_Locator_New}


Validate the Audit Results tab contains the total count of tiles
    Wait Until Element Is Visible    ${Comm_Portal_HomePage_AuditResultsTab_Locator_WithTotalCount_Locator_New}
    Element Should Be Visible  ${Comm_Portal_HomePage_AuditResultsTab_Locator_WithTotalCount_Locator_New}

#Get Row Index of file attachment
#    Wait Until Element Is Visible    ${BillingAnalyst_AppealFinding_DocumentNameList_Table_rows_Locator}        timeout=120
#    ${Elements}=    Get WebElements    ${BillingAnalyst_AppealFinding_DocumentNameList_Table_rows_Locator}
#    ${RowIndex}=    Set variable    0
#    FOR    ${Element}    IN    @{Elements}
#       ${text}=    Get Text    ${Element}
#       ${text}=    Get Line    ${text}  0
#       ${text}=    Get Substring    ${text}    5
#       ${RowIndex}=    Evaluate    ${RowIndex} + 1
#       Exit For Loop If  '${text}'=='${PDFFileNameUpload}'
#    END
#    ${RowIndex}=  Convert To String    ${RowIndex}
#    Set Global Variable    ${RowIndex}


#Replace the row index with the dynamically feteched index for removing attachment
#    [Arguments]   ${RowIndex}
#    ${BillingAnalyst_Remove_Attachment_Close_Locator}=     Replace String      ${BillingAnalyst_Remove_Attachment_Close_Locator}   ${DefaultIndex}   ${RowIndex}
#    Set Global Variable    ${BillingAnalyst_Remove_Attachment_Close_Locator}


#Replace the row index with the dynamically feteched index
#     [Arguments]   ${RowIndex}
#     ${BillingAnalyst_AppealFinding_DocumentDetailsList_Table_rows_Locator}=     Replace String      ${BillingAnalyst_AppealFinding_DocumentDetailsList_Table_rows_Locator}   ${DefaultIndex}   ${RowIndex}
#     Set Global Variable    ${BillingAnalyst_AppealFinding_DocumentDetailsList_Table_rows_Locator}
#
#     ${BillingAnalyst_AppealFindings_DocumentName_Locator}=     Replace String      ${BillingAnalyst_AppealFindings_DocumentName_Locator}   ${DefaultIndex}   ${RowIndex}
#     Set Global Variable    ${BillingAnalyst_AppealFindings_DocumentName_Locator}
#
#     ${BillingAnalyst_AppealFindings_DocumentSize_Locator}=     Replace String      ${BillingAnalyst_AppealFindings_DocumentSize_Locator}   ${DefaultIndex}   ${RowIndex}
#     Set Global Variable    ${BillingAnalyst_AppealFindings_DocumentSize_Locator}
#
#     ${BillingAnalyst_AppealFindings_DocumentUploadDate_Locator}=     Replace String      ${BillingAnalyst_AppealFindings_DocumentUploadDate_Locator}   ${DefaultIndex}   ${RowIndex}
#     Set Global Variable    ${BillingAnalyst_AppealFindings_DocumentUploadDate_Locator}
#
#     ${BillingAnalyst_AppealFindings_DocumentUploadTime_Locator}=     Replace String      ${BillingAnalyst_AppealFindings_DocumentUploadTime_Locator}   ${DefaultIndex}   ${RowIndex}
#     Set Global Variable    ${BillingAnalyst_AppealFindings_DocumentUploadTime_Locator}
#
#     ${BillingAnalyst_AppealFindings_DocumentUser_Locator}=     Replace String      ${BillingAnalyst_AppealFindings_DocumentUser_Locator}   ${DefaultIndex}   ${RowIndex}
#     Set Global Variable    ${BillingAnalyst_AppealFindings_DocumentUser_Locator}



Fetch FileUpload Details

      #Filesize
      Wait Until Element Is Visible    ${BillingAnalyst_AppealFindings_DocumentSize_Locator}
      ${FileZize_Portal}=    Get Text    ${BillingAnalyst_AppealFindings_DocumentSize_Locator}
      Set Global Variable   ${FileZize_Portal}
      #UploadDate
      Wait Until Element Is Visible    ${BillingAnalyst_AppealFindings_DocumentUploadDate_Locator}
      ${UploadDate_Portal}=    Get Text    ${BillingAnalyst_AppealFindings_DocumentUploadDate_Locator}
      Set Global Variable   ${UploadDate_Portal}
      #UploadTime
      Wait Until Element Is Visible    ${BillingAnalyst_AppealFindings_DocumentUploadTime_Locator}
      ${UploadTime_Portal}=    Get Text    ${BillingAnalyst_AppealFindings_DocumentUploadTime_Locator}
      Set Global Variable  ${UploadTime_Portal}
      #UploadUser
      Wait Until Element Is Visible    ${BillingAnalyst_AppealFindings_DocumentUser_Locator}
      ${UploadUser_Portal}=    Get Text    ${BillingAnalyst_AppealFindings_DocumentUser_Locator}
      Set Global Variable  ${UploadUser_Portal}


Validate FileUpload Details

     #Filesize
      Should Be Equal     ${PDFFileSizeUpload}    ${FileZize_Portal}
      #UploadDate
      ${date}=      Get Current Date     result_format=%m/%d/%Y
      Should Be Equal     ${date}    ${UploadDate_Portal}
      #Uploa dTime
      ${time}=  Get Current Date    result_format=%I:%M %p
      log   ${time}
      Should Contain     ${UploadTime_Portal}    ${time}
      #UploadUser
      Should Be Equal     ${PDFFileploadUser}    ${UploadUser_Portal}



Return request extension Button locator on AppealFindings Tile with patient account number passed by user
     [Arguments]   ${RequestExtensionPtAccAppeal_PassedByUser}
     ${BillingAnalyst_AppealFinding_RequestExtension_Button_Locator_New}=     Replace String      ${BillingAnalyst_AppealFinding_RequestExtension_Button_Locator}   ${PtAccNumAppeal}    ${RequestExtensionPtAccAppeal_PassedByUser}
     Set Global Variable    ${BillingAnalyst_AppealFinding_RequestExtension_Button_Locator_New}



Return request extension Button locator on AuditFindings Tile with patient account number passed by user
     [Arguments]   ${RequestExtensionPtAccAudit_PassedByUser}
     ${BillingAnalyst_AuditFinding_RequestExtension_Button_Locator_New}=     Replace String      ${BillingAnalyst_AuditFinding_RequestExtension_Button_Locator}   ${PtAccNumAudit}    ${RequestExtensionPtAccAudit_PassedByUser}
     Set Global Variable    ${BillingAnalyst_AuditFinding_RequestExtension_Button_Locator_New}


Verify that the request extension button is present on the identified AppealFindings Tile
    Wait Until Element Is Visible    ${BillingAnalyst_AppealFinding_RequestExtension_Button_Locator_New}        timeout=120
    Element Should Be Visible      ${BillingAnalyst_AppealFinding_RequestExtension_Button_Locator_New}

Verify that the request extension button is present on the identified AuditFindings Tile
    Wait Until Element Is Visible    ${BillingAnalyst_AuditFinding_RequestExtension_Button_Locator_New}           timeout=120
    Element Should Be Visible      ${BillingAnalyst_AuditFinding_RequestExtension_Button_Locator_New}

Click Request extension button on the AppealFindings Tile and verify the Request Extension pop up is displayed
   Wait Until Element Is Visible    ${BillingAnalyst_AppealFinding_RequestExtension_Button_Locator_New}
   Click Element    ${BillingAnalyst_AppealFinding_RequestExtension_Button_Locator_New}
   Element Should Be Visible   ${RecordAnalyst_RequestExtension_Popup_Locator}


Click Request extension button on the AuditFindings Tile and verify the Request Extension pop up is displayed
   Wait Until Element Is Visible    ${BillingAnalyst_AuditFinding_RequestExtension_Button_Locator_New}
   Click Element    ${BillingAnalyst_AuditFinding_RequestExtension_Button_Locator_New}
   Element Should Be Visible   ${RecordAnalyst_RequestExtension_Popup_Locator}

Click Cancel button on Request Extension
   Wait Until Element Is Visible   ${BillingAnalyst_AppealFindings_Cancel_Button_Locator}
   Click Element    ${BillingAnalyst_AppealFindings_Cancel_Button_Locator}

Verify the Request Extension pop up of a appeal contains a message and confirm request button
   [Arguments]     ${patientFirstName}    ${patientLastName}
   Wait Until Element Is Visible    ${RecordAnalyst_RequestExtension_Popup_Locator}
   Element Should Be Visible   ${RecordAnalyst_RequestExtension_Popup_Locator}
   Element Should Be Visible   ${RecordAnalyst_RequestExtension_Button_ConfirmRequest_Locator}
   ${RecordAnalyst_RequestExtensionPopup_msg_Actual}=    Get Text    ${RecordAnalyst_RequestExtension_message_Locator}
   ${PatientName}           TestDataFormatter.formatPatientName          ${patientFirstName}    ${patientLastName}
   Should Be Equal As Strings  ${RecordAnalyst_RequestExtensionPopup_msg_Actual}     You are requesting a one-time 14 day extension for the billing audit of ${PatientName}.

Verify the Request Extension pop up of a audit contains a message and confirm request button
   [Arguments]     ${patientFirstName}    ${patientLastName}
   Wait Until Element Is Visible    ${RecordAnalyst_RequestExtension_Popup_Locator}
   Element Should Be Visible   ${RecordAnalyst_RequestExtension_Popup_Locator}
   Element Should Be Visible   ${RecordAnalyst_RequestExtension_Button_ConfirmRequest_Locator}
   ${RecordAnalyst_RequestExtensionPopup_msg_Actual}=    Get Text    ${RecordAnalyst_RequestExtension_message_Locator}
   ${PatientName}           TestDataFormatter.formatPatientName          ${patientFirstName}    ${patientLastName}
   Should Be Equal As Strings  ${RecordAnalyst_RequestExtensionPopup_msg_Actual}     You are requesting a one-time 14 day extension for the billing audit of ${PatientName}.


Click Confirm Request Button and verify the Request Extension is no longer available on the AuditFindings tile
    Wait Until Element Is Visible    ${RecordAnalyst_RequestExtension_Button_ConfirmRequest_Locator}  timeout=120
    sleep       2
    Click Element     ${RecordAnalyst_RequestExtension_Button_ConfirmRequest_Locator}
    sleep       5
    Wait until element is not visible    ${BillingAnalyst_AuditFinding_RequestExtension_Button_Locator_New}      timeout=60
    Wait Until Element Is Visible    ${BillingAnalyst_AuditFindings_RequestExtension_ExtensionGranted_Locator_New}        timeout=60
    Element Should Be Visible   ${BillingAnalyst_AuditFindings_RequestExtension_ExtensionGranted_Locator_New}    timeout=60

Click Confirm Request Button and verify the Request Extension is no longer available on the AppealFindings tile
    Wait Until Element Is Visible    ${RecordAnalyst_RequestExtension_Button_ConfirmRequest_Locator}  timeout=120
    wait until element is enabled    ${RecordAnalyst_RequestExtension_Button_ConfirmRequest_Locator}  timeout=120
    Set Focus To Element       ${RecordAnalyst_RequestExtension_Button_ConfirmRequest_Locator}
    sleep      2
    Click Element         ${RecordAnalyst_RequestExtension_Button_ConfirmRequest_Locator}
    Element Should Not Be Visible    ${BillingAnalyst_AppealFinding_RequestExtension_Button_Locator_New}
    Wait Until Element Is Visible    ${BillingAnalyst_AppealFindings_RequestExtension_ExtensionGranted_Locator_New}     timeout=120
    Element Should Be Visible   ${BillingAnalyst_AppealFindings_RequestExtension_ExtensionGranted_Locator_New}    timeout=120


Verify filter Functionality by providing Valid Appeal Decesion

       Wait Until Element Is Visible    ${Comm_Portal_FilterTab_AppealDecision_DropDown_Locator}        timeout=120
       Element Should Be Visible        ${Comm_Portal_FilterTab_AppealDecision_DropDown_Locator}
       Click Element    ${Comm_Portal_FilterTab_AppealDecision_DropDown_Locator}
       wait until element is enabled   ${Comm_Portal_FilterTab_AppealDecision_DropDown_option1_Locator}       timeout=120
       Click Element    ${Comm_Portal_FilterTab_AppealDecision_DropDown_option1_Locator}
       Click Apply Filter Button



Verify data after applying filter Functionality by providing Valid Appeal Decesion
        ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${BillingAnalyst_Filtered_result_Text_locator}
        IF   ${present} == True
        ${AppealDecisssionMws_element_exists}=    Run Keyword And Return Status        Page Should Contain Element         ${Comm_Portal_FilterTab_AppealDecesion_ReviewButton_Locator1}
        ${AppealDecisssionMod_element_exists}=    Run Keyword And Return Status        Page Should Contain Element         ${Comm_Portal_FilterTab_AppealDecesion_ReviewButton_Locator2}
         Run Keyword If    "${AppealDecisssionMws_element_exists}"=="True" or "${AppealDecisssionMod_element_exists}"=="True"
         log      Appeal Decission element does not exists

        ELSE
                Page should contain        There are no Outstanding Audit Results which meet the criteria.
        END


Verify filter Functionality by providing Valid Prepay value as No

       Wait Until Element Is Visible    ${Comm_Portal_FilterTab_Prepay_DropDown_Locator}        timeout=120
       Element Should Be Visible        ${Comm_Portal_FilterTab_Prepay_DropDown_Locator}
       Click Element    ${Comm_Portal_FilterTab_Prepay_DropDown_Locator}
       wait until element is enabled   ${Comm_Portal_FilterTab_Prepay_DropDown_No_option_Locator}       timeout=120
       Click Element    ${Comm_Portal_FilterTab_Prepay_DropDown_No_option_Locator}
       Click Apply Filter Button



Verify data after applying filter Functionality by selecting Prepay Value as No
        ${present} =   Run Keyword And Return Status        Page Should Contain Element         ${BillingAnalyst_Filtered_result_Text_locator}
        IF   '${present}' == True
             Scroll element into view         ${Comm_Portal_FilterTab_Prepay_No_Locator}
             Element Should Be Visible        ${Comm_Portal_FilterTab_Prepay_No_Locator}         timeout=30
             Wait Until Element Is Visible    ${Comm_Portal_FilterTab_Prepay_No_Locator}
             Wait until element is not visible     ${Comm_Portal_FilterTab_Prepay_Yes_Locator}         timeout=30
        ELSE
                Page should contain        There are no Outstanding Audit Results which meet the criteria.
        END



Verify filter Functionality by providing Valid Prepay value as Yes

       Wait Until Element Is Visible    ${Comm_Portal_FilterTab_Prepay_DropDown_Locator}        timeout=120
       Element Should Be Visible        ${Comm_Portal_FilterTab_Prepay_DropDown_Locator}
       Click Element    ${Comm_Portal_FilterTab_Prepay_DropDown_Locator}
       wait until element is enabled   ${Comm_Portal_FilterTab_Prepay_DropDown_Yes_option_Locator}       timeout=120
       Click Element    ${Comm_Portal_FilterTab_Prepay_DropDown_Yes_option_Locator}
       Click Apply Filter Button



Verify data after applying filter Functionality by selecting Prepay Value as Yes
        ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${BillingAnalyst_Filtered_result_Text_locator}
        IF   ${present} == True
            Scroll element into view         ${Comm_Portal_FilterTab_Prepay_Yes_Locator}
            Element Should Be Visible        ${Comm_Portal_FilterTab_Prepay_Yes_Locator}         timeout=30
            Wait Until Element Is Visible    ${Comm_Portal_FilterTab_Prepay_Yes_Locator}
            Wait until element is not visible     ${Comm_Portal_FilterTab_Prepay_No_Locator}         timeout=30
        ELSE
                Page should contain        There are no Outstanding Audit Results which meet the criteria.
        END


Validate filter clearing functionality
    Wait Until Element Is Visible    ${Comm_Portal_FilterTab_Review_Button_Locator}                                             timeout=120
    ${ReviewButton_Count_BeforeapplyingFilter} =   Get Element Count   ${Comm_Portal_FilterTab_Review_Button_Locator}
    BillingAnalyst_Dashboard.Click Filter Button
    Verify filter Functionality by providing Valid Patient Account Number    ${data_list[0]['PatientAccountNumber']}
    BillingAnalyst_Dashboard.Click Apply Filter Button
    Sleep    5
    Return Review Button locator with patient account number for filter functionality passed by user    ${data_list[0]['PatientAccountNumber']}
    Verify data after applying filter Functionality by providing Valid Patient Account Number           ${data_list[0]['PatientAccountNumber']}
    BillingAnalyst_Dashboard.Click Clear Filter Button
    wait until element is not visible         ${RecordAnalyst_Dashboard_PageLoad_RedFlower_Image_Locator}
    ${ReviewButton_Count_AfterClearingFilter} =   Get Element Count   ${Comm_Portal_FilterTab_Review_Button_Locator}
    Should Be Equal    ${ReviewButton_Count_BeforeapplyingFilter}    ${ReviewButton_Count_AfterClearingFilter}

Return Review Button locator with patient account number for filter functionality passed by user
     [Arguments]   ${PtAccNum_PassedByUser}
     ${Comm_Portal_FilterButton_PatientAccountNumber_Locator}=     Replace String      ${Comm_Portal_FilterButton_PatientAccountNumber_Locator}   ${PtAccNumFilter}    ${PtAccNum_PassedByUser}
     Set Global Variable    ${Comm_Portal_FilterButton_PatientAccountNumber_Locator}



#AN

Verify Authorized eSignature details for AgreeWithFindings
       Textfield Value Should Be     ${ BillingAnalyst_AppealFindingsTile_Agreewithfinding_Esignature_Locator}    ${Esignature}
       Textfield Value Should Be   ${BillingAnalyst_AppealFindingsTile_Agreewithfinding_Title_Locator}        ${Title}
       ${date}=      Get Current Date     result_format=%Y-%m-%d
       Textfield Value Should Be     ${BillingAnalyst_AppealFindingsTile_Agreewithfinding_Date_Locator}    ${date}


Click Cancel Button on Latest Appeal Level
        Wait Until Element Is Visible       ${BillingAnalyst_AppealFindingsTile_LatestAppeal_CancelButton_Locator}    timeout=120
        Click Button                       ${BillingAnalyst_AppealFindingsTile_LatestAppeal_CancelButton_Locator}


Click Filter Button
        Wait Until Element Is Visible           ${Comm_Portal_FilterButton_Locator}          timeout=120
         sleep   2
         Click Element                           ${Comm_Portal_FilterButton_Locator}

Click Apply Filter Button
        Wait Until Element Is Visible           ${Comm_Portal_FilterButton_ApplyFilterButton_Locator}    timeout=120
        Click Button                           ${Comm_Portal_FilterButton_ApplyFilterButton_Locator}
        sleep   5


Click Clear Filter Button
        Wait Until Element Is Visible           ${Comm_Portal_FilterButton_ClearFilterButton_Locator}    timeout=120
        Click Element                           ${Comm_Portal_FilterButton_ClearFilterButton_Locator}

Scroll down to the bottom of Audit result page
       Sleep  2
       Execute JavaScript         window.scrollTo(0, document.body.scrollHeight)

Scroll Up to Audit result page
      Scroll Element Into View                 ${Comm_Portal_Locator}
      Wait Until Element Is Visible            ${Comm_Portal_Locator}


Verify Filter Options panel is visible
        Wait Until Element Is Visible    ${Comm_Portal_FilterButton_filterPatientAccountLabel_Locator}
        Element Should Be Visible       ${Comm_Portal_FilterButton_filterPatientAccountLabel_Locator}
        Wait Until Element Is Visible    ${Comm_Portal_FilterButton_filterMRNumberLabel_Locator}
        Element Should Be Visible       ${Comm_Portal_FilterButton_filterMRNumberLabel_Locator}
        Wait Until Element Is Visible    ${Comm_Portal_FilterButton_filterAuditNumberLabel_Locator}
        Element Should Be Visible        ${Comm_Portal_FilterButton_filterAuditNumberLabel_Locator}
        Wait Until Element Is Visible    ${Comm_Portal_FilterButton_filterClaimTypeLabel_Locator}
        Element Should Be Visible        ${ Comm_Portal_FilterButton_filterClaimTypeLabel_Locator}
        Wait Until Element Is Visible    ${ Comm_Portal_FilterButton_filterProviderNumber_Locator}
        Element Should Be Visible        ${ Comm_Portal_FilterButton_filterProviderNumber_Locator}
        Wait Until Element Is Visible    ${Comm_Portal_FilterButton_filterDaysRemainingLabel_Locator}
        Element Should Be Visible        ${Comm_Portal_FilterButton_filterDaysRemainingLabel_Locator}
        Wait Until Element Is Visible    ${Comm_Portal_FilterButton_filterClaimNumberLabel_Locator}
        Element Should Be Visible        ${Comm_Portal_FilterButton_filterClaimNumberLabel_Locator}
        Wait Until Element Is Visible    ${Comm_Portal_FilterButton_filterAppealDecisionLabel_Locator}
        Element Should Be Visible        ${Comm_Portal_FilterButton_filterAppealDecisionLabel_Locator}
        Wait Until Element Is Visible    ${Comm_Portal_FilterButton_ClearFilterButton_Locator}
        Element Should Be Visible        ${Comm_Portal_FilterButton_ClearFilterButton_Locator}
        Wait Until Element Is Visible    ${Comm_Portal_FilterButton_ApplyFilterButton_Locator}
        Element Should Be Visible        ${Comm_Portal_FilterButton_ApplyFilterButton_Locator}

Verify filter Functionality by providing Valid Patient Account Number
       [Arguments]   ${PtAccNum_PassedByUser}
       Element Should Be Visible        ${Comm_Portal_FilterButton_PatientAccountNumber_TextField_Locator}
       Wait Until Element Is Visible    ${Comm_Portal_FilterButton_PatientAccountNumber_TextField_Locator}
       Click Element                   ${Comm_Portal_FilterButton_PatientAccountNumber_TextField_Locator}
       Input Text                       ${Comm_Portal_FilterButton_PatientAccountNumber_TextField_Locator}     ${PtAccNum_PassedByUser}
       Click Apply Filter Button

Verify data after applying filter Functionality by providing Valid Patient Account Number
       [Arguments]           ${PtAccNum_PassedByUser}
       ${Comm_Portal_FilterButton_PatientAccountNumber_Locator_New} =   Replace String      ${Comm_Portal_FilterButton_PatientAccountNumber_Locator}   ${substringToReplace}      ${PtAccNum_PassedByUser}
       Element Should Be Visible        ${Comm_Portal_FilterButton_PatientAccountNumber_Locator_New}
       Wait Until Element Is Visible    ${Comm_Portal_FilterButton_PatientAccountNumber_Locator_New}

Verify filter Functionality by providing Valid Medical Record Number
       Element Should Be Visible        ${Comm_Portal_FilterButton_MRNumber_TextField_Locator}     timeout=60
#       Click Element                    ${Comm_Portal_FilterButton_MRNumber_TextField_Locator}
       Input Text                       ${Comm_Portal_FilterButton_MRNumber_TextField_Locator}              ${data_list[0]['MRNumber']}
       Click Apply Filter Button

Verify data after applying filter Functionality by providing Valid Medical Record Number
        ${Comm_Portal_FilterButton_MedicalRecordNumber_Locator_New} =   Replace String      ${Comm_Portal_FilterButton_MedicalRecordNumber_Locator}   ${substringToReplace}      ${data_list[0]['MRNumber']}
        Element Should Be Visible        ${Comm_Portal_FilterButton_MedicalRecordNumber_Locator_New}            timeout=120
        Wait Until Element Is Visible    ${Comm_Portal_FilterButton_MedicalRecordNumber_Locator_New}

Verify filter Functionality by providing Valid Audit Number
       Element Should Be Visible        ${Comm_Portal_FilterButton_AuditNumber_TextField_Locator}        timeout=120
       Wait Until Element Is Visible    ${Comm_Portal_FilterButton_AuditNumber_TextField_Locator}
       Input Text                       ${Comm_Portal_FilterButton_AuditNumber_TextField_Locator}             ${data_list[0]['AuditNumber']}
       Click Apply Filter Button

Verify data after applying filter Functionality by providing Valid Audit Number
        ${Comm_Portal_FilterButton_AuditNumber_Locator_New} =   Replace String      ${Comm_Portal_FilterButton_AuditNumber_Locator}   ${substringToReplace}      ${data_list[0]['AuditNumber']}
        Element Should Be Visible        ${Comm_Portal_FilterButton_AuditNumber_Locator_New}                       timeout=120
        Wait Until Element Is Visible    ${Comm_Portal_FilterButton_AuditNumber_Locator_New}


Verify filter Functionality by providing Valid Provider Number
       Element Should Be Visible        ${Comm_Portal_FilterButton_ProviderNumber_TextField_Locator}      timeout=120
       Wait Until Element Is Visible    ${Comm_Portal_FilterButton_ProviderNumber_TextField_Locator}
       Click Element                   ${Comm_Portal_FilterButton_ProviderNumber_TextField_Locator}
       Input Text                       ${Comm_Portal_FilterButton_ProviderNumber_TextField_Locator}            ${data_list[0]['BillingProviderNumber']}
       Click Apply Filter Button

Verify data after applying filter Functionality by providing Valid Provider Number
        ${Comm_Portal_FilterButton_ProviderNumber_Locator_New} =   Replace String      ${Comm_Portal_FilterButton_ProviderNumber_Locator}   ${substringToReplace}      ${data_list[0]['BillingProviderNumber']}
        Element Should Be Visible        ${Comm_Portal_FilterButton_ProviderNumber_Locator_New}                       timeout=120
        Wait Until Element Is Visible    ${Comm_Portal_FilterButton_ProviderNumber_Locator_New}

Verify filter Functionality by providing Valid Claim Number
       Element Should Be Visible        ${Comm_Portal_FilterButton_ClaimNumber_TextField_Locator}                timeout=60
       Wait Until Element Is Visible    ${Comm_Portal_FilterButton_ClaimNumber_TextField_Locator}
       Click Element                    ${Comm_Portal_FilterButton_ClaimNumber_TextField_Locator}
       Input Text                      ${Comm_Portal_FilterButton_ClaimNumber_TextField_Locator}              ${data_list[0]['ClaimNumber']}
       Click Apply Filter Button


Verify data after applying filter Functionality by providing Valid Claim Number
        ${Comm_Portal_FilterButton_ClaimNumber_Locator_New} =   Replace String      ${Comm_Portal_FilterButton_ClaimNumber_Locator}   ${substringToReplace}      ${data_list[0]['ClaimNumber']}
        Element Should Be Visible        ${Comm_Portal_FilterButton_ClaimNumber_Locator_New}                       timeout=120
        Wait Until Element Is Visible    ${Comm_Portal_FilterButton_ClaimNumber_Locator_New}

#changes

#   AN
Verify Audit Result tab is selected by default
    Wait Until Element Is Visible                 ${Comm_Portal_HomePage_AuditResultsTab_Locator}             timeout=120
    Element Should Be Visible                   ${Comm_Portal_HomePage_AuditResultsTab_Locator}


Verify Billing Analyst Page is displayed
    Wait Until Element Is Visible                 ${Comm_Portal_HomePage_AuditResultsTab_Locator}             timeout=120
    Element Should Be Visible                   ${Comm_Portal_HomePage_AuditResultsTab_Locator}
    Wait Until Element Is Visible                   ${BillingAnalyst_Dashboard_Text}
    Element Should Be Visible                         ${BillingAnalyst_Dashboard_Text}




#Satheesh
Click Confirm Agreement Button
    Wait Until Element Is Visible       ${BillingAnalyst_AgreeWithFindings_Confirm_Agreement_button}    timeout=120
    Click Button                       ${BillingAnalyst_AgreeWithFindings_Confirm_Agreement_button}

Verify CONFIRM FINDINGS AGREEMENT pop up
    Wait Until Element Is Visible            ${BillingAnalyst_Confirm_Findings_Agreement_PopUp_Head_Locator}
    Element Should Be Visible                ${BillingAnalyst_Confirm_Findings_Agreement_PopUp_Head_Locator}
    Wait Until Element Is Visible            ${BillingAnalyst_Confirm_Findings_Agreement_PopUp_Body_Locator}
    Element Should Be Visible                ${BillingAnalyst_Confirm_Findings_Agreement_PopUp_Body_Locator}
    ${BillingAnalyst_Confirm_Findings_Agreement_PopUp_Body_Locator_Text}=        Get Text            ${BillingAnalyst_Confirm_Findings_Agreement_PopUp_Body_Locator}
    should be equal            ${BillingAnalyst_Confirm_Findings_Agreement_PopUp_Body_Locator_Text}           Are you ready to approve the audit findings?
    Wait Until Element Is Visible           ${BillingAnalyst_Confirm_Findings_Agreement_PopUp_Yes_Button_Locator}
    Element Should Be Visible               ${BillingAnalyst_Confirm_Findings_Agreement_PopUp_Yes_Button_Locator}
    Element Should Be Enabled               ${BillingAnalyst_Confirm_Findings_Agreement_PopUp_Yes_Button_Locator}
    Wait Until Element Is Visible           ${BillingAnalyst_Confirm_Findings_Agreement_PopUp_No_Button_Locator}
    Element Should Be Visible               ${BillingAnalyst_Confirm_Findings_Agreement_PopUp_No_Button_Locator}
    Element Should Be Enabled               ${BillingAnalyst_Confirm_Findings_Agreement_PopUp_No_Button_Locator}

Click YES button in Confirm FIndings Agreement pop up
    Wait Until Element Is Visible            ${BillingAnalyst_Confirm_Findings_Agreement_PopUp_Head_Locator}
    Element Should Be Visible                ${BillingAnalyst_Confirm_Findings_Agreement_PopUp_Head_Locator}
    Wait Until Element Is Visible           ${BillingAnalyst_Confirm_Findings_Agreement_PopUp_Yes_Button_Locator}
    Element Should Be Visible               ${BillingAnalyst_Confirm_Findings_Agreement_PopUp_Yes_Button_Locator}
    Click Element       ${BillingAnalyst_Confirm_Findings_Agreement_PopUp_Yes_Button_Locator}

Click First level Appeal findings tab
    Wait Until Element Is Visible    ${BillingAnalyst_First_level_Appeal_Findings_Tab_locator}   timeout=120
    Click Element    ${BillingAnalyst_First_level_Appeal_Findings_Tab_locator}

Verify First Appeal Findings tab is displayed
    Wait Until Element Is Visible                 ${BillingAnalyst_First_level_Appeal_Findings_Tab_locator}             timeout=120
    Element Should Be Visible                   ${BillingAnalyst_First_level_Appeal_Findings_Tab_locator}
    Wait Until Element Is Visible                   ${BillingAnalyst_First_Appeal_Findings_ReasonForAppeal}
    Element Should Be Visible                         ${BillingAnalyst_First_Appeal_Findings_ReasonForAppeal}

Click Second level Appeal findings tab
    Wait Until Element Is Visible    ${BillingAnalyst_Second_level_Appeal_Findings_Tab_locator}   timeout=120
    Click Element    ${BillingAnalyst_Second_level_Appeal_Findings_Tab_locator}

Verify Second Appeal Findings tab is displayed
    Wait Until Element Is Visible                 ${BillingAnalyst_Second_level_Appeal_Findings_Tab_locator}             timeout=120
    Element Should Be Visible                   ${BillingAnalyst_Second_level_Appeal_Findings_Tab_locator}
    Wait Until Element Is Visible                   ${BillingAnalyst_Second_Appeal_Findings_ReasonForAppeal}
    Element Should Be Visible                         ${BillingAnalyst_Second_Appeal_Findings_ReasonForAppeal}

Click Initial findings tab
    Wait Until Element Is Visible    ${BillingAnalyst_Initial_Appeal_Findings_Tab_locator}   timeout=120
    Click Element    ${BillingAnalyst_Initial_Appeal_Findings_Tab_locator}

Verify Intial Findings tab is displayed
    Wait Until Element Is Visible                 ${BillingAnalyst_Initial_Appeal_Findings_Tab_locator}             timeout=120
    Element Should Be Visible                   ${BillingAnalyst_Initial_Appeal_Findings_Tab_locator}
   ${BillingAnalyst_AppealInfo_ClaimNum_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealInfo_ClaimNum_Detail_Locator}   ${substringToReplace}    ${data_list[0]['ClaimNumber']}
   Wait Until Element Is Visible    ${BillingAnalyst_AppealInfo_ClaimNum_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_AppealInfo_ClaimNum_Detail_Locator_New}
   ${BillingAnalyst_AppealInfo_AuditNum_Detail_Locator_New}=     Replace String      ${BillingAnalyst_AppealInfo_AuditNum_Detail_Locator}   ${substringToReplace}    ${data_list[0]['AuditNumber']}
    Wait Until Element Is Visible            ${BillingAnalyst_AppealInfo_AuditNum_Detail_Locator_New}
    Element Should Be Visible            ${BillingAnalyst_AppealInfo_AuditNum_Detail_Locator_New}

Click Cancel button on Appeal findings page
    Wait Until Element Is Visible    ${BillingAnalyst_AppealFindings_Cancel_Button_Locator}     timeout=120
    Element Should Be Enabled       ${BillingAnalyst_AppealFindings_Cancel_Button_Locator}
    Click Button    ${BillingAnalyst_AppealFindings_Cancel_Button_Locator}

Verify Cancel Appeal Submission Pop up
    Wait Until Element Is Visible            ${BillingAnalyst_Cancel_Appeal_Submission_PopUp_Head_Locator}
    Element Should Be Visible                ${BillingAnalyst_Cancel_Appeal_Submission_PopUp_Head_Locator}
    Wait Until Element Is Visible            ${BillingAnalyst_Cancel_Appeal_Submission_PopUp_Body_Locator}
    Element Should Be Visible                ${BillingAnalyst_Cancel_Appeal_Submission_PopUp_Body_Locator}
    ${BillingAnalyst_Cancel_Appeal_Submission_PopUp_Body_Locator_Text}=        Get Text            ${BillingAnalyst_Cancel_Appeal_Submission_PopUp_Body_Locator}
    should be equal            ${BillingAnalyst_Cancel_Appeal_Submission_PopUp_Body_Locator_Text}           Creation of this appeal has been cancelled. Any uploaded files are still pending submission. This audit will continue to remain on your Audit Results dashboard until an agreement is confirmed or a new appeal is created.
    Wait Until Element Is Visible           ${BillingAnalyst_Cancel_Appeal_Submission_PopUp_GoToDashboard_Button_Locator}
    Element Should Be Visible               ${BillingAnalyst_Cancel_Appeal_Submission_PopUp_GoToDashboard_Button_Locator}
    Element Should Be Enabled               ${BillingAnalyst_Cancel_Appeal_Submission_PopUp_GoToDashboard_Button_Locator}
    Wait Until Element Is Visible           ${BillingAnalyst_Cancel_Appeal_Submission_PopUp_ContinueToNextAudit_Button_Locator}
    Element Should Be Visible               ${BillingAnalyst_Cancel_Appeal_Submission_PopUp_ContinueToNextAudit_Button_Locator}
    Element Should Be Enabled               ${BillingAnalyst_Cancel_Appeal_Submission_PopUp_ContinueToNextAudit_Button_Locator}

Click GoToDashboard button in cancel appeal submission pop up
    Wait Until Element Is Visible           ${BillingAnalyst_Cancel_Appeal_Submission_PopUp_GoToDashboard_Button_Locator}
    Click button        ${BillingAnalyst_Cancel_Appeal_Submission_PopUp_GoToDashboard_Button_Locator}


Click GoToDashboard button in the submission success pop up
    Wait Until Element Is Visible           ${BillingAnalyst_Appeal_Submission_Success_PopUp_GoToDashboard_Button_Locator}     timeout=120
    Click button        ${BillingAnalyst_Appeal_Submission_Success_PopUp_GoToDashboard_Button_Locator}

Verify the Appeal is not submitted and present in dashboard
    Wait Until Element Is Visible       ${BillingAnalyst_AppealFindings_ReviewButton_Locator_New}
    Element Should Be Visible            ${BillingAnalyst_AppealFindings_ReviewButton_Locator_New}

Verify the submitted record is displayed in the history page
    Wait Until Element Is Visible           ${BillingAnalyst_Confirm_Findings_Agreement_PopUp_Yes_Button_Locator}
    Element Should Be Visible               ${BillingAnalyst_Confirm_Findings_Agreement_PopUp_Yes_Button_Locator}
    Element Should Be Enabled               ${BillingAnalyst_Confirm_Findings_Agreement_PopUp_Yes_Button_Locator}
    Click Element                           ${BillingAnalyst_Confirm_Findings_Agreement_PopUp_Yes_Button_Locator}
    Element Should Not Be Visible           ${BillingAnalyst_AppealFindings_ReviewButton_Locator}
    History.Verify History page is displayed on clicking History Icon
    History.Clicks on filter icon

Click Confirm Appeal Button
    Wait Until Element Is Visible     ${RecordAnalyst_Remove_Attachment_Cancle_Locator}
    Wait Until Element Is Visible               ${BillingAnalyst_AppealFindingsTile_AppealFinding_CofirmAppeal_Button_Locator}
    Element Should Be Visible                    ${BillingAnalyst_AppealFindingsTile_AppealFinding_CofirmAppeal_Button_Locator}
    Element Should Be Enabled                       ${BillingAnalyst_AppealFindingsTile_AppealFinding_CofirmAppeal_Button_Locator}
    Click Element                                   ${BillingAnalyst_AppealFindingsTile_AppealFinding_CofirmAppeal_Button_Locator}

Verify Confirm Findings Appeal Pop up and Click Yes button
    Wait Until Element Is Visible            ${BillingAnalyst_AppealFinding__Confirm_Findings_Appeal_PopUp_Head_Locator}
    Element Should Be Visible                ${BillingAnalyst_AppealFinding__Confirm_Findings_Appeal_PopUp_Head_Locator}
    Wait Until Element Is Visible            ${BillingAnalyst_AppealFinding__Confirm_Findings_Appeal_PopUp_Body_Locator}
    Element Should Be Visible                ${BillingAnalyst_AppealFinding__Confirm_Findings_Appeal_PopUp_Body_Locator}                   timeout=120
    ${BillingAnalyst_Confirm_Findings_Appeal_PopUp_Body_Locator_new}=        Get Text            ${BillingAnalyst_AppealFinding__Confirm_Findings_Appeal_PopUp_Body_Locator}
    should be equal            ${BillingAnalyst_Confirm_Findings_Appeal_PopUp_Body_Locator_new}           Are you ready to submit the appeal?
    Wait Until Element Is Visible           ${BillingAnalyst_AppealFinding__Confirm_Findings_Appeal_PopUp_Yes_Button_Locator}                timeout=120
    Element Should Be Visible               ${BillingAnalyst_AppealFinding__Confirm_Findings_Appeal_PopUp_Yes_Button_Locator}
    Element Should Be Enabled               ${BillingAnalyst_AppealFinding__Confirm_Findings_Appeal_PopUp_Yes_Button_Locator}
    Wait Until Element Is Visible           ${BillingAnalyst_AppealFinding__Confirm_Findings_Appeal_PopUp_No_Button_Locator}
    Element Should Be Visible               ${BillingAnalyst_AppealFinding__Confirm_Findings_Appeal_PopUp_No_Button_Locator}
    Element Should Be Enabled               ${BillingAnalyst_AppealFinding__Confirm_Findings_Appeal_PopUp_No_Button_Locator}
    Click button        ${BillingAnalyst_AppealFinding__Confirm_Findings_Appeal_PopUp_Yes_Button_Locator}


Verify the Appeal submitted is not present in dashboard
    Wait until element is not visible      ${BillingAnalyst_AppealFindings_ReviewButton_Locator_New}          timeout=60
    Element Should not Be Visible            ${BillingAnalyst_AppealFindings_ReviewButton_Locator_New}


Remove the Existing attachment of Appeal details page
       ${element_count}=    get element count     ${BillingAnalyst_AppealFindings_Remove_Attachment_Locator}
       IF   ${element_count}>0
           Click Element    ${BillingAnalyst_AppealFindings_Remove_Attachment_Locator}
           Element Should Be Visible    ${BillingAnalyst_window_Confirm_Delete_Document_Locator}   timeout=120
           Click Element     ${BillingAnalyst_Button_Yes_Confirm_Delete_Document_window_Locator}
           wait Until Element Is Visible    ${BillingAnalyst_button_close_Document_delete_windw_locator}     timeout=120
           Click Element    ${BillingAnalyst_button_close_Document_delete_windw_locator}
           sleep         10

       END



Click Export Audit
    Wait Until Element Is Visible        ${BillingAnalyst_ExportAudit_Button_Locator}        timeout=120
    click element            ${BillingAnalyst_ExportAudit_Button_Locator}


Verify the columns in the downloaded export
     ${expectedColumns_list}=         create list              Days Left 	Patient Name	    Patient AccountNumber 	Prepay      Provider Name 	    AuditType 	    AppealDecision 		Birth Date 		Dates OfService 	Provider Number 	AuditNumber 	Claim Number 	Medical RecordNumber 	Due Date
      ${lists_equal}          Lists should be equal       ${downloaded_data_list[0].keys()}          ${expectedColumns_list}


Verify the total records in the downloaded export
     ${actualNoOfRecords} =     get length  ${downloaded_data_list}
     log                ${actualNoOfRecords}
     ${expectedCount} =    Convert To Integer  ${AuditResults_Tile_count_New}
     Should Be Equal     ${actualNoOfRecords}    ${expectedCount}


Verify all the column headers are displayed
      Wait Until Element Is Visible        ${BillingAnalyst_ListView_Actions_ColumnHeader_Element_Locator}        timeout=120
      Element Should Be Visible            ${BillingAnalyst_ListView_Actions_ColumnHeader_Element_Locator}
	  Element Should Be Visible            ${BillingAnalyst_ListView_DaysLeft_ColumnHeader_Element_Locator}
	  Element Should Be Visible            ${BillingAnalyst_ListView_PatientName_ColumnHeader_Element_Locator}
      Element Should Be Visible            ${BillingAnalyst_ListView_PatientAccountNumber_ColumnHeader_Element_Locator}
	  Element Should Be Visible            ${BillingAnalyst_ListView_Prepay_ColumnHeader_Element_Locator}
	  Element Should Be Visible            ${BillingAnalyst_ListView_ProviderName_ColumnHeader_Element_Locator}
	  Element Should Be Visible            ${BillingAnalyst_ListView_AuditType_ColumnHeader_Element_Locator}
      Element Should Be Visible            ${BillingAnalyst_ListView_AppealDecision_ColumnHeader_Element_Locator}
	  Element Should Be Visible            ${BillingAnalyst_ListView_BirthDate_ColumnHeader_Element_Locator}
	  Element Should Be Visible            ${BillingAnalyst_ListView_DatesOfService_ColumnHeader_Element_Locator}
	  Element Should Be Visible            ${BillingAnalyst_ListView_ProviderNumber_ColumnHeader_Element_Locator}
      Element Should Be Visible            ${BillingAnalyst_ListView_AuditNumber_ColumnHeader_Element_Locator}
	  Element Should Be Visible            ${BillingAnalyst_ListView_ClaimNumber_ColumnHeader_Element_Locator}
	  Element Should Be Visible            ${BillingAnalyst_ListView_MedicalRecordNumber_ColumnHeader_Element_Locator}
	  Element Should Be Visible            ${BillingAnalyst_ListView_DueDate_ColumnHeader_Element_Locator}


Return AuditFindings List View Review Button locator with patient account number passed by user
     [Arguments]   ${PtAccNum_PassedByUser}
     ${BillingAnalyst_ListView_Audit_Review_Button_Locator_New}=     Replace String      ${BillingAnalyst_ListView_Audit_Review_Button_Locator}   ${substringToReplace}     ${PtAccNum_PassedByUser}
     Set Global Variable    ${BillingAnalyst_ListView_Audit_Review_Button_Locator_New}


Click List View Review button
    Wait Until Element Is Visible    ${BillingAnalyst_ListView_Audit_Review_Button_Locator_New}    timeout=120
    wait until element is enabled     ${BillingAnalyst_ListView_Audit_Review_Button_Locator_New}   timeout=120
    Click Element    ${BillingAnalyst_ListView_Audit_Review_Button_Locator_New}


Fetch the First Audit Record From the List
    [arguments]     ${baDashboardListAuditQuery}
    Wait Until Element Is Visible      ${BillingAnalyst_ListView_AuditType_Locator}     timeout=60
    ${auditNumber}=     Get text    ${BillingAnalyst_ListView_AuditType_Locator}
    ${sqlQueryToExec}=       BuiltIn.Catenate      ${baDashboardListAuditQuery}     ${auditNumber}
    Log to console     ${sqlQueryToExec}
    Connect to DB for a specific Database     ${sqlQueryToExec}     ${DBName}

Verify data after applying filter Functionality In List View by providing Valid Patient Account Number
   [Arguments]           ${PtAccNum_PassedByUser}
   ${Comm_Portal_FilterButton_List_view_PatientAccountNumber_Locator_New} =   Replace String      ${Comm_Portal_FilterButton_List_view_PatientAccountNumber_Locator}   ${substringToReplace}      ${PtAccNum_PassedByUser}
   Scroll Element Into View       ${Comm_Portal_FilterButton_List_view_PatientAccountNumber_Locator_New}
   Element Should Be Visible         ${Comm_Portal_FilterButton_List_view_PatientAccountNumber_Locator_New}
   Wait Until Element Is Visible     ${Comm_Portal_FilterButton_List_view_PatientAccountNumber_Locator_New}


Verify data after applying filter Functionality In List View by providing Valid Medical Record Number
   [Arguments]           ${MedicalRecordNum_PassedByUser}
   Execute javascript       document.body.style.zoom = "0.7"
   ${Comm_Portal_FilterButton_List_view_MedicalRecordNumber_Locator_New} =   Replace String      ${Comm_Portal_FilterButton_List_view_MedicalRecordNumber_Locator}   ${substringToReplace}      ${MedicalRecordNum_PassedByUser}
   Scroll Element Into View       ${Comm_Portal_FilterButton_List_view_MedicalRecordNumber_Locator_New}
   Element Should Be Visible         ${Comm_Portal_FilterButton_List_view_MedicalRecordNumber_Locator_New}


Verify data after applying filter Functionality In List View by providing Valid Audit Number
    [Arguments]           ${AuditNum_PassedByUser}
   ${Comm_Portal_FilterButton_List_view_AuditNumber_Locator_New} =   Replace String      ${Comm_Portal_FilterButton_List_view_AuditNumber_Locator}   ${substringToReplace}      ${AuditNum_PassedByUser}
   Scroll Element Into View       ${Comm_Portal_FilterButton_List_view_AuditNumber_Locator_New}
   Element Should Be Visible        ${Comm_Portal_FilterButton_List_view_AuditNumber_Locator_New}

Verify data after applying filter Functionality In List View by providing Valid Appeal Decesion
        ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${BillingAnalyst_Filtered_result_Text_locator}
        IF   ${present} == True
               Page Should Contain Element         ${Comm_Portal_FilterButton_List_view_AppealDecisson_Locator}
        ELSE
              Wait Until Element Is Visible   ${Comm_Portal_FilterButton_No_Filter_Records_Element_Locator}        timeout=20
               Scroll Element Into View    ${Comm_Portal_FilterButton_No_Filter_Records_Element_Locator}
               Page Should Contain      There are no Outstanding Audit Results which meet the criteria.

        END

Verify data after applying filter Functionality In List View by providing Valid Provider Number
       [Arguments]           ${ProviderNum_PassedByUser}
       ${Comm_Portal_FilterButton_List_view_ProviderNumber_Locator_New} =   Replace String      ${Comm_Portal_FilterButton_List_view_ProviderNumber_Locator}   ${substringToReplace}      ${ProviderNum_PassedByUser}
       Scroll Element Into View       ${Comm_Portal_FilterButton_List_view_ProviderNumber_Locator_New}
       Element Should Be Visible        ${Comm_Portal_FilterButton_List_view_ProviderNumber_Locator_New}

Verify data after applying filter Functionality In List View by selecting Prepay value as No
        ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${BillingAnalyst_Filtered_result_Text_locator}
        IF  ${present} == True
            Element Should Be Visible        ${Comm_Portal_FilterButton_List_view_Prepay_No_Element_Locator}         timeout=120
            Wait Until Element Is Visible    ${Comm_Portal_FilterButton_List_view_Prepay_No_Element_Locator}
            Wait until element is not visible    ${Comm_Portal_FilterButton_List_view_Prepay_Yes_Element_Locator}
        ELSE
             Page should contain        There are no Outstanding Audit Results which meet the criteria.
        END

Verify data after applying filter Functionality In List View by selecting Prepay value as Yes
        ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${BillingAnalyst_Filtered_result_Text_locator}
        IF   ${present} == True
             Element Should Be Visible        ${Comm_Portal_FilterButton_List_view_Prepay_Yes_Element_Locator}         timeout=120
             Wait Until Element Is Visible    ${Comm_Portal_FilterButton_List_view_Prepay_Yes_Element_Locator}
             Wait until element is not visible    ${Comm_Portal_FilterButton_List_view_Prepay_No_Element_Locator}
        ELSE
            Page should contain        There are no Outstanding Audit Results which meet the criteria.
        END




Verify data after applying filter Functionality In List View by providing Valid Claim Number
        [Arguments]      ${CalimNum_PassedByUser}
        ${Comm_Portal_FilterButton_List_view_ClaimNumber_Locator_New} =   Replace String      ${Comm_Portal_FilterButton_List_view_ClaimNumber_Locator}   ${substringToReplace}      ${CalimNum_PassedByUser}
        Element Should Be Visible        ${Comm_Portal_FilterButton_List_view_ClaimNumber_Locator_New}                       timeout=120
        Wait Until Element Is Visible    ${Comm_Portal_FilterButton_List_view_ClaimNumber_Locator_New}


Verify filter result In List View by after providing Claim Type as outpatient
     ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${BillingAnalyst_Filtered_result_Text_locator}
     IF   ${present} == True
                        ${element_count}=    get element count     ${BillingAnalyst_ListView_Filtered_List_Review_Button_Locator}
                        Click button            ${BillingAnalyst_ListView_Filtered_List_Review_Button_Locator}
                     ${e}=       set variable    1
                     WHILE      ${element_count}>=${e}
                     sleep   5
                     IF      ${e}< ${element_count}
                     ${a}=   get text        ${BillingAnalyst_DetailsPage_ClaimType_Locator}
                        IF  "${a}"== "Outpatient"
                        Click Next Audit Button
                        ${e}=   evaluate          ${e}+1
                        ELSE
                        Break
                        END

                    ELSE IF  ${e}== ${element_count}
                    ${a}=   get text        ${BillingAnalyst_DetailsPage_ClaimType_Locator}
                        IF  "${a}"== "Outpatient"
                        log     pass
                        ${e}=   evaluate          ${e}+1
                        ELSE
                        Break
                        END
                    END
                    END
        ELSE
                Page should contain        There are no Outstanding Audit Results which meet the criteria.
        END




Double click patient Name header in BA dashboard List View Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${BillingAnalyst_ListView_PatientName_ColumnHeader_Element_Locator}
    Double click Element   ${BillingAnalyst_ListView_PatientName_ColumnHeader_Element_Locator}
    sleep   5
    ${element_count}=    get element count     ${BillingAnalyst_ListView_PatientsName_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${BillingAnalyst_ListView_PatientsName_Table_Locator} [${i}]
    Append To List      ${username_list}    ${get_username}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${BiilingAnalyst_List_view_Next_Link_Locator}
       WHILE    ${present} == True
          Click element      ${BiilingAnalyst_List_view_Next_Link_Locator}
          ${element_count}=    get element count     ${BillingAnalyst_ListView_PatientsName_Table_Locator}
          @{username_list}=   Create List
           FOR    ${i}     IN RANGE    1   ${element_count}+1
           ${get_username}=  Get Text      ${BillingAnalyst_ListView_PatientsName_Table_Locator} [${i}]
           Append To List      ${username_list}    ${get_username}

    log      ${username_list}
    ${Sort_order}=  Copy list  ${username_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${username_list}     ${Sort_order}


Double click patient Account Number header in BA dashboard List View Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${BillingAnalyst_ListView_PatientAccountNumber_ColumnHeader_Element_Locator}
    Double click Element   ${BillingAnalyst_ListView_PatientAccountNumber_ColumnHeader_Element_Locator}
    sleep   5

    ${element_count}=    get element count     ${BillingAnalyst_ListView_PatientAccountNumber_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${BillingAnalyst_ListView_PatientAccountNumber_Table_Locator} [${i}]
    Append To List      ${username_list}    ${get_username}
    END
    log      ${username_list}
    ${Sort_order}=  Copy list  ${username_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${username_list}     ${Sort_order}



Double click prepay header in BA dashboard List View Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${BillingAnalyst_ListView_Prepay_ColumnHeader_Element_Locator}
    Double click Element   ${BillingAnalyst_ListView_Prepay_ColumnHeader_Element_Locator}
    sleep   5

    ${element_count}=    get element count     ${BillingAnalyst_ListView_Prepay_Table_Locator}
    @{prepay_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_prepay}=  Get Text      ${BillingAnalyst_ListView_Prepay_Table_Locator} [${i}]
    log      ${get_prepay}
    Append To List      ${prepay_list}    ${get_prepay}
    END
    log      ${prepay_list}
    ${Sort_order}=  Copy list  ${prepay_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${prepay_list}     ${Sort_order}


Double click Provider Name header in BA dashboard List View Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${BillingAnalyst_ListView_ProviderName_ColumnHeader_Element_Locator}        timeout=20
    Double click Element   ${BillingAnalyst_ListView_ProviderName_ColumnHeader_Element_Locator}
    sleep   3

    ${element_count}=    get element count     ${BillingAnalyst_ListView_ProviderName_Table_Locator}
    @{ProviderName_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_ProviderName}=  Get Text      ${BillingAnalyst_ListView_ProviderName_Table_Locator} [${i}]
    Append To List      ${ProviderName_list}    ${get_ProviderName}
    END
    log      ${ProviderName_list}
    ${sort_order}=  Copy list  ${ProviderName_list}
    sort list     ${sort_order}
    log      ${sort_order}
    lists should be equal       ${ProviderName_list}     ${sort_order}


Double click Audit Type header in BA dashboard List View Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${BillingAnalyst_ListView_AuditType_ColumnHeader_Element_Locator}        timeout=20
    Double click Element   ${BillingAnalyst_ListView_AuditType_ColumnHeader_Element_Locator}
    sleep   3

    ${element_count}=    get element count     ${BillingAnalyst_ListView_AuditType_Table_Locator}
    @{AuditType_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_AuditType}=  Get Text      ${BillingAnalyst_ListView_AuditType_Table_Locator} [${i}]
    Append To List      ${AuditType_list}    ${get_AuditType}
    END
    log      ${AuditType_list}
    ${sort_order}=  Copy list  ${AuditType_list}
    sort list     ${sort_order}
    log      ${sort_order}
    lists should be equal       ${AuditType_list}     ${sort_order}


Double click Appeal Decision header in BA dashboard List View Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${BillingAnalyst_ListView_AppealDecision_ColumnHeader_Element_Locator}        timeout=20
    Double click Element   ${BillingAnalyst_ListView_AppealDecision_ColumnHeader_Element_Locator}
    sleep   3

    ${element_count}=    get element count     ${BillingAnalyst_ListView_AppealDecision_Table_Locator}
    @{AppealDecision_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_AppealDecision}=  Get Text      ${BillingAnalyst_ListView_AppealDecision_Table_Locator} [${i}]
    Append To List      ${AppealDecision_list}    ${get_AppealDecision}
    END
    log      ${AppealDecision_list}
    ${sort_order}=  Copy list  ${AppealDecision_list}
    sort list     ${sort_order}
    log      ${sort_order}
    lists should be equal       ${AppealDecision_list}     ${sort_order}


Double click Birth Date header in BA dashboard List View Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${BillingAnalyst_ListView_BirthDate_ColumnHeader_Element_Locator}     timeout=20
    Double click Element   ${BillingAnalyst_ListView_BirthDate_ColumnHeader_Element_Locator}
    sleep   3
    ${element_count}=    get element count     ${BillingAnalyst_ListView_BirthDate_Table_Locator}
    @{dob_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_dob}=  Get Text      ${BillingAnalyst_ListView_BirthDate_Table_Locator} [${i}]
    Append To List      ${dob_list}    ${get_dob}
    END
    log      ${dob_list}
    ${sort_order}=  Copy list  ${dob_list}
    sort list     ${sort_order}
    log      ${sort_order}
    lists should be equal       ${dob_list}     ${sort_order}

Double click Date Of Service header in BA dashboard List View Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${BillingAnalyst_ListView_DatesOfService_ColumnHeader_Element_Locator}         timeout=20
    Double click Element   ${BillingAnalyst_ListView_DatesOfService_ColumnHeader_Element_Locator}
    sleep   3

    ${element_count}=    get element count     ${BillingAnalyst_ListView_DateOfService_Table_Locator}
    @{username_list}=   Create List
    @{converted_list}=       Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${BillingAnalyst_ListView_DateOfService_Table_Locator} [${i}]

    ${split_string}=    split string         ${get_username}          -
    ${formatted_input}=   replace string       ${split_string}[0]     ${SPACE}         ${EMPTY}
    ${from_date}=    Convert Date     ${formatted_input}           date_format=%m/%d/%Y
    log     ${from_date}

    ${formatted_input}=   replace string       ${split_string}[1]     ${SPACE}         ${EMPTY}
    ${formatted_input1}=   replace string         ${formatted_input}   \n         ${EMPTY}
    ${to_date}=    Convert Date      ${formatted_input1}           date_format=%m/%d/%Y
    log     ${to_date}

    Append To List      ${username_list}    ${get_username}
    ${date_list}=      set variable    ${from_date} - ${to_date}

    Append to list          ${converted_list}     ${date_list}
    END
    log      ${converted_list}

    ${sort_order}=  Copy list  ${converted_list}
    sort list     ${sort_order}
    log      ${sort_order}
    lists should be equal       ${converted_list}     ${sort_order}


Double click Provider Number header in BA dashboard List View Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${BillingAnalyst_ListView_ProviderNumber_ColumnHeader_Element_Locator}        timeout=20
    Double click Element   ${BillingAnalyst_ListView_ProviderNumber_ColumnHeader_Element_Locator}
    sleep   3

    ${element_count}=    get element count     ${BillingAnalyst_ListView_ProviderNumber_Table_Locator}
    @{AppealDecision_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_AppealDecision}=  Get Text      ${BillingAnalyst_ListView_ProviderNumber_Table_Locator} [${i}]
    Append To List      ${AppealDecision_list}    ${get_AppealDecision}
    END
    log      ${AppealDecision_list}
    ${sort_order}=  Copy list  ${AppealDecision_list}
    sort list     ${sort_order}
    log      ${sort_order}
    lists should be equal       ${AppealDecision_list}     ${sort_order}



Double click Audit Number header in BA dashboard List View Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${BillingAnalyst_ListView_AuditNumber_ColumnHeader_Element_Locator}        timeout=20
    Double click Element   ${BillingAnalyst_ListView_AuditNumber_ColumnHeader_Element_Locator}
    sleep   3
    ${element_count}=    get element count     ${BillingAnalyst_ListView_AuditNumber_Table_Locator}
    @{AppealDecision_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_AppealDecision}=  Get Text      ${BillingAnalyst_ListView_AuditNumber_Table_Locator} [${i}]
    Append To List      ${AppealDecision_list}    ${get_AppealDecision}
    END
    log      ${AppealDecision_list}
    ${sort_order}=  Copy list  ${AppealDecision_list}
    sort list     ${sort_order}
    log      ${sort_order}
    lists should be equal       ${AppealDecision_list}     ${sort_order}


Double click Claim Number header in BA dashboard List View Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${BillingAnalyst_ListView_ClaimNumber_ColumnHeader_Element_Locator}        timeout=20
    Double click Element   ${BillingAnalyst_ListView_ClaimNumber_ColumnHeader_Element_Locator}
    sleep   3

    ${element_count}=    get element count     ${BillingAnalyst_ListView_ClaimNumber_Table_Locator}
    @{ClaimNumber_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_ClaimNumber}=  Get Text      ${BillingAnalyst_ListView_ClaimNumber_Table_Locator} [${i}]
    Append To List      ${ClaimNumber_list}    ${get_ClaimNumber}
    END
    log      ${ClaimNumber_list}
    ${sort_order}=  Copy list  ${ClaimNumber_list}
    sort list     ${sort_order}
    log      ${sort_order}
    lists should be equal       ${ClaimNumber_list}     ${sort_order}


Double click Medical Record Number header in BA dashboard List View Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${BillingAnalyst_ListView_MedicalRecordNumber_ColumnHeader_Element_Locator}        timeout=20
    Double click Element   ${BillingAnalyst_ListView_MedicalRecordNumber_ColumnHeader_Element_Locator}
    sleep   3

    ${element_count}=    get element count     ${BillingAnalyst_ListView_MedicalRecord_Table_Locator}
    @{MedicalRecord_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_MedicalRecord}=  Get Text      ${BillingAnalyst_ListView_MedicalRecord_Table_Locator} [${i}]
    Append To List      ${MedicalRecord_list}    ${get_MedicalRecord}
    END
    log      ${MedicalRecord_list}
    ${sort_order}=  Copy list  ${MedicalRecord_list}
    sort list     ${sort_order}
    log      ${sort_order}
    lists should be equal       ${MedicalRecord_list}     ${sort_order}


Double click Due Date header in BA dashboard List View Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${BillingAnalyst_ListView_DueDate_ColumnHeader_Element_Locator}        timeout=20
    Double click Element   ${BillingAnalyst_ListView_DueDate_ColumnHeader_Element_Locator}
    sleep   3
    ${element_count}=    get element count     ${BillingAnalyst_ListView_DueDate_Table_Locator}
    @{DueDate_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_DueDate}=  Get Text      ${BillingAnalyst_ListView_DueDate_Table_Locator} [${i}]
    Append To List      ${DueDate_list}    ${get_DueDate}
    END
    log      ${DueDate_list}
    ${sort_order}=  Copy list  ${DueDate_list}
    sort list     ${sort_order}
    log      ${sort_order}
    lists should be equal       ${DueDate_list}     ${sort_order}


Return request extension Button locator on AuditFindings In List View with patient account number passed by user
     [Arguments]   ${RequestExtensionPtAccAudit_PassedByUser}
     ${BillingAnalyst_AuditFinding_RequestExtension_Button_Locator_New}=     Replace String      ${BillingAnalyst_ListView_RequestExtension_Button_Locator}   ${substringToReplace}   ${RequestExtensionPtAccAudit_PassedByUser}
     Set Global Variable    ${BillingAnalyst_AuditFinding_RequestExtension_Button_Locator_New}

Return AuditFindings request extension Days Remaining locator In List View with patient account number passed by user
     [Arguments]   ${RequestExtensionPtAccAudit_PassedByUserAudit}
     ${BillingAnalyst_DaysRemaining_Audit_Locator_New}=     Replace String      ${BillingAnalyst_ListView_DaysRemaining_Audit_Locator}   ${substringToReplace}    ${RequestExtensionPtAccAudit_PassedByUserAudit}
     Set Global Variable    ${BillingAnalyst_DaysRemaining_Audit_Locator_New}

Return AuditFindings request extension Granted locator In List View with patient account number passed by user
     [Arguments]   ${PtAccNumAudit_PassedByUser}
     ${BillingAnalyst_AuditFindings_RequestExtension_ExtensionGranted_Locator_New}=     Replace String      ${BillingAnalyst_ListView_ExtensionGranted_Locator}   ${substringToReplace}    ${PtAccNumAudit_PassedByUser}
     Set Global Variable    ${BillingAnalyst_AuditFindings_RequestExtension_ExtensionGranted_Locator_New}


mouse over on ProviderName and verify the tooltip information
     [Arguments]   ${PtAccNumAudit_PassedByUser}
     ${Comm_Portal_FilterButton_List_view_ProviderName_Information_Locator_New}=     Replace String      ${Comm_Portal_FilterButton_List_view_ProviderName_Information_Locator}   ${substringToReplace}    ${PtAccNumAudit_PassedByUser}
     Wait until element is enabled     ${Comm_Portal_FilterButton_List_view_ProviderName_Information_Locator_New}    timeout=30
     Mouse over      ${Comm_Portal_FilterButton_List_view_ProviderName_Information_Locator_New}
     ${informationIconText}=    Get text    ${Comm_Portal_FilterButton_List_view_ProviderName_Information_Icon_Text_Locator}

     Log to console    ${informationIconText}


Connect to Db with more than 10 records
     [arguments]     ${baDashabordPaginationQuery}
     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity To Fetch More than 10 Records    ${baDashabordPaginationQuery}


Fetch the Number of Record on BA dashboard List View
     ${element_count}=    get element count     ${BiilingAnalyst_List_view_Table_PatientAccountNumber_Locator}
     ${expectedCount} =    Convert To Integer     10
     Should be equal     ${element_count}       ${expectedCount}      "Element Count is not equal to 10"


Verify clicking on Next displays next page
     Click element           ${BiilingAnalyst_List_view_Next_Link_Locator}
     Page should contain element     ${BiilingAnalyst_List_view_Second_page_Locator}
     ${actual_text}=    Get text    ${BiilingAnalyst_List_view_Second_page_Locator}
     Should contain    ${actual_text}          You're on page
     Should contain    ${actual_text}          2

Verify clicking on Previous displays previous page
          Click element           ${BiilingAnalyst_List_view_Previous_Link_Locator}
     Page should contain element     ${BiilingAnalyst_List_view_First_page_Locator}
     ${actual_text}=    Get text    ${BiilingAnalyst_List_view_First_page_Locator}
     Should contain    ${actual_text}          You're on page
     Should contain    ${actual_text}          1


Validate filter clearing functionality in List View
    ${ReviewButton_Count_BeforeapplyingFilter} =   Get text   ${BillingAnalyst_Total_Records_Element_Locator}
    ${Formatted1ReviewButton_Count_BeforeapplyingFilter} =  Replace String    ${ReviewButton_Count_BeforeapplyingFilter}       AUDIT RESULTS (           ${EMPTY}
    ${Formatted2ReviewButton_Count_BeforeapplyingFilter} =  Replace String    ${Formatted1ReviewButton_Count_BeforeapplyingFilter}      )           ${EMPTY}
    ${countBeforeApplyingFilter}=    Convert To Integer    ${Formatted2ReviewButton_Count_BeforeapplyingFilter}
    BillingAnalyst_Dashboard.Click Filter Button
    Verify filter Functionality by providing Valid Patient Account Number    ${data_list[0]['PatientAccountNumber']}
    BillingAnalyst_Dashboard.Click Apply Filter Button
    Sleep    5
    Verify data after applying filter Functionality In List View by providing Valid Patient Account Number           ${data_list[0]['PatientAccountNumber']}
    ${ReviewButton_Count_AfterapplyingFilter} =   Get text    ${BillingAnalyst_Total_Records_Element_Locator}
    ${Formatted1ReviewButton_Count_AfterapplyingFilter}=    Replace String    ${ReviewButton_Count_AfterapplyingFilter}       AUDIT RESULTS (           ${EMPTY}
    ${Formatted2ReviewButton_Count_AfterapplyingFilter}=    Replace String    ${Formatted1ReviewButton_Count_AfterapplyingFilter}      )           ${EMPTY}
    ${countAfterApplyingFilter}=    Convert To Integer    ${Formatted2ReviewButton_Count_AfterapplyingFilter}
    BillingAnalyst_Dashboard.Click Clear Filter Button
    wait until element is not visible         ${RecordAnalyst_Dashboard_PageLoad_RedFlower_Image_Locator}         timeout=120
    ${ReviewButton_Count_AfterClearingFilter} =   Get text   ${BillingAnalyst_Total_Records_Element_Locator}
    ${Formatted1ReviewButton_Count_AfterClearingFilter} =   Replace String    ${ReviewButton_Count_AfterClearingFilter}       AUDIT RESULTS (           ${EMPTY}
    ${Formatted2ReviewButton_Count_AfterClearingFilter} =   Replace String    ${Formatted1ReviewButton_Count_AfterClearingFilter}      )           ${EMPTY}
    ${countAfterClearingFilter}=    Convert To Integer    ${Formatted2ReviewButton_Count_AfterClearingFilter}
    Should Be Equal    ${countBeforeApplyingFilter}     ${countAfterClearingFilter}



Verify Audit finding details with its corresponding values in List View
    Execute javascript       document.body.style.zoom = "0.6"
   ${PatientName}             TestDataFormatter.capitalizeWord             ${data_list[0]['PatientLastName']}
   ${BillingAnalyst_ListView_PtName_Locator_New} =  Replace String   ${Comm_Portal_FilterButton_List_view_PatientName_Locator}  ${substringToReplace}  ${PatientName}
   Wait Until Element Is Visible    ${BillingAnalyst_ListView_PtName_Locator_New}            timeout=30
   Element Should Be Visible      ${BillingAnalyst_ListView_PtName_Locator_New}
   ${formattedDOB}             TestDataFormatter.formatDate           ${data_list[0]['DateOfBirth']}
   ${BillingAnalyst_ListView_DOB_Detail_Locator_New}=     Replace String      ${BiilingAnalyst_List_view_DateOfBirth_Locator}   ${substringToReplace}    ${formattedDOB}
   Wait Until Element Is Visible    ${BillingAnalyst_ListView_DOB_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_ListView_DOB_Detail_Locator_New}
   ${BillingAnalyst_ListView_PtAccNum_Detail_Locator_New}=     Replace String      ${BiilingAnalyst_List_view_PatientAccountNumber_Locator}   ${substringToReplace}    ${data_list[0]['PatientAccountNumber']}
   Wait Until Element Is Visible    ${BillingAnalyst_ListView_PtAccNum_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_ListView_PtAccNum_Detail_Locator_New}
   ${BillingAnalyst_ListView_AuditNum_Detail_Locator_New}=     Replace String      ${Comm_Portal_FilterButton_List_view_AuditNumber_Locator}   ${substringToReplace}    ${data_list[0]['AuditNumber']}
   Wait Until Element Is Visible    ${BillingAnalyst_ListView_AuditNum_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_ListView_AuditNum_Detail_Locator_New}
   ${dateOfService}             TestDataFormatter.formatDate          ${data_list[0]['AdmitDate']}
   ${BillingAnalyst_ListView_DOS_Detail_Locator_New}=     Replace String      ${Comm_Portal_FilterButton_List_view_DateOFService_Locator}   ${substringToReplace}       ${dateOfService}
   Wait Until Element Is Visible    ${BillingAnalyst_ListView_DOS_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_ListView_DOS_Detail_Locator_New}
   ${BillingAnalyst_ListView_MediRecNum_Detail_Locator_New}=     Replace String      ${Comm_Portal_FilterButton_List_view_MedicalRecordNumber_Locator}   ${substringToReplace}    ${data_list[0]['MRNumber']}
   Wait Until Element Is Visible    ${BillingAnalyst_ListView_MediRecNum_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_ListView_MediRecNum_Detail_Locator_New}
   ${BillingAnalyst_ListView_ClaimNum_Detail_Locator_New}=     Replace String      ${Comm_Portal_FilterButton_List_view_ClaimNumber_Locator}   ${substringToReplace}    ${data_list[0]['ClaimNumber']}
   Wait Until Element Is Visible    ${BillingAnalyst_ListView_ClaimNum_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_ListView_ClaimNum_Detail_Locator_New}
   ${BillingAnalyst_ListView_ProviderName_Detail_Locator_New}=     Replace String      ${Comm_Portal_FilterButton_List_view_ProviderName_Locator}   ${substringToReplace}    ${data_list[0]['ProviderName']}
   Wait Until Element Is Visible    ${BillingAnalyst_ListView_ProviderName_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_ListView_ProviderName_Detail_Locator_New}
   ${BillingAnalyst_ListView_ProviderID_Detail_Locator_New}=     Replace String      ${Comm_Portal_FilterButton_List_view_ProviderNumber_Locator}   ${substringToReplace}    ${data_list[0]['ProviderId']}
   Wait Until Element Is Visible    ${BillingAnalyst_ListView_ProviderID_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_ListView_ProviderID_Detail_Locator_New}

   IF  ${data_list[0]['Prepay']}=="TRUE"
       ${PrepayValue}=     Set Variable    Yes
       Set Global Variable     ${PrepayValue}
   ELSE
       ${PrepayValue}=     Set Variable    Yes
       Set Global Variable     ${PrepayValue}
   END
    ${BillingAnalyst_ListView_Prepay_Detail_Locator_New}=     Replace String      ${BiilingAnalyst_List_view_Prepay_Locator}   ${substringToReplace}    ${PrepayValue}
   Wait Until Element Is Visible    ${BillingAnalyst_ListView_Prepay_Detail_Locator_New}
   Element Should Be Visible      ${BillingAnalyst_ListView_Prepay_Detail_Locator_New}
   ${BillingAnalyst_ListView_AppealDecision_Detail_Locator_New}=     Replace String      ${Comm_Portal_FilterButton_List_view_AppealDecision_Locator}   ${substringToReplace}    N/A
    Wait Until Element Is Visible    ${BillingAnalyst_ListView_AppealDecision_Detail_Locator_New}
    Element Should Be Visible      ${BillingAnalyst_ListView_AppealDecision_Detail_Locator_New}


Verify after submission of Audit is in audit history page
       [Arguments]   ${PtAccNumRecordRequest_PassedByUser}
       Element Should Not Be Visible                         ${BillingAnalyst_AuditFindings_ReviewButton_Locator_New}
       History.Verify History page is displayed on clicking History Icon
       History.Clicks on filter icon
       History.Verify filter Functionality by providing Valid Patient Account Number for RA and BA               ${PtAccNumRecordRequest_PassedByUser}
       ${RecordAnalyst_Dashboard_Submiited_Record_Locator_New} =    Replace String      ${RecordAnalyst_Dashboard_Submiited_Record_Locator}   ${substringToReplace}    ${PtAccNumRecordRequest_PassedByUser}
       Wait Until Element Is Visible           ${RecordAnalyst_Dashboard_Submiited_Record_Locator_New}             timeout=60
       Element Should Be Visible                 ${RecordAnalyst_Dashboard_Submiited_Record_Locator_New}

Connect to Cloud Db with more than 10 records
     [arguments]     ${baDashabordPaginationQuery}
     CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity To Fetch More than 10 Records    ${baDashabordPaginationQuery}
