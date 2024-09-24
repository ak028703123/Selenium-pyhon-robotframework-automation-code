*** Settings ***
Documentation    Script to Test Communication Portal
Library    SeleniumLibrary
Library    Easter
Library    DateTime
Library    String
Library    OperatingSystem
Library    ..//ProperPay_Automation//Resource/Database//TestDataFormatter.py
Resource   ../ProperPay_Automation/Resource/UI/RecoveryStudio/History.robot


Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//Homepage_Elements.py
Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//RecordAnalyst_DashBoard_Elements.py
Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//BillingAnalyst_DashBoard_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//BillingAnalyst_DashBoard_TestData.yaml
Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//RecordAnalyst_DashBoard_TestData.yaml
Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//UserManagement_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//UserManagement_TestData.yaml


*** Variables ***
${substringToReplace}    texttoreplace

*** Keywords ***


#Aishwarya K

Return Record Request Review Button locator with patient account number passed by user
     [Arguments]   ${PtAccNumRecordRequest_PassedByUser}
     ${RecordRequest_ReviewButton_Locator_New}=     Replace String      ${RecordRequest_ReviewButton_Locator}   ${PtAccNumRecordRequest}    ${PtAccNumRecordRequest_PassedByUser}
     Set Global Variable    ${RecordRequest_ReviewButton_Locator_New}


Return request extension Button locator with patient account number passed by user
     [Arguments]   ${RequestExtensionPtAcc_PassedByUser}
     ${RecordAnalyst_RequestExtension_Button_Locator_New}=     Replace String      ${RecordAnalyst_RequestExtension_Button_Locator}   ${REPtAccNum}    ${RequestExtensionPtAcc_PassedByUser}
     Set Global Variable    ${RecordAnalyst_RequestExtension_Button_Locator_New}


Return request extension Days Remaining locator with patient account number passed by user
     [Arguments]   ${RequestExtensionPtAcc_PassedByUser}
     ${RecordAnalyst_RecordRequest_DaysRemaining_Locator_New}=     Replace String      ${RecordAnalyst_RecordRequest_DaysRemaining_Locator}   ${REPtAccNum}    ${RequestExtensionPtAcc_PassedByUser}
     Set Global Variable    ${RecordAnalyst_RecordRequest_DaysRemaining_Locator_New}

Return request extension Granted locator with patient account number passed by user
     [Arguments]   ${RequestExtensionPtAcc_PassedByUser}
     ${RecordAnalyst_RequestExtension_ExtensionGranted_Locator_New}=     Replace String      ${RecordAnalyst_RequestExtension_ExtensionGranted_Locator}   ${REPtAccNum}    ${RequestExtensionPtAcc_PassedByUser}
     Set Global Variable    ${RecordAnalyst_RequestExtension_ExtensionGranted_Locator_New}


Click Record Request Tab
    Sleep   5
    Wait Until Element Is Visible    ${Comm_Portal_HomePage_RecordRequestsTab_Locator}   timeout=120
    Click Element    ${Comm_Portal_HomePage_RecordRequestsTab_Locator}

Click Review button_RecordRequest

    Wait Until Element Is Visible    ${RecordRequest_ReviewButton_Locator_New}           timeout=160
    Click Element                    ${RecordRequest_ReviewButton_Locator_New}


Scroll down to the bottom of Record details page
    Wait Until Element Is Visible                    ${RecordAnalyst_Dashboard_Details_Page_Locator}    timeout=160
    Scroll Element Into View                         ${RecordAnalyst_SubmitDocuments_Button_Locator}
    Wait Until Element Is Visible                     ${RecordAnalyst_SubmitDocuments_Button_Locator}


Verify Submit Document button is present
   Wait Until Element Is Visible                     ${RecordAnalyst_SubmitDocuments_Button_Locator}
   Element Should Be Visible                        ${RecordAnalyst_SubmitDocuments_Button_Locator}


Verify Patient details are present
   Sleep    5
   ${PatientName}             TestDataFormatter.formatPatientName          ${data_list[0]['PatientFirstName']}    ${data_list[0]['PatientLastName']}
   ${RecordAnalyst_PtName_Locator_New} =  Replace String   ${RecordAnalyst_PtName_Locator}  ${substringToReplace}  ${PatientName}
   Wait Until Element Is Visible    ${RecordAnalyst_PtName_Locator_New}            timeout=120
    Element Should Be Visible      ${RecordAnalyst_PtName_Locator_New}
   ${formattedDOB}             TestDataFormatter.formatDate           ${data_list[0]['DateOfBirth']}
   ${RecordAnalyst_DOB_Detail_Locator_New}=     Replace String      ${RecordAnalyst_DOB_Detail_Locator}   ${substringToReplace}    ${formattedDOB}
   Wait Until Element Is Visible    ${RecordAnalyst_DOB_Detail_Locator_New}
   Element Should Be Visible      ${RecordAnalyst_DOB_Detail_Locator_New}
   ${RecordAnalyst_PtAccNum_Detail_Locator_New}=     Replace String      ${RecordAnalyst_PtAccNum_Detail_Locator}   ${substringToReplace}    ${data_list[0]['PatientAccountNumber']}
   Wait Until Element Is Visible    ${RecordAnalyst_PtAccNum_Detail_Locator_New}
   Element Should Be Visible      ${RecordAnalyst_PtAccNum_Detail_Locator_New}
   ${RecordAnalyst_AuditNum_Detail_Locator_New}=     Replace String      ${RecordAnalyst_AuditNum_Detail_Locator}   ${substringToReplace}    ${data_list[0]['AuditNumber']}
   Wait Until Element Is Visible    ${RecordAnalyst_AuditNum_Detail_Locator_New}
   Element Should Be Visible      ${RecordAnalyst_AuditNum_Detail_Locator_New}
   ${dateOfService}             TestDataFormatter.formatDateOfService          ${data_list[0]['AdmitDate']}    ${data_list[0]['DischargeDate']}
   ${RecordAnalyst_DOS_Detail_Locator_New}=     Replace String      ${RecordAnalyst_DOS_Detail_Locator}   ${substringToReplace}    ${dateOfService}
   Wait Until Element Is Visible    ${RecordAnalyst_DOS_Detail_Locator_New}
   Element Should Be Visible      ${RecordAnalyst_DOS_Detail_Locator_New}
   ${RecordAnalyst_MediRecNum_Detail_Locator_New}=     Replace String      ${RecordAnalyst_MediRecNum_Detail_Locator}   ${substringToReplace}    ${data_list[0]['MRNumber']}
   Wait Until Element Is Visible    ${RecordAnalyst_MediRecNum_Detail_Locator_New}
   Element Should Be Visible      ${RecordAnalyst_MediRecNum_Detail_Locator_New}
   ${RecordAnalyst_ClaimNum_Detail_Locator_New}=     Replace String      ${RecordAnalyst_ClaimNum_Detail_Locator}   ${substringToReplace}    ${data_list[0]['ClaimNumber']}
   Wait Until Element Is Visible    ${RecordAnalyst_ClaimNum_Detail_Locator_New}
   Element Should Be Visible      ${RecordAnalyst_ClaimNum_Detail_Locator_New}
   ${RecordAnalyst_ProviderName_Detail_Locator_New}=     Replace String      ${RecordAnalyst_ProviderName_Detail_Locator}   ${substringToReplace}    ${data_list[0]['ProviderName']}
   Wait Until Element Is Visible    ${RecordAnalyst_ProviderName_Detail_Locator_New}
   Element Should Be Visible      ${RecordAnalyst_ProviderName_Detail_Locator_New}
   ${RecordAnalyst_ProviderId_Detail_Locator_New}=     Replace String      ${RecordAnalyst_ProviderId_Detail_Locator}   ${substringToReplace}    ${data_list[0]['BillingProviderNumber']}
   Wait Until Element Is Visible    ${RecordAnalyst_ProviderID_Detail_Locator_New}
   Element Should Be Visible      ${RecordAnalyst_ProviderID_Detail_Locator_New}
   IF  '${data_list[0]['Prepay']}=False'
       ${PrepayValue}=     Set Variable    No
       Set Global Variable     ${PrepayValue}
   ELSE IF   '${data_list[0]['Prepay']}=True'
       ${PrepayValue}=     Set Variable    Yes
       Set Global Variable     ${PrepayValue}
   END
   ${RecordAnalyst_Prepay_Detail_Locator_New}=     Replace String      ${RecordAnalyst_Prepay_Detail_Locator}   ${substringToReplace}    ${PrepayValue}
   Wait Until Element Is Visible    ${RecordAnalyst_Prepay_Detail_Locator_New}
   Element Should Be Visible      ${RecordAnalyst_Prepay_Detail_Locator_New}


Verify Authorized eSignature details

   Textfield Value Should Be     ${RecordAnalyst_Esignature_Locator}    ${Esignature}
   Textfield Value Should Be     ${RecordAnalyst_Title_Locator}    ${Title}
   ${date}=      Get Current Date     result_format=%Y-%m-%d
   Textfield Value Should Be     ${RecordAnalyst_date_Locator}    ${date}


Verify Submit Documents button is enabled
   Sleep    5
   Wait Until Element Is Visible    ${RecordAnalyst_SubmitDocuments_Button_Locator}
   Element Should Be Enabled    ${RecordAnalyst_SubmitDocuments_Button_Locator}

Verify Submit Documents button is disabled
   Sleep    5
   Wait Until Element Is Visible    ${RecordAnalyst_SubmitDocuments_Button_Locator}
   Element Should Be Disabled    ${RecordAnalyst_SubmitDocuments_Button_Locator}

Return Overdue locator with patient account number passed by user
     [Arguments]   ${PtAccNumRecordRequest_PassedByUser}
     ${RecordAnalyst_Overdue_locator_New}=     Replace String      ${RecordAnalyst_Overdue_locator}   ${PtAccNumRecordRequest}    ${PtAccNumRecordRequest_PassedByUser}
     Set Global Variable    ${RecordAnalyst_Overdue_locator_New}

     ${RecordAnalyst_Apoproaching_Overdue_locator_New}=     Replace String      ${RecordAnalyst_Apoproaching_Overdue_locator}   ${PtAccNumRecordRequest}    ${PtAccNumRecordRequest_PassedByUser}
     Set Global Variable    ${RecordAnalyst_Apoproaching_Overdue_locator_New}

     ${RecordAnalyst_NotApoproaching_Overdue_locator_New}=     Replace String      ${RecordAnalyst_NotApoproaching_Overdue_locator}   ${PtAccNumRecordRequest}    ${PtAccNumRecordRequest_PassedByUser}
     Set Global Variable    ${RecordAnalyst_NotApoproaching_Overdue_locator_New}



Verify patient record request Overdue status
    Wait Until Element Is Visible    ${RecordRequest_ReviewButton_Locator_New}         timeout=120
    ${Overdue_locator_count} =   Get Element Count   ${RecordAnalyst_Overdue_locator_New}
    ${Apoproaching_Overdue_locator_count} =   Get Element Count   ${RecordAnalyst_Apoproaching_Overdue_locator_New}
    ${NotApoproaching_Overdue_locator_count} =   Get Element Count   ${RecordAnalyst_NotApoproaching_Overdue_locator_New}

    IF   ${Overdue_locator_count}>0
    ${status}=   set variable    Overdue
    log   ${status}
    ELSE IF    ${Apoproaching_Overdue_locator_count}>0
    ${status}=    set variable    Approaching Overdue
    log   ${status}
    ELSE IF    ${NotApoproaching_Overdue_locator_count}>0
    ${status}=    Set Variable    Not Approaching Overdue
    log   ${status}
    END

Verify the request extension button is not present for overdue patient
    wait until element is not visible         ${RecordAnalyst_Dashboard_PageLoad_RedFlower_Image_Locator}           timeout=120
    Wait Until Element Is Visible   ${RecordAnalyst_Overdue_locator_New}                                    timeout=120
    ${Overdue_locator_count} =   Get Element Count     ${RecordAnalyst_Overdue_locator_New}
    IF   ${Overdue_locator_count}>0
    Element Should Not Be Visible    ${RecordAnalyst_RequestExtension_Button_Locator_New}
    END



Verify all the Record information is entered

   ${formattedDOB}             TestDataFormatter.formatDate           ${data_list[0]['DateOfBirth']}
   ${RecordAnalyst_RecordInfo_DOB_Detail_Locator_New}=     Replace String      ${RecordAnalyst_RecordInfo_DOB_Detail_Locator}   ${substringToReplace}    ${formattedDOB}
   Wait Until Element Is Visible    ${RecordAnalyst_RecordInfo_DOB_Detail_Locator_New}                timeout=120
   Element Should Be Visible      ${RecordAnalyst_RecordInfo_DOB_Detail_Locator_New}
   ${RecordAnalyst_RecordInfo_SubscriberID_Detail_Locator_New}=     Replace String      ${RecordAnalyst_RecordInfo_SubscriberID_Detail_Locator}   ${substringToReplace}    ${data_list[0]['SubscriberId']}
   Wait Until Element Is Visible    ${RecordAnalyst_RecordInfo_SubscriberID_Detail_Locator_New}
   Element Should Be Visible      ${RecordAnalyst_RecordInfo_SubscriberID_Detail_Locator_New}
   ${RecordAnalyst_RecordInfo_GroupID_Detail_Locator_New}=     Replace String      ${RecordAnalyst_RecordInfo_GroupID_Detail_Locator}   ${substringToReplace}    ${data_list[0]['PolicyNumber']}
   Wait Until Element Is Visible    ${RecordAnalyst_RecordInfo_GroupID_Detail_Locator_New}
   Element Should Be Visible      ${RecordAnalyst_RecordInfo_GroupID_Detail_Locator_New}
   ${RecordAnalyst_RecordInfo_ClaimNum_Detail_Locator_New}=     Replace String      ${RecordAnalyst_RecordInfo_ClaimNum_Detail_Locator}   ${substringToReplace}    ${data_list[0]['ClaimNumber']}
   Wait Until Element Is Visible    ${RecordAnalyst_RecordInfo_ClaimNum_Detail_Locator_New}
   Element Should Be Visible      ${RecordAnalyst_RecordInfo_ClaimNum_Detail_Locator_New}
   ${RecordAnalyst_RecordInfo_ClaimType_Detail_Locator_New}=     Replace String      ${RecordAnalyst_RecordInfo_ClaimType_Detail_Locator}   ${substringToReplace}    ${data_list[0]['ClaimType']}
   Wait Until Element Is Visible     ${RecordAnalyst_RecordInfo_ClaimType_Detail_Locator_New}
   Element Should Be Visible       ${RecordAnalyst_RecordInfo_ClaimType_Detail_Locator_New}
   ${RecordAnalyst_RecordInfo_MediRecNum_Detail_Locator_New}=     Replace String      ${RecordAnalyst_RecordInfo_MediRecNum_Detail_Locator}   ${substringToReplace}    ${data_list[0]['MRNumber']}
   Wait Until Element Is Visible    ${RecordAnalyst_RecordInfo_MediRecNum_Detail_Locator_New}
   Element Should Be Visible      ${RecordAnalyst_RecordInfo_MediRecNum_Detail_Locator_New}
   ${RecordAnalyst_RecordInfo_AuditNum_Detail_Locator_New}=     Replace String      ${RecordAnalyst_RecordInfo_AuditNum_Detail_Locator}   ${substringToReplace}    ${data_list[0]['AuditNumber']}
   Wait Until Element Is Visible    ${RecordAnalyst_RecordInfo_AuditNum_Detail_Locator_New}
   Element Should Be Visible      ${RecordAnalyst_RecordInfo_AuditNum_Detail_Locator_New}
   ${formattedAuditStatus}             TestDataFormatter.formatAuditStatus           ${data_list[0]['AuditStatus']}
   ${RecordAnalyst_RecordInfo_AuditStatus_Detail_Locator_New}=     Replace String      ${RecordAnalyst_RecordInfo_AuditStatus_Detail_Locator}   ${substringToReplace}    ${formattedAuditStatus}
   Wait Until Element Is Visible    ${RecordAnalyst_RecordInfo_AuditStatus_Detail_Locator_New}
   Element Should Be Visible      ${RecordAnalyst_RecordInfo_AuditStatus_Detail_Locator_New}
   ${RecordAnalyst_RecordInfo_ProviderName_Detail_Locator_New}=     Replace String      ${RecordAnalyst_RecordInfo_ProviderName_Detail_Locator}   ${substringToReplace}    ${data_list[0]['ProviderName']}
   Wait Until Element Is Visible    ${RecordAnalyst_RecordInfo_ProviderName_Detail_Locator_New}
   Element Should Be Visible      ${RecordAnalyst_RecordInfo_ProviderName_Detail_Locator_New}
   ${RecordAnalyst_RecordInfo_ProviderID_Detail_Locator_New}=     Replace String      ${RecordAnalyst_RecordInfo_ProviderID_Detail_Locator}   ${substringToReplace}    ${data_list[0]['BillingProviderNumber']}
   Wait Until Element Is Visible    ${RecordAnalyst_RecordInfo_ProviderID_Detail_Locator_New}
   Element Should Be Visible      ${RecordAnalyst_RecordInfo_ProviderID_Detail_Locator_New}
   ${RecordAnalyst_RecordInfo_DivisionCode_Detail_Locator_New}=     Replace String      ${RecordAnalyst_RecordInfo_DivisionCode_Detail_Locator}   ${substringToReplace}    ${data_list[0]['DivisionCode']}
   Wait Until Element Is Visible    ${RecordAnalyst_RecordInfo_DivisionCode_Detail_Locator_New}
   Element Should Be Visible      ${RecordAnalyst_RecordInfo_DivisionCode_Detail_Locator_New}
   ${formattedAdmitDate}             TestDataFormatter.formatDate           ${data_list[0]['AdmitDate']}
   ${RecordAnalyst_RecordInfo_AdmitDate_Detail_Locator_New}=     Replace String      ${RecordAnalyst_RecordInfo_AdmitDate_Detail_Locator}   ${substringToReplace}    ${formattedAdmitDate}
   Wait Until Element Is Visible    ${RecordAnalyst_RecordInfo_AdmitDate_Detail_Locator_New}
   Element Should Be Visible      ${RecordAnalyst_RecordInfo_AdmitDate_Detail_Locator_New}
   ${formattedDischargeDate}             TestDataFormatter.formatDate           ${data_list[0]['DischargeDate']}
   ${RecordAnalyst_RecordInfo_DischargeDate_Detail_Locator_New}=     Replace String      ${RecordAnalyst_RecordInfo_DischargeDate_Detail_Locator}   ${substringToReplace}    ${formattedDischargeDate}
   Wait Until Element Is Visible    ${RecordAnalyst_RecordInfo_DischargeDate_Detail_Locator_New}
   Element Should Be Visible      ${RecordAnalyst_RecordInfo_DischargeDate_Detail_Locator_New}
   Wait Until Element Is Visible    ${RecordAnalyst_RecordInfo_Prepay_Detail_Locator}
   Element Should Be Visible      ${RecordAnalyst_RecordInfo_Prepay_Detail_Locator}



Verify that the request extension button is present on the identified record request tile
    wait until element is not visible         ${RecordAnalyst_Dashboard_PageLoad_RedFlower_Image_Locator}                  timeout=120
    Wait Until Element Is Visible   ${RecordAnalyst_RequestExtension_Button_Locator_New}               timeout=60                          timeout=120
    Element Should Be Visible      ${RecordAnalyst_RequestExtension_Button_Locator_New}

Click Request extension button and verify the Request Extension pop up is displayed
   Wait Until Element Is Visible    ${RecordAnalyst_RequestExtension_Button_Locator_New}               timeout=60
   Click Element    ${RecordAnalyst_RequestExtension_Button_Locator_New}
   Element Should Be Visible   ${RecordAnalyst_RequestExtension_Popup_Locator}                   timeout=15


Verify the Request Extension confirmation message
   [Arguments]     ${patientFirstName}    ${patientLastName}
   Wait Until Element Is Visible    ${RecordAnalyst_RequestExtension_Popup_Locator}
   Element Should Be Visible   ${RecordAnalyst_RequestExtension_Popup_Locator}
   Element Should Be Visible   ${RecordAnalyst_RequestExtension_Button_ConfirmRequest_Locator}
   ${RecordAnalyst_RequestExtensionPopup_msg_Actual}=    Get Text    ${RecordAnalyst_RequestExtension_message_Locator}
   ${PatientName}           TestDataFormatter.formatPatientName          ${patientFirstName}    ${patientLastName}
   Should Be Equal As Strings  ${RecordAnalyst_RequestExtensionPopup_msg_Actual}     You are requesting a one-time 14 day extension for the record request of ${PatientName}.


Click Confirm Request Button and verify the Request Extension is no longer available on the tile
    Wait Until Element Is Visible    ${RecordAnalyst_RequestExtension_Button_ConfirmRequest_Locator}  timeout=120
    sleep    3
    Click Element     ${RecordAnalyst_RequestExtension_Button_ConfirmRequest_Locator}
    wait until element is not visible    ${RecordAnalyst_RequestExtension_Button_Locator_New}     timeout=120
    Wait Until Element Is Visible    ${RecordAnalyst_RequestExtension_ExtensionGranted_Locator_New}   timeout=120
    Element Should Be Visible   ${RecordAnalyst_RequestExtension_ExtensionGranted_Locator_New}



Verify the number of days remaining to submit is reflected on tiles before requesting extension
    Wait Until Element Is Visible    ${RecordAnalyst_RecordRequest_DaysRemaining_Locator_New}     timeout=120
    ${RecordAnalyst_RecordRequest_DaysRemaining_Actual}=    Get Text    ${RecordAnalyst_RecordRequest_DaysRemaining_Locator_New}
    ${RecordAnalyst_RecordRequest_DaysRemaining_Actual_Firstline} =     Get Line    ${RecordAnalyst_RecordRequest_DaysRemaining_Actual}    0
    log    ${RecordAnalyst_RecordRequest_DaysRemaining_Actual_Firstline}
    Set Global Variable    ${RecordAnalyst_RecordRequest_DaysRemaining_Actual_Firstline}

Add 14 days to the number of day remaining to submit
    ${Additionaldays} =     Set Variable   ${14}
    ${number only}=     Evaluate    "${RecordAnalyst_RecordRequest_DaysRemaining_Actual_Firstline}".split(" ")[0]
    ${number only}=     Convert To Number    ${number only}
    log    ${number only}
    ${TotalDaysAfterExtension}=     Evaluate    ${number only}+${Additionaldays}
    log    ${TotalDaysAfterExtension}
    Set Global Variable    ${TotalDaysAfterExtension}

Verify additional 14 days is added to number of days remaining to submit after requesting extension

    Wait Until Element Is Visible    ${RecordAnalyst_RecordRequest_DaysRemaining_Locator_New}     timeout=120
    ${RecordAnalyst_RecordRequest_DaysRemaining_Actual_AfterRequestExtns}=    Get Text    ${RecordAnalyst_RecordRequest_DaysRemaining_Locator_New}
    ${RecordAnalyst_RecordRequest_DaysRemaining_Actual_AfterRequestExtns_Firstline} =     Get Line    ${RecordAnalyst_RecordRequest_DaysRemaining_Actual_AfterRequestExtns}    0
    log    ${RecordAnalyst_RecordRequest_DaysRemaining_Actual_AfterRequestExtns_Firstline}
    ${number only}=     Evaluate    "${RecordAnalyst_RecordRequest_DaysRemaining_Actual_AfterRequestExtns_Firstline}".split(" ")[0]
    ${NumberofDaysAftrExtns}=     Convert To Number    ${number only}
    Run Keyword If    "${TotalDaysAfterExtension}" == "${NumberofDaysAftrExtns}"   log    additional 14 days is added


Verify Document uploading errors window appears with FileAlreadyExists error message in RA dashboard
      Wait Until Element Is Visible    ${BillingAnalyst_window_Document_uploading_error_locator}   timeout=120
      Element Should Be Visible     ${BillingAnalyst_window_Document_uploading_error_locator}
      ${BillingAnalyst_window_Document_uploading_error_locator_msg_Actual}=    Get Text    ${BillingAnalyst_window_Document_uploading_error_locator}


  #    Should Contain    ${BillingAnalyst_window_Document_uploading_error_locator_msg_Actual}     Document Not Saved Successfully             OR           The following files listed below are already exists for the Audit
      Should Contain    ${BillingAnalyst_window_Document_uploading_error_locator_msg_Actual}      already exists
#      Wait Until Element Is Visible     ${BillingAnalyst_button_OK_Document_uploading_error_locator}
#      Click Button     ${BillingAnalyst_button_OK_Document_uploading_error_locator}
#      Wait Until Element Is Visible    ${BillingAnalyst_UploadDocuments_Window_Locator}
#      Click Element    ${BillingAnalyst_UploadDocuments_Cancel_Button_Locator}
#      Wait Until Element Is Visible    ${BillingAnalyst_UploadDocuments_Done_Button_Locator}
#      Click Element  ${BillingAnalyst_UploadDocuments_Done_Button_Locator}



Remove the Attached Document RA dashboard
     Wait Until Element Is Visible     ${RecordAnalyst_Remove_Attachment_Cancle_Locator}     timeout=120
     Click Element    ${RecordAnalyst_Remove_Attachment_Cancle_Locator}
     Element Should Be Visible    ${BillingAnalyst_window_Confirm_Delete_Document_Locator}   timeout=120
     Click Element     ${BillingAnalyst_Button_Yes_Confirm_Delete_Document_window_Locator}
     Wait Until Element Is Visible    ${BillingAnalyst_button_close_Document_delete_windw_locator}     timeout=120
     Click Element    ${BillingAnalyst_button_close_Document_delete_windw_locator}
     sleep         10

Verify record details are present
    [Documentation]    This keyword vaidates that All  3 Sections - Claim Review Details, Upload Documents and Authorized eSignature are displayed on clicking the review button of record request tile
    Wait Until Element Is Visible  ${RecordRequest_ClaimReviewDetails_Tab_Locator}    timeout=30
    Element Should Be Visible    ${RecordRequest_ClaimReviewDetails_Tab_Locator}   timeout=120
    Scroll Element Into View    ${RecordRequest_UploadDocuments_Tab_Locator}
    Wait Until Element Is Visible  ${RecordRequest_UploadDocuments_Tab_Locator}
    Element Should Be Visible    ${RecordRequest_UploadDocuments_Tab_Locator}   timeout=120
    Scroll Element Into View    ${RecordRequest_Authorized_eSignature_Locator}
    Wait Until Element Is Visible  ${RecordRequest_Authorized_eSignature_Locator}
    Element Should Be Visible    ${RecordRequest_Authorized_eSignature_Locator}   timeout=120



Click Grid View Icon
    Wait Until Element Is Visible   ${RecordAnalyst_GridView_Icon_locator}
    Click Element    ${RecordAnalyst_GridView_Icon_locator}

Click List View Icon
    Wait Until Element Is Visible   ${RecordAnalyst_ListView_Icon_locator}     timeout=120
    Click Element    ${RecordAnalyst_ListView_Icon_locator}

Verify auidts are diplayed in list view
    Wait Until Element Is Visible   ${RecordAnalyst_ListView_Active_locator}
    Click Element    ${RecordAnalyst_ListView_Active_locator}

Verify auidts are diplayed in Grid view
     Wait Until Element Is Visible   ${RecordAnalyst_GridView_Active_locator}
     Click Element    ${RecordAnalyst_GridView_Active_locator}

Verify auidts are not diplayed in Grid view
      Element Should Be Visible  ${RecordAnalyst_GridView_Inactive_locator}

Verify auidts are not diplayed in List view
     Element Should Be Visible    ${RecordAnalyst_ListView_Inactive_locator}



Replace the dynamically fetched Record Request Tile total count number
     ${Comm_Portal_HomePage_RecordRequestsTab_WithTotalCount_Locator_New}=     Replace String      ${Comm_Portal_HomePage_RecordRequestsTab_WithTotalCount_Locator}   ${RecordRequest_Tile_count}    ${RecordRequest_Tile_count_New}
     Set Global Variable    ${Comm_Portal_HomePage_RecordRequestsTab_WithTotalCount_Locator_New}


Validate the Record Request tab contains the total count of tiles
    Wait Until Element Is Visible    ${Comm_Portal_HomePage_RecordRequestsTab_WithTotalCount_Locator_New}
    Element Should Be Visible  ${Comm_Portal_HomePage_RecordRequestsTab_WithTotalCount_Locator_New}

#Satheesh

Verify filter Functionality by providing DAYS REMAINING UNTIL DUE DATE
    [Arguments]     ${User_option}
    Wait until Element is Visible       ${Comm_Portal_FilterButton_filterDaysRemainingLabel_Locator}     timeout=30
    Select From List By Value           ${Comm_Portal_FilterButton_DaysRemaining_TextField_Locator}             ${User_option}
    BillingAnalyst_Dashboard.Click Apply Filter Button

Verify data after applying filter Functionality by providing DAYS REMAINING UNTIL DUE DATE - OVERDUE

    wait until Element is visible   ${RecordAnalyst_Overdue_Data_FilterResult_Locator}                 timeout=120
    ${element_count}=    get element count     ${RecordAnalyst_Overdue_Data_FilterResult_Locator}
    IF  ${element_count}>0
    @{OverdueStatus_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_OverdueStatus}=  Get Text      ${RecordAnalyst_Overdue_Data_FilterResult_Locator} [${i}]
    Append To List      ${OverdueStatus_list}    ${get_OverdueStatus}
    END
    log      ${OverdueStatus_list}
    ${Duplicates}=   remove duplicates      ${OverdueStatus_list}
    ${OverdueStatus}=     catenate        @{Duplicates}
    ${OverdueStatus}=    convert to lower case       ${OverdueStatus}
    ${OverdueStatus}=     convert to title case         ${OverdueStatus}
    log         ${OverdueStatus}
    should contain any       ${OverdueStatus_}       ${DAYS REMAINING OVERDUE}

    ELSE
    log     no record found
    END

Verify data after applying filter Functionality by providing DAYS REMAINING UNTIL DUE DATE - NON OVERDUE
    ${element_count}=    get element count     ${RecordAnalyst_1_2_3_4_5_Great5_Data_FilterResult_Locator}

    IF      ${element_count}>0
    @{Non_OverdueStatus_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_NonOverdueStatus}=  Get Text      ${RecordAnalyst_1_2_3_4_5_Great5_Data_FilterResult_Locator} [${i}]
    ${get_NonOverdueStatus}=   SPLIT STRING        ${get_NonOverdueStatus}         ${SPACE}
    Append To List      ${Non_OverdueStatus_list}    ${get_NonOverdueStatus}[0]
    END
    log     ${Non_OverdueStatus_list}

    FOR     ${i}    IN      @{Non_OverdueStatus_list}
    ${Days}=      convert to integer        ${i}

    IF    ${Days}==1
    log     DAYS REMAINING UNTIL DUE DATE is 1

    ELSE IF     ${Days}==2
    log     DAYS REMAINING UNTIL DUE DATE is 2

    ELSE IF     ${Days}==3
    log     DAYS REMAINING UNTIL DUE DATE is 3

    ELSE IF     ${Days}==4
    log     DAYS REMAINING UNTIL DUE DATE is 4

    ELSE IF     ${Days}==5
    log     DAYS REMAINING UNTIL DUE DATE is 5

    ELSE IF     ${Days}>5
    log     DAYS REMAINING UNTIL DUE DATE is greater than 5
    END
    END

    ELSE
    log     No Records found
    END

Verify filter Functionality by providing Claim Type
    [Arguments]     ${User_option}
    Wait until Element is Visible       ${RecordAnalyst_filter_ClaimType_dropdown_Locator}        timeout=30
    Element Should Be Visible        ${RecordAnalyst_filter_ClaimType_dropdown_Locator}
    Select from list by label       ${RecordAnalyst_filter_ClaimType_dropdown_Locator}                       ${User_option}
    BillingAnalyst_Dashboard.Click Apply Filter Button

Verify filter result by after providing Claim Type as Inpatient
    sleep         5

    ${element_count}=    get element count     ${Comm_Portal_FilterTab_Review_Button_Locator}[1]
    Click button        ${Comm_Portal_FilterTab_Review_Button_Locator}

    ${e}=       set variable    1
    WHILE      ${element_count}>=${e}
    sleep   5
    IF      ${e}< ${element_count}
        ${a}=   get text        ${RecordAnalyst_RecordInfo_Filter_ClaimType_Detail_Locator}
        IF  "${a}"== "Inpatient"
        Click Next Request Button
        ${e}=   evaluate          ${e}+1
        ELSE
        Break
        END

    ELSE IF  ${e}== ${element_count}
        ${a}=   get text        ${RecordAnalyst_RecordInfo_Filter_ClaimType_Detail_Locator}
        IF  "${a}"== "Inpatient"
        log     pass
        ${e}=   evaluate          ${e}+1
        ELSE
        Break
        END
    END
    END

Scroll down to the bottom of page
    Execute javascript          window.scrollTo(0,2000)
    sleep  3

Verify CANCEL RECORDS SUBMISSION Pop up
    Wait Until Element Is Visible            ${RecordAnalyst_Cancel_Records_Submission_PopUp_Head_Locator}
    Element Should Be Visible                ${RecordAnalyst_Cancel_Records_Submission_PopUp_Head_Locator}
    Wait Until Element Is Visible            ${RecordAnalyst_Cancel_Records_Submission_PopUp_Body_Locator}
    Element Should Be Visible                ${RecordAnalyst_Cancel_Records_Submission_PopUp_Body_Locator}
    ${RecordAnalyst_Cancel_Records_Submission_PopUp_Body_Locator_new}=        Get Text            ${RecordAnalyst_Cancel_Records_Submission_PopUp_Body_Locator}
    should be equal            ${RecordAnalyst_Cancel_Records_Submission_PopUp_Body_Locator_new}           Record submission has been cancelled. Any uploaded files are still pending submission. This audit will continue to remain on your Record Requests dashboard until the records with signature have been submitted.
    Wait Until Element Is Visible           ${BillingAnalyst_Cancel_Appeal_Submission_PopUp_GoToDashboard_Button_Locator}
    Element Should Be Visible               ${BillingAnalyst_Cancel_Appeal_Submission_PopUp_GoToDashboard_Button_Locator}
    Element Should Be Enabled               ${BillingAnalyst_Cancel_Appeal_Submission_PopUp_GoToDashboard_Button_Locator}
    Wait Until Element Is Visible           ${BillingAnalyst_Cancel_Appeal_Submission_PopUp_ContinueToNextAudit_Button_Locator}
    Element Should Be Visible               ${BillingAnalyst_Cancel_Appeal_Submission_PopUp_ContinueToNextAudit_Button_Locator}
    Element Should Be Enabled               ${BillingAnalyst_Cancel_Appeal_Submission_PopUp_ContinueToNextAudit_Button_Locator}







#AN
Verify Filter Options panel is visible
   Wait Until Element Is Visible    ${RecordAnalyst_FilterButton_filterPatientAccountLabel_Locator}
   Element Should Be Visible       ${RecordAnalyst_FilterButton_filterPatientAccountLabel_Locator}
   Wait Until Element Is Visible    ${RecordAnalyst_FilterButton_filterMRNumberLabel_Locator}
   Element Should Be Visible       ${RecordAnalyst_FilterButton_filterMRNumberLabel_Locator}
   Wait Until Element Is Visible    ${RecordAnalyst_FilterButton_filterAuditNumberLabel_Locator}
   Element Should Be Visible        ${RecordAnalyst_FilterButton_filterAuditNumberLabel_Locator}
   Wait Until Element Is Visible    ${RecordAnalyst_FilterButton_filterClaimTypeLabel_Locator}
   Element Should Be Visible        ${RecordAnalyst_FilterButton_filterClaimTypeLabel_Locator}
   Wait Until Element Is Visible    ${RecordAnalyst_FilterButton_filterProviderNumber_Locator}
   Element Should Be Visible        ${RecordAnalyst_FilterButton_filterProviderNumber_Locator}
   Wait Until Element Is Visible    ${RecordAnalyst_FilterButton_filterDaysRemainingLabel_Locator}
   Element Should Be Visible        ${RecordAnalyst_FilterButton_filterDaysRemainingLabel_Locator}
   Wait Until Element Is Visible    ${RecordAnalyst_FilterButton_ClearFilterButton_Locator}
   Element Should Be Visible        ${RecordAnalyst_FilterButton_ClearFilterButton_Locator}
   Wait Until Element Is Visible    ${RecordAnalyst_FilterButton_ApplyFilterButton_Locator}
   Element Should Be Visible        ${RecordAnalyst_FilterButton_ApplyFilterButton_Locator}

Verify filter result by after providing Claim Type as outpatient
        Sleep   5
        Scroll down to the bottom of page
        ${element_count}=    get element count     ${Comm_Portal_FilterTab_Review_Button_Locator}
        Click button            (${Comm_Portal_FilterTab_Review_Button_Locator})
     ${e}=       set variable    1
     WHILE      ${element_count}>=${e}
     sleep   5
     IF      ${e}< ${element_count}
     ${a}=   get text        ${RecordAnalyst_DetailsPage_ClaimType_Locator}
        IF  "${a}"== "Outpatient"
        Click Next Request Button
        ${e}=   evaluate          ${e}+1
        ELSE
        Break
        END

    ELSE IF  ${e}== ${element_count}
    ${a}=   get text        ${RecordAnalyst_DetailsPage_ClaimType_Locator}
        IF  "${a}"== "Outpatient"
        log     pass
        ${e}=   evaluate          ${e}+1
        ELSE
        Break
        END
    END
    END

Scroll down to the UploadDocuments Window
    sleep    5
    Scroll Element Into View                ${RecordAnalyst_UploadDocument_Title_Locator}
    Wait Until Element Is Visible           ${RecordAnalyst_UploadDocument_Title_Locator}

Verify Good Cause Language Link
      Click Element                           ${RecordAnalyst_GoodCauseLanguage_Link_Locator}
      Wait Until Element Is Visible           ${RecordAnalyst_GoodCauseLanguage_Header_Locator}
      Wait Until Element Is Visible           ${RecordAnalyst_GoodCauseLanguage_Body_Locator}
      Element Should Be Visible               ${RecordAnalyst_GoodCauseLanguage_Body_Locator}
    # ${RecordAnalyst_GoodCauseLanguage_Body_Locator} =        Get Text             ${RecordAnalyst_GoodCauseLanguage_Body_Locator}
#      should Contain                  ${RecordAnalyst_GoodCauseLanguage_Body_Locator}           This MS-DRG was selected for coding and/or clinical validation because previous improper payments have been
#      should Contain                  ${RecordAnalyst_GoodCauseLanguage_Body_Locator}           found on the same or similar MSDRGs by Office of Inspector General (OIG) reports, Program for Evaluating
#      should Contain                  ${RecordAnalyst_GoodCauseLanguage_Body_Locator}           Payment Patterns Electronic Report (PEPPER) reports, and/or the Comprehensive Error Rate Testing program
#      should Contain                  ${RecordAnalyst_GoodCauseLanguage_Body_Locator}           (CERT) reports, as well as by our own data analysis. The improper payments could be traced to the provider's
#      should Contain                  ${RecordAnalyst_GoodCauseLanguage_Body_Locator}           incorrect assignment and/or sequencing of diagnosis and procedure codes, and discharge status codes. During
#      should Contain                  ${RecordAnalyst_GoodCauseLanguage_Body_Locator}           the course of this complex review, all reimbursement-impacting elements of the claim will be validated.

Verify Record Analyst Page is displayed

        Wait Until Element Is Visible               ${RecordAnalyst_Dashboard_Text}                        timeout=120
        Click Element                                ${RecordAnalyst_Dashboard_Text}


Verify Record Analyst is able to delete the uploaded document
     Wait Until Element Is Visible                     ${RecordAnalyst_Remove_Attachment_Cancle_Locator}     timeout=120
     Click Element                                     ${RecordAnalyst_Remove_Attachment_Cancle_Locator}
     RecordAnalyst_Dashboard.Verify CONFIRM DELETE DOCUMENT popup is displayed
     RecordAnalyst_Dashboard.Verify Document Delete popup is displayed with sucess message


Verify CONFIRM DELETE DOCUMENT popup is displayed
     Element Should Be Visible                       ${RecordAnalyst_Dashboard_CONFIRM_DELETE_DOCUMENT_Popup_Locator}          timeout=120
     Wait Until Element Is Visible                      ${RecordAnalyst_Dashboard_CONFIRM_DELETE_DOCUMENT_Popup_Locator}
     Element Should Be Visible    ${BillingAnalyst_window_Confirm_Delete_Document_Locator}    timeout=120
    # Click Element     ${BillingAnalyst_Button_Yes_Confirm_Delete_Document_window_Locator}

Verify Document Delete popup is displayed with sucess message
#     Element Should Be Visible                                      ${RecordAnalyst_Dashboard_CONFIRM_DELETE_DOCUMENT_Popup_Head_Locator}
#     Wait Until Element Is Visible                                       ${RecordAnalyst_Dashboard_CONFIRM_DELETE_DOCUMENT_Popup_Head_Locator}
#     Element Should Be Visible                                  ${RecordAnalyst_Dashboard_CONFIRM_DELETE_DOCUMENT_Popup_Body_Locator}    timeout=120
#     Wait Until Element Is Visible                                             ${RecordAnalyst_Dashboard_CONFIRM_DELETE_DOCUMENT_Popup_Body_Locator}
#     ${RecordAnalyst_Dashboard_CONFIRM_DELETE_DOCUMENT_Popup_Body_Locator} =        Get Text             ${RecordAnalyst_Dashboard_CONFIRM_DELETE_DOCUMENT_Popup_Body_Locator}
#     should Contain                        ${RecordAnalyst_Dashboard_CONFIRM_DELETE_DOCUMENT_Popup_Body_Locator}          ${PDFNAME} document deleted successfully.
     Wait Until Element Is Visible            ${RecordAnalyst_Dashboard_CONFIRM_DELETE_DOCUMENT_Popup_Ok_Button_Locator}           timeout=120
     Click Element                        ${RecordAnalyst_Dashboard_CONFIRM_DELETE_DOCUMENT_Popup_Ok_Button_Locator}

Click Cancel button on Record Request Page
     Element Should Be Visible           ${RecordAnalyst_Dashboard_Cancel_Button_Locator}
     Wait Until Element Is Visible       ${RecordAnalyst_Dashboard_Cancel_Button_Locator}
     Click Element                      ${RecordAnalyst_Dashboard_Cancel_Button_Locator}


Click GoToDashboard button in cancel Record submission pop up
    Wait Until Element Is Visible                       ${RecordAnalyst_Dashboard_Cancel_Record_Submission_PopUp_GoToDashboard_Button_Locator}
    Click button                                        ${RecordAnalyst_Dashboard_Cancel_Record_Submission_PopUp_GoToDashboard_Button_Locator}

Verify the Record is not submitted and present in dashboard
     Wait Until Element Is Visible                       ${RecordRequest_ReviewButton_Locator_New}
     Element Should Be Visible                           ${RecordRequest_ReviewButton_Locator_New}


Click on Submit Documents button
   sleep     15
   Wait Until Element Is Visible             ${RecordAnalyst_SubmitDocuments_Button_Locator}
   Element Should Be Enabled                  ${RecordAnalyst_SubmitDocuments_Button_Locator}
   Click Element                                        ${RecordAnalyst_SubmitDocuments_Button_Locator}

Verify that user is able to submit the documents after uploading the documents
    Wait Until Element Is Visible                        ${RecordAnalyst_Dashboard_CONFIRM_FILE_SUBMISSION_PopUp_GoToDashboard_Button_Locator}
    Element Should Be Visible                          ${RecordAnalyst_Dashboard_CONFIRM_FILE_SUBMISSION_PopUp_GoToDashboard_Button_Locator}
    Click Element                                       ${RecordAnalyst_Dashboard_CONFIRM_FILE_SUBMISSION_PopUp_GoToDashboard_Button_Locator}
    sleep     15

Verify submitted record is not present on Dashboard
    Wait Until Element Is Visible                       ${RecordAnalyst_Dashboard_SubmitDocument_PopUp_GoToDashboard_Button_Locator}     timeout=60
    Click button                                        ${RecordAnalyst_Dashboard_SubmitDocument_PopUp_GoToDashboard_Button_Locator}
#    Wait Until Element Is Visible                      ${RecordRequest_ReviewButton_Locator}
    Element Should Not Be Visible                          ${RecordRequest_ReviewButton_Locator}

Click on Cancel Button of Request Extension Popup
   Wait Until Element Is Visible                      ${RecordAnalyst_Dashboard_Request_Extension_Cancel_Button_Locator}
   Click Element                                            ${RecordAnalyst_Dashboard_Request_Extension_Cancel_Button_Locator}


Verify Cancel Extension Functionality

   Wait Until Element Is Visible    ${RecordAnalyst_RecordRequest_DaysRemaining_Locator_New}     timeout=120
   ${RecordAnalyst_RecordRequest_DaysRemaining_Actual}=    Get Text    ${RecordAnalyst_RecordRequest_DaysRemaining_Locator_New}
   ${RecordAnalyst_RecordRequest_DaysRemaining_Actual_Firstline} =     Get Line    ${RecordAnalyst_RecordRequest_DaysRemaining_Actual}    0
   log    ${RecordAnalyst_RecordRequest_DaysRemaining_Actual_Firstline}
   Sleep    5
   Set Global Variable    ${RecordAnalyst_RecordRequest_DaysRemaining_Actual_Firstline}
   Wait Until Element Is Visible                 ${RecordAnalyst_RequestExtension_Button_Locator_New}
   Click Element                                  ${RecordAnalyst_RequestExtension_Button_Locator_New}
   Sleep    5
   Click on Cancel Button of Request Extension Popup
   Sleep    3
   Wait Until Element Is Visible    ${RecordAnalyst_RecordRequest_DaysRemaining_Locator_New}     timeout=120
   ${RecordAnalyst_RecordRequest_DaysRemaining_Actual}=    Get Text    ${RecordAnalyst_RecordRequest_DaysRemaining_Locator_New}
   ${RecordAnalyst_RecordRequest_DaysRemaining_Actual_Secondline} =     Get Line    ${RecordAnalyst_RecordRequest_DaysRemaining_Actual}    0
   log    ${RecordAnalyst_RecordRequest_DaysRemaining_Actual_Secondline}
   Set Global Variable    ${RecordAnalyst_RecordRequest_DaysRemaining_Actual_Secondline}
   Should Be Equal As Strings    ${RecordAnalyst_RecordRequest_DaysRemaining_Actual_Firstline}    ${RecordAnalyst_RecordRequest_DaysRemaining_Actual_Secondline}

Verify after submission of record presnet in audit history page
       [Arguments]   ${PtAccNumRecordRequest_PassedByUser}
       Element Should Not Be Visible                          ${RecordRequest_ReviewButton_Locator}
       History.Verify History page is displayed on clicking History Icon
       History.Clicks on filter icon
       History.Verify filter Functionality by providing Valid Patient Account Number for RA and BA               ${PtAccNumRecordRequest_PassedByUser}
       ${RecordAnalyst_Dashboard_Submiited_Record_Locator_New} =    Replace String      ${RecordAnalyst_Dashboard_Submiited_Record_Locator}   ${substringToReplace}    ${PtAccNumRecordRequest_PassedByUser}
       Wait Until Element Is Visible           ${RecordAnalyst_Dashboard_Submiited_Record_Locator_New}             timeout=60
       Element Should Be Visible                 ${RecordAnalyst_Dashboard_Submiited_Record_Locator_New}


Remove the Existing attachment of Record details page
       ${element_count}=    get element count     ${RecordAnalyst_Remove_Attachment_Cancle_Locator}
       IF   ${element_count}>0
           Click Element    ${RecordAnalyst_Remove_Attachment_Cancle_Locator}
           Element Should Be Visible    ${BillingAnalyst_window_Confirm_Delete_Document_Locator}   timeout=120
           Click Element     ${BillingAnalyst_Button_Yes_Confirm_Delete_Document_window_Locator}
           wait Until Element Is Visible    ${BillingAnalyst_button_close_Document_delete_windw_locator}     timeout=120
           Click Element    ${BillingAnalyst_button_close_Document_delete_windw_locator}
           sleep         10

       END


Click Export Audit
    Wait Until Element Is Visible        ${RecordAnalyst_ExportAudit_Button_Locator}        timeout=120
    click element            ${RecordAnalyst_ExportAudit_Button_Locator}

Verify the columns in the downloaded export
     ${expectedColumns_list}=         create list              Days Left 	Patient Name	    Patient AccountNumber 	Prepay      Provider Name 	  		Birth Date 		Dates OfService 	ProviderNumber 	AuditNumber 	Claim Number 	Medical RecordNumber 	Due Date
      ${lists_equal}          Lists should be equal       ${downloaded_data_list[0].keys()}          ${expectedColumns_list}


Verify the total records in the downloaded export
     ${actualNoOfRecords} =     get length  ${downloaded_data_list}
     log                ${actualNoOfRecords}
     ${expectedCount} =    Convert To Integer  ${RecordRequest_Tile_count_New}
     Should Be Equal     ${actualNoOfRecords}    ${expectedCount}


Verify all the column headers are displayed
      Wait Until Element Is Visible        ${RecordAnalyst_ListView_Actions_ColumnHeader_Element_Locator}        timeout=120
      Element Should Be Visible            ${RecordAnalyst_ListView_Actions_ColumnHeader_Element_Locator}
	  Element Should Be Visible            ${RecordAnalyst_ListView_DaysLeft_ColumnHeader_Element_Locator}
	  Element Should Be Visible            ${RecordAnalyst_ListView_PatientName_ColumnHeader_Element_Locator}
      Element Should Be Visible            ${RecordAnalyst_ListView_PatientAccountNumber_ColumnHeader_Element_Locator}
	  Element Should Be Visible            ${RecordAnalyst_ListView_Prepay_ColumnHeader_Element_Locator}
	  Element Should Be Visible            ${RecordAnalyst_ListView_ProviderName_ColumnHeader_Element_Locator}
	  Element Should Be Visible            ${RecordAnalyst_ListView_BirthDate_ColumnHeader_Element_Locator}
	  Element Should Be Visible            ${RecordAnalyst_ListView_DateOfService_ColumnHeader_Element_Locator}
	  Element Should Be Visible            ${RecordAnalyst_ListView_ProviderNumber_ColumnHeader_Element_Locator}
      Element Should Be Visible            ${RecordAnalyst_ListView_AuditNumber_ColumnHeader_Element_Locator}
	  Element Should Be Visible            ${RecordAnalyst_ListView_ClaimNumber_ColumnHeader_Element_Locator}
	  Element Should Be Visible            ${RecordAnalyst_ListView_MedicalRecord_ColumnHeader_Element_Locator}
	  Element Should Be Visible            ${RecordAnalyst_ListView_DueDate_ColumnHeader_Element_Locator}


Fetch the First Audit Record From the List
    [arguments]     ${raDashboardListAuditQuery}
    Wait Until Element Is Visible      ${RecordAnalyst_ListView_FirstRecord_AuditNumber_Element_Locator}     timeout=60
    ${auditNumber}=     Get text    ${RecordAnalyst_ListView_FirstRecord_AuditNumber_Element_Locator}
    ${sqlQueryToExec}=       BuiltIn.Catenate      ${raDashboardListAuditQuery}     ${auditNumber}
    Log to console     ${sqlQueryToExec}
    Connect to Cloud DB for a specific Database     ${sqlQueryToExec}     ${DBName}

Return AuditFindings List View Review Button locator with patient account number passed by user
     [Arguments]   ${PtAccNum_PassedByUser}
     ${RecordAnalyst_ListView_Audit_Review_Button_Locator_New}=     Replace String      ${RecordAnalyst_ListView_Audit_Review_Button_Locator}   ${substringToReplace}     ${PtAccNum_PassedByUser}
     Set Global Variable    ${RecordAnalyst_ListView_Audit_Review_Button_Locator_New}


Click List View Review button
    Wait Until Element Is Visible    ${RecordAnalyst_ListView_Audit_Review_Button_Locator_New}    timeout=120
    wait until element is enabled     ${RecordAnalyst_ListView_Audit_Review_Button_Locator_New}   timeout=120
    Click Element    ${RecordAnalyst_ListView_Audit_Review_Button_Locator_New}

Verify Patient details in List View
    Sleep    5
#     ${get_DaysLeft}=  Get Text      ${data_list[0]['DaysLeft']}
#    ${formatted_DaysLeft1} =    Replace string   ${get_DaysLeft}    schedule_outline     ${empty}
#    ${formatted_DaysLeft2} =    Replace string   ${formatted_DaysLeft1}     Days     ${empty}
#    ${formatted_DaysLeft3} =    Replace string   ${formatted_DaysLeft2}     \n    ${empty}
#    ${formatted_DaysLeft4} =    Strip string    ${formatted_DaysLeft3}
#    ${RecordAnalyst_ListView_DaysLeft_Element_Locator_New} =  Replace String   ${RecordAnalyst_ListView_DaysLeft_Element_Locator}  ${substringToReplace}  ${formatted_DaysLeft4}
#    Wait Until Element Is Visible    ${RecordAnalyst_ListView_DaysLeft_Element_Locator_New}            timeout=120
#    Element Should Be Visible      ${RecordAnalyst_ListView_DaysLeft_Element_Locator_New}
#     Sleep    5
   ${RecordAnalyst_ListView_PatientAccountNumber_Element_Locator_New} =  Replace String   ${RecordAnalyst_ListView_PatientAccountNumber_Element_Locator}  ${substringToReplace}  ${data_list[0]['PatientAccountNumber']}
   Wait Until Element Is Visible    ${RecordAnalyst_ListView_PatientAccountNumber_Element_Locator_New}            timeout=60
    Element Should Be Visible      ${RecordAnalyst_ListView_PatientAccountNumber_Element_Locator_New}
     IF  '${data_list[0]['Prepay']}=False'
       ${PrepayValue}=     Set Variable    No
       Set Global Variable     ${PrepayValue}
     ELSE IF   '${data_list[0]['Prepay']}=True'
       ${PrepayValue}=     Set Variable    Yes
       Set Global Variable     ${PrepayValue}
     END
   ${RecordAnalyst_ListView_Prepay_Element_Locator_New} =  Replace String   ${RecordAnalyst_ListView_Prepay_Element_Locator}  ${substringToReplace}  ${PrepayValue}
   Wait Until Element Is Visible    ${RecordAnalyst_ListView_Prepay_Element_Locator_New}           timeout=60
    Element Should Be Visible      ${RecordAnalyst_ListView_Prepay_Element_Locator_New}
   ${RecordAnalyst_ListView_ProviderName_Element_Locator_New} =  Replace String   ${RecordAnalyst_ListView_ProviderName_Element_Locator}  ${substringToReplace}  ${data_list[0]['ProviderName']}
   Wait Until Element Is Visible    ${RecordAnalyst_ListView_ProviderName_Element_Locator_New}           timeout=60
    Element Should Be Visible      ${RecordAnalyst_ListView_ProviderName_Element_Locator_New}
    ${formattedDOB}             TestDataFormatter.formatDate           ${data_list[0]['DateOfBirth']}
    ${RecordAnalyst_ListView_BirthDate_Element_Locator_New} =  Replace String   ${RecordAnalyst_ListView_BirthDate_Element_Locator}  ${substringToReplace}   ${formattedDOB}
    Wait Until Element Is Visible    ${RecordAnalyst_ListView_BirthDate_Element_Locator_New}           timeout=60
    Element Should Be Visible      ${RecordAnalyst_ListView_BirthDate_Element_Locator_New}
    ${dateOfService}             TestDataFormatter.formatDate          ${data_list[0]['AdmitDate']}
    ${RecordAnalyst_ListView_DatesOfService_Element_Locator_New} =  Replace String   ${RecordAnalyst_ListView_DatesOfService_Element_Locator}  ${substringToReplace}  ${dateOfService}
    Wait Until Element Is Visible    ${RecordAnalyst_ListView_DatesOfService_Element_Locator_New}           timeout=60
    Element Should Be Visible      ${RecordAnalyst_ListView_DatesOfService_Element_Locator_New}
    ${RecordAnalyst_ListView_ProviderNumber_Element_Locator_New} =  Replace String   ${RecordAnalyst_ListView_ProviderNumber_Element_Locator}  ${substringToReplace}  ${data_list[0]['BillingProviderNumber']}
    Wait Until Element Is Visible    ${RecordAnalyst_ListView_ProviderNumber_Element_Locator_New}           timeout=60
    Element Should Be Visible      ${RecordAnalyst_ListView_ProviderNumber_Element_Locator_New}
    ${RecordAnalyst_ListView_AuditNumber_Element_Locator_New} =  Replace String   ${RecordAnalyst_ListView_AuditNumber_Element_Locator}  ${substringToReplace}  ${data_list[0]['AuditNumber']}
    Wait Until Element Is Visible    ${RecordAnalyst_ListView_AuditNumber_Element_Locator_New}           timeout=60
    Element Should Be Visible      ${RecordAnalyst_ListView_AuditNumber_Element_Locator_New}
    ${RecordAnalyst_ListView_ClaimNumber_Element_Locator_New} =  Replace String   ${RecordAnalyst_ListView_ClaimNumber_Element_Locator}  ${substringToReplace}  ${data_list[0]['ClaimNumber']}
    Wait Until Element Is Visible    ${RecordAnalyst_ListView_ClaimNumber_Element_Locator_New}           timeout=60
    Element Should Be Visible      ${RecordAnalyst_ListView_ClaimNumber_Element_Locator_New}
     ${RecordAnalyst_ListView_MedicalRecordNumber_Element_Locator_New} =  Replace String   ${RecordAnalyst_ListView_MedicalRecordNumber_Element_Locator}  ${substringToReplace}  ${data_list[0]['MRNumber']}
    Wait Until Element Is Visible    ${RecordAnalyst_ListView_MedicalRecordNumber_Element_Locator_New}           timeout=60
    Element Should Be Visible      ${RecordAnalyst_ListView_MedicalRecordNumber_Element_Locator_New}
    Log to console         ${data_list[0]['DueDate']}
    ${formattedDate}             TestDataFormatter.formatDate          ${data_list[0]['DueDate']}
    ${RecordAnalyst_ListView_DueDate_Element_Locator_New} =  Replace String   ${RecordAnalyst_ListView_DueDate_Element_Locator}  ${substringToReplace}   ${formattedDate}
    Wait Until Element Is Visible    ${RecordAnalyst_ListView_DueDate_Element_Locator_New}           timeout=60
    Element Should Be Visible      ${RecordAnalyst_ListView_DueDate_Element_Locator_New}


Validate the Count of Record After Applyiing filter
    Fetch Total count of Record Request Tile on RA dashboard in List View
    Should be equal     ${RecordAnalyst_Tile_count_New}         1

Verify data after applying filter Functionality for Patient Account Number In List View
   ${RecordAnalyst_ListView_PatientAccountNumber_Element_Locator_New} =  Replace String   ${RecordAnalyst_ListView_PatientAccountNumber_Element_Locator}  ${substringToReplace}  ${data_list[0]['PatientAccountNumber']}
   Wait Until Element Is Visible    ${RecordAnalyst_ListView_PatientAccountNumber_Element_Locator_New}            timeout=60
   Element Should Be Visible      ${RecordAnalyst_ListView_PatientAccountNumber_Element_Locator_New}
   ${elements}    Get WebElements    ${RecordAnalyst_ListView_PatientAccountNumber_Element_Locator_New}
      FOR    ${element}    IN    @{elements}
        ${patientAccountNumber}    Get Text    ${element}
         Log    Text from element: ${patientAccountNumber}
         Should be equal      ${patientAccountNumber}    ${data_list[0]['PatientAccountNumber']}
      END



Verify filter result In List View after providing Claim Type as Inpatient
     ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${RecordAnalyst_Filtered_result_Text_locator}
     IF   ${present} == True

         sleep         10

        ${element_count}=    get element count     ${RecordAnalyst_ListView_FilterTab_Review_Button_Locator}
        Click button        ${RecordAnalyst_ListView_FilterTab_Review_Button_Locator}

        ${e}=       set variable    1
        WHILE      ${element_count}>=${e}
        sleep   5
        IF      ${e}< ${element_count}
            ${a}=   get text        ${RecordAnalyst_RecordInfo_Filter_ClaimType_Detail_Locator}
            IF  "${a}"== "Inpatient"
            Click Next Request Button
            ${e}=   evaluate          ${e}+1
            ELSE
            Break
            END

        ELSE IF  ${e}== ${element_count}
            ${a}=   get text        ${RecordAnalyst_RecordInfo_Filter_ClaimType_Detail_Locator}
            IF  "${a}"== "Inpatient"
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



Verify data after applying filter Functionality for Audit Number In List View
   ${RecordAnalyst_ListView_AuditNumber_Element_Locator_New} =  Replace String   ${RecordAnalyst_ListView_AuditNumber_Element_Locator}  ${substringToReplace}  ${data_list[0]['AuditNumber']}
   Wait Until Element Is Visible    ${RecordAnalyst_ListView_AuditNumber_Element_Locator_New}            timeout=60
   Element Should Be Visible      ${RecordAnalyst_ListView_AuditNumber_Element_Locator_New}

Verify filter Functionality by providing Valid Patient Account Number In List View
     [Arguments]   ${PtAccNum_PassedByUser}
       Element Should Be Visible        ${Comm_Portal_FilterButton_PatientAccountNumber_TextField_Locator}
       Wait Until Element Is Visible    ${Comm_Portal_FilterButton_PatientAccountNumber_TextField_Locator}
       Click Element                   ${Comm_Portal_FilterButton_PatientAccountNumber_TextField_Locator}
       Input Text                       ${Comm_Portal_FilterButton_PatientAccountNumber_TextField_Locator}     ${PtAccNum_PassedByUser}
       BillingAnalyst_Dashboard.Click Apply Filter Button
       Sleep    5


Fetch Total count of Record Request Tile on RA dashboard in List View
    Wait Until Element Is Visible    ${RecordAnalyst_RecordsCount_Element_Locator}                                  timeout=120
  ${RecordAnalyst_Tile_count} =   Get Text   ${RecordAnalyst_RecordsCount_Element_Locator}
  ${Formatted1_RecordAnalyst_Tile_count} =   Replace string         ${RecordAnalyst_Tile_count}      RECORD REQUESTS (       ${empty}
   ${Formatted2_RecordAnalyst_Tile_count} =   Replace string         ${Formatted1_RecordAnalyst_Tile_count}      )       ${empty}
   ${RecordAnalyst_Tile_count_New}=    Convert to string    ${Formatted2_RecordAnalyst_Tile_count}
    Set Global Variable     ${RecordAnalyst_Tile_count_New}

Fetch Total count of Record Request Tile on RA dashboard
    Wait Until Element Is Visible    ${RecordRequest_Tile_Locator}                                  timeout=120
    ${RecordRequest_Tile_count} =   SeleniumLibrary.Get Element Count   ${RecordRequest_Tile_Locator}
    ${RecordRequest_Tile_count_New}=    Convert To String     ${RecordRequest_Tile_count}
    Set Global Variable     ${RecordRequest_Tile_count_New}

Verify filter Functionality by providing Valid Provider Number In List View
     [Arguments]   ${ProviderNum_PassedByUser}
       Element Should Be Visible        ${Comm_Portal_FilterButton_ProviderNumber_TextField_Locator}
       Wait Until Element Is Visible    ${Comm_Portal_FilterButton_ProviderNumber_TextField_Locator}
       Input Text                       ${Comm_Portal_FilterButton_ProviderNumber_TextField_Locator}     ${ProviderNumPassedByUser}
       BillingAnalyst_Dashboard.Click Apply Filter Button


Verify data after applying filter Functionality for Provider Number In List View
       ${RecordAnalyst_ListView_ProviderNumber_Element_Locator_New} =  Replace String   ${RecordAnalyst_ListView_ProviderNumber_Element_Locator}  ${substringToReplace}  ${data_list[0]['BillingProviderNumber']}
      Wait Until Element Is Visible    ${RecordAnalyst_ListView_ProviderNumber_Element_Locator_New}            timeout=60
      Element Should Be Visible      ${RecordAnalyst_ListView_ProviderNumber_Element_Locator_New}
       ${elements}    Get WebElements    ${RecordAnalyst_ListView_ProviderNumber_Element_Locator_New}
      FOR    ${element}    IN    @{elements}
        ${providerNumber}    Get Text    ${element}
         Log    Text from element: ${providerNumber}
         Should be equal      ${providerNumber}    ${data_list[0]['BillingProviderNumber']}
      END

Verify data after applying filter Functionality for Medical Record Number In List View
       ${RecordAnalyst_ListView_MedicalRecord_Element_Locator_New} =  Replace String   ${RecordAnalyst_ListView_MedicalRecordNumber_Element_Locator}  ${substringToReplace}  ${data_list[0]['MRNumber']}
      Wait until element is visible     ${RecordAnalyst_ListView_MedicalRecord_Element_Locator_New}    timeout=60
      Element Should Be Visible      ${RecordAnalyst_ListView_MedicalRecord_Element_Locator_New}
       ${elements}    Get WebElements    ${RecordAnalyst_ListView_MedicalRecord_Element_Locator_New}
      FOR    ${element}    IN    @{elements}
        ${medicalRecNumber}    Get Text    ${element}
         Log    Text from element: ${medicalRecNumber}
         Should be equal      ${medicalRecNumber}    ${data_list[0]['MRNumber']}
      END


Verify data after applying filter Functionality In List View by providing DAYS REMAINING UNTIL DUE DATE - OVERDUE
     ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${RecordAnalyst_Filtered_result_Text_locator}
     IF   ${present} == True
            ${element_count}=    get element count     ${RecordAnalyst_ListView_Overdue_Data_FilterResult_Locator}
            IF  ${element_count}>0
            @{OverdueStatus_list}=   Create List
            FOR    ${i}     IN RANGE    1   ${element_count}+1
            ${get_OverdueStatus}=  Get Text      ${RecordAnalyst_ListView_Overdue_Data_FilterResult_Locator} [${i}]
            Append To List      ${OverdueStatus_list}    ${get_OverdueStatus}
            END
            log      ${OverdueStatus_list}
            ${Duplicates}=   remove duplicates      ${OverdueStatus_list}
            ${OverdueStatus}=     catenate        @{Duplicates}
            ${OverdueStatus}=    convert to lower case       ${OverdueStatus}
            ${OverdueStatus}=     convert to title case         ${OverdueStatus}
            log         ${OverdueStatus}
            should contain any       ${OverdueStatus_}       ${DAYS REMAINING OVERDUE}
            END
     ELSE
            Page should contain         There are no Outstanding Audit Results at this time.
     END

Return request extension Button locator In List View with patient account number passed by user
     [Arguments]   ${RequestExtensionPtAcc_PassedByUser}
     ${RecordAnalyst_RequestExtension_Button_Locator_New}=     Replace String      ${RecordAnalyst_ListView_RequestExtension_Button_Locator}   ${substringToReplace}   ${RequestExtensionPtAcc_PassedByUser}
     Set Global Variable    ${RecordAnalyst_RequestExtension_Button_Locator_New}

Return request extension Days Remaining locator In List View with patient account number passed by user
     [Arguments]   ${RequestExtensionPtAcc_PassedByUser}
     ${RecordAnalyst_RecordRequest_DaysRemaining_Locator_New}=     Replace String      ${RecordAnalyst_ListView_DaysRemaining_Audit_Locator}   ${substringToReplace}    ${RequestExtensionPtAcc_PassedByUser}
     Set Global Variable    ${RecordAnalyst_RecordRequest_DaysRemaining_Locator_New}

Return request extension Granted locator In List View with patient account number passed by user
     [Arguments]  ${RequestExtensionPtAcc_PassedByUser}
     ${RecordAnalyst_RequestExtension_ExtensionGranted_Locator_New}=     Replace String      ${RecordAnalyst_ListView_ExtensionGranted_Locator}   ${substringToReplace}    ${RequestExtensionPtAcc_PassedByUser}
     Set Global Variable    ${RecordAnalyst_RequestExtension_ExtensionGranted_Locator_New}


Double Click Patient Name header in RA dashboard List View Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${RecordAnalyst_ListView_PatientName_ColumnHeader_Element_Locator}
    Double click Element   ${RecordAnalyst_ListView_PatientName_ColumnHeader_Element_Locator}
    sleep   5
    ${element_count}=    get element count     ${RecordAnalyst_ListView_PatientsName_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${RecordAnalyst_ListView_PatientsName_Table_Locator} [${i}]
    Append To List      ${username_list}    ${get_username}
    END
    log      ${username_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${RecordAnalyst_List_view_Next_Link_Locator}
    WHILE    ${present} == True
          Click element      ${BiilingAnalyst_List_view_Next_Link_Locator}
          ${element_count}=    get element count     ${RecordAnalyst_ListView_PatientsName_Table_Locator}
          @{username_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_username}=  Get Text      ${RecordAnalyst_ListView_PatientsName_Table_Locator} [${i}]
             Append To List      ${username_list}    ${get_username}
          END
    END
    log      ${username_list}
    ${Sort_order}=  Copy list  ${username_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${username_list}     ${Sort_order}



Double Click Patient Account Number header in RA dashboard List View Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${RecordAnalyst_ListView_PatientAccountNumber_ColumnHeader_Element_Locator}
    Double Click Element   ${RecordAnalyst_ListView_PatientAccountNumber_ColumnHeader_Element_Locator}
    sleep   5
    ${element_count}=    get element count     ${RecordAnalyst_ListView_PatientAccountNumber_Table_Locator}
    @{accountNumber_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_accountNumber}=  Get Text      ${RecordAnalyst_ListView_PatientAccountNumber_Table_Locator} [${i}]
    Append To List      ${accountNumber_list}    ${get_accountNumber}
    END
    log      ${accountNumber_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${RecordAnalyst_List_view_Next_Link_Locator}
    WHILE    ${present} == True
          Click element      ${RecordAnalyst_List_view_Next_Link_Locator}
          ${element_count}=    get element count     ${RecordAnalyst_ListView_PatientAccountNumber_Table_Locator}
          @{accountNumber_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_accountNumber}=  Get Text      ${RecordAnalyst_ListView_PatientAccountNumber_Table_Locator} [${i}]
             Append To List      ${accountNumber_list}    ${get_accountNumber}
          END
    END
    log      ${accountNumber_list}
    ${Sort_order}=  Copy list  ${accountNumber_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${accountNumber_list}     ${Sort_order}


Double Click prepay header in RA dashboard List View Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${RecordAnalyst_ListView_Prepay_ColumnHeader_Element_Locator}
    Double Click Element   ${RecordAnalyst_ListView_Prepay_ColumnHeader_Element_Locator}
    sleep   5
    ${element_count}=    get element count     ${RecordAnalyst_ListView_Prepay_Table_Locator}
    ${Prepay_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_Prepay}=  Get Text      ${RecordAnalyst_ListView_Prepay_Table_Locator} [${i}]
    Append To List      ${Prepay_list}    ${get_Prepay}
    END
    log      ${Prepay_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${RecordAnalyst_List_view_Next_Link_Locator}
    WHILE    ${present} == True
          Click element      ${RecordAnalyst_List_view_Next_Link_Locator}
          ${element_count}=    get element count     ${RecordAnalyst_ListView_Prepay_Table_Locator}
          @{accountNumber_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_accountNumber}=  Get Text      ${RecordAnalyst_ListView_Prepay_Table_Locator} [${i}]
             Append To List      ${Prepay_list}    ${get_Prepay}
          END
    END
    log      ${Prepay_list}
    ${Sort_order}=  Copy list  ${Prepay_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${Prepay_list}     ${Sort_order}

Double Click Provider Name header in RA dashboard List View Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${RecordAnalyst_ListView_ProviderName_ColumnHeader_Element_Locator}
    Double Click Element   ${RecordAnalyst_ListView_ProviderName_ColumnHeader_Element_Locator}
    sleep   5
    ${element_count}=    get element count     ${RecordAnalyst_ListView_ProviderName_Table_Locator}
    @{ProviderName_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_ProviderName}=  Get Text      ${RecordAnalyst_ListView_ProviderName_Table_Locator} [${i}]
    Append To List      ${ProviderName_list}    ${get_ProviderName}
    END
    log      ${ProviderName_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${RecordAnalyst_List_view_Next_Link_Locator}
    WHILE    ${present} == True
          Click element      ${RecordAnalyst_List_view_Next_Link_Locator}
          ${element_count}=    get element count     ${RecordAnalyst_ListView_ProviderName_Table_Locator}
          @{ProviderName_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_ProviderName}=  Get Text      ${RecordAnalyst_ListView_ProviderName_Table_Locator} [${i}]
             Append To List      ${ProviderName_list}    ${get_ProviderName}
          END
    END
    log      ${ProviderName_list}
    ${Sort_order}=  Copy list  ${ProviderName_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${ProviderName_list}     ${Sort_order}


Double click Days Left header in RA dashboard List View Tab and verify sorting is done in Ascending order
       wait until Element is visible   ${RecordAnalyst_ListView_DaysLeft_ColumnHeader_Element_Locator}
    Double Click Element   ${RecordAnalyst_ListView_DaysLeft_ColumnHeader_Element_Locator}
    sleep   5
    ${element_count}=    get element count     ${RecordAnalyst_ListView_DaysLeft_Table_Locator}
    @{DaysLeft_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_DaysLeft}=  Get Text      ${RecordAnalyst_ListView_DaysLeft_Table_Locator} [${i}]
    ${formatted_DaysLeft1} =    Replace string   ${get_DaysLeft}    schedule_outline     ${empty}
    ${formatted_DaysLeft2} =    Replace string   ${formatted_DaysLeft1}     Days     ${empty}
    ${formatted_DaysLeft3} =    Replace string   ${formatted_DaysLeft2}     \n    ${empty}
    ${formatted_DaysLeft4} =    Strip string    ${formatted_DaysLeft3}

    Append To List      ${DaysLeft_list}    ${formatted_DaysLeft4}
    END
    log      ${DaysLeft_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${RecordAnalyst_List_view_Next_Link_Locator}
    WHILE    ${present} == True
          Click element      ${RecordAnalyst_List_view_Next_Link_Locator}
          ${element_count}=    get element count     ${RecordAnalyst_ListView_DaysLeft_Table_Locator}
          @{DaysLeft_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_DaysLeft}=  Get Text      ${RecordAnalyst_ListView_DaysLeft_Table_Locator} [${i}]
             ${formatted_DaysLeft1} =    Replace string   ${get_DaysLeft}    schedule_outline     ${empty}
              ${formatted_DaysLeft2} =    Replace string   ${formatted_DaysLeft1}     Days     ${empty}
              ${formatted_DaysLeft3} =    Replace string   ${formatted_DaysLeft2}     \n    ${empty}
              ${formatted_DaysLeft4} =    Strip string    ${formatted_DaysLeft3}
             Append To List      ${DaysLeft_list}    ${formatted_DaysLeft4}
          END
    END
    log      ${DaysLeft_list}
    ${Sort_order}=  Copy list  ${DaysLeft_list}
    ${sorted_list}    Sort List By Type    ${Sort_order}
    Log    ${sorted_list}
    lists should be equal       ${DaysLeft_list}     ${Sorted_list}

Double click Birth Date header in RA dashboard List View Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${RecordAnalyst_ListView_BirthDate_ColumnHeader_Element_Locator}
    Double Click Element   ${RecordAnalyst_ListView_BirthDate_ColumnHeader_Element_Locator}
    sleep   5
    ${element_count}=    get element count     ${RecordAnalyst_ListView_BirthDate_Table_Locator}
    @{BirthDate_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_BirthDate}=  Get Text      ${RecordAnalyst_ListView_BirthDate_Table_Locator} [${i}]
    Append To List      ${BirthDate_list}    ${get_birthDate}
    END
    log      ${BirthDate_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${RecordAnalyst_List_view_Next_Link_Locator}
    WHILE    ${present} == True
          Click element      ${RecordAnalyst_List_view_Next_Link_Locator}
          ${element_count}=    get element count     ${RecordAnalyst_ListView_BirthDate_Table_Locator}
          @{BirthDate_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_BirthDate}=  Get Text      ${RecordAnalyst_ListView_BirthDate_Table_Locator} [${i}]

             Append To List      ${BirthDate_list}    ${get_birthDate}
          END
    END
    log      ${BirthDate_list}
    ${Sort_order}=  Copy list  ${BirthDate_list}
    ${sorted_birthdates}       Sort Dates MM/DD/YYYY      ${Sort_order}
    log      ${sorted_birthdates}
    lists should be equal       ${BirthDate_list}     ${sorted_birthdates}


Double click Date Of Service header in RA dashboard List View Tab and verify sorting is done in Ascending order
     wait until Element is visible   ${RecordAnalyst_ListView_DateOfService_ColumnHeader_Element_Locator}
    Double Click Element   ${RecordAnalyst_ListView_DateOfService_ColumnHeader_Element_Locator}
    sleep   5
    ${element_count}=    get element count     ${RecordAnalyst_ListView_DateOfService_Table_Locator}
    @{DateOfService_list}=   Create List
    @{Converted_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_DateOfService}=  Get Text      ${RecordAnalyst_ListView_DateOfService_Table_Locator} [${i}]

	${split_string}=    split string         ${get_DateOfService}      -
    ${formatted_input}=   replace string       ${split_string}[0]     ${SPACE}         ${EMPTY}
    ${from_date}=    Convert Date     ${formatted_input}           date_format=%m/%d/%Y
    log     ${from_date}

    ${formatted_input}=   replace string       ${split_string}[1]     ${SPACE}         ${EMPTY}
    ${formatted_input1}=   replace string         ${formatted_input}   \n         ${EMPTY}
    ${to_date}=    Convert Date      ${formatted_input1}           date_format=%m/%d/%Y
    log     ${to_date}

    Append To List      ${DateOfService_list}    ${get_DateOfService}
	${date_list}=      set variable    ${from_date} - ${to_date}
	Append To List      ${Converted_list}    ${date_list}
    END
    log      ${DateOfService_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${RecordAnalyst_List_view_Next_Link_Locator}
    WHILE    ${present} == True
          Click element      ${RecordAnalyst_List_view_Next_Link_Locator}
          ${element_count}=    get element count     ${RecordAnalyst_ListView_DateOfService_Table_Locator}
          @{DateOfService_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_DateOfService}=  Get Text      ${RecordAnalyst_ListView_DateOfService_Table_Locator} [${i}]
			 ${split_string}=    split string         ${get_DateOfService}      -
			${formatted_input}=   replace string       ${split_string}[0]     ${SPACE}         ${EMPTY}
			${from_date}=    Convert Date     ${formatted_input}           date_format=%m/%d/%Y
			log     ${from_date}

			${formatted_input}=   replace string       ${split_string}[1]     ${SPACE}         ${EMPTY}
			${formatted_input1}=   replace string         ${formatted_input}   \n         ${EMPTY}
			${to_date}=    Convert Date      ${formatted_input1}           date_format=%m/%d/%Y
			log     ${to_date}

			Append To List      ${DateOfService_list}    ${get_DateOfService}
			${date_list}=      set variable    ${from_date} - ${to_date}
			Append To List      ${Converted_list}    ${date_list}
          END
    END
    log      ${DateOfService_list}
    ${Sort_order}=  Copy list  ${Converted_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${Converted_list}     ${Sort_order}

Double click Provider Number header in RA dashboard List View Tab and verify sorting is done in Ascending order
    	wait until Element is visible   ${RecordAnalyst_ListView_ProviderNumber_ColumnHeader_Element_Locator}
    Double Click Element   ${RecordAnalyst_ListView_ProviderNumber_ColumnHeader_Element_Locator}
    sleep   5
    ${element_count}=    get element count     ${RecordAnalyst_ListView_ProviderNumber_Table_Locator}
    @{ProviderNumber_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_ProviderNumber}=  Get Text      ${RecordAnalyst_ListView_ProviderNumber_Table_Locator} [${i}]
    Append To List      ${ProviderNumber_list}    ${get_ProviderNumber}
    END
    log      ${ProviderNumber_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${RecordAnalyst_List_view_Next_Link_Locator}
    WHILE    ${present} == True
          Click element      ${RecordAnalyst_List_view_Next_Link_Locator}
          ${element_count}=    get element count     ${RecordAnalyst_ListView_ProviderNumber_Table_Locator}
          @{ProviderNumber_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_ProviderNumber}=  Get Text      ${RecordAnalyst_ListView_ProviderNumber_Table_Locator} [${i}]
             Append To List      ${ProviderNumber_list}    ${get_ProviderNumber}
          END
    END
    log      ${ProviderNumber_list}
    ${Sort_order}=  Copy list  ${ProviderNumber_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${ProviderNumber_list}     ${Sort_order}

Double click Audit Number header in RA dashboard List View Tab and verify sorting is done in Ascending order
    	wait until Element is visible   ${RecordAnalyst_ListView_AuditNumber_ColumnHeader_Element_Locator}
    Double Click Element   ${RecordAnalyst_ListView_AuditNumber_ColumnHeader_Element_Locator}
    sleep   5
    ${element_count}=    get element count     ${RecordAnalyst_ListView_AuditNumber_Table_Locator}
    @{AuditNumber_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_AuditNumber}=  Get Text      ${RecordAnalyst_ListView_AuditNumber_Table_Locator} [${i}]
    Append To List      ${AuditNumber_list}    ${get_AuditNumber}
    END
    log      ${AuditNumber_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${RecordAnalyst_List_view_Next_Link_Locator}
    WHILE    ${present} == True
          Click element      ${RecordAnalyst_List_view_Next_Link_Locator}
          ${element_count}=    get element count     ${RecordAnalyst_ListView_AuditNumber_Table_Locator}
          @{AuditNumber_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_AuditNumber}=  Get Text      ${RecordAnalyst_ListView_AuditNumber_Table_Locator} [${i}]
             Append To List      ${AuditNumber_list}    ${get_AuditNumber}
          END
    END
    log      ${AuditNumber_list}
    ${Sort_order}=  Copy list  ${AuditNumber_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${AuditNumber_list}     ${Sort_order}

Double click Claim Number header in RA dashboard List View Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${RecordAnalyst_ListView_ClaimNumber_ColumnHeader_Element_Locator}
    Double Click Element   ${RecordAnalyst_ListView_ClaimNumber_ColumnHeader_Element_Locator}
    sleep   5
    ${element_count}=    get element count     ${RecordAnalyst_ListView_ClaimNumber_Table_Locator}
    @{ClaimNumber_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_ClaimNumber}=  Get Text      ${RecordAnalyst_ListView_ClaimNumber_Table_Locator} [${i}]
    Append To List      ${ClaimNumber_list}    ${get_ClaimNumber}
    END
    log      ${ClaimNumber_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${RecordAnalyst_List_view_Next_Link_Locator}
    WHILE    ${present} == True
          Click element      ${RecordAnalyst_List_view_Next_Link_Locator}
          ${element_count}=    get element count     ${RecordAnalyst_ListView_ClaimNumber_Table_Locator}
          @{ClaimNumber_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_ClaimNumber}=  Get Text      ${RecordAnalyst_ListView_ClaimNumber_Table_Locator} [${i}]
             Append To List      ${ClaimNumber_list}    ${get_ClaimNumber}
          END
    END
    log      ${ClaimNumber_list}
    ${Sort_order}=  Copy list  ${ClaimNumber_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${ClaimNumber_list}     ${Sort_order}


Double click Medical Record Number header in RA dashboard List View Tab and verify sorting is done in Ascending order
    	wait until Element is visible   ${RecordAnalyst_ListView_MedicalRecord_ColumnHeader_Element_Locator}
    Double Click Element   ${RecordAnalyst_ListView_MedicalRecord_ColumnHeader_Element_Locator}
    sleep   5
    ${element_count}=    get element count     ${RecordAnalyst_ListView_MedicalRecord_Table_Locator}
    @{MedicalRecord_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_MedicalRecord}=  Get Text      ${RecordAnalyst_ListView_MedicalRecord_Table_Locator} [${i}]
    Append To List      ${MedicalRecord_list}    ${get_MedicalRecord}
    END
    log      ${MedicalRecord_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${RecordAnalyst_List_view_Next_Link_Locator}
    WHILE    ${present} == True
          Click element      ${RecordAnalyst_List_view_Next_Link_Locator}
          ${element_count}=    get element count     ${RecordAnalyst_ListView_MedicalRecord_Table_Locator}
          @{MedicalRecord_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_MedicalRecord}=  Get Text      ${RecordAnalyst_ListView_MedicalRecord_Table_Locator} [${i}]
             Append To List      ${MedicalRecord_list}    ${get_MedicalRecord}
          END
    END
    log      ${MedicalRecord_list}
    ${Sort_order}=  Copy list  ${MedicalRecord_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${MedicalRecord_list}     ${Sort_order}

Double click Due Date header in RA dashboard List View Tab and verify sorting is done in Ascending order
     	wait until Element is visible   ${RecordAnalyst_ListView_DueDate_ColumnHeader_Element_Locator}
    Double Click Element   ${RecordAnalyst_ListView_DueDate_ColumnHeader_Element_Locator}
    sleep   5
    ${element_count}=    get element count     ${RecordAnalyst_ListView_DueDate_Table_Locator}
    @{DueDate_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_DueDate}=  Get Text      ${RecordAnalyst_ListView_DueDate_Table_Locator} [${i}]
    Append To List      ${DueDate_list}    ${get_DueDate}
    END
    log      ${DueDate_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${RecordAnalyst_List_view_Next_Link_Locator}
    WHILE    ${present} == True
          Click element      ${RecordAnalyst_List_view_Next_Link_Locator}
          ${element_count}=    get element count     ${RecordAnalyst_ListView_DueDate_Table_Locator}
          @{DueDate_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_DueDate}=  Get Text      ${RecordAnalyst_ListView_DueDate_Table_Locator} [${i}]
             Append To List      ${DueDate_list}    ${get_DueDate}
          END
    END
    log      ${DueDate_list}
    ${Sort_order}=  Copy list  ${DueDate_list}
    ${sorted_duedates}       Sort Dates MM/DD/YYYY      ${Sort_order}
    log      ${sorted_duedates}
    lists should be equal       ${DueDate_list}     ${sorted_duedates}


Verify that only 10 records per page are displayed
   ${element_count}=       get element count     ${RecordAnalyst_ListView_ProviderName_Table_Locator}
   ${element_count} =    Convert to string      ${element_count}
   Should be equal       ${element_count}      10


Sort Dates MM/DD/YYYY
    [Arguments]    ${dates}
    ${sorted_dates} =      Evaluate    sorted($dates, key=lambda x: tuple(map(int, x.split('/')[::-1])))
    log       ${sorted_dates}
    [Return]    ${sorted_dates}

Sort List By Type
    [Arguments]    ${input_list}
#    ${sorted_list} =     Evaluate    sorted($input_list, key=lambda x: (isinstance(x, int), x))
    ${sorted_list} =     Evaluate    sorted($input_list, key=lambda x: (isinstance(x, str), str(x)))
    Reverse List      ${sorted_list}
    [Return]    ${sorted_list}

Sort Date Ranges
    [Arguments]    @{ranges}
    ${date_range_objects}=    Create Date Range Objects    @{ranges}
    @{sorted_ranges}=    Sort List By Date    ${date_range_objects}
    [Return]    ${sorted_ranges}

Create Date Range Objects
    [Arguments]    @{ranges}
    @{date_range_objects}=    Create List
    FOR    ${range}    IN    @{ranges}
        ${start_date}    ${end_date}=    Split Date Range    ${range}
        ${date_range_object}=    Create Dictionary    start_date=${start_date}    end_date=${end_date}
        Append To List    ${date_range_objects}    ${date_range_object}
    END
    [Return]    ${date_range_objects}

Split Date Range
    [Arguments]    ${range}
    @{dates}=    Split String    ${range}    -
    ${start_date}=    Normalize Date    ${dates}[0]
    ${end_date}=    Normalize Date    ${dates}[1]
    [Return]    ${start_date}    ${end_date}

Normalize Date
    [Arguments]    ${date}
    ${day}    ${month}    ${year}=    Split String    ${date}    /
    [Return]    ${year}-${month}-${day}

Sort List By Date
    [Arguments]    @{date_range_objects}
    @{sorted_list}=    Sort List    @{date_range_objects}    key=lambda x: datetime.strptime(x['start_date'], '%mm-%dd-%YYYY')
    [Return]    ${sorted_list}