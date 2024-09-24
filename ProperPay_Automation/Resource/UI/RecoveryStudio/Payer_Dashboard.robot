*** Settings ***
Documentation    Script to Test Communication Portal
Library    SeleniumLibrary
Library    Easter
Library    String
Library    Collections
Library    os
#Library    RPA.PDF
Library    ..//ProperPay_Automation//Resource/Database//TestDataFormatter.py
Resource    ../ProperPay_Automation/Resource/UI/CommonFunctionality/CommonFunctionality.robot

Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//Payer_Dashboard_Elements.py
Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//RecordAnalyst_Dashboard_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//Payer_DashBoard_TestData.yaml





*** Variables ***
${substringToReplace}    texttoreplace
${substringToReplace1}    texttoreplace1

*** Keywords ***

Verify Data Availability
    [Arguments]    ${MoreThanOneClaimNeeded}
    Sleep    5
    Wait Until Element Is Visible    ${Comm_Portal_Payer_View_Claims_button_Locator_Value}    timeout=120
    ${NumberOfClaimsAvaialbleForPayer}    Get Text    ${Comm_Portal_Payer_View_Claims_button_Locator_Value}
    #${NumberOfClaimsAvaialbleForPayer}    Evaluate    int('${NumberOfClaimsAvaialbleForPayer}')
    Log To Console      ${NumberOfClaimsAvaialbleForPayer}
     IF   '${NumberOfClaimsAvaialbleForPayer}' == '0'
                        Log     "No claims present for this client, try with another client to run the test"

     ELSE IF    '${MoreThanOneClaimNeeded}' == '1' and '${NumberOfClaimsAvaialbleForPayer}' == '1'
                        Log     "More than 1 claim needed , try with another client to run the test"

     END


Click View Claims button
      Sleep     5
      Wait Until Element Is Visible    ${Comm_Portal_Payer_View_Claims_button_Locator}        timeout=120
      Click Element                   ${Comm_Portal_Payer_View_Claims_button_Locator}
      sleep       5

Verify Adjustments page is displayed
     Wait Until Element Is Visible    ${Comm_Portal_Payer_Adjustments_page_Locator}           timeout=120
     Element Should Be Visible      ${Comm_Portal_Payer_Adjustments_page_Locator}



Click Approve Adjustment button
      Wait Until Element Is Visible    ${Comm_Portal_Outstanding_Dashboard_Approve_Adjustment_Button_Locator}       timeout=120
      Click Element    ${Comm_Portal_Outstanding_Dashboard_Approve_Adjustment_Button_Locator}


Scroll down to the Approve Adjustment button
    Element Should Be Visible    ${Comm_Portal_Outstanding_Dashboard_Approve_Adjustment_form_Button_Locator}     timeout=120
    Scroll Element Into View    ${Comm_Portal_Outstanding_Dashboard_Approve_Adjustment_form_Button_Locator}

Click Approve Adjustment button on Adjustment Approve Form
    Wait Until Element Is Visible    ${Comm_Portal_Outstanding_Dashboard_Approve_Adjustment_form_Button_Locator}       timeout=120
    Click Element    ${Comm_Portal_Outstanding_Dashboard_Approve_Adjustment_form_Button_Locator}

Verify Confirm Approve Adjustment pop up is displayed
    Wait Until Element Is Visible     ${Comm_Portal_OutStanding_Dashboard_Confirm_Approve_Adjustment_Popup_Locator}
    Element Should Be Visible         ${Comm_Portal_OutStanding_Dashboard_Confirm_Approve_Adjustment_Popup_Locator}

Verify Confirm Approve Adjustment pop up message is displayed
    Wait Until Element Is Visible     ${Comm_Portal_OutStanding_Dashboard_Confirm_Approve_Adjustment_Popup_message_Locator}
    Element Should Be Visible         ${Comm_Portal_OutStanding_Dashboard_Confirm_Approve_Adjustment_Popup_message_Locator}

Verify Yes and No button is displayed on Confirm Approve Adjustment pop up
    Wait Until Element Is Visible     ${Comm_Portal_OutStanding_Dashboard_Confirm_Approve_Adjustment_Popup_Button_NO_Locator}
    Element Should Be Visible         ${Comm_Portal_OutStanding_Dashboard_Confirm_Approve_Adjustment_Popup_Button_NO_Locator}
    Wait Until Element Is Visible     ${Comm_Portal_OutStanding_Dashboard_Confirm_Approve_Adjustment_Popup_Button_Yes_Locator}
    Element Should Be Visible         ${Comm_Portal_OutStanding_Dashboard_Confirm_Approve_Adjustment_Popup_Button_Yes_Locator}

Click Yes on Confirm Approve Adjustment pop up
     Wait Until Element Is Visible    ${Comm_Portal_OutStanding_Dashboard_Confirm_Approve_Adjustment_Popup_Button_Yes_Locator}       timeout=120
    Click Element    ${Comm_Portal_OutStanding_Dashboard_Confirm_Approve_Adjustment_Popup_Button_Yes_Locator}


Verify Confirmation pop up is displayed
    Wait Until Element Is Visible     ${Comm_Portal_OutStanding_Dashboard_Confirmataion_Popup_Locator}       timeout=120
    Element Should Be Visible         ${Comm_Portal_OutStanding_Dashboard_Confirmataion_Popup_Locator}

Verify Confirmation pop up message is displayed
    Wait Until Element Is Visible     ${Comm_Portal_OutStanding_Dashboard_Confirmataion_Popup_Message_Locator}
    Element Should Be Visible         ${Comm_Portal_OutStanding_Dashboard_Confirmataion_Popup_Message_Locator}

Verify Go to dashboard button is displayed on Confirmation pop up
    Wait Until Element Is Visible     ${Comm_Portal_OutStanding_Dashboard_Confirmataion_Popup_Go_To_dashboard_Button_Locator}
    Element Should Be Visible         ${Comm_Portal_OutStanding_Dashboard_Confirmataion_Popup_Go_To_dashboard_Button_Locator}


Click Go to dashboard button on Confirmation pop up
     Wait Until Element Is Visible    ${Comm_Portal_OutStanding_Dashboard_Confirmataion_Popup_Go_To_dashboard_Button_Locator}       timeout=120
    Click Element    ${Comm_Portal_OutStanding_Dashboard_Confirmataion_Popup_Go_To_dashboard_Button_Locator}



Verify filter Functionality by providing DAYS SINCE ADJUSTMENT REQUESTED
    Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENTS_Filter_DAYSSINCEDJUSTMENTREQUESTED_DropDown_Locator}   timeout=60
    sleep   2
    ${c} =  Get Element Count   ${PayerDashboard_ADJUSTMENTS_Filter_DAYSSINCEDJUSTMENTREQUESTED_DropDown_Locator}
    Run Keyword If    ${c} > 0   Select From List By Value    ${PayerDashboard_ADJUSTMENTS_Filter_DAYSSINCEDJUSTMENTREQUESTED_DropDown_Locator}      ${Payer_DAYS_SINCE_ADJUSTMENT_REQUESTED}

Click on Apply Filter Icon
    Wait Until Element Is Visible            ${PayerDashboard_OUTSTANDING_ADJUSTMENTS_Filter_ApplyFilter_Button_Locator}                 timeout=120
    Element Should Be Visible                ${PayerDashboard_OUTSTANDING_ADJUSTMENTS_Filter_ApplyFilter_Button_Locator}
    Click Element                            ${PayerDashboard_OUTSTANDING_ADJUSTMENTS_Filter_ApplyFilter_Button_Locator}

Verify data after applying filter Functionality by providing DAYS SINCE ADJUSTMENT REQUESTED
       Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENTS_Filter_DAYSSINCEDJUSTMENTREQUESTED_result_message_locator}     timeout=60
       Element Should Be Visible        ${PayerDashboard_ADJUSTMENTS_Filter_DAYSSINCEDJUSTMENTREQUESTED_result_message_locator}
      # Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENTS_Filter_DAYSSINCEDJUSTMENTREQUESTED_result_locator}     timeout=60
      # Element Should Be Visible        ${PayerDashboard_ADJUSTMENTS_Filter_DAYSSINCEDJUSTMENTREQUESTED_result_locator}



Verify filter Functionality by providing valid Claim Number
       [Arguments]   ${PayerDashboard_ClaimNumber_PassedByUser}
       Element Should Be Visible        ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_TextField_Locator}
       Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_TextField_Locator}
       Click Element                    ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_TextField_Locator}
       Input Text                       ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_TextField_Locator}     ${PayerDashboard_ClaimNumber_PassedByUser}
       Sleep    3


Verify data after applying filter Functionality by providing valid Claim Number
       Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_result_message_locator}     timeout=60
       Element Should Be Visible        ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_result_message_locator}
       Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_result_locator_New}     timeout=60
       Element Should Be Visible        ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_result_locator_New}
       Element Should Not Be Visible    ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_not_visible_after_filter_locator_New}


####VJ##
#New key word to create dynamic locators and make them global

Create dynamic locators for the Claims
    [Arguments]   ${ClaimNumber1ToVerify}   ${ClaimNumber2ToVerify}

    ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_result_locator_New}=    Replace String    ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_result_locator}    ${substringToReplace}    ${ClaimNumber1ToVerify}
    Set Global Variable     ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_result_locator_New}

    ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_not_visible_after_filter_locator_New}=    Replace String    ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_not_visible_after_filter_locator}    ${substringToReplace}    ${ClaimNumber2ToVerify}
    Set Global Variable     ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_not_visible_after_filter_locator_New}




Validate Filter Clearing Functionality
   Create dynamic locators for the Claims      ${Claimnumber_first}    ${Claimnumber_second}
#    # Verify the claim numbers present before applying the filter
#    ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_result_locator_New}=    Replace String    ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_result_locator}    ${substringToReplace}    ${ClaimNumber1ToVerify}
#    Set Global Variable     ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_result_locator_New}
    Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_result_locator_New}   timeout=60
    Element Should Be Visible    ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_result_locator_New}
#    ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_not_visible_after_filter_locator_New}=    Replace String    ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_not_visible_after_filter_locator}    ${substringToReplace}    ${ClaimNumber2ToVerify}
#    Set Global Variable     ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_not_visible_after_filter_locator_New}
    Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_not_visible_after_filter_locator_New}    timeout=60
    Element Should Be Visible    ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_not_visible_after_filter_locator_New}

    # Apply filter for a valid claim number and verify the result
    Click on Filter Icon of Adjustment History
    Verify Filter Functionality by Providing Valid Claim Number    ${Claimnumber_first}
    Click on Apply Filter Icon
    Sleep    5
    Verify data after applying filter Functionality by providing valid Claim Number
    Sleep    5
    #clear the filter and verify the filter applied eralier is cleared
    Click Clear Filter Button on payer filter
    Sleep    5
    Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_result_locator_New}    timeout=60
    Element Should Be Visible    ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_result_locator_New}
    Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_not_visible_after_filter_locator_New}    timeout=60
    Element Should Be Visible    ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_not_visible_after_filter_locator_New}


Click Clear Filter Button on payer filter
    Wait Until Element Is Visible          ${PayerDashboard_OUTSTANDING_ADJUSTMENTS_Filter_ClearFilter_Button_Locator}                   timeout=120
    Element Should Be Visible              ${PayerDashboard_OUTSTANDING_ADJUSTMENTS_Filter_ClearFilter_Button_Locator}
    Click Element                          ${PayerDashboard_OUTSTANDING_ADJUSTMENTS_Filter_ClearFilter_Button_Locator}

Verify outstanding adjustment tab is selected by default
     Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENTS_OutstandingAdjustment_Tab_locator}       timeout=60
     Element Should Be Visible        ${PayerDashboard_ADJUSTMENTS_OutstandingAdjustment_Tab_locator}



Click on Approve Adjustment Cancel Button
    Wait Until Element Is Visible   ${PayerDashboard_Approve_Adjustment_Cancel_Button_Locator}
    Element Should Be Visible       ${PayerDashboard_Approve_Adjustment_Cancel_Button_Locator}              timeout=120
    Click Button                    ${PayerDashboard_Approve_Adjustment_Cancel_Button_Locator}




#Satheesh
Return ClaimNumber hyperlink locator with Claim number passed by user
     [Arguments]   ${ClaimNum_PassedByUser}
     ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator_New}=     Replace String      ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator}   ${substringToReplace}    ${ClaimNum_PassedByUser}
     Set Global Variable    ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator_New}

#Click ClaimNumber in Outstanding Adjustment page
#        Wait Until Element Is Visible   ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator_New}    timeout=120
#        Click Element       ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator_New}

Verify Change Adjustment amount button is present
   Wait Until Element Is Visible    ${Comm_Portal_Outstanding_Dashboard_Change_Adjustment_amount_Button_Locator}
   Element Should Be Visible      ${Comm_Portal_Outstanding_Dashboard_Change_Adjustment_amount_Button_Locator}

Verify Approve Adjustment button is present
   Wait Until Element Is Visible    ${Comm_Portal_Outstanding_Dashboard_Approve_Adjustment_Button_Locator}
   Element Should Be Visible      ${Comm_Portal_Outstanding_Dashboard_Approve_Adjustment_Button_Locator}

Verify Deny Adjustment button is present
   Wait Until Element Is Visible    ${Comm_Portal_Outstanding_Dashboard_Deny_Adjustment_Button_Locator}
   Element Should Be Visible      ${Comm_Portal_Outstanding_Dashboard_Deny_Adjustment_Button_Locator}

Scroll down to the bottom of Adjustment detail page
    Element Should Be Visible    ${Comm_Portal_Outstanding_Dashboard_Deny_Adjustment_Button_Locator}     timeout=120
    Scroll Element Into View    ${Comm_Portal_Outstanding_Dashboard_Deny_Adjustment_Button_Locator}

Verify Adjustment details entered is visible in Payer dashboard
     Sleep    5
#Creating dynamic loactor for patient name
   ${PatientName}             TestDataFormatter.formatPatientName          ${data_list[0]['PatientFirstName']}    ${data_list[0]['PatientLastName']}
   ${PayerDashboard_AdjustmentInfo_PatientName_Header_Locator_New} =  Replace String   ${PayerDashboard_AdjustmentInfo_PatientName_Header_Locator}  ${substringToReplace}  ${PatientName}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_PatientName_Header_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_PatientName_Header_Locator_New}

   #Creating dynamic loactor for patient DOB
    ${formattedDOB}             TestDataFormatter.formatDate           ${data_list[0]['DateOfBirth']}
   ${PayerDashboard_AdjustmentInfo_DOB_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_DOB_Detail_Locator}   ${substringToReplace}    ${formattedDOB}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_DOB_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_DOB_Detail_Locator_New}

    #${formattedSubsriberID}             TestDataFormatter.formatSubscriberID           ${data_list[0]['SubscriberId']}
   ${PayerDashboard_AdjustmentInfo_SubscriberID_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_SubscriberID_Detail_Locator}   ${substringToReplace}    ${data_list[0]['SubscriberId']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_SubscriberID_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_SubscriberID_Detail_Locator_New}

   ${PayerDashboard_AdjustmentInfo_GroupID_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_GroupID_Detail_Locator}   ${substringToReplace}    ${data_list[0]['PolicyNumber']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_GroupID_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_GroupID_Detail_Locator_New}

    ${PayerDashboard_AdjustmentInfo_AuditNum_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_AuditNum_Detail_Locator}     ${substringToReplace}    ${data_list[0]['AuditNumber']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_AuditNum_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_AuditNum_Detail_Locator_New}

    ${PayerDashboard_AdjustmentInfo_AuditType_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_AuditType_Detail_Locator}     ${substringToReplace}    ${data_list[0]['AuditType']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_AuditType_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_AuditType_Detail_Locator_New}

    ${formattedAuditStatus}             TestDataFormatter.formatAuditStatus           ${data_list[0]['AuditStatus']}
    ${PayerDashboard_AdjustmentInfo_AuditStatus_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_AuditStatus_Detail_Locator}     ${substringToReplace}    ${formattedAuditStatus}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_AuditStatus_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_AuditStatus_Detail_Locator_New}

    ${PayerDashboard_AdjustmentInfo_ProviderName_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_ProviderName_Detail_Locator}     ${substringToReplace}    ${data_list[0]['ProviderName']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_ProviderName_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_ProviderName_Detail_Locator_New}

   ${PayerDashboard_AdjustmentInfo_ProviderNumber_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_ProviderNumber_Detail_Locator}     ${substringToReplace}    ${data_list[0]['BillingProviderNumber']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_ProviderNumber_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_ProviderNumber_Detail_Locator_New}

   ${PayerDashboard_AdjustmentInfo_ClaimNum_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_ClaimNum_Detail_Locator}     ${substringToReplace}    ${data_list[0]['ClaimNumber']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_ClaimNum_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_ClaimNum_Detail_Locator_New}

#   ${PayerDashboard_AdjustmentInfo_MediRecNum_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_MediRecNum_Detail_Locator}     ${substringToReplace}    ${data_list[0]['MRNumber']}
#   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_MediRecNum_Detail_Locator_New}
#   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_MediRecNum_Detail_Locator_New}

   ${formattedAdmitDate}             TestDataFormatter.formatDate           ${data_list[0]['AdmitDate']}
   ${PayerDashboard_AdjustmentInfo_AdmitDate_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_AdmitDate_Detail_Locator}   ${substringToReplace}    ${formattedAdmitDate}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_AdmitDate_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_AdmitDate_Detail_Locator_New}

   ${formattedDischargeDate}             TestDataFormatter.formatDate           ${data_list[0]['DischargeDate']}
   ${PayerDashboard_AdjustmentInfo_DischargeDate_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_DischargeDate_Detail_Locator}   ${substringToReplace}    ${formattedDischargeDate}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_DischargeDate_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_DischargeDate_Detail_Locator_New}

    ${formattedPaidDateDate}             TestDataFormatter.formatDate           ${data_list[0]['PaidDate']}
   ${PayerDashboard_AdjustmentInfo_PaidDate_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_PaidDate_Detail_Locator}   ${substringToReplace}    ${formattedPaidDateDate}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_PaidDate_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_PaidDate_Detail_Locator_New}


     ${adjusted_date}    Set Variable    ${data_list[0]['ReadyForAdjustmentDate'].split('.')[0]}
   ${formattedAdjustmentDate}             TestDataFormatter.formatDate           ${adjusted_date}
   ${PayerDashboard_AdjustmentInfo_AdjustmentRequested_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_AdjustmentRequested_Detail_Locator}   ${substringToReplace}    ${formattedAdjustmentDate}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_AdjustmentRequested_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_AdjustmentRequested_Detail_Locator_New}

   ${formattedOriginalGrossPay}             TestDataFormatter.formatToCurrency           ${Payer_data_list[0]['OriginalGrossPay']}
   ${PayerDashboard_AdjustmentInfo_Original_Gross_Pay_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Original_Gross_Pay_Detail_Locator}   ${substringToReplace}    ${formattedOriginalGrossPay}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Original_Gross_Pay_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Original_Gross_Pay_Detail_Locator_New}

   ${formattedOriginalNetPay}             TestDataFormatter.formatToCurrency           ${Payer_data_list[0]['OriginalNetPay']}
   ${PayerDashboard_AdjustmentInfo_Original_Net_Pay_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Original_Net_Pay_Detail_Locator}   ${substringToReplace}    ${formattedOriginalNetPay}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Original_Net_Pay_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Original_Net_Pay_Detail_Locator_New}


   ${formattedIdentifiedGrossPay}             TestDataFormatter.formatToCurrency           ${Payer_data_list[0]['NewGrossPay']}
   ${PayerDashboard_AdjustmentInfo_Identified_Gross_Pay_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Identified_Gross_Pay_Detail_Locator}   ${substringToReplace}    ${formattedIdentifiedGrossPay}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Identified_Gross_Pay_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Identified_Gross_Pay_Detail_Locator_New}


    ${formattedIdentifiedNetPay}             TestDataFormatter.formatToCurrency           ${Payer_data_list[0]['NewNetPay']}
   ${PayerDashboard_AdjustmentInfo_Identified_Net_Pay_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Identified_Net_Pay_Detail_Locator}   ${substringToReplace}    ${formattedIdentifiedNetPay}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Identified_Net_Pay_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Identified_Net_Pay_Detail_Locator_New}

   ${VerifiedAdjustor}             TestDataFormatter.VerifyIfNull           ${data_list[0]['Adjustor']}
   ${PayerDashboard_AdjustmentInfo_Adjustor_Name_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Adjustor_Name_Detail_Locator}   ${substringToReplace}    ${VerifiedAdjustor}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Adjustor_Name_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Adjustor_Name_Detail_Locator_New}

   ${VerifiedAdjustmentDate}             TestDataFormatter.VerifyIfNull           ${data_list[0]['AdjustmentDate']}
   ${PayerDashboard_AdjustmentInfo_Adjustment_date_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Adjustment_date_Detail_Locator}   ${substringToReplace}    ${VerifiedAdjustmentDate}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Adjustment_date_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Adjustment_date_Detail_Locator_New}


  # Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Payer_Confirmed_Pay_Detail_Locator_New}
   #Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Payer_Confirmed_Pay_Detail_Locator_New}



##  Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Payer_Confirmed_Savings_Detail_Locator}
##  Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Payer_Confirmed_Savings_Detail_Locator}

   ${PayerDashboard_AdjustmentInfo_Region_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Region_Detail_Locator}   ${substringToReplace}    ${data_list[0]['Region']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Region_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Region_Detail_Locator_New}

   ${PayerDashboard_AdjustmentInfo_DivisionCode_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_DivisionCode_Detail_Locator}   ${substringToReplace}    ${data_list[0]['DivisionCode']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_DivisionCode_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_DivisionCode_Detail_Locator_New}

   ${VerifiedReferenceClaim}             TestDataFormatter.VerifyIfNull           ${data_list[0]['ReferenceClaim']}
   ${PayerDashboard_AdjustmentInfo_Reference_Claim_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Reference_Claim_Detail_Locator}   ${substringToReplace}    ${VerifiedReferenceClaim}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Reference_Claim_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Reference_Claim_Detail_Locator_New}

     ${formattedFindingsLetterDate}             TestDataFormatter.formatDate           ${data_list[0]['FindingLettersDate']}
   ${PayerDashboard_AdjustmentInfo_Findings_Letter_Date_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Findings_Letter_Date_Detail_Locator}   ${substringToReplace}     ${formattedFindingsLetterDate}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Findings_Letter_Date_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Findings_Letter_Date_Detail_Locator_New}

    IF	 '$Client_Name == "HMBCBS" or "GATEW"'
    ${TextToReplace}=    Set Variable       Adjustment Details
    ELSE
	${TextToReplace}=     Set Variable      Adjustment Summary
	END

	 ${PayerDashboard_AdjustmentDetail_Header_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentDetail_Header_Locator}   ${substringToReplace}     ${TextToReplace}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentDetail_Header_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentDetail_Header_Locator_New}


   Wait Until Element Is Visible    ${PayerDashboard_FindingsComment_Header_Locator}
   Element Should Be Visible      ${PayerDashboard_FindingsComment_Header_Locator}

Enter Adjustment reason
    Wait Until Element Is Visible          ${PayerDashboard_AdjustmentInfo_CommenteSignature_ADJUSTMENTREASON_TextArea_Locator}
    Element Should Be Visible              ${PayerDashboard_AdjustmentInfo_CommenteSignature_ADJUSTMENTREASON_TextArea_Locator}
    Input Text                        ${PayerDashboard_AdjustmentInfo_CommenteSignature_ADJUSTMENTREASON_TextArea_Locator}                  ${Adjustment Reason}


Click on Change Adjustment Amount Button
    Wait Until Element Is Visible          ${PayerDashboard_AdjustmentInfo_ChangeAdjustmentAmountButton_Locator}                   timeout=120
    Element Should Be Visible              ${PayerDashboard_AdjustmentInfo_ChangeAdjustmentAmountButton_Locator}
    Click Button                           ${PayerDashboard_AdjustmentInfo_ChangeAdjustmentAmountButton_Locator}
    Sleep    2

Verify CONFIRM ADJUSTMENT CHANGE pop up
    Wait Until Element Is Visible            ${PayerDashboard_Confirm_Adjustment_Change_PopUp_Head_Locator}
    Element Should Be Visible                ${PayerDashboard_Confirm_Adjustment_Change_PopUp_Head_Locator}
    Wait Until Element Is Visible            ${PayerDashboard_Confirm_Adjustment_Change_PopUp_Body_Locator}
    Element Should Be Visible                ${PayerDashboard_Confirm_Adjustment_Change_PopUp_Body_Locator}
    ${PayerDashboard_Confirm_Adjustment_Change_PopUp_Body_Locator_Text}=        Get Text            ${PayerDashboard_Confirm_Adjustment_Change_PopUp_Body_Locator}
    should be equal            ${PayerDashboard_Confirm_Adjustment_Change_PopUp_Body_Locator_Text}           Are you ready to change the adjustment amount?
    Wait Until Element Is Visible           ${PayerDashboard_Confirm_Adjustment_Change_PopUp_Yes_Locator}
    Element Should Be Visible               ${PayerDashboard_Confirm_Adjustment_Change_PopUp_Yes_Locator}
    Element Should Be Enabled               ${PayerDashboard_Confirm_Adjustment_Change_PopUp_Yes_Locator}
    Wait Until Element Is Visible           ${PayerDashboard_Confirm_Adjustment_Change_PopUp_No_Locator}
    Element Should Be Visible               ${PayerDashboard_Confirm_Adjustment_Change_PopUp_No_Locator}
    Element Should Be Enabled               ${PayerDashboard_Confirm_Adjustment_Change_PopUp_No_Locator}

Click on Approve Adjustment Tab
    Wait Until Element Is Visible      ${Comm_Portal_Outstanding_Dashboard_Approve_Adjustment_Button_Locator}
    Element Should Be Visible          ${Comm_Portal_Outstanding_Dashboard_Approve_Adjustment_Button_Locator}
    Click Button                        ${Comm_Portal_Outstanding_Dashboard_Approve_Adjustment_Button_Locator}

Click on Approve Adjustment Button
    Wait Until Element Is Visible          ${PayerDashboard_Approve_Adjustment_Button_Locator}                   timeout=120
    Element Should Be Visible              ${PayerDashboard_Approve_Adjustment_Button_Locator}
    Click Button                           ${PayerDashboard_Approve_Adjustment_Button_Locator}
    Sleep    2

Verify CONFIRM APPROVE ADJUSTMENT pop up
    Wait Until Element Is Visible            ${PayerDashboard_Confirm_Approve_Adjustment_PopUp_Head_Locator}
    Element Should Be Visible                ${PayerDashboard_Confirm_Approve_Adjustment_PopUp_Head_Locator}
    Wait Until Element Is Visible            ${PayerDashboard_Confirm_Approve_Adjustment_PopUp_Body_Locator}
    Element Should Be Visible                ${PayerDashboard_Confirm_Approve_Adjustment_PopUp_Body_Locator}
    ${PayerDashboard_Confirm_Approve_Adjustment_PopUp_Body_Locator_Text}=        Get Text            ${PayerDashboard_Confirm_Approve_Adjustment_PopUp_Body_Locator}
    should be equal            ${PayerDashboard_Confirm_Approve_Adjustment_PopUp_Body_Locator_Text}           Are you ready to approve the adjustment?
    Wait Until Element Is Visible           ${PayerDashboard_Confirm_Approve_Adjustment_PopUp_Yes_Locator}
    Element Should Be Visible               ${PayerDashboard_Confirm_Approve_Adjustment_PopUp_Yes_Locator}
    Element Should Be Enabled               ${PayerDashboard_Confirm_Approve_Adjustment_PopUp_Yes_Locator}
    Wait Until Element Is Visible           ${PayerDashboard_Confirm_Approve_Adjustment_PopUp_No_Locator}
    Element Should Be Visible               ${PayerDashboard_Confirm_Approve_Adjustment_PopUp_No_Locator}
    Element Should Be Enabled               ${PayerDashboard_Confirm_Approve_Adjustment_PopUp_No_Locator}

Verify Comments and Authorized eSignature panel is displayed with details for "Approve Adjustment" Tab
    Wait Until Element Is Visible        ${PayerDashboard_Approve_Adjustment_Tab_Authorized_eSignaturePanel_Locator}
    Element Should Be Visible            ${PayerDashboard_Approve_Adjustment_Tab_Authorized_eSignaturePanel_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_Approve_Adjustment_Approve_Comments_Locator}
    Element Should Be Visible            ${PayerDashboard_Approve_Adjustment_Approve_Comments_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_Approve_Adjustment_Esignature_Locator}
    Element Should Be Visible            ${PayerDashboard_Approve_Adjustment_Esignature_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_Approve_Adjustment_Title_Locator}
    Element Should Be Visible            ${PayerDashboard_Approve_Adjustment_Title_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_Approve_Adjustment_Date_Locator}
    Element Should Be Visible            ${PayerDashboard_Approve_Adjustment_Date_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_Approve_Adjustment_Button_Locator}
    Element Should Be Visible            ${PayerDashboard_Approve_Adjustment_Button_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_Approve_Adjustment_Cancel_Button_Locator}
    Element Should Be Visible            ${PayerDashboard_Approve_Adjustment_Cancel_Button_Locator}

Verify Authorized eSignature details are autofilled for "Approve Adjustment" Tab
    Textfield Value Should Be     ${ PayerDashboard_Approve_Adjustment_Esignature_Locator}    ${Payer_comm_usr_name}
    Textfield Value Should Be   ${PayerDashboard_Approve_Adjustment_Title_Locator}        ${Payer_Title}
    ${date}=      Get Current Date     result_format=%Y-%m-%d
    Textfield Value Should Be     ${PayerDashboard_Approve_Adjustment_Date_Locator}    ${date}


Verify 'Claim Number' is clickable and other columns are not clickable in Outstanding Adjustment page

    ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator_New}=     Replace String      ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator}   ${substringToReplace}    ${data_list[0]['ClaimNumber']}
    Set Global Variable   ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator_New}
    Verify Claim Number On Current Page else go to next page
    Wait Until Element Is Visible        ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator_New}

    Page Should contain Link     ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator_New}
#    ${Prepay_Value}      Set Variable      ${data_list[0]['Prepay']}
#
#    log   ${Prepay_Value}
#        IF    '$Prepay_Value' == "TRUE"
#              #${Prepay}=    Set Variable    Yes
#              ${Comm_Portal_Outstanding_Adjustment_Prepay_Locator_New}=     Replace String      ${Comm_Portal_Outstanding_Adjustment_Prepay_Locator_Yes}   ${substringToReplace}    ${data_list[0]['ClaimNumber']}
#        ELSE
#              #${Prepay}=    Set Variable    No
#              ${Comm_Portal_Outstanding_Adjustment_Prepay_Locator_New}=     Replace String      ${Comm_Portal_Outstanding_Adjustment_Prepay_Locator_No}   ${substringToReplace}    ${data_list[0]['ClaimNumber']}
#        END

#    Wait Until Element Is Visible        ${Comm_Portal_Outstanding_Adjustment_Prepay_Locator_New}
#    Page Should not contain Link         ${Comm_Portal_Outstanding_Adjustment_Prepay_Locator_New}


    ${AdjustedDate}    Set Variable    ${data_list[0]['ReadyForAdjustmentDate'].split('.')[0]}
    ${formattedAdjustment_Request_DATE}             TestDataFormatter.formatDate           ${AdjustedDate}
    ${PayerDashboard_Outstanding_Adjustment_Adjustment_Request_DATE_Value_Locator_New}=     Replace String      ${PayerDashboard_Outstanding_Adjustment_Adjustment_Request_DATE_Value_Locator}   ${substringToReplace}    ${formattedAdjustment_Request_DATE}
    Wait Until Element Is Visible        ${PayerDashboard_Outstanding_Adjustment_Adjustment_Request_DATE_Value_Locator_New}
    Page Should not contain Link         ${PayerDashboard_Outstanding_Adjustment_Adjustment_Request_DATE_Value_Locator_New}


     ${Days_Since_Request_date}    FindDateDifference    ${formattedAdjustment_Request_DATE}
     ${Days_Since_Request_dateStr}    Convert To String    ${Days_Since_Request_date}

     ${PayerDashboard_Outstanding_Adjustment_DAYS_SINCE_REQUEST_DATE_Value_Locator_New}=     Replace String      ${PayerDashboard_Outstanding_Adjustment_DAYS_SINCE_REQUEST_DATE_Value_Locator}   ${substringToReplace}   ${Days_Since_Request_dateStr}
    Wait Until Element Is Visible        ${PayerDashboard_Outstanding_Adjustment_DAYS_SINCE_REQUEST_DATE_Value_Locator_New}
    Page Should not contain Link         ${PayerDashboard_Outstanding_Adjustment_DAYS_SINCE_REQUEST_DATE_Value_Locator_New}



    ${formattedProviderName}             TestDataFormatter.ConvertCaseOftheString          ${data_list[0]['ProviderName']}
    ${PayerDashboard_Outstanding_Adjustment_ProviderName_Value_Locator_New}=     Replace String      ${PayerDashboard_Outstanding_Adjustment_ProviderName_Value_Locator}   ${substringToReplace}    ${formattedProviderName}
    Wait Until Element Is Visible        ${PayerDashboard_Outstanding_Adjustment_ProviderName_Value_Locator_New}
    Page Should not contain Link         ${PayerDashboard_Outstanding_Adjustment_ProviderName_Value_Locator_New}

    #${BillingProviderNumber}      Get Value from the list     BillingProviderNumber
    ${formattedProviderNumber}             TestDataFormatter.formatProviderNumber            ${data_list[0]['BillingProviderNumber']}
    ${PayerDashboard_Outstanding_Adjustment_ProviderNumber_Value_Locator_New}=     Replace String      ${PayerDashboard_Outstanding_Adjustment_ProviderNumber_Value_Locator}   ${substringToReplace}   ${formattedProviderNumber}
    Wait Until Element Is Visible        ${PayerDashboard_Outstanding_Adjustment_ProviderNumber_Value_Locator_New}
    Page Should not contain Link         ${PayerDashboard_Outstanding_Adjustment_ProviderNumber_Value_Locator_New}

    #${AuditStatus}      Get Value from the list     AuditStatus
    ${formattedAuditStatus}             TestDataFormatter.formatAuditStatus           ${data_list[0]['AuditStatus']}
    ${PayerDashboard_Outstanding_Adjustment_AuditStatus_Value_Locator_New}=      Replace String      ${PayerDashboard_Outstanding_Adjustment_AuditStatus_Value_Locator}     ${substringToReplace}    ${formattedAuditStatus}
    Wait Until Element Is Visible        ${PayerDashboard_Outstanding_Adjustment_AuditStatus_Value_Locator_New}
    Page Should not contain Link         ${PayerDashboard_Outstanding_Adjustment_AuditStatus_Value_Locator_New}

    ${PayerDashboard_Outstanding_Adjustment_AuditNumber_Value_Locator_New}=     Replace String      ${PayerDashboard_Outstanding_Adjustment_AuditNumber_Value_Locator}   ${substringToReplace}    ${data_list[0]['AuditNumber']}
    Wait Until Element Is Visible        ${PayerDashboard_Outstanding_Adjustment_AuditNumber_Value_Locator_New}
    Page Should not contain Link         ${PayerDashboard_Outstanding_Adjustment_AuditNumber_Value_Locator_New}

     ${PayerDashboard_Outstanding_Adjustment_AuditType_Value_Locator_New}=     Replace String      ${PayerDashboard_Outstanding_Adjustment_AuditType_Value_Locator}   ${substringToReplace}    ${data_list[0]['AuditType']}
    Wait Until Element Is Visible        ${PayerDashboard_Outstanding_Adjustment_AuditType_Value_Locator_New}
    Page Should not contain Link         ${PayerDashboard_Outstanding_Adjustment_AuditType_Value_Locator_New}

     #${IdentifiedGrossSavings}      Get Value from the list     IdentifiedGrossSavings
    ${formattedIdentifiedSavings}             TestDataFormatter.formatToCurrency           ${Payer_data_list[0]['IdentifiedGrossSavings']}
    ${PayerDashboard_Outstanding_Adjustment_IdentifiedSavings_Value_Locator_New}=     Replace String      ${PayerDashboard_Outstanding_Adjustment_IdentifiedSavings_Value_Locator}   ${substringToReplace}    ${formattedIdentifiedSavings}
    Wait Until Element Is Visible        ${PayerDashboard_Outstanding_Adjustment_IdentifiedSavings_Value_Locator_New}
    Page Should not contain Link         ${PayerDashboard_Outstanding_Adjustment_IdentifiedSavings_Value_Locator_New}

     #${ConfirmedGrossSavings}      Get Value from the list     ConfirmedGrossSavings
    ${formattedConfirmedSavings}             TestDataFormatter.formatToCurrency           ${Payer_data_list[0]['ConfirmedGrossSavings']}
    ${PayerDashboard_Outstanding_Adjustment_ConfirmedSavings_Value_Locator_New}=     Replace String      ${PayerDashboard_Outstanding_Adjustment_ConfirmedSavings_Value_Locator}   ${substringToReplace}    ${formattedConfirmedSavings}
    Wait Until Element Is Visible        ${PayerDashboard_Outstanding_Adjustment_ConfirmedSavings_Value_Locator_New}
    Page Should not contain Link         ${PayerDashboard_Outstanding_Adjustment_ConfirmedSavings_Value_Locator_New}


Verify 'Claim Number' is clickable and other columns are not clickable in Adjustment History page

    #Get the first 2 Claimnumber Elements from the Payer dashboard page

    #Find Row Index by Claim Number        ${Claimnumber_first}

    #${ClaimNumber}      Get Value from the list     ClaimNumber

    ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator_New}=     Replace String      ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator}   ${substringToReplace}    ${data_list[0]['ClaimNumber']}
    Set Global Variable   ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator_New}
    Verify Claim Number On Current Page else go to next page
    Wait Until Element Is Visible        ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator_New}

    Page Should contain Link     ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator_New}

    # ${ProviderName}      Get Value from the list     ProviderName
    ${formattedProviderName}             TestDataFormatter.ConvertCaseOftheString          ${data_list[0]['ProviderName']}
    ${PayerDashboard_Outstanding_Adjustment_ProviderName_Value_Locator_New}=     Replace String      ${PayerDashboard_Outstanding_Adjustment_ProviderName_Value_Locator}   ${substringToReplace}    ${formattedProviderName}
    Wait Until Element Is Visible        ${PayerDashboard_Outstanding_Adjustment_ProviderName_Value_Locator_New}
    Page Should not contain Link         ${PayerDashboard_Outstanding_Adjustment_ProviderName_Value_Locator_New}

    #${BillingProviderNumber}      Get Value from the list     BillingProviderNumber
    ${formattedProviderNumber}             TestDataFormatter.formatProviderNumber            ${data_list[0]['BillingProviderNumber']}
    ${PayerDashboard_Outstanding_Adjustment_ProviderNumber_Value_Locator_New}=     Replace String      ${PayerDashboard_Outstanding_Adjustment_ProviderNumber_Value_Locator}   ${substringToReplace}   ${formattedProviderNumber}
    Wait Until Element Is Visible        ${PayerDashboard_Outstanding_Adjustment_ProviderNumber_Value_Locator_New}
    Page Should not contain Link         ${PayerDashboard_Outstanding_Adjustment_ProviderNumber_Value_Locator_New}

    #${AuditStatus}      Get Value from the list     AuditStatus
    ${formattedAuditStatus}             TestDataFormatter.formatAuditStatus           ${data_list[0]['AuditStatus']}
    ${PayerDashboard_Outstanding_Adjustment_AuditStatus_Value_Locator_New}=      Replace String      ${PayerDashboard_Outstanding_Adjustment_AuditStatus_Value_Locator}     ${substringToReplace}    ${formattedAuditStatus}
    Wait Until Element Is Visible        ${PayerDashboard_Outstanding_Adjustment_AuditStatus_Value_Locator_New}
    Page Should not contain Link         ${PayerDashboard_Outstanding_Adjustment_AuditStatus_Value_Locator_New}

    #${AuditType}      Get Value from the list     AuditType
    ${PayerDashboard_Outstanding_Adjustment_AuditType_Value_Locator_New}=     Replace String      ${PayerDashboard_Outstanding_Adjustment_AuditType_Value_Locator}   ${substringToReplace}    ${data_list[0]['AuditType']}
    Wait Until Element Is Visible        ${PayerDashboard_Outstanding_Adjustment_AuditType_Value_Locator_New}
    Page Should not contain Link         ${PayerDashboard_Outstanding_Adjustment_AuditType_Value_Locator_New}

     #${IdentifiedGrossSavings}      Get Value from the list     IdentifiedGrossSavings
    ${formattedIdentifiedSavings}             TestDataFormatter.formatToCurrency           ${Payer_data_list[0]['IdentifiedGrossSavings']}
    ${PayerDashboard_Outstanding_Adjustment_IdentifiedSavings_Value_Locator_New}=     Replace String      ${PayerDashboard_Outstanding_Adjustment_IdentifiedSavings_Value_Locator}   ${substringToReplace}    ${formattedIdentifiedSavings}
    Wait Until Element Is Visible        ${PayerDashboard_Outstanding_Adjustment_IdentifiedSavings_Value_Locator_New}
    Page Should not contain Link         ${PayerDashboard_Outstanding_Adjustment_IdentifiedSavings_Value_Locator_New}

     #${ConfirmedGrossSavings}      Get Value from the list     ConfirmedGrossSavings
    ${formattedConfirmedSavings}             TestDataFormatter.formatToCurrency           ${Payer_data_list[0]['ConfirmedGrossSavings']}
    ${PayerDashboard_Outstanding_Adjustment_ConfirmedSavings_Value_Locator_New}=     Replace String      ${PayerDashboard_Outstanding_Adjustment_ConfirmedSavings_Value_Locator}   ${substringToReplace}    ${formattedConfirmedSavings}
    Wait Until Element Is Visible        ${PayerDashboard_Outstanding_Adjustment_ConfirmedSavings_Value_Locator_New}
    Page Should not contain Link         ${PayerDashboard_Outstanding_Adjustment_ConfirmedSavings_Value_Locator_New}

    # ${adjusted_date}      Get Value from the list     ReadyForAdjustmentDate
     ${AdjustedDate}    Set Variable    ${data_list[0]['ReadyForAdjustmentDate'].split('.')[0]}
    ${formattedAdjustment_Request_DATE}             TestDataFormatter.formatDate           ${AdjustedDate}
    ${PayerDashboard_Outstanding_Adjustment_Adjustment_Request_DATE_Value_Locator_New}=     Replace String      ${PayerDashboard_Outstanding_Adjustment_Adjustment_Request_DATE_Value_Locator}   ${substringToReplace}    ${formattedAdjustment_Request_DATE}
    Wait Until Element Is Visible        ${PayerDashboard_Outstanding_Adjustment_Adjustment_Request_DATE_Value_Locator_New}
    Page Should not contain Link         ${PayerDashboard_Outstanding_Adjustment_Adjustment_Request_DATE_Value_Locator_New}

    #${adjustor}      Get Value from the list     Adjustor
    ${PayerDashboard_AdjustmentHistory_Adjustment_User_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentHistory_Adjustment_User_Locator}   ${substringToReplace}    ${data_list[0]['Adjustor']}
    Wait Until Element Is Visible        ${PayerDashboard_AdjustmentHistory_Adjustment_User_Locator_New}
    Page Should not contain Link         ${PayerDashboard_AdjustmentHistory_Adjustment_User_Locator_New}

#    Wait Until Element Is Visible        ${PayerDashboard_Outstanding_Adjustment_ProviderNumber_Value_Locator}
#    Page Should not contain Link         ${PayerDashboard_Outstanding_Adjustment_ProviderNumber_Value_Locator}
#    Wait Until Element Is Visible        ${PayerDashboard_Outstanding_Adjustment_AuditStatus_Value_Locator}
#    Page Should not contain Link         ${PayerDashboard_Outstanding_Adjustment_AuditStatus_Value_Locator}
#    Wait Until Element Is Visible        ${PayerDashboard_Outstanding_Adjustment_AuditType_Value_Locator}
#    Page Should not contain Link         ${PayerDashboard_Outstanding_Adjustment_AuditType_Value_Locator}
#    Wait Until Element Is Visible        ${PayerDashboard_Outstanding_Adjustment_IdentifiedSavings_Value_Locator}
#    Page Should not contain Link         ${PayerDashboard_Outstanding_Adjustment_IdentifiedSavings_Value_Locator}
#    Wait Until Element Is Visible        ${PayerDashboard_Outstanding_Adjustment_ConfirmedSavings_Value_Locator}
#    Page Should not contain Link         ${PayerDashboard_Outstanding_Adjustment_ConfirmedSavings_Value_Locator}
#    Wait Until Element Is Visible        ${PayerDashboard_Outstanding_Adjustment_Adjustment_Request_DATE_Value_Locator}
#    Page Should not contain Link         ${PayerDashboard_Outstanding_Adjustment_Adjustment_Request_DATE_Value_Locator}
#    Wait Until Element Is Visible        ${PayerDashboard_AdjustmentHistory_Adjustment_User_Locator}
#    Page Should not contain Link         ${PayerDashboard_AdjustmentHistory_Adjustment_User_Locator}

Verify Approve Adjustment button is enabled
    Wait Until Element Is Visible    ${PayerDashboard_Approve_Adjustment_Button_Locator}
    Element Should Be Visible      ${PayerDashboard_Approve_Adjustment_Button_Locator}
    Element Should be enabled       ${PayerDashboard_Approve_Adjustment_Button_Locator}

Click Apply Filter Button in Outstanding Adjustment
        Wait Until Element Is Visible           ${PayerDashboard_OUTSTANDING_ADJUSTMENTS_Filter_ApplyFilter_Button_Locator}    timeout=120
        Click Button                           ${PayerDashboard_OUTSTANDING_ADJUSTMENTS_Filter_ApplyFilter_Button_Locator}

Verify filter Functionality by providing Valid Audit Number in Outstanding Adjustment
       [Arguments]   ${PtAccNum_PassedByUser}
       Element Should Be Visible        ${PayerDashboard_Outstanding_Adjustment_FilterButton_AuditNumber_TextField_Locator}
       Wait Until Element Is Visible    ${PayerDashboard_Outstanding_Adjustment_FilterButton_AuditNumber_TextField_Locator}
       Click Element                    ${PayerDashboard_Outstanding_Adjustment_FilterButton_AuditNumber_TextField_Locator}
       Input Text                       ${PayerDashboard_Outstanding_Adjustment_FilterButton_AuditNumber_TextField_Locator}     ${PtAccNum_PassedByUser}
       Sleep    3

Verify data after applying filter Functionality by providing Valid Audit Number in Outstanding Adjustment
        ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_Outstanding_Adjustment_NumberOfFilterResults_Locator}
        IF   ${present} == True

                  ${PayerDashboard_Outstanding_Adjustment_FilterButton_AuditNumber_Locator_New}=     Replace String      ${PayerDashboard_Outstanding_Adjustment_FilterButton_AuditNumber_Locator}   ${substringToReplace}    ${data_list[0]['AuditNumber']}
                Wait Until Element Is Visible        ${PayerDashboard_Outstanding_Adjustment_FilterButton_AuditNumber_Locator_New}                       timeout=120
                Element Should Be Visible    ${PayerDashboard_Outstanding_Adjustment_FilterButton_AuditNumber_Locator_New}
        ELSE
                Page should contain       There are no Outstanding Adjustment Requests which meet the criteria.
        END

Verify filter Functionality by providing Provider Number in Outstanding Adjustment
       [Arguments]   ${PtAccNum_PassedByUser}
       Element Should Be Visible        ${PayerDashboard_Outstanding_Adjustment_FilterButton_ProviderNumber_TextField_Locator}
       Wait Until Element Is Visible    ${PayerDashboard_Outstanding_Adjustment_FilterButton_ProviderNumber_TextField_Locator}
       Click Element                    ${PayerDashboard_Outstanding_Adjustment_FilterButton_ProviderNumber_TextField_Locator}
       Input Text                       ${PayerDashboard_Outstanding_Adjustment_FilterButton_ProviderNumber_TextField_Locator}      ${PtAccNum_PassedByUser}
       Sleep    3

Verify data after applying filter Functionality by providing Provider Number in Outstanding Adjustment
        ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_Outstanding_Adjustment_NumberOfFilterResults_Locator}
        IF   ${present} == True

        ${formattedProviderNumber}             TestDataFormatter.formatProviderNumber            ${data_list[0]['BillingProviderNumber']}
        ${PayerDashboard_Outstanding_Adjustment_FilterButton_ProviderNumber_Locator_New}=     Replace String      ${PayerDashboard_Outstanding_Adjustment_FilterButton_ProviderNumber_Locator}   ${substringToReplace}    ${formattedProviderNumber}

                Wait Until Element Is Visible        ${PayerDashboard_Outstanding_Adjustment_FilterButton_ProviderNumber_Locator_New}                       timeout=120
                Element Should Be Visible    ${PayerDashboard_Outstanding_Adjustment_FilterButton_ProviderNumber_Locator_New}
        ELSE
                Page should contain       There are no Outstanding Adjustment Requests which meet the criteria.
        END


Click Next Request Button
     Wait Until Element Is Visible   ${PayerDashboard_Outstanding_Adjustment_NextRequest_button_Locator}        timeout=120
     Click Element    ${PayerDashboard_Outstanding_Adjustment_NextRequest_button_Locator}
     sleep      2

Click Previous Request Button
     Wait Until Element Is Visible   ${PayerDashboard_Outstanding_Adjustment_PrevRequest_button_Locator}        timeout=120
     Click Element    ${PayerDashboard_Outstanding_Adjustment_PrevRequest_button_Locator}
     sleep      2

Click Next Request Button in Adjustment History
     Wait Until Element Is Visible   ${PayerDashboard_Adjustment_History_NextRequest_button_Locator}        timeout=120
     Click Element    ${PayerDashboard_Adjustment_History_NextRequest_button_Locator}
     sleep      2

Click Previous Request Button in Adjustment History
     Wait Until Element Is Visible   ${PayerDashboard_Adjustment_History_PrevRequest_button_Locator}        timeout=120
     Click Element    ${PayerDashboard_Adjustment_History_PrevRequest_button_Locator}
     sleep      2

Click on Outstanding Adjustment Breadcrumbs
     Wait Until Element Is Visible   ${PayerDashboard_Outstanding_Adjustment_Breadcrumbs_Locator}        timeout=120
     Click Element    ${PayerDashboard_Outstanding_Adjustment_Breadcrumbs_Locator}

Verify filter Functionality by providing Audit Status in Adjustment history page
    [Arguments]     ${User_option}
    Wait until Element is Visible       ${PayerDashboard_ADJUSTMENT_HISTORY_Filter_AuditStatusLabel_Locator}
    Element Should Be Visible           ${PayerDashboard_ADJUSTMENT_HISTORY_Filter_AuditStatusLabel_Locator}
    Select From List By Value           ${PayerDashboard_ADJUSTMENT_HISTORY_Filter_AuditStatusDropdown_Locator}             ${User_option}
    sleep  5

Click on Apply Filter button in Adjustment History
    Wait Until Element Is Visible            ${PayerDashboard_ADJUSTMENT_HISTORY_Filter_ApplyFilter_Button_Locator}                 timeout=120
    Element Should Be Visible                ${PayerDashboard_ADJUSTMENT_HISTORY_Filter_ApplyFilter_Button_Locator}
    Click Element                            ${PayerDashboard_ADJUSTMENT_HISTORY_Filter_ApplyFilter_Button_Locator}

Verify data after applying filter Functionality by providing Audit Status in Adjustment History
        ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_Outstanding_Adjustment_NumberOfFilterResults_Locator}

        ${formattedProviderNumber}             TestDataFormatter.formatProviderNumber            ${data_list[0]['BillingProviderNumber']}
        ${PayerDashboard_Outstanding_Adjustment_FilterButton_ProviderNumber_Locator_New}=     Replace String      ${PayerDashboard_Outstanding_Adjustment_FilterButton_ProviderNumber_Locator}   ${substringToReplace}   ${formattedProviderNumber}

        IF   ${present} == True
                Wait Until Element Is Visible        ${PayerDashboard_Outstanding_Adjustment_FilterButton_ProviderNumber_Locator_New}                       timeout=120
                Element Should Be Visible    ${PayerDashboard_Outstanding_Adjustment_FilterButton_ProviderNumber_Locator_New}
        ELSE
                Page should contain        There are no Adjustment History Results which meet the criteria.
        END

Verify filter Functionality by providing DAYS SINCE ADJUSTMENT REQUESTED - >5
    Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENTS_Filter_DAYSSINCEDJUSTMENTREQUESTED_DropDown_Locator}   timeout=60
    sleep   2
    ${c} =  Get Element Count   ${PayerDashboard_ADJUSTMENTS_Filter_DAYSSINCEDJUSTMENTREQUESTED_DropDown_Locator}
    Run Keyword If    ${c} > 0   Select From List By Value    ${PayerDashboard_ADJUSTMENTS_Filter_DAYSSINCEDJUSTMENTREQUESTED_DropDown_Locator}      ${Payer_DAYS_SINCE_ADJUSTMENT_REQUESTED_TODAY}

Verify data after applying filter Functionality by providing DAYS SINCE ADJUSTMENT REQUESTED - >5
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_Outstanding_Adjustment_NumberOfFilterResults_Locator}
    IF   ${present} == True



    FOR    ${data}    IN    @{data_list}
    ${ready_for_adjustment_date}    Set Variable    ${data['ReadyForAdjustmentDate']}
    ${adjusted_date}    Set Variable    ${ready_for_adjustment_date.split('.')[0]}
    ${formattedAdjustmentDate}             TestDataFormatter.formatDate           ${adjusted_date}
    ${Days_Since_Request_date}    FindDateDifference    ${formattedAdjustmentDate}
    Exit For Loop If    ${Days_Since_Request_date} > 5
    END

        ${Days_Since_Request_dateStr}    Convert To String    ${Days_Since_Request_date}
        ${PayerDashboard_ADJUSTMENTS_Filter_DAYSSINCEDJUSTMENTREQUESTED_TODAY_result_locator_New}=     Replace String      ${PayerDashboard_ADJUSTMENTS_Filter_DAYSSINCEDJUSTMENTREQUESTED_TODAY_result_locator}   ${substringToReplace}   ${Days_Since_Request_dateStr}
       Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENTS_Filter_DAYSSINCEDJUSTMENTREQUESTED_TODAY_result_locator_New}     timeout=60
       Element Should Be Visible        ${PayerDashboard_ADJUSTMENTS_Filter_DAYSSINCEDJUSTMENTREQUESTED_TODAY_result_locator_New}

    ELSE
                Page should contain         There are no Outstanding Adjustment Requests which meet the criteria.
    END

Selects Item Per Page as 5
    [Arguments]     ${option}
    ${IPP} =  Get Element Count   ${AuditHistory_ItemsPerPage_Dropdown_Locator}
    Run Keyword If    ${IPP} > 0   Select From List By label    ${AuditHistory_ItemsPerPage_Dropdown_Locator}   ${option}
    sleep   2

Verifies Adjustments page displays 5 records
    [Arguments]     ${option}
    wait until Element is Visible       ${AuditHistory_PatientsName_Table_Locator}
    ${element_count}=    get element count     ${AuditHistory_PatientsName_Table_Locator}
    should be true         ${element_count}<=${option}









#AN
Scroll down to the ADJUSTMENT REASON
    Element Should Be Visible    ${BillingAnalyst_AppealFindings_Cancel_Button_Locator}     timeout=120
    Scroll Element Into View    ${BillingAnalyst_AppealFindings_Cancel_Button_Locator}

Click on Change Adjustment Amount Tab
    Wait Until Element Is Visible      ${Comm_Portal_Outstanding_Dashboard_Change_Adjustment_amount_Button_Locator}
    Element Should Be Visible          ${Comm_Portal_Outstanding_Dashboard_Change_Adjustment_amount_Button_Locator}
    Click Button                        ${Comm_Portal_Outstanding_Dashboard_Change_Adjustment_amount_Button_Locator}

Verify Comments and Authorized eSignature panel is displayed with details

    Wait Until Element Is Visible        ${PayerDashboard_AdjustmentInfo_Comments_Authorized_eSignaturePanel_Locator}
    Element Should Be Visible            ${PayerDashboard_AdjustmentInfo_Comments_Authorized_eSignaturePanel_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_AdjustmentInfo_CommenteSignature_ORIGINALCHARGES_Locator}
    Element Should Be Visible            ${PayerDashboard_AdjustmentInfo_CommenteSignature_ORIGINALCHARGES_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_AdjustmentInfo_CommenteSignature_ORIGINALGROSSPAY_Locator}
    Element Should Be Visible            ${PayerDashboard_AdjustmentInfo_CommenteSignature_ORIGINALGROSSPAY_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_AdjustmentInfo_CommenteSignature_ORIGINALNETPAY_Locator}
    Element Should Be Visible            ${PayerDashboard_AdjustmentInfo_CommenteSignature_ORIGINALNETPAY_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_AdjustmentInfo_CommenteSignature_CGIIDENTIFIEDGROSSPAY_Locator}
    Element Should Be Visible            ${PayerDashboard_AdjustmentInfo_CommenteSignature_CGIIDENTIFIEDGROSSPAY_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_AdjustmentInfo_CommenteSignature_CGIIDENTIFIEDNETPAY_Locator}
    Element Should Be Visible            ${PayerDashboard_AdjustmentInfo_CommenteSignature_CGIIDENTIFIEDNETPAY_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_AdjustmentInfo_CommenteSignature_PAYERCONFIRMEDPAY_Locator}
    Element Should Be Visible            ${PayerDashboard_AdjustmentInfo_CommenteSignature_PAYERCONFIRMEDPAY_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_AdjustmentInfo_CommenteSignature_PAYERCONFIRMEDSAVINGS_Locator}
    Element Should Be Visible            ${PayerDashboard_AdjustmentInfo_CommenteSignature_PAYERCONFIRMEDSAVINGS_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_AdjustmentInfo_CommenteSignature_CGICOMMISSION_Locator}
    Element Should Be Visible            ${PayerDashboard_AdjustmentInfo_CommenteSignature_CGICOMMISSION_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_AdjustmentInfo_CommenteSignature_PAYERCONFIRMEDNETSAVINGS_Locator}
    Element Should Be Visible            ${PayerDashboard_AdjustmentInfo_CommenteSignature_PAYERCONFIRMEDNETSAVINGS_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_AdjustmentInfo_CommenteSignature_ADJUSTMENTREASON_Locator}
    Element Should Be Visible            ${PayerDashboard_AdjustmentInfo_CommenteSignature_ADJUSTMENTREASON_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_AdjustmentInfo_Comments_Authorized_Esignature_Locator}
    Element Should Be Visible            ${PayerDashboard_AdjustmentInfo_Comments_Authorized_Esignature_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_AdjustmentInfo_Comments_Authorized_Title_Locator}
    Element Should Be Visible            ${PayerDashboard_AdjustmentInfo_Comments_Authorized_Title_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_AdjustmentInfo_Comments_Authorized_Date_Locator}
    Element Should Be Visible            ${PayerDashboard_AdjustmentInfo_Comments_Authorized_Date_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_AdjustmentInfo_ChangeAdjustmentAmountButton_Locator}
    Element Should Be Visible            ${PayerDashboard_AdjustmentInfo_ChangeAdjustmentAmountButton_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_AdjustmentInfo_CancelButton_Locator}
    Element Should Be Visible            ${PayerDashboard_AdjustmentInfo_CancelButton_Locator}

Verify Authorized eSignature details are autofilled
    Textfield Value Should Be     ${ PayerDashboard_AdjustmentInfo_Comments_Authorized_Esignature_Locator}    ${Payer_Esignature}
    Textfield Value Should Be   ${PayerDashboard_AdjustmentInfo_Comments_Authorized_Title_Locator}        ${Payer_Title}
    ${date}=      Get Current Date     result_format=%Y-%m-%d
    Textfield Value Should Be     ${PayerDashboard_AdjustmentInfo_Comments_Authorized_Date_Locator}    ${date}



Verify user is able to change the adjustment Amount
    Wait Until Element Is Visible           ${PayerDashboard_AdjustmentInfo_CommenteSignature_PAYERCONFIRMEDPAY_Locator}            timeout=120
    Element Should Be Visible               ${PayerDashboard_AdjustmentInfo_CommenteSignature_PAYERCONFIRMEDPAY_Locator}
    Wait Until Element Is Visible           ${PayerDashboard_AdjustmentInfo_CommenteSignature_PAYERCONFIRMEDPAY_Input_Locator}       timeout=120
    Element Should Be Visible               ${PayerDashboard_AdjustmentInfo_CommenteSignature_PAYERCONFIRMEDPAY_Input_Locator}
    Sleep    5
    ${PayerConfirmedPay}             TestDataFormatter.truncate_trailing_zeros           ${Payer_data_list[0]['NewGrossPay']}
    Set Global Variable  ${PayerConfirmedPay}
    log         ${Payer_data_list[0]['NewGrossPay']}
    log         ${PayerConfirmedPay}
    Textfield Value Should Be          ${PayerDashboard_AdjustmentInfo_CommenteSignature_PAYERCONFIRMEDPAY_Input_Locator}                ${PayerConfirmedPay}
#   ${Old_PAYER_CONFIRMED_PAY}=  get element attribute          ${PayerDashboard_AdjustmentInfo_CommenteSignature_PAYERCONFIRMEDPAY_Input_Locator}               timeout=120

    ${PayerConfirmedPay_number}=       convert to number   ${PayerConfirmedPay}

    ${RandomNumbertoInput}=     Generate Random Number Less Than    ${PayerConfirmedPay_number}
    Set Global Variable     ${RandomNumbertoInput}
    Input Text                  ${PayerDashboard_AdjustmentInfo_CommenteSignature_PAYERCONFIRMEDPAY_Input_Locator}                        ${RandomNumbertoInput}
    Sleep  2
    ${PayerDashboard_OutstandingAdjustment_AdjustmentDetails_Payer_confirmed_Savings_Amount} =  Get Value        ${PayerDashboard_OutstandingAdjustment_AdjustmentDetails_Payer_confirmed_Savings}
    ${PayerDashboard_OutstandingAdjustment_AdjustmentDetails_Payer_confirmed_Savings_Amount_number}=            Convert to Number       ${PayerDashboard_OutstandingAdjustment_AdjustmentDetails_Payer_confirmed_Savings_Amount}

    ${PayerDashboard_OutstandingAdjustment_AdjustmentDetails_Payer_confirmed_Savings_Amount_Expected}=    Subtract Currency Values        ${Payer_data_list[0]['OriginalGrossPay']}      ${RandomNumbertoInput}
    Should be equal as numbers          ${PayerDashboard_OutstandingAdjustment_AdjustmentDetails_Payer_confirmed_Savings_Amount_Expected}       ${PayerDashboard_OutstandingAdjustment_AdjustmentDetails_Payer_confirmed_Savings_Amount_number}

    ${PayerDashboard_OutstandingAdjustment_AdjustmentDetails_CGIComission_Amount}=  Get Value        ${PayerDashboard_OutstandingAdjustment_AdjustmentDetails_CGIComission}
    ${PayerDashboard_OutstandingAdjustment_AdjustmentDetails_CGIComission_Amount_number}=           Convert to Number       ${PayerDashboard_OutstandingAdjustment_AdjustmentDetails_CGIComission_Amount}
    ${PayerDashboard_OutstandingAdjustment_AdjustmentDetails_CGIComission_Amount_expected}     TestDataFormatter.multiply_by_015     ${PayerDashboard_OutstandingAdjustment_AdjustmentDetails_Payer_confirmed_Savings_Amount_Expected}

    Should be equal as numbers        ${PayerDashboard_OutstandingAdjustment_AdjustmentDetails_CGIComission_Amount_expected}        ${PayerDashboard_OutstandingAdjustment_AdjustmentDetails_CGIComission_Amount_number}

    ${PayerDashboard_OutstandingAdjustment_AdjustmentDetails_Payer_confirmed_Gross_Savings_Amount}=  Get Value        ${PayerDashboard_OutstandingAdjustment_AdjustmentDetails_Payer_confirmed_Gross_Savings}
    ${PayerDashboard_OutstandingAdjustment_AdjustmentDetails_Payer_confirmed_Gross_Savings_Amount_number}=          Convert To Number     ${PayerDashboard_OutstandingAdjustment_AdjustmentDetails_Payer_confirmed_Gross_Savings_Amount}
    ${PayerDashboard_OutstandingAdjustment_AdjustmentDetails_Payer_confirmed_Gross_Savings_Amount_Expected}=     Subtract Currency Values       ${PayerDashboard_OutstandingAdjustment_AdjustmentDetails_Payer_confirmed_Savings_Amount_Expected}     ${PayerDashboard_OutstandingAdjustment_AdjustmentDetails_CGIComission_Amount_expected}

    Should be equal as numbers          ${PayerDashboard_OutstandingAdjustment_AdjustmentDetails_Payer_confirmed_Gross_Savings_Amount_Expected}     ${PayerDashboard_OutstandingAdjustment_AdjustmentDetails_Payer_confirmed_Gross_Savings_Amount_number}

    Wait Until Element Is Visible          ${PayerDashboard_AdjustmentInfo_CommenteSignature_ADJUSTMENTREASON_TextArea_Locator}
    Element Should Be Visible              ${PayerDashboard_AdjustmentInfo_CommenteSignature_ADJUSTMENTREASON_TextArea_Locator}
    Input Text                        ${PayerDashboard_AdjustmentInfo_CommenteSignature_ADJUSTMENTREASON_TextArea_Locator}                  ${Adjustment Reason}

Subtract Currency Values
    [Arguments]    ${value1}    ${value2}
    ${numeric_value1} =    Convert To Number    ${value1}
    ${numeric_value2} =    Convert To Number    ${value2}
    ${result} =    Evaluate    ${numeric_value1} - ${numeric_value2}
    [Return]    ${result}

Click on Change Adjustment Amount Button and click yes button
    Wait Until Element Is Visible          ${PayerDashboard_AdjustmentInfo_ChangeAdjustmentAmountButton_Locator}                   timeout=120
    Element Should Be Visible              ${PayerDashboard_AdjustmentInfo_ChangeAdjustmentAmountButton_Locator}
    Click Button                           ${PayerDashboard_AdjustmentInfo_ChangeAdjustmentAmountButton_Locator}
    Sleep    5
    Wait Until Element Is Visible           ${PayerDashboard_ChangeAdjustmentButton_CONFIRMADJUSTMENTCHANGE_PopUp_Yes_Locator}
    Element Should Be Visible               ${PayerDashboard_ChangeAdjustmentButton_CONFIRMADJUSTMENTCHANGE_PopUp_Yes_Locator}
    Click Button                           ${PayerDashboard_ChangeAdjustmentButton_CONFIRMADJUSTMENTCHANGE_PopUp_Yes_Locator}
    Sleep    10

Verify Confirmation PopUp with message
    Wait Until Element Is Visible            ${PayerDashboard_ChangeAdjustmentButton_Confirmation_PopUp_Head_Locator}
    Element Should Be Visible                ${PayerDashboard_ChangeAdjustmentButton_Confirmation_PopUp_Head_Locator}
    Wait Until Element Is Visible            ${PayerDashboard_ChangeAdjustmentButton_Confirmation_PopUp_Body_Locator}
    Element Should Be Visible                ${PayerDashboard_ChangeAdjustmentButton_Confirmation_PopUp_Body_Locator}
    ${PayerDashboard_ChangeAdjustmentButton_Confirmation_PopUp_Body_Locator}=        Get Text            ${PayerDashboard_ChangeAdjustmentButton_Confirmation_PopUp_Body_Locator}
    Should Contain            ${PayerDashboard_ChangeAdjustmentButton_Confirmation_PopUp_Body_Locator}           You have successfully changed the adjustment amount from  ${PayerConfirmedPay} to  ${RandomNumbertoInput}
    Should Contain            ${PayerDashboard_ChangeAdjustmentButton_Confirmation_PopUp_Body_Locator}           The new adjustment amount is reflected in your claims history.

Verify Change Adjustment Amount button is enabled
    Wait Until Element Is Visible          ${PayerDashboard_AdjustmentInfo_CommenteSignature_ADJUSTMENTREASON_TextArea_Locator}
    Element Should Be Visible              ${PayerDashboard_AdjustmentInfo_CommenteSignature_ADJUSTMENTREASON_TextArea_Locator}
    Input Text                        ${PayerDashboard_AdjustmentInfo_CommenteSignature_ADJUSTMENTREASON_TextArea_Locator}                  ${Adjustment Reason}
    Wait Until Element Is Visible          ${PayerDashboard_AdjustmentInfo_ChangeAdjustmentAmountButton_Locator}                   timeout=120
    Element Should Be Visible              ${PayerDashboard_AdjustmentInfo_ChangeAdjustmentAmountButton_Locator}
    Element Should be enabled              ${PayerDashboard_AdjustmentInfo_ChangeAdjustmentAmountButton_Locator}

Click on Deny Adjustment Tab and Enter Reason
    Wait Until Element Is Visible     ${Comm_Portal_Outstanding_Dashboard_Deny_Adjustment_Button_Locator}            timeout=120
    Element Should Be Visible          ${Comm_Portal_Outstanding_Dashboard_Deny_Adjustment_Button_Locator}
    Click Button                       ${Comm_Portal_Outstanding_Dashboard_Deny_Adjustment_Button_Locator}
    Wait Until Element Is Visible       ${PayerDashboard_DenyAdjustmentReason_Textfield_Locator}
    Element Should Be Visible           ${PayerDashboard_DenyAdjustmentReason_Textfield_Locator}
    Input Text                          ${PayerDashboard_DenyAdjustmentReason_Textfield_Locator}       ${Deny Adjustment Reason}

Click on Deny Adjustment Button
    Wait Until Element Is Visible     ${PayerDashboard_DenyAdjustmentButton_Locator}            timeout=120
    Element Should Be Visible         ${PayerDashboard_DenyAdjustmentButton_Locator}
    Click Button                      ${PayerDashboard_DenyAdjustmentButton_Locator}

Verify CONFIRM DENY ADJUSTMENT Popup
    Wait Until Element Is Visible            ${PayerDashboard_DenyAdjustmentButton_CONFIRMDENYADJUSTMENT_PopUp_Head_Locator}
    Element Should Be Visible                ${PayerDashboard_DenyAdjustmentButton_CONFIRMDENYADJUSTMENT_PopUp_Head_Locator}
    Wait Until Element Is Visible            ${PayerDashboard_DenyAdjustmentButton_CONFIRMDENYADJUSTMENT_PopUp_Body_Locator}
    Element Should Be Visible                ${PayerDashboard_DenyAdjustmentButton_CONFIRMDENYADJUSTMENT_PopUp_Body_Locator}
    ${PayerDashboard_DenyAdjustmentButton_CONFIRMDENYADJUSTMENT_PopUp_Body_Locator}=        Get Text            ${PayerDashboard_DenyAdjustmentButton_CONFIRMDENYADJUSTMENT_PopUp_Body_Locator}
    Should Contain            ${PayerDashboard_DenyAdjustmentButton_CONFIRMDENYADJUSTMENT_PopUp_Body_Locator}           Are you ready to deny the adjustment?

Click on Yes Button and Verify Confirmation Message
    Wait Until Element Is Visible          ${PayerDashboard_DenyAdjustmentButton_CONFIRMDENYADJUSTMENT_PopUp_YesButton_Locator}
    Click Button                            ${PayerDashboard_DenyAdjustmentButton_CONFIRMDENYADJUSTMENT_PopUp_YesButton_Locator}
    Sleep    2
    Wait Until Element Is Visible           ${PayerDashboard_DenyAdjustmentButton_Confirmation_PopUp_Head_Locator}
    Element Should Be Visible               ${PayerDashboard_DenyAdjustmentButton_Confirmation_PopUp_Head_Locator}
    Wait Until Element Is Visible           ${PayerDashboard_DenyAdjustmentButton_Confirmation_PopUp_Body_Locator}
    Element Should Be Visible               ${PayerDashboard_DenyAdjustmentButton_Confirmation_PopUp_Body_Locator}
    ${PayerDashboard_DenyAdjustmentButton_Confirmation_PopUp_Body_Locator}=        Get Text            ${PayerDashboard_DenyAdjustmentButton_Confirmation_PopUp_Body_Locator}
    Should Contain            ${PayerDashboard_DenyAdjustmentButton_Confirmation_PopUp_Body_Locator}            You have successfully denied the adjustment.

Verify User is able to see Outstanding Claims, Overview and Monthly Savings Graph
    Wait Until Element Is Visible       ${Comm_Portal_Payer_View_Claims_button_Locator}             timeout=120
    Element Should Be Visible                    ${Comm_Portal_Payer_View_Claims_button_Locator}
    Wait Until Element Is Visible       ${PayerDashboard_Outstanding_Claim_Title_Locator}               timeout=120
    Element Should Be Visible           ${PayerDashboard_Outstanding_Claim_Title_Locator}
    Wait Until Element Is Visible       ${PayerDashboard_Outstanding_Calim_Overview_Title_Locator}
    Element Should Be Visible           ${PayerDashboard_Outstanding_Calim_Overview_Title_Locator}
    Wait Until Element Is Visible       ${PayerDashboard_Outstanding_Calim_MONTHLYSAVINGS_Title_Locator}        timeout=120
    Element Should Be Visible           ${PayerDashboard_Outstanding_Calim_MONTHLYSAVINGS_Title_Locator}

Scroll down to the Deny Adjustment Button
    Element Should Be Visible         ${PayerDashboard_DenyAdjustmentButton_Locator}        timeout=120
    Scroll Element Into View          ${PayerDashboard_DenyAdjustmentButton_Locator}

Click on DenyAdjustment Cancel Button
    Wait Until Element Is Visible   ${PayerDashboard_DenyAdjustment_Cancel_Button_Locator}
    Element Should Be Visible       ${PayerDashboard_DenyAdjustment_Cancel_Button_Locator}              timeout=120
    Click Button                    ${PayerDashboard_DenyAdjustment_Cancel_Button_Locator}

Verify Comments and Authorized eSignature panel is Not displayed
    Element Should Not Be Visible       ${PayerDashboard_DenyAdjustment_Comments_Authorized_eSignaturePanel_Locator}

Verify that the following Columns are displayed
    Sleep   10
    Wait Until Element Is Visible        ${PayerDashboard_OUTSTANDINGADJUSTMENTS_CLAIM_NUMBER_ColumnHeader_Locator}                             timeout=30
    Element Should Be Visible            ${PayerDashboard_OUTSTANDINGADJUSTMENTS_CLAIM_NUMBER_ColumnHeader_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_OUTSTANDINGADJUSTMENTS_DAYS_SINCE_REQUEST_DATE_ColumnHeader_Locator}                  timeout=30
    Element Should Be Visible            ${PayerDashboard_OUTSTANDINGADJUSTMENTS_DAYS_SINCE_REQUEST_DATE_ColumnHeader_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_OUTSTANDINGADJUSTMENTS_ADJUSTMENT_REQUEST_DATE_ColumnHeader_Locator}                timeout=30
    Element Should Be Visible            ${PayerDashboard_OUTSTANDINGADJUSTMENTS_ADJUSTMENT_REQUEST_DATE_ColumnHeader_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_OUTSTANDINGADJUSTMENTS_PROVIDER_NAME_ColumnHeader_Locator}                                    timeout=30
    Element Should Be Visible            ${PayerDashboard_OUTSTANDINGADJUSTMENTS_PROVIDER_NAME_ColumnHeader_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_OUTSTANDINGADJUSTMENTS_PROVIDER_NUMBER_ColumnHeader_Locator}
    Element Should Be Visible            ${PayerDashboard_OUTSTANDINGADJUSTMENTS_PROVIDER_NUMBER_ColumnHeader_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_OUTSTANDINGADJUSTMENTS_AUDIT_STATUS_ColumnHeader_Locator}
    Element Should Be Visible            ${PayerDashboard_OUTSTANDINGADJUSTMENTS_AUDIT_STATUS_ColumnHeader_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_OUTSTANDINGADJUSTMENTS_AUDIT_NUMBER_ColumnHeader_Locator}
    Element Should Be Visible            ${PayerDashboard_OUTSTANDINGADJUSTMENTS_AUDIT_NUMBER_ColumnHeader_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_OUTSTANDINGADJUSTMENTS_AUDIT_TYPE_ColumnHeader_Locator}
    Element Should Be Visible            ${PayerDashboard_OUTSTANDINGADJUSTMENTS_AUDIT_TYPE_ColumnHeader_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_OUTSTANDINGADJUSTMENTS_IDENTIFIED_SAVINGS_ColumnHeader_Locator}
    Element Should Be Visible            ${PayerDashboard_OUTSTANDINGADJUSTMENTS_IDENTIFIED_SAVINGS_ColumnHeader_Locator}
    Wait Until Element Is Visible        ${PayerDashboard_OUTSTANDINGADJUSTMENTS_CONFIRMED_SAVINGS_ColumnHeader_Locator}
    Element Should Be Visible            ${PayerDashboard_OUTSTANDINGADJUSTMENTS_CONFIRMED_SAVINGS_ColumnHeader_Locator}


Click on Adjustment History Button
    Wait Until Element Is Visible                  ${PayerDashboard_Adjustment_History_Button}        timeout=120
    Element Should Be Visible                      ${PayerDashboard_Adjustment_History_Button}
    Click Element                                  ${PayerDashboard_Adjustment_History_Button}
    Sleep    5

Click ClaimNumber in Adjustment History page

        sleep   1
        Verify Claim Number On Current Page else go to next page
        Wait Until Element Is Visible   ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator_New}    timeout=120
        Click Element       ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator_New}
        sleep   2

Verify Adjustment details is visible in ADJUSTMENT HISTORY Page

    ${PatientName}             TestDataFormatter.formatPatientName          ${data_list[0]['PatientFirstName']}    ${data_list[0]['PatientLastName']}
    ${PayerDashboard_AdjustmentInfo_PatientName_Header_Locator_New} =  Replace String   ${PayerDashboard_AdjustmentInfo_PatientName_Header_Locator}  ${substringToReplace}  ${PatientName}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_PatientName_Header_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_PatientName_Header_Locator_New}

    ${formattedDOB}             TestDataFormatter.formatDate           ${data_list[0]['DateOfBirth']}
   ${PayerDashboard_AdjustmentInfo_DOB_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_DOB_Detail_Locator}   ${substringToReplace}    ${formattedDOB}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_DOB_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_DOB_Detail_Locator_New}

    #${formattedSubsriberID}             TestDataFormatter.formatSubscriberID           ${data_list[0]['SubscriberId']}
   ${PayerDashboard_AdjustmentInfo_SubscriberID_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_SubscriberID_Detail_Locator}   ${substringToReplace}    ${data_list[0]['SubscriberId']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_SubscriberID_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_SubscriberID_Detail_Locator_New}

   ${PayerDashboard_AdjustmentInfo_GroupID_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_GroupID_Detail_Locator}   ${substringToReplace}    ${data_list[0]['PolicyNumber']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_GroupID_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_GroupID_Detail_Locator_New}

    ${PayerDashboard_AdjustmentInfo_AuditNum_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_AuditNum_Detail_Locator}     ${substringToReplace}    ${data_list[0]['AuditNumber']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_AuditNum_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_AuditNum_Detail_Locator_New}

    ${PayerDashboard_AdjustmentInfo_AuditType_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_AuditType_Detail_Locator}     ${substringToReplace}    ${data_list[0]['AuditType']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_AuditType_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_AuditType_Detail_Locator_New}

    ${formattedAuditStatus}             TestDataFormatter.formatAuditStatus           ${data_list[0]['AuditStatus']}
    ${PayerDashboard_AdjustmentInfo_AuditStatus_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_AuditStatus_Detail_Locator}     ${substringToReplace}    ${formattedAuditStatus}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_AuditStatus_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_AuditStatus_Detail_Locator_New}

    ${PayerDashboard_AdjustmentInfo_ProviderName_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_ProviderName_Detail_Locator}     ${substringToReplace}    ${data_list[0]['ProviderName']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_ProviderName_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_ProviderName_Detail_Locator_New}

   ${PayerDashboard_AdjustmentInfo_ProviderNumber_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_ProviderNumber_Detail_Locator}     ${substringToReplace}    ${data_list[0]['BillingProviderNumber']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_ProviderNumber_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_ProviderNumber_Detail_Locator_New}

   ${PayerDashboard_AdjustmentInfo_ClaimNum_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_ClaimNum_Detail_Locator}     ${substringToReplace}    ${data_list[0]['ClaimNumber']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_ClaimNum_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_ClaimNum_Detail_Locator_New}

#   ${PayerDashboard_AdjustmentInfo_MediRecNum_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_MediRecNum_Detail_Locator}     ${substringToReplace}    ${data_list[0]['MRNumber']}
#   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_MediRecNum_Detail_Locator_New}
#   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_MediRecNum_Detail_Locator_New}

   ${formattedAdmitDate}             TestDataFormatter.formatDate           ${data_list[0]['AdmitDate']}
   ${PayerDashboard_AdjustmentInfo_AdmitDate_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_AdmitDate_Detail_Locator}   ${substringToReplace}    ${formattedAdmitDate}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_AdmitDate_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_AdmitDate_Detail_Locator_New}

   ${formattedDischargeDate}             TestDataFormatter.formatDate           ${data_list[0]['DischargeDate']}
   ${PayerDashboard_AdjustmentInfo_DischargeDate_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_DischargeDate_Detail_Locator}   ${substringToReplace}    ${formattedDischargeDate}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_DischargeDate_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_DischargeDate_Detail_Locator_New}

    ${formattedPaidDateDate}             TestDataFormatter.formatDate           ${data_list[0]['PaidDate']}
   ${PayerDashboard_AdjustmentInfo_PaidDate_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_PaidDate_Detail_Locator}   ${substringToReplace}    ${formattedPaidDateDate}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_PaidDate_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_PaidDate_Detail_Locator_New}


     ${adjusted_date}    Set Variable    ${data_list[0]['ReadyForAdjustmentDate'].split('.')[0]}
   ${formattedAdjustmentDate}             TestDataFormatter.formatDate           ${adjusted_date}
   ${PayerDashboard_AdjustmentInfo_AdjustmentRequested_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_AdjustmentRequested_Detail_Locator}   ${substringToReplace}    ${formattedAdjustmentDate}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_AdjustmentRequested_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_AdjustmentRequested_Detail_Locator_New}

   ${formattedOriginalGrossPay}             TestDataFormatter.formatToCurrency           ${Payer_data_list[0]['OriginalGrossPay']}
   ${PayerDashboard_AdjustmentInfo_Original_Gross_Pay_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Original_Gross_Pay_Detail_Locator}   ${substringToReplace}    ${formattedOriginalGrossPay}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Original_Gross_Pay_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Original_Gross_Pay_Detail_Locator_New}

   ${formattedOriginalNetPay}             TestDataFormatter.formatToCurrency           ${Payer_data_list[0]['OriginalNetPay']}
   ${PayerDashboard_AdjustmentInfo_Original_Net_Pay_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Original_Net_Pay_Detail_Locator}   ${substringToReplace}    ${formattedOriginalNetPay}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Original_Net_Pay_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Original_Net_Pay_Detail_Locator_New}


   ${formattedIdentifiedGrossPay}             TestDataFormatter.formatToCurrency           ${Payer_data_list[0]['NewGrossPay']}
   ${PayerDashboard_AdjustmentInfo_Identified_Gross_Pay_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Identified_Gross_Pay_Detail_Locator}   ${substringToReplace}    ${formattedIdentifiedGrossPay}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Identified_Gross_Pay_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Identified_Gross_Pay_Detail_Locator_New}


    ${formattedIdentifiedNetPay}             TestDataFormatter.formatToCurrency           ${Payer_data_list[0]['NewNetPay']}
   ${PayerDashboard_AdjustmentInfo_Identified_Net_Pay_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Identified_Net_Pay_Detail_Locator}   ${substringToReplace}    ${formattedIdentifiedNetPay}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Identified_Net_Pay_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Identified_Net_Pay_Detail_Locator_New}

   ${VerifiedAdjustor}             TestDataFormatter.VerifyIfNull           ${data_list[0]['Adjustor']}
   ${PayerDashboard_AdjustmentInfo_Adjustor_Name_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Adjustor_Name_Detail_Locator}   ${substringToReplace}    ${VerifiedAdjustor}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Adjustor_Name_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Adjustor_Name_Detail_Locator_New}

   ${VerifiedAdjustmentDate}             TestDataFormatter.VerifyIfNull           ${data_list[0]['AdjustmentDate']}
   ${PayerDashboard_AdjustmentInfo_Adjustment_date_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Adjustment_date_Detail_Locator}   ${substringToReplace}    ${VerifiedAdjustmentDate}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Adjustment_date_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Adjustment_date_Detail_Locator_New}

##   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Payer_Confirmed_Pay_Detail_Locator}
##   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Payer_Confirmed_Pay_Detail_Locator}
##   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Payer_Confirmed_Savings_Detail_Locator}
##   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Payer_Confirmed_Savings_Detail_Locator}

    ${PayerDashboard_AdjustmentInfo_Region_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Region_Detail_Locator}   ${substringToReplace}    ${data_list[0]['Region']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Region_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Region_Detail_Locator_New}

   ${PayerDashboard_AdjustmentInfo_DivisionCode_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_DivisionCode_Detail_Locator}   ${substringToReplace}    ${data_list[0]['DivisionCode']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_DivisionCode_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_DivisionCode_Detail_Locator_New}

   ${VerifiedReferenceClaim}             TestDataFormatter.VerifyIfNull           ${data_list[0]['ReferenceClaim']}
   ${PayerDashboard_AdjustmentInfo_Reference_Claim_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Reference_Claim_Detail_Locator}   ${substringToReplace}    ${VerifiedReferenceClaim}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Reference_Claim_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Reference_Claim_Detail_Locator_New}

     ${formattedFindingsLetterDate}             TestDataFormatter.formatDate           ${data_list[0]['FindingLettersDate']}
   ${PayerDashboard_AdjustmentInfo_Findings_Letter_Date_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Findings_Letter_Date_Detail_Locator}   ${substringToReplace}     ${formattedFindingsLetterDate}
   Scroll element into view     ${PayerDashboard_AdjustmentInfo_Findings_Letter_Date_Detail_Locator_New}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Findings_Letter_Date_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Findings_Letter_Date_Detail_Locator_New}

   Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_REASON_Header_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_REASON_Header_Locator}

    IF	 '$Client_Name == "HMBCBS" or "GATEW"'
    ${TextToReplace}=    Set Variable       adjustment details
    ELSE
	${TextToReplace}=     Set Variable      adjustment summary
	END

	 ${PayerDashboard_AdjustmentDetail_Header_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentDetail_Header_Locator}   ${substringToReplace}     ${TextToReplace}

   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentDetail_Header_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentDetail_Header_Locator_New}


   Wait Until Element Is Visible    ${PayerDashboard_FindingsComment_Header_Locator}
   Element Should Be Visible      ${PayerDashboard_FindingsComment_Header_Locator}

   Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_REASON_Header_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_REASON_Header_Locator}


Click on Filter Icon of OUTSTANDING ADJUSTMENTS
    Wait Until Element Is Visible            ${PayerDashboard_OUTSTANDING_ADJUSTMENTS_FilterButton_Locator}                 timeout=120
    Element Should Be Visible                ${PayerDashboard_OUTSTANDING_ADJUSTMENTS_FilterButton_Locator}
    Click Element                            ${PayerDashboard_OUTSTANDING_ADJUSTMENTS_FilterButton_Locator}

Verify On Outstanding Adjustment page,below filter panel has follwing filter fields
    Wait Until Element Is Visible           ${PayerDashboard_OUTSTANDING_ADJUSTMENTS_Filter_ClaimNumberLabel_Locator}
    Element Should Be Visible               ${PayerDashboard_OUTSTANDING_ADJUSTMENTS_Filter_ClaimNumberLabel_Locator}
    Wait Until Element Is Visible           ${PayerDashboard_OUTSTANDING_ADJUSTMENTS_Filter_AuditNumberLabel_Locator}
    Element Should Be Visible               ${PayerDashboard_OUTSTANDING_ADJUSTMENTS_Filter_AuditNumberLabel_Locator}
    Wait Until Element Is Visible           ${PayerDashboard_OUTSTANDING_ADJUSTMENTS_Filter_ClaimTypeLabel_Locator}
    Element Should Be Visible               ${PayerDashboard_OUTSTANDING_ADJUSTMENTS_Filter_ClaimTypeLabel_Locator}
    Wait Until Element Is Visible           ${PayerDashboard_OUTSTANDING_ADJUSTMENTS_Filter_ProviderNumberLabel_Locator}
    Element Should Be Visible               ${PayerDashboard_OUTSTANDING_ADJUSTMENTS_Filter_ProviderNumberLabel_Locator}
    Wait Until Element Is Visible           ${PayerDashboard_OUTSTANDING_ADJUSTMENTS_Filter_DAYSSINCEDJUSTMENTREQUESTEDLabel_Locator}
    Element Should Be Visible               ${PayerDashboard_OUTSTANDING_ADJUSTMENTS_Filter_DAYSSINCEDJUSTMENTREQUESTEDLabel_Locator}
    Wait Until Element Is Visible           ${PayerDashboard_OUTSTANDING_ADJUSTMENTS_Filter_ClearFilter_Button_Locator}
    Element Should Be Visible               ${PayerDashboard_OUTSTANDING_ADJUSTMENTS_Filter_ClearFilter_Button_Locator}
    Wait Until Element Is Visible           ${PayerDashboard_OUTSTANDING_ADJUSTMENTS_Filter_ApplyFilter_Button_Locator}
    Element Should Be Visible               ${PayerDashboard_OUTSTANDING_ADJUSTMENTS_Filter_ApplyFilter_Button_Locator}

Click on Filter Icon of Adjustment History
    Wait Until Element Is Visible            ${PayerDashboard_ADJUSTMENT_HISTORY_Filter_Button_Locator}                 timeout=120
    Element Should Be Visible                ${PayerDashboard_ADJUSTMENT_HISTORY_Filter_Button_Locator}
    Click Element                            ${PayerDashboard_ADJUSTMENT_HISTORY_Filter_Button_Locator}

Verify that the following Columns are displayed on Adjustment History Page
    Wait Until Element Is Visible            ${PayerDashboard_ADJUSTMENT_HISTORY_CLAIM_NUMBER_ColumnHeader_Locator}
    Element Should Be Visible                ${PayerDashboard_ADJUSTMENT_HISTORY_CLAIM_NUMBER_ColumnHeader_Locator}                  timeout=120
    Wait Until Element Is Visible            ${PayerDashboard_ADJUSTMENT_HISTORY_PROVIDER_ColumnHeader_Locator}
    Element Should Be Visible                ${PayerDashboard_ADJUSTMENT_HISTORY_PROVIDER_ColumnHeader_Locator}                             timeout=120
    Wait Until Element Is Visible            ${PayerDashboard_ADJUSTMENT_HISTORY_PROVIDER_NUMBER_ColumnHeader_Locator}
    Element Should Be Visible                ${PayerDashboard_ADJUSTMENT_HISTORY_PROVIDER_NUMBER_ColumnHeader_Locator}                           timeout=60
    Wait Until Element Is Visible            ${PayerDashboard_ADJUSTMENT_HISTORY_STATUS_ColumnHeader_Locator}
    Element Should Be Visible                ${PayerDashboard_ADJUSTMENT_HISTORY_STATUS_ColumnHeader_Locator}                                    timeout=60
    Wait Until Element Is Visible            ${PayerDashboard_ADJUSTMENT_HISTORY_AUDIT_TYPE_ColumnHeader_Locator}
    Element Should Be Visible                ${PayerDashboard_ADJUSTMENT_HISTORY_AUDIT_TYPE_ColumnHeader_Locator}                      timeout=60
    Wait Until Element Is Visible            ${PayerDashboard_ADJUSTMENT_HISTORY_IDENTIFIED_SAVINGS_ColumnHeader_Locator}
    Element Should Be Visible                ${PayerDashboard_ADJUSTMENT_HISTORY_IDENTIFIED_SAVINGS_ColumnHeader_Locator}                       timeout=60
    Wait Until Element Is Visible            ${PayerDashboard_ADJUSTMENT_HISTORY_CONFIRMED_SAVINGS_ColumnHeader_Locator}
    Element Should Be Visible                ${PayerDashboard_ADJUSTMENT_HISTORY_CONFIRMED_SAVINGS_ColumnHeader_Locator}                      timeout=60
    Wait Until Element Is Visible            ${PayerDashboard_ADJUSTMENT_HISTORY_ADJUSTMENT_REQUEST_DATE_ColumnHeader_Locator}
    Element Should Be Visible                ${PayerDashboard_ADJUSTMENT_HISTORY_ADJUSTMENT_REQUEST_DATE_ColumnHeader_Locator}                   timeout=60
    Wait Until Element Is Visible            ${PayerDashboard_ADJUSTMENT_HISTORY_ADJUSTMENT_DATE_ColumnHeader_Locator}
    Element Should Be Visible                ${PayerDashboard_ADJUSTMENT_HISTORY_ADJUSTMENT_DATE_ColumnHeader_Locator}                                  timeout=60
    Wait Until Element Is Visible            ${PayerDashboard_ADJUSTMENT_HISTORY_ADJUSTMENT_USER_ColumnHeader_Locator}
    Element Should Be Visible                ${PayerDashboard_ADJUSTMENT_HISTORY_ADJUSTMENT_USER_ColumnHeader_Locator}                              timeout=60

Verify the Deny Adjustment Button is enabled
    Wait Until Element Is Visible          ${PayerDashboard_DenyAdjustmentButton_Locator}                   timeout=120
    Element Should Be Visible              ${PayerDashboard_DenyAdjustmentButton_Locator}
    Element Should be enabled              ${PayerDashboard_DenyAdjustmentButton_Locator}

Verify that Authorized eSignature Panel is displayed
    Wait Until Element Is Visible               ${PayerDashboard_DenyAdjustment_Comments_Authorized_eSignaturePanel_Locator}
    Element Should Be Visible                   ${PayerDashboard_DenyAdjustment_Comments_Authorized_eSignaturePanel_Locator}
    Wait Until Element Is Visible               ${PayerDashboard_DenyAdjustment_Comments_Authorized_Esignature_Locator}
    Element Should Be Visible                   ${PayerDashboard_DenyAdjustment_Comments_Authorized_Esignature_Locator}
    Wait Until Element Is Visible               ${PayerDashboard_DenyAdjustment_Comments_Authorized_Title_Locator}
    Element Should Be Visible                   ${PayerDashboard_DenyAdjustment_Comments_Authorized_Title_Locator}
    Wait Until Element Is Visible               ${PayerDashboard_DenyAdjustment_Comments_Authorized_Date_Locator}
    Element Should Be Visible                   ${PayerDashboard_DenyAdjustment_Comments_Authorized_Date_Locator}
    Wait Until Element Is Visible               ${PayerDashboard_DenyAdjustment_Comments_Authorized_DenyReason_Locator}
    Element Should Be Visible                   ${PayerDashboard_DenyAdjustment_Comments_Authorized_DenyReason_Locator}


Verify Adjustment History Page is displayed
    Wait Until Element Is Visible               ${PayerDashboard_Adjustment_History_Page_Title_Button_Locator}
    Element Should Be Visible                   ${PayerDashboard_Adjustment_History_Page_Title_Button_Locator}


Click on Outstanding Adjustment Button

    Wait Until Element Is Visible               ${PayerDashboard_OutstandingAdjustment_Button_Locator}
    Element Should Be Visible                   ${PayerDashboard_OutstandingAdjustment_Button_Locator}
    Click Element                               ${PayerDashboard_OutstandingAdjustment_Button_Locator}

Verify Outstanding Adjustment Page is displayed
    Wait Until Element Is Visible               ${PayerDashboard_OutstandingAdjustment_Page_Title_Button_Locator}
    Element Should Be Visible                   ${PayerDashboard_OutstandingAdjustment_Page_Title_Button_Locator}

Scroll down to the Change Adjustment Amount Button
    Element Should Be Visible           ${PayerDashboard_AdjustmentInfo_ChangeAdjustmentAmountButton_Locator}     timeout=120
    Scroll Element Into View            ${PayerDashboard_AdjustmentInfo_ChangeAdjustmentAmountButton_Locator}

Click On Change Adjustment Cancel Button
    Wait Until Element Is Visible               ${PayerDashboard_Change_Adjustment_Cancel_Button_Locator}
    Element Should Be Visible                   ${PayerDashboard_Change_Adjustment_Cancel_Button_Locator}
    Click Element                               ${PayerDashboard_Change_Adjustment_Cancel_Button_Locator}

Double click Claim Number header in Oustanding Adjustment and verify sorting is done in Ascending order

    wait until Element is visible   ${Outstanding_Adjustment_ClaimNumber_Column_Locator}                                timeout=120
    Double Click Element            ${Outstanding_Adjustment_ClaimNumber_Column_Locator}
    sleep   10

    ${element_count}=    get element count     ${Outstanding_Adjustment_ClaimNumber_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${Outstanding_Adjustment_ClaimNumber_Table_Locator} [${i}]
    Run Keyword If    '${get_username}' != ''    Append To List    ${username_list}    ${get_username}
    #Append To List      ${username_list}    ${get_username}
    END
    log      ${username_list}
    ${Sort_order}=  Copy list  ${username_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${username_list}     ${Sort_order}
    sleep   10


Click Days Since Request header in Oustanding Adjustment and verify sorting is done in Ascending order

    wait until Element is visible    	 ${PayerDashboard_OUTSTANDINGADJUSTMENTS_DAYS_SINCE_REQUEST_DATE_ColumnHeader_Locator}       timeout=20
    click Element                  		 ${PayerDashboard_OUTSTANDINGADJUSTMENTS_DAYS_SINCE_REQUEST_DATE_ColumnHeader_Locator}
    click Element                  		 ${PayerDashboard_OUTSTANDINGADJUSTMENTS_DAYS_SINCE_REQUEST_DATE_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${Outstanding_Adjustment_DAYS_Since_Request_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1

    ${get_DaysSinceRequest}=  Get Text      ${Outstanding_Adjustment_DAYS_Since_Request_Table_Locator} [${i}]
    ${get_DaysSinceRequest}=   SPLIT STRING        ${get_DaysSinceRequest}         ${SPACE}
    Run Keyword If    '${get_DaysSinceRequest}[0]' != ''    Append To List      ${username_list}    ${get_DaysSinceRequest}[0]
    END
    log     ${username_list}
#    ${sort_order}=  Evaluate     sorted(${username_list}, key=int, reverse=False)
    ${Sort_order}         Sort List Numerically       ${username_list}
    log      ${sort_order}
    lists should be equal       ${username_list}     ${sort_order}


Click ADJUSTMENT REQUEST DATE header in Oustanding Adjustment and verify sorting is done in Ascending order
    wait until Element is visible            ${PayerDashboard_OUTSTANDINGADJUSTMENTS_ADJUSTMENT_REQUEST_DATE_ColumnHeader_Locator}                                timeout=120
    Double Click Element                     ${PayerDashboard_OUTSTANDINGADJUSTMENTS_ADJUSTMENT_REQUEST_DATE_ColumnHeader_Locator}
#    Click Element                                ${PayerDashboard_OUTSTANDINGADJUSTMENTS_ADJUSTMENT_REQUEST_DATE_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${Outstanding_Adjustment_Adjustment_Request_Date_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${Outstanding_Adjustment_Adjustment_Request_Date_Table_Locator} [${i}]
        IF    '${get_username}' != ''
    ${split_string}=    split string         ${get_username}          -
    ${formatted_input}=   replace string       ${split_string}[0]     ${SPACE}         ${EMPTY}
    ${from_date}=    Convert Date     ${formatted_input}           date_format=%m/%d/%Y
    log     ${from_date}
    Append To List      ${username_list}    ${from_date}
        END

    END
    log      ${username_list}
    ${Sort_order}=  Copy list  ${username_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${username_list}     ${Sort_order}
    sleep   3

Click Provider Name header in Oustanding Adjustment and verify sorting is done in Ascending order
    wait until Element is visible   ${PayerDashboard_OUTSTANDINGADJUSTMENTS_PROVIDER_NAME_ColumnHeader_Locator}                                timeout=120
    Double Click Element                    ${PayerDashboard_OUTSTANDINGADJUSTMENTS_PROVIDER_NAME_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${Outstanding_Adjustment_Provider_Name_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${Outstanding_Adjustment_Provider_Name_Table_Locator} [${i}]
        #IF    '$get_username' != ''
    ${ProviderName}         TestDataFormatter.FormatProviderName         ${get_username}
    log    ${ProviderName}
    Run Keyword If    '${ProviderName}' != ''    Append To List    ${username_list}    ${ProviderName}

        #END
    #Append To List      ${username_list}    ${get_username}
    END
    log      ${username_list}
    ${Sort_order}=  Copy list  ${username_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${username_list}     ${Sort_order}
    sleep   3

Click Provider Number header in Oustanding Adjustment and verify sorting is done in Ascending order
    wait until Element is visible   ${PayerDashboard_OUTSTANDINGADJUSTMENTS_PROVIDER_NUMBER_ColumnHeader_Locator}                                timeout=120
    Double Click Element                   ${PayerDashboard_OUTSTANDINGADJUSTMENTS_PROVIDER_NUMBER_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${Outstanding_Adjustment_Provider_Number_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${Outstanding_Adjustment_Provider_Number_Table_Locator} [${i}]
    Run Keyword If    '${get_username}' != ''    Append To List    ${username_list}    ${get_username}
    #Append To List      ${username_list}    ${get_username}
    END
    log      ${username_list}
    ${Sort_order}=  Copy list  ${username_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${username_list}     ${Sort_order}
    sleep   3

Click Audit Status header in Oustanding Adjustment and verify sorting is done in Ascending order
    wait until Element is visible   ${PayerDashboard_OUTSTANDINGADJUSTMENTS_AUDIT_STATUS_ColumnHeader_Locator}                                timeout=120
    Double Click Element                   ${PayerDashboard_OUTSTANDINGADJUSTMENTS_AUDIT_STATUS_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${Outstanding_Adjustment_Audit_Status_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${Outstanding_Adjustment_Audit_Status_Table_Locator} [${i}]
    Run Keyword If    '${get_username}' != ''    Append To List    ${username_list}    ${get_username}
    #Append To List      ${username_list}    ${get_username}
    END
    log      ${username_list}
    ${Sort_order}=  Copy list  ${username_list}
    #sort list     ${Sort_order}
    ${Sort_order} =    Sort List Alphabetically Ascending    ${username_list}
    log      ${Sort_order}
    lists should be equal       ${username_list}     ${Sort_order}
    sleep   3

Sort List Alphabetically Ascending
    [Arguments]    ${input_list}
    ${sorted_list} =    Evaluate    sorted($input_list)
    [Return]    ${sorted_list}


Click Audit Number header in Oustanding Adjustment and verify sorting is done in Ascending order
    wait until Element is visible            ${PayerDashboard_OUTSTANDINGADJUSTMENTS_AUDIT_NUMBER_ColumnHeader_Locator}                                timeout=120
    Double Click Element                   ${PayerDashboard_OUTSTANDINGADJUSTMENTS_AUDIT_NUMBER_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${Outstanding_Adjustment_Audit_Number_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${Outstanding_Adjustment_Audit_Number_Table_Locator} [${i}]
    Run Keyword If    '${get_username}' != ''    Append To List    ${username_list}    ${get_username}
    #Append To List      ${username_list}    ${get_username}

    END
    log      ${username_list}
    ${Sort_order}         Sort List Numerically       ${username_list}
    #sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${username_list}     ${Sort_order}
     sleep   3


Sort List Numerically
    [Arguments]    ${input_list}
    ${sorted_list} =    Evaluate    sorted(${input_list}, key=lambda x: int(x))
    [Return]    ${sorted_list}

Click Audit Type header in Oustanding Adjustment and verify sorting is done in Ascending order
    Wait until Element is visible           ${PayerDashboard_OUTSTANDINGADJUSTMENTS_AUDIT_TYPE_ColumnHeader_Locator}                                timeout=120
    Double Click Element                   ${PayerDashboard_OUTSTANDINGADJUSTMENTS_AUDIT_TYPE_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${Outstanding_Adjustment_Audit_Type_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${Outstanding_Adjustment_Audit_Type_Table_Locator} [${i}]
    Run Keyword If    '${get_username}' != ''    Append To List    ${username_list}    ${get_username}
    #Append To List      ${username_list}    ${get_username}
    END
    log      ${username_list}
    ${Sort_order}=  Copy list  ${username_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${username_list}     ${Sort_order}
    sleep   3

Click Identified Savings header in Oustanding Adjustment and verify sorting is done in Ascending order
    Wait until Element is visible           ${PayerDashboard_OUTSTANDINGADJUSTMENTS_IDENTIFIED_SAVINGS_ColumnHeader_Locator}                                timeout=120
    Double Click Element                   ${PayerDashboard_OUTSTANDINGADJUSTMENTS_IDENTIFIED_SAVINGS_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${Outstanding_Adjustment_Identified_Savings_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${Outstanding_Adjustment_Identified_Savings_Table_Locator} [${i}]
    Run Keyword If    '${get_username}' != ''    Append To List    ${username_list}    ${get_username}
    END
    log      ${username_list}
     ${Sort_order}         Sort Currency Values       ${username_list}
    #sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${username_list}     ${Sort_order}
    sleep   3

Click Confirmed Savings header in Oustanding Adjustment and verify sorting is done in Ascending order
    Wait until Element is visible           ${PayerDashboard_OUTSTANDINGADJUSTMENTS_CONFIRMED_SAVINGS_ColumnHeader_Locator}                                timeout=120
    Double Click Element                            ${PayerDashboard_OUTSTANDINGADJUSTMENTS_CONFIRMED_SAVINGS_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${Outstanding_Adjustment_Confirmed Saving_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${Outstanding_Adjustment_Confirmed Saving_Table_Locator} [${i}]
    Run Keyword If    '${get_username}' != ''    Append To List    ${username_list}    ${get_username}
    END
    log      ${username_list}
     ${Sort_order}         Sort Currency Values       ${username_list}
    #sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${username_list}     ${Sort_order}
    sleep   3



Sort Currency Values
    [Arguments]    ${input_list}
    ${sorted_list} =    Evaluate    sorted(${input_list}, key=lambda x: float(x.replace('$', '').replace(',', '')))

    [Return]    ${sorted_list}


###HISTORY#####
Double click Claim Number header in Adjustment History and verify sorting is done in Ascending order

    wait until Element is visible   ${PayerDashboard_ADJUSTMENT_HISTORY_CLAIM_NUMBER_ColumnHeader_Locator}                                timeout=120
    Double Click Element            ${PayerDashboard_ADJUSTMENT_HISTORY_CLAIM_NUMBER_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${PayerDashboard_AdjustmentHistory_ClaimNumber_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${PayerDashboard_AdjustmentHistory_ClaimNumber_Table_Locator} [${i}]

    log     ${get_username}
    #Append To List      ${username_list}    ${get_username}
    #VJ
    Run Keyword If    '${get_username}' != ''    Append To List    ${username_list}    ${get_username}
    END
    log      ${username_list}
    ${Sort_order}=  Copy list  ${username_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${username_list}     ${Sort_order}
    sleep   3

Double Click Provider Name header in Oustanding Adjustment and verify sorting is done in Ascending order
    wait until Element is visible   ${PayerDashboard_ADJUSTMENT_HISTORY_PROVIDER_ColumnHeader_Locator}                                timeout=120
    Double Click Element                    ${PayerDashboard_ADJUSTMENT_HISTORY_PROVIDER_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${PayerDashboard_AdjustmentHistory_Provider_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${PayerDashboard_AdjustmentHistory_Provider_Table_Locator} [${i}]
    #VJ
    ${ProviderName}         TestDataFormatter.FormatProviderName         ${get_username}
    log    ${ProviderName}
    Run Keyword If    '${ProviderName}' != ''    Append To List    ${username_list}    ${ProviderName}

    #Append To List      ${username_list}    ${get_username}
    END
    log      ${username_list}
    ${Sort_order}=  Copy list  ${username_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${username_list}     ${Sort_order}
    sleep   3

Double Click Provider Number header in Oustanding Adjustment and verify sorting is done in Ascending order
    wait until Element is visible   ${PayerDashboard_ADJUSTMENT_HISTORY_PROVIDER_NUMBER_ColumnHeader_Locator}                                timeout=120
    Double Click Element                   ${PayerDashboard_ADJUSTMENT_HISTORY_PROVIDER_NUMBER_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${PayerDashboard_AdjustmentHistory_ProviderNumber_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${PayerDashboard_AdjustmentHistory_ProviderNumber_Table_Locator} [${i}]
    #VJ
    Run Keyword If    '${get_username}' != ''    Append To List    ${username_list}    ${get_username}
    #Append To List      ${username_list}    ${get_username}
    END
    log      ${username_list}
    ${Sort_order}=  Copy list  ${username_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${username_list}     ${Sort_order}
    sleep   3

Double click Status header in Adjustment History and verify sorting is done in Ascending order
    wait until Element is visible   ${PayerDashboard_ADJUSTMENT_HISTORY_STATUS_ColumnHeader_Locator}                                timeout=120
    Double Click Element                   ${PayerDashboard_ADJUSTMENT_HISTORY_STATUS_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${PayerDashboard_AdjustmentHistory_Status_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${PayerDashboard_AdjustmentHistory_Status_Table_Locator} [${i}]
    #VJ
    Run Keyword If    '${get_username}' != ''    Append To List    ${username_list}    ${get_username}
    #Append To List      ${username_list}    ${get_username}
    END
    log      ${username_list}
    ${Sort_order}=  Copy list  ${username_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${username_list}     ${Sort_order}
    sleep   3

Double click Audit Type in Adjustment History and verify sorting is done in Ascending order
    wait until Element is visible   ${PayerDashboard_ADJUSTMENT_HISTORY_AUDIT_TYPE_ColumnHeader_Locator}                                timeout=120
    Double Click Element                   ${PayerDashboard_ADJUSTMENT_HISTORY_AUDIT_TYPE_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${PayerDashboard_AdjustmentHistory_AuditType_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${PayerDashboard_AdjustmentHistory_AuditType_Table_Locator} [${i}]
    #VJ
    Run Keyword If    '${get_username}' != ''    Append To List    ${username_list}    ${get_username}
    #Append To List      ${username_list}    ${get_username}
    END
    log      ${username_list}
    ${Sort_order}=  Copy list  ${username_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${username_list}     ${Sort_order}
    sleep   3

Double click Identified Saving in Adjustment History and verify sorting is done in Ascending order
    wait until Element is visible   ${PayerDashboard_ADJUSTMENT_HISTORY_IDENTIFIED_SAVINGS_ColumnHeader_Locator}                                timeout=120
    Double Click Element                   ${PayerDashboard_ADJUSTMENT_HISTORY_IDENTIFIED_SAVINGS_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${PayerDashboard_AdjustmentHistory_IdentifiedSaving_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${PayerDashboard_AdjustmentHistory_IdentifiedSaving_Table_Locator} [${i}]
    log     ${get_username}
    #VJ
    Run Keyword If    '${get_username}' != ''    Append To List    ${username_list}    ${get_username}
    #Append To List      ${username_list}    ${get_username}
    END
    log      ${username_list}
     ${Sort_order}         Sort Currency Values       ${username_list}


    log      ${Sort_order}
    lists should be equal       ${username_list}     ${Sort_order}
    sleep   3

Double click Confirmed Saving in Adjustment History and verify sorting is done in Ascending order
    wait until Element is visible           ${PayerDashboard_ADJUSTMENT_HISTORY_CONFIRMED_SAVINGS_ColumnHeader_Locator}                                timeout=120
    Double Click Element                   ${PayerDashboard_ADJUSTMENT_HISTORY_CONFIRMED_SAVINGS_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${PayerDashboard_AdjustmentHistory_ConfirmedSaving_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${PayerDashboard_AdjustmentHistory_ConfirmedSaving_Table_Locator} [${i}]
    #VJ
    Run Keyword If    '${get_username}' != ''    Append To List    ${username_list}    ${get_username}
    #Append To List      ${username_list}    ${get_username}
    END
    log      ${username_list}
     ${Sort_order}         Sort Currency Values       ${username_list}

    log      ${Sort_order}
    lists should be equal       ${username_list}     ${Sort_order}
    sleep   3

Double click ADJUSTMENT REQUEST DATE in Adjustment History and verify sorting is done in Ascending order
    wait until Element is visible            ${PayerDashboard_ADJUSTMENT_HISTORY_ADJUSTMENT_REQUEST_DATE_ColumnHeader_Locator}                                timeout=120
    Double Click Element                     ${PayerDashboard_ADJUSTMENT_HISTORY_ADJUSTMENT_REQUEST_DATE_ColumnHeader_Locator}
#    Click Element                                ${PayerDashboard_OUTSTANDINGADJUSTMENTS_ADJUSTMENT_REQUEST_DATE_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${PayerDashboard_AdjustmentHistory_AdjustmentRequestDate_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${PayerDashboard_AdjustmentHistory_AdjustmentRequestDate_Table_Locator} [${i}]
     IF    '${get_username}' != ''
    ${split_string}=    split string         ${get_username}          -
    ${formatted_input}=   replace string       ${split_string}[0]     ${SPACE}         ${EMPTY}
    ${from_date}=    Convert Date     ${formatted_input}           date_format=%m/%d/%Y
    log     ${from_date}
    Append To List    ${username_list}    ${get_username}
     END

    END
    log      ${username_list}
    ${Sort_order}=  Copy list  ${username_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${username_list}     ${Sort_order}
    sleep   3

Double click ADJUSTMENT User in Adjustment History and verify sorting is done in Ascending order
    wait until Element is visible           ${PayerDashboard_ADJUSTMENT_HISTORY_ADJUSTMENT_USER_ColumnHeader_Locator}                                timeout=120
    Click Element                   ${PayerDashboard_ADJUSTMENT_HISTORY_ADJUSTMENT_USER_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${PayerDashboard_AdjustmentHistory_AdjustmentUser_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${PayerDashboard_AdjustmentHistory_AdjustmentUser_Table_Locator} [${i}]
    #VJ
    Run Keyword If    '${get_username}' != ''    Append To List    ${username_list}    ${get_username}
    #Append To List      ${username_list}    ${get_username}
    END
    log      ${username_list}
    ${Sort_order}=  Copy list  ${username_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${username_list}     ${Sort_order}
    sleep   3



#Changes VJ

Get the first 2 Claimnumber Elements from the Payer dashboard page


   sleep   5
     #${AllClaimnumberElements} = Get WebElements ${All_Claim_Number_Locator}
    ${element_count}=    get element count     ${Outstanding_Adjustment_ClaimNumber_Table_Locator}
    @{ClaimNumber_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_claimnumber}=  Get Text      ${Outstanding_Adjustment_ClaimNumber_Table_Locator} [${i}]
    Append To List      ${ClaimNumber_list}    ${get_claimnumber}
    END
    log     All the Claim numbers :
    log      ${ClaimNumber_list}

    ${Claimnumber_first}    Get From List    ${ClaimNumber_list}    0

    ${Claimnumber_second}    Get From List    ${ClaimNumber_list}    1


    Set Global Variable  ${Claimnumber_first}
    Set Global Variable  ${Claimnumber_second}

    ${Comm_Portal_Outstanding_Adjustment_ClaimNumber1_Locator_New}=     Replace String      ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator}   ${substringToReplace}    ${Claimnumber_first}
    ${Comm_Portal_Outstanding_Adjustment_ClaimNumber2_Locator_New}=     Replace String      ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator}   ${substringToReplace}    ${Claimnumber_second}

    Set Global Variable     ${Comm_Portal_Outstanding_Adjustment_ClaimNumber1_Locator_New}
    Set Global Variable     ${Comm_Portal_Outstanding_Adjustment_ClaimNumber2_Locator_New}

Click ClaimNumber1 in Outstanding Adjustment page

     wait until Element is visible   ${Comm_Portal_Outstanding_Adjustment_ClaimNumber1_Locator_New}
    click element                   ${Comm_Portal_Outstanding_Adjustment_ClaimNumber1_Locator_New}

Click ClaimNumber1 in Adjustment History page

    wait until Element is visible   ${Comm_Portal_Outstanding_Adjustment_ClaimNumber1_Locator_New}
    click element                   ${Comm_Portal_Outstanding_Adjustment_ClaimNumber1_Locator_New}



Get the first 2 Patientnumber Elements from the Outstanding Adjustments dashboard page




    wait until Element is visible   ${Comm_Portal_Outstanding_Adjustment_ClaimNumber1_Locator_New}
    click element                   ${Comm_Portal_Outstanding_Adjustment_ClaimNumber1_Locator_New}
    Sleep   3
    wait until element is visible   ${Comm_Portal_Outstanding_Adjustment_Generic_PatientName_Locator}

        ${PatientName1} =    get text   ${Comm_Portal_Outstanding_Adjustment_Generic_PatientName_Locator}
        Set Global Variable     ${PatientName1}
##         ${PayerDashboard_AdjustmentInfo_PatientName_Header_Locator_New} =  Replace String   ${PayerDashboard_AdjustmentInfo_PatientName_Header_Locator}  ${substringToReplace}  ${PatientName1}
#
#    IF    "{DashBoardToPerformAction}" == "OutStanding Adjustments"
#
#        log   Inside
##       ${ElementToClick} = Set Variable    ${Comm_Portal_Outstanding_Adjustment_Dashboard_Link}
#        #${ElementToClick} =     ${Comm_Portal_Outstanding_Adjustment_Dashboard_Link}
#        ${ElementToClick} =     ${Comm_Portal_Outstanding_Adjustment_Dashboard_Link}


#    ELSE IF    "{DashBoardToPerformAction}" == "Adjustment History"
#      ${ElementToClick} =      ${Comm_Portal_Adjustment_History_Dashboard_Link}
#    END
#
#    log  ${Comm_Portal_Outstanding_Adjustment_Dashboard_Link}
##        ${ElementToClick} =  Set Variable If    "{DashBoardToPerformAction}" == "OutStanding Adjustments"    ${Comm_Portal_Outstanding_Adjustment_Dashboard_Link}
##        ...    "{DashBoardToPerformAction}" == "Adjustment History"    ${Comm_Portal_Adjustment_History_Dashboard_Link}
#      log     ${ElementToClick}
    click element       ${Comm_Portal_Outstanding_Adjustment_Dashboard_Link}
    Sleep   2
    wait until Element is visible   ${Comm_Portal_Outstanding_Adjustment_ClaimNumber2_Locator_New}
    click element                   ${Comm_Portal_Outstanding_Adjustment_ClaimNumber2_Locator_New}

    wait until element is visible   ${Comm_Portal_Outstanding_Adjustment_Generic_PatientName_Locator}

        ${PatientName2} =    get text   ${Comm_Portal_Outstanding_Adjustment_Generic_PatientName_Locator}
        Set Global Variable     ${PatientName2}
    click element        ${Comm_Portal_Outstanding_Adjustment_Dashboard_Link}


Get the first 2 Patientnumber Elements from the Adjustments history dashboard page

    wait until Element is visible   ${Comm_Portal_Outstanding_Adjustment_ClaimNumber1_Locator_New}
    click element                   ${Comm_Portal_Outstanding_Adjustment_ClaimNumber1_Locator_New}

    wait until element is visible   ${Comm_Portal_Adjustment_History_PatientName_Locator}

        ${PatientName1} =    get text   ${Comm_Portal_Adjustment_History_PatientName_Locator}
        Set Global Variable     ${PatientName1}
##         ${PayerDashboard_AdjustmentInfo_PatientName_Header_Locator_New} =  Replace String   ${PayerDashboard_AdjustmentInfo_PatientName_Header_Locator}  ${substringToReplace}  ${PatientName1}
#
#    IF    "{DashBoardToPerformAction}" == "OutStanding Adjustments"
#
#        log   Inside
##       ${ElementToClick} = Set Variable    ${Comm_Portal_Outstanding_Adjustment_Dashboard_Link}
#        #${ElementToClick} =     ${Comm_Portal_Outstanding_Adjustment_Dashboard_Link}
#        ${ElementToClick} =     ${Comm_Portal_Outstanding_Adjustment_Dashboard_Link}


#    ELSE IF    "{DashBoardToPerformAction}" == "Adjustment History"
#      ${ElementToClick} =      ${Comm_Portal_Adjustment_History_Dashboard_Link}
#    END
#
#    log  ${Comm_Portal_Outstanding_Adjustment_Dashboard_Link}
##        ${ElementToClick} =  Set Variable If    "{DashBoardToPerformAction}" == "OutStanding Adjustments"    ${Comm_Portal_Outstanding_Adjustment_Dashboard_Link}
##        ...    "{DashBoardToPerformAction}" == "Adjustment History"    ${Comm_Portal_Adjustment_History_Dashboard_Link}
#      log     ${ElementToClick}
    click element       ${Comm_Portal_Adjustment_History_Dashboard_Link}
    Sleep   2
    wait until Element is visible   ${Comm_Portal_Outstanding_Adjustment_ClaimNumber2_Locator_New}
    click element                   ${Comm_Portal_Outstanding_Adjustment_ClaimNumber2_Locator_New}

    wait until element is visible   ${Comm_Portal_Adjustment_History_PatientName_Locator}

        ${PatientName2} =    get text   ${Comm_Portal_Adjustment_History_PatientName_Locator}
        Set Global Variable     ${PatientName2}
    click element        ${Comm_Portal_Adjustment_History_Dashboard_Link}

Return Patient name locator with patient name passed by user for Payer dashboard

      #${PatientName}             TestDataFormatter.formatPatientName          ${data_list[0]['PatientFirstName']}    ${data_list[0]['PatientLastName']}
   ${Common_Payer_PatientName1_Header_Locator_New} =  Replace String   ${Common_Payer_PatientName_Header_Locator}  ${substringToReplace}  ${PatientName1}
   ${Common_Payer_PatientName2_Header_Locator_New} =  Replace String   ${Common_Payer_PatientName_Header_Locator}  ${substringToReplace}  ${PatientName2}

    Set Global Variable    ${Common_Payer_PatientName1_Header_Locator_New}
    Set Global Variable    ${Common_Payer_PatientName2_Header_Locator_New}

Verify Patient name1
        wait until Element is Visible   ${Common_Payer_PatientName1_Header_Locator_New}      timeout=120
        Element should be Visible   ${Common_Payer_PatientName1_Header_Locator_New}

Return Patient name locator with next patient name passed by user for Payer dashboard

      ${PatientName}             TestDataFormatter.formatPatientName          ${data_list[1]['PatientFirstName']}    ${data_list[1]['PatientLastName']}
   ${Common_Payer_Next_PatientName_Header_Locator_New} =  Replace String   ${Common_Payer_Next_PatientName_Header_Locator}  ${substringToReplace}  ${PatientName}

    Set Global Variable    ${Common_Payer_Next_PatientName_Header_Locator_New}

Verify next Patient name2
        wait until Element is Visible   ${Common_Payer_PatientName2_Header_Locator_New}      timeout=120
        Element should be Visible   ${Common_Payer_PatientName2_Header_Locator_New}




Click ClaimNumber in Outstanding Adjustment page
        Sleep   2
        Verify Claim Number On Current Page else go to next page
        Wait Until Element Is Visible   ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator_New}    timeout=120
        Click Element       ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator_New}
        Sleep   2


Verify Claim Number On Current Page else go to next page

            ${MaxAttempts}      Set Variable    5
    FOR    ${i}    IN RANGE    ${MaxAttempts}
    ${is_visible} =    Run Keyword and Return Status    Element Should Be Visible    ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator_New}


    IF    ${is_visible}

    Log    Element is present and visible - Performing test1

    Exit For Loop If    ${is_visible}

    END

    ${next_page_enabled} =   Run Keyword and Return Status    Element Should Be Enabled    ${Comm_Portal_Outstanding_Dashboard_Next_Page_Locator}
         log     ${next_page_enabled}
        Exit For Loop if   not ${next_page_enabled}

    Log         Clicking next page
    Click Element    ${Comm_Portal_Outstanding_Dashboard_Next_Page_Locator}
    END


Find Row Index by Claim Number
    [Arguments]     ${Claimnumber}

       FOR    ${i}    IN RANGE    ${data_list.__len__()}
            ${dictionary}=    Get From List    ${data_list}    ${i}
            ${cell_value}=    Get From Dictionary    ${dictionary}    ClaimNumber
            Log    Cell Value: ${cell_value}
            IF   '${cell_value}' == '${Claimnumber}'
                    Set Global Variable     ${i}
                    Exit for loop
            END
       END

Get Value from the list
    [Arguments]     ${RequiredKey}

        ${dictionary}=    Get From List    ${data_list}    ${i}
    	${RequiredValue}=    Get From Dictionary    ${dictionary}    ${RequiredKey}

    	BuiltIn.Return From Keyword    ${RequiredValue}


Locate the claimnumber and verify it is displayed in the page
    [Arguments]     ${ClaimnumberToLocate}

    ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_result_locator_New}=    Replace String    ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_result_locator}    ${substringToReplace}    ${ClaimnumberToLocate}

    ${ElementVisible}=  run keyword and return status   element should be visible   ${PayerDashboard_ADJUSTMENTS_Filter_ClaimNumber_result_locator_New}

    BuiltIn.Return From Keyword     ${ElementVisible}





Verify the page displays only 10 records by default

    ${NumberOfElementsDisplayed}    Get the number of elements displayed in the page

    should be true         ${NumberOfElementsDisplayed}<=${10}


Verify the page displays only 5 records

    ${NumberOfElementsDisplayed}    Get the number of elements displayed in the page

    should be true         ${NumberOfElementsDisplayed}<=${5}


Get the number of elements displayed in the page

    ${Counter}=    Set Variable    0


    FOR    ${index}    IN RANGE    ${data_list.__len__()}
            ${dictionary}=    Get From List    ${data_list}    ${index}
            ${cell_value}=    Get From Dictionary    ${dictionary}    ClaimNumber
            #Log    Cell Value: ${cell_value}
            #IF   '${cell_value}' == '${Claimnumber}'

            #${ClaimnumberVisisble}      Locate the claimnumber and verify it is displayed in the page      ${cell_value}
            ${ClaimnumberVisisble} =     Locate the claimnumber and verify it is displayed in the page    ${cell_value}

            IF  ${ClaimnumberVisisble}
            ${Counter}=    Evaluate    ${Counter} + 1
            END
       END

    BuiltIn.Return From Keyword    ${Counter}

Generate Random Number Less Than
    [Arguments]    ${Number}
    ${random_number} =    Evaluate   round(random.uniform(0, ${Number}-1))
    [Return]    ${random_number}

#Verifies Adjustments page displays 5 records
#    [Arguments]     ${option}
#
#    ${NumberOfElementsDisplayed}    Get the number of elements displayed in the page
#
#    should be true         ${NumberOfElementsDisplayed}<=${5}

Verify 'Claim Number' is clickable and 'PrePay' columns is not clickable in Outstanding Adjustment page

    ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator_New}=     Replace String      ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator}   ${substringToReplace}    ${data_list[0]['ClaimNumber']}
    Set Global Variable   ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator_New}
    Verify Claim Number On Current Page else go to next page
    Wait Until Element Is Visible        ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator_New}

    Page Should contain Link     ${Comm_Portal_Outstanding_Adjustment_ClaimNumber_Locator_New}
    ${Prepay_Value}      Set Variable      ${data_list[0]['Prepay']}

    log   ${Prepay_Value}
        IF    '$Prepay_Value' == "1"
              #${Prepay}=    Set Variable    Yes
              ${Comm_Portal_Outstanding_Adjustment_Prepay_Locator_New}=     Replace String      ${Comm_Portal_Outstanding_Adjustment_Prepay_Locator_Yes}   ${substringToReplace}    ${data_list[0]['ClaimNumber']}
        ELSE
              #${Prepay}=    Set Variable    No
              ${Comm_Portal_Outstanding_Adjustment_Prepay_Locator_New}=     Replace String      ${Comm_Portal_Outstanding_Adjustment_Prepay_Locator_No}   ${substringToReplace}    ${data_list[0]['ClaimNumber']}
        END

    Wait Until Element Is Visible        ${Comm_Portal_Outstanding_Adjustment_Prepay_Locator_New}
    Page Should not contain Link         ${Comm_Portal_Outstanding_Adjustment_Prepay_Locator_New}

Click Prepay header in Oustanding Adjustment and verify sorting is done in Ascending order

    wait until Element is visible    	 ${PayerDashboard_OUTSTANDINGADJUSTMENTS_Prepay_ColumnHeader_Locator}       timeout=20
    click Element                  		 ${PayerDashboard_OUTSTANDINGADJUSTMENTS_Prepay_ColumnHeader_Locator}
    click Element                  		 ${PayerDashboard_OUTSTANDINGADJUSTMENTS_Prepay_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${Outstanding_Adjustment_Prepay_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1

    ${get_PrepayValue}=  Get Text      ${Outstanding_Adjustment_Prepay_Table_Locator} [${i}]

    Run Keyword If    '${get_PrepayValue}' != ''    Append To List      ${username_list}    ${get_PrepayValue}
    END
    log     ${username_list}
#    ${sort_order}=  Evaluate     sorted(${username_list}, key=int, reverse=False)
    ${Sort_order} =    Sort List Alphabetically Ascending    ${username_list}

    log      ${sort_order}
    lists should be equal       ${username_list}     ${sort_order}

Apply filter Functionality by providing Prepay
    [Arguments]        ${Option}

    Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENTS_Filter_Prepay_DropDown_Locator}   timeout=60
    sleep   2
    log         ${Option}
    IF    ${Option} == 'Yes'
    ${OptionToChoose}    Set Variable    1: 1
    ELSE IF     ${Option} == 'No'
    ${OptionToChoose}    Set Variable    2: 0
    END
    Select From List By Value    ${PayerDashboard_ADJUSTMENTS_Filter_Prepay_DropDown_Locator}      ${OptionToChoose}

Verify data after applying filter Functionality by providing Prepay
    [Arguments]         ${Option}
    Sleep       3
    ${FormattedOption}    TestDataFormatter.FormatPrepay        ${Option}
    log     ${Option}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_Outstanding_Adjustment_NumberOfFilterResults_Locator}

    IF   ${present} == True
             ${element_count}=    Get Element Count     ${Outstanding_Adjustment_Prepay_Table_Locator}
            @{username_list}=   Create List
            FOR    ${i}     IN RANGE    1   ${element_count}+1
                ${get_PrepayValue}=  Get Text      ${Outstanding_Adjustment_Prepay_Table_Locator} [${i}]
                 IF    '${get_PrepayValue}' != ''
                 Should Be Equal as Strings       ${get_PrepayValue}    ${FormattedOption}
                 END
            END
    ELSE
        Page Should Contain         There are no Outstanding Adjustment Requests which meet the criteria.
    END


Verify Analytics Page Is Displayed
     Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_AvailableDashboard_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_AvailableDashboard_locator}


Verify the Regional Specialty Data Table Details
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_RegionalSpecialtyDataName_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_RegionalSpecialtyDataName_locator}
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_RegionalSpecialtyDataDescription_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_RegionalSpecialtyDataDescription_locator}
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_RegionalSpecialtyDataAction_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_RegionalSpecialtyDataAction_locator}


Verify clicking on Regional Specialty Data Report View Button Open Regional Specialty Data Report
     click element           ${PayerDashboard_Analytics_Page_RegionalSpecialtyDataAction_locator}
     Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_RegionalSpecialtyDataReportPage_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_RegionalSpecialtyDataReportPage_locator}


Verify the Medical Record Request Summary Table Details
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_MedicalRecordRequestSummaryName_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_MedicalRecordRequestSummaryName_locator}
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_MedicalRecordRequestSummaryDescription_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_MedicalRecordRequestSummaryDescription_locator}
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_MedicalRecordRequestSummaryAction_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_MedicalRecordRequestSummaryAction_locator}


Verify clicking on Medical Record Request Summary View Button Open Medical Record Request Summary Report
     click element           ${PayerDashboard_Analytics_Page_MedicalRecordRequestSummaryAction_locator}
     Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_MedicalRecordRequestSummaryReportPage_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_MedicalRecordRequestSummaryReportPage_locator}


Verify the Multi Source Claims Comparison Table Details
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_MultiSourceClaimsComparisonName_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_MultiSourceClaimsComparisonName_locator}
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_MultiSourceClaimsComparisonDescription_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_MultiSourceClaimsComparisonDescription_locator}
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_MultiSourceClaimsComparisonAction_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_MultiSourceClaimsComparisonAction_locator}


Verify clicking on Multi Source Claims Comparison View Button Open Multi Source Claims Comparison Report
     click element           ${PayerDashboard_Analytics_Page_MultiSourceClaimsComparisonAction_locator}
     Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_MultiSourceClaimsComparisonReportPage_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_MultiSourceClaimsComparisonReportPage_locator}


Verify the Audit Summaries by Errors and Savings Table Details
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_AuditSummariesbyErrorsAndSavingsName_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_AuditSummariesbyErrorsAndSavingsName_locator}
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_AuditSummariesbyErrorsAndSavingsDescription_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_AuditSummariesbyErrorsAndSavingsDescription_locator}
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_AuditSummariesbyErrorsAndSavingsAction_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_AuditSummariesbyErrorsAndSavingsAction_locator}


Verify clicking on Audit Summaries by Errors and Savings View Button Open Audit Summaries by Errors and Savings Report
     click element           ${PayerDashboard_Analytics_Page_AuditSummariesbyErrorsAndSavingsAction_locator}
     Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_AuditSummariesbyErrorsAndSavingsReportPage_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_AuditSummariesbyErrorsAndSavingsReportPage_locator}


Verify the Provider Audit Summary By DRG Table Details
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_ProviderAuditSummaryByDRGName_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_ProviderAuditSummaryByDRGName_locator}
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_ProviderAuditSummaryByDRGDescription_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_ProviderAuditSummaryByDRGDescription_locator}
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_ProviderAuditSummaryByDRGAction_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_ProviderAuditSummaryByDRGAction_locator}


Verify clicking on Provider Audit Summary By DRG View Button Open provider Audit Summary Report
     click element           ${PayerDashboard_Analytics_Page_ProviderAuditSummaryByDRGAction_locator}
     Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_ProviderAuditSummaryByDRGReportPage_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_ProviderAuditSummaryByDRGReportPage_locator}



Verify the Provider Error Dashboard Table Details
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_ProviderErrorDashboardName_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_ProviderErrorDashboardName_locator}
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_ProviderErrorDashboardDescription_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_ProviderErrorDashboardDescription_locator}
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_ProviderErrorDashboardAction_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_ProviderErrorDashboardAction_locator}


Verify clicking on Provider Error Dashboard View Button Open Provider Error Dashboard Report
     click element           ${PayerDashboard_Analytics_Page_ProviderErrorDashboardAction_locator}
     Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_ProviderErrorDashboardReportPage_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_ProviderErrorDashboardReportPage_locator}




Verify the Identified Audit Findings Table Details
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_IdentifiedAuditFindingsName_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_IdentifiedAuditFindingsName_locator}
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_IdentifiedAuditFindingsDescription_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_IdentifiedAuditFindingsDescription_locator}
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_IdentifiedAuditFindingsAction_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_IdentifiedAuditFindingsAction_locator}


Verify clicking on Identified Audit Findings View Button Open Identified Audit Findings Report
     click element           ${PayerDashboard_Analytics_Page_IdentifiedAuditFindingsAction_locator}
     Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_IdentifiedAuditFindingsReportPage_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_IdentifiedAuditFindingsReportPage_locator}




Verify the Medical Record Detailed Summary Table Details
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_MedicalRecordDetailedSummaryName_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_MedicalRecordDetailedSummaryName_locator}
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_MedicalRecordDetailedSummaryDescription_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_MedicalRecordDetailedSummaryDescription_locator}
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_MedicalRecordDetailedSummaryAction_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_MedicalRecordDetailedSummaryAction_locator}


Verify clicking on Medical Record Detailed Summary View Button Open Medical Record Detailed Summary Report
     click element           ${PayerDashboard_Analytics_Page_MedicalRecordDetailedSummaryAction_locator}
     Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_MedicalRecordDetailedSummaryReportPage_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_MedicalRecordDetailedSummaryReportPage_locator}



Verify the Claims with DRG Comparison Table Details
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_ClaimswithDRGComparisonName_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_ClaimswithDRGComparisonName_locator}
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_ClaimswithDRGComparisonDescription_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_ClaimswithDRGComparisonDescription_locator}
      Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_ClaimswithDRGComparisonAction_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_ClaimswithDRGComparisonAction_locator}


Verify clicking on Claims with DRG Comparison View Button Open Claims with DRG Comparison Report
     click element           ${PayerDashboard_Analytics_Page_ClaimswithDRGComparisonAction_locator}
     Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_ClaimswithDRGComparisonReportPage_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_ClaimswithDRGComparisonReportPage_locator}



Enter the report name in Search box
      [Arguments]   ${PayerDashboard_Analytics_ReportName_PassedByUser}
      Wait Until Element Is Visible     ${PayerDashboard_Analytics_Page_Search_Box_locator}            timeout=120
      click Element       ${PayerDashboard_Analytics_Page_Search_Box_locator}
      Input Text                       ${PayerDashboard_Analytics_Page_Search_Box_locator}     ${PayerDashboard_Analytics_ReportName_PassedByUser}
       Sleep    3



Verify that searched report is displayed in the search results
     Wait Until Element Is Visible    ${PayerDashboard_Analytics_Page_Search_Results_locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_Analytics_Page_Search_Results_locator}


Verify the Adjustment Details and Summary in Outstanding adjustment details page for Inpatient record

       ${PatientName}             TestDataFormatter.formatPatientName          ${data_list[0]['PatientFirstName']}    ${data_list[0]['PatientLastName']}
    ${PayerDashboard_AdjustmentInfo_PatientName_Header_Locator_New} =  Replace String   ${PayerDashboard_AdjustmentInfo_PatientName_Header_Locator}  ${substringToReplace}  ${PatientName}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_PatientName_Header_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_PatientName_Header_Locator_New}

    ${formattedDOB}             TestDataFormatter.formatDate           ${data_list[0]['DateOfBirth']}
   ${PayerDashboard_AdjustmentInfo_DOB_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_DOB_Detail_Locator}   ${substringToReplace}    ${formattedDOB}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_DOB_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_DOB_Detail_Locator_New}

    #${formattedSubsriberID}             TestDataFormatter.formatSubscriberID           ${data_list[0]['SubscriberId']}
   ${PayerDashboard_AdjustmentInfo_SubscriberID_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_SubscriberID_Detail_Locator}   ${substringToReplace}    ${data_list[0]['SubscriberId']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_SubscriberID_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_SubscriberID_Detail_Locator_New}

   ${PayerDashboard_AdjustmentInfo_GroupID_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_GroupID_Detail_Locator}   ${substringToReplace}    ${data_list[0]['PolicyNumber']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_GroupID_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_GroupID_Detail_Locator_New}

    ${PayerDashboard_AdjustmentInfo_AuditNum_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_AuditNum_Detail_Locator}     ${substringToReplace}    ${data_list[0]['AuditNumber']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_AuditNum_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_AuditNum_Detail_Locator_New}

    ${PayerDashboard_AdjustmentInfo_AuditType_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_AuditType_Detail_Locator}     ${substringToReplace}    ${data_list[0]['AuditType']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_AuditType_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_AuditType_Detail_Locator_New}

    ${formattedAuditStatus}             TestDataFormatter.formatAuditStatus           ${data_list[0]['AuditStatus']}
    ${PayerDashboard_AdjustmentInfo_AuditStatus_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_AuditStatus_Detail_Locator}     ${substringToReplace}    ${formattedAuditStatus}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_AuditStatus_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_AuditStatus_Detail_Locator_New}

    ${PayerDashboard_AdjustmentInfo_ProviderName_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_ProviderName_Detail_Locator}     ${substringToReplace}    ${data_list[0]['ProviderName']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_ProviderName_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_ProviderName_Detail_Locator_New}

   ${PayerDashboard_AdjustmentInfo_ProviderNumber_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_ProviderNumber_Detail_Locator}     ${substringToReplace}    ${data_list[0]['BillingProviderNumber']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_ProviderNumber_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_ProviderNumber_Detail_Locator_New}

   ${PayerDashboard_AdjustmentInfo_ClaimNum_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_ClaimNum_Detail_Locator}     ${substringToReplace}    ${data_list[0]['ClaimNumber']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_ClaimNum_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_ClaimNum_Detail_Locator_New}

#   ${PayerDashboard_AdjustmentInfo_MediRecNum_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_MediRecNum_Detail_Locator}     ${substringToReplace}    ${data_list[0]['MRNumber']}
#   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_MediRecNum_Detail_Locator_New}
#   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_MediRecNum_Detail_Locator_New}

   ${formattedAdmitDate}             TestDataFormatter.formatDate           ${data_list[0]['AdmitDate']}
   ${PayerDashboard_AdjustmentInfo_AdmitDate_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_AdmitDate_Detail_Locator}   ${substringToReplace}    ${formattedAdmitDate}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_AdmitDate_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_AdmitDate_Detail_Locator_New}

   ${formattedDischargeDate}             TestDataFormatter.formatDate           ${data_list[0]['DischargeDate']}
   ${PayerDashboard_AdjustmentInfo_DischargeDate_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_DischargeDate_Detail_Locator}   ${substringToReplace}    ${formattedDischargeDate}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_DischargeDate_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_DischargeDate_Detail_Locator_New}

    ${formattedPaidDateDate}             TestDataFormatter.formatDate           ${data_list[0]['PaidDate']}
   ${PayerDashboard_AdjustmentInfo_PaidDate_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_PaidDate_Detail_Locator}   ${substringToReplace}    ${formattedPaidDateDate}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_PaidDate_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_PaidDate_Detail_Locator_New}


     ${adjusted_date}    Set Variable    ${data_list[0]['ReadyForAdjustmentDate'].split('.')[0]}
   ${formattedAdjustmentDate}             TestDataFormatter.formatDate           ${adjusted_date}
   ${PayerDashboard_AdjustmentInfo_AdjustmentRequested_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_AdjustmentRequested_Detail_Locator}   ${substringToReplace}    ${formattedAdjustmentDate}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_AdjustmentRequested_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_AdjustmentRequested_Detail_Locator_New}

   ${formattedOriginalGrossPay}             TestDataFormatter.formatToCurrency           ${Payer_data_list[0]['OriginalGrossPay']}
   ${PayerDashboard_AdjustmentInfo_Original_Gross_Pay_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Original_Gross_Pay_Detail_Locator}   ${substringToReplace}    ${formattedOriginalGrossPay}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Original_Gross_Pay_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Original_Gross_Pay_Detail_Locator_New}

   ${formattedOriginalNetPay}             TestDataFormatter.formatToCurrency           ${Payer_data_list[0]['OriginalNetPay']}
   ${PayerDashboard_AdjustmentInfo_Original_Net_Pay_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Original_Net_Pay_Detail_Locator}   ${substringToReplace}    ${formattedOriginalNetPay}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Original_Net_Pay_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Original_Net_Pay_Detail_Locator_New}


   ${formattedIdentifiedGrossPay}             TestDataFormatter.formatToCurrency           ${Payer_data_list[0]['NewGrossPay']}
   ${PayerDashboard_AdjustmentInfo_Identified_Gross_Pay_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Identified_Gross_Pay_Detail_Locator}   ${substringToReplace}    ${formattedIdentifiedGrossPay}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Identified_Gross_Pay_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Identified_Gross_Pay_Detail_Locator_New}


    ${formattedIdentifiedNetPay}             TestDataFormatter.formatToCurrency           ${Payer_data_list[0]['NewNetPay']}
   ${PayerDashboard_AdjustmentInfo_Identified_Net_Pay_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Identified_Net_Pay_Detail_Locator}   ${substringToReplace}    ${formattedIdentifiedNetPay}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Identified_Net_Pay_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Identified_Net_Pay_Detail_Locator_New}

   ${VerifiedAdjustor}             TestDataFormatter.VerifyIfNull           ${data_list[0]['Adjustor']}
   ${PayerDashboard_AdjustmentInfo_Adjustor_Name_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Adjustor_Name_Detail_Locator}   ${substringToReplace}    ${VerifiedAdjustor}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Adjustor_Name_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Adjustor_Name_Detail_Locator_New}

   ${VerifiedAdjustmentDate}             TestDataFormatter.VerifyIfNull           ${data_list[0]['AdjustmentDate']}
   ${PayerDashboard_AdjustmentInfo_Adjustment_date_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Adjustment_date_Detail_Locator}   ${substringToReplace}    ${VerifiedAdjustmentDate}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Adjustment_date_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Adjustment_date_Detail_Locator_New}

##   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Payer_Confirmed_Pay_Detail_Locator}
##   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Payer_Confirmed_Pay_Detail_Locator}
##   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Payer_Confirmed_Savings_Detail_Locator}
##   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Payer_Confirmed_Savings_Detail_Locator}

    ${PayerDashboard_AdjustmentInfo_Region_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Region_Detail_Locator}   ${substringToReplace}    ${data_list[0]['Region']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Region_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Region_Detail_Locator_New}

   ${PayerDashboard_AdjustmentInfo_DivisionCode_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_DivisionCode_Detail_Locator}   ${substringToReplace}    ${data_list[0]['DivisionCode']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_DivisionCode_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_DivisionCode_Detail_Locator_New}

   ${VerifiedReferenceClaim}             TestDataFormatter.VerifyIfNull           ${data_list[0]['ReferenceClaim']}
   ${PayerDashboard_AdjustmentInfo_Reference_Claim_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Reference_Claim_Detail_Locator}   ${substringToReplace}    ${VerifiedReferenceClaim}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Reference_Claim_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Reference_Claim_Detail_Locator_New}


     ${formattedFindingsLetterDate}             TestDataFormatter.formatDate           ${data_list[0]['FindingLettersDate']}
   ${PayerDashboard_AdjustmentInfo_Findings_Letter_Date_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Findings_Letter_Date_Detail_Locator}   ${substringToReplace}     ${formattedFindingsLetterDate}
   Scroll element into view     ${PayerDashboard_AdjustmentInfo_Findings_Letter_Date_Detail_Locator_New}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Findings_Letter_Date_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Findings_Letter_Date_Detail_Locator_New}

   Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_SUMMARY_Header_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_SUMMARY_Header_Locator}

#    IF	 '$Client_Name == "HMBCBS" or "GATEW"'
#    ${TextToReplace}=    Set Variable       adjustment details
#    ELSE
#	${TextToReplace}=     Set Variable      adjustment summary
#	END

   Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_SUMMARY_Table_OriginalDRG_Element_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_SUMMARY_Table_OriginalDRG_Element_Locator}
   ${actualOriginalDRGValue} =       Get text    ${PayerDashboard_ADJUSTMENT_SUMMARY_Table_OriginalDRG_Element_Locator}
   ${actualOriginalDRGValueFormatted}     TestDataFormatter.getStringAfterRemovingSpaces            ${actualOriginalDRGValue}
   Should be equal          ${actualOriginalDRGValueFormatted}            ${Payer_data_list[0]['OriginalDrg']}

    Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_SUMMARY_Table_AdjustedDRG_Element_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_SUMMARY_Table_AdjustedDRG_Element_Locator}
   ${actualAdjustedDRGValue} =       Get text    ${PayerDashboard_ADJUSTMENT_SUMMARY_Table_AdjustedDRG_Element_Locator}
   ${actualAdjustedDRGValueFormatted}     TestDataFormatter.getStringAfterRemovingSpaces            ${actualAdjustedDRGValue}
   Should be equal          ${actualAdjustedDRGValueFormatted}            ${Payer_data_list[0]['NewDrg']}

   Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_SUMMARY_Table_OriginalDischargeStatus_Element_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_SUMMARY_Table_OriginalDischargeStatus_Element_Locator}
   ${actualOriginalDischargeStatus} =       Get text    ${PayerDashboard_ADJUSTMENT_SUMMARY_Table_OriginalDischargeStatus_Element_Locator}
   ${actualOriginalDischargeStatusFormatted}     TestDataFormatter.getStringAfterRemovingSpaces            ${actualOriginalDischargeStatus}
   Should be equal          ${actualOriginalDischargeStatusFormatted}            ${Payer_data_list[0]['OriginalDischargeStatus']}


   Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_SUMMARY_Table_AdjustedDischargeStatus_Element_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_SUMMARY_Table_AdjustedDischargeStatus_Element_Locator}
   ${actualAdjustedDischargeStatus} =       Get text    ${PayerDashboard_ADJUSTMENT_SUMMARY_Table_AdjustedDischargeStatus_Element_Locator}
   ${actualAdjustedDischargeStatusFormatted}     TestDataFormatter.getStringAfterRemovingSpaces            ${actualAdjustedDischargeStatus}
   Should be equal          ${actualAdjustedDischargeStatusFormatted}            ${Payer_data_list[0]['NewDischargeStatus']}

     Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_SUMMARY_Table_OriginalDiagnosisCode_Element_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_SUMMARY_Table_OriginalDiagnosisCode_Element_Locator}
   ${actualOriginalDiagnosisCode} =       Get text    ${PayerDashboard_ADJUSTMENT_SUMMARY_Table_OriginalDiagnosisCode_Element_Locator}
   ${actualOriginalDiagnosisCodeFormatted}     TestDataFormatter.formatDiagnosisCode           ${actualOriginalDiagnosisCode}
   Should be equal          ${actualOriginalDiagnosisCodeFormatted}            ${Payer_data_list[0]['OriginalDiagnoses']}

   Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_SUMMARY_Table_AdjustedDiagnosisCode_Element_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_SUMMARY_Table_AdjustedDiagnosisCode_Element_Locator}
   ${actualAdjustedDiagnosisCode} =       Get text    ${PayerDashboard_ADJUSTMENT_SUMMARY_Table_AdjustedDiagnosisCode_Element_Locator}
   ${actualAdjustedDiagnosisCodeFormatted}     TestDataFormatter.formatDiagnosisCode           ${actualAdjustedDiagnosisCode}
   Should be equal          ${actualAdjustedDiagnosisCodeFormatted}            ${Payer_data_list[0]['NewDiagnoses']}

   Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_SUMMARY_Table_OriginalProcedureCode_Element_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_SUMMARY_Table_OriginalProcedureCode_Element_Locator}
   ${actualOriginalProcedureCode} =       Get text    ${PayerDashboard_ADJUSTMENT_SUMMARY_Table_OriginalProcedureCode_Element_Locator}
   ${actualOriginalProcedureCodeFormatted}     TestDataFormatter.getStringAfterRemovingSpaces            ${actualOriginalProcedureCode}
   Should be equal          ${actualOriginalProcedureCodeFormatted}            ${Payer_data_list[0]['OriginalProcedures']}


   Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_SUMMARY_Table_AdjustedProcedureCode_Element_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_SUMMARY_Table_AdjustedProcedureCode_Element_Locator}
   ${actualAdjustedProcedureCode} =       Get text    ${PayerDashboard_ADJUSTMENT_SUMMARY_Table_AdjustedProcedureCode_Element_Locator}
   ${actualAdjustedProcedureCodeFormatted}     TestDataFormatter.getStringAfterRemovingSpaces            ${actualAdjustedProcedureCode}
   Should be equal          ${actualAdjustedProcedureCodeFormatted}            ${Payer_data_list[0]['OriginalProcedures']}


Verify the Adjustment Details and Summary in Outstanding adjustment details page for Outpatient record
    ${PatientName}             TestDataFormatter.formatPatientName          ${data_list[0]['PatientFirstName']}    ${data_list[0]['PatientLastName']}
    ${PayerDashboard_AdjustmentInfo_PatientName_Header_Locator_New} =  Replace String   ${PayerDashboard_AdjustmentInfo_PatientName_Header_Locator}  ${substringToReplace}  ${PatientName}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_PatientName_Header_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_PatientName_Header_Locator_New}

    ${formattedDOB}             TestDataFormatter.formatDate           ${data_list[0]['DateOfBirth']}
   ${PayerDashboard_AdjustmentInfo_DOB_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_DOB_Detail_Locator}   ${substringToReplace}    ${formattedDOB}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_DOB_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_DOB_Detail_Locator_New}

    #${formattedSubsriberID}             TestDataFormatter.formatSubscriberID           ${data_list[0]['SubscriberId']}
   ${PayerDashboard_AdjustmentInfo_SubscriberID_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_SubscriberID_Detail_Locator}   ${substringToReplace}    ${data_list[0]['SubscriberId']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_SubscriberID_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_SubscriberID_Detail_Locator_New}

   ${PayerDashboard_AdjustmentInfo_GroupID_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_GroupID_Detail_Locator}   ${substringToReplace}    ${data_list[0]['PolicyNumber']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_GroupID_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_GroupID_Detail_Locator_New}

    ${PayerDashboard_AdjustmentInfo_AuditNum_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_AuditNum_Detail_Locator}     ${substringToReplace}    ${data_list[0]['AuditNumber']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_AuditNum_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_AuditNum_Detail_Locator_New}

    ${PayerDashboard_AdjustmentInfo_AuditType_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_AuditType_Detail_Locator}     ${substringToReplace}    ${data_list[0]['AuditType']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_AuditType_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_AuditType_Detail_Locator_New}

    ${formattedAuditStatus}             TestDataFormatter.formatAuditStatus           ${data_list[0]['AuditStatus']}
    ${PayerDashboard_AdjustmentInfo_AuditStatus_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_AuditStatus_Detail_Locator}     ${substringToReplace}    ${formattedAuditStatus}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_AuditStatus_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_AuditStatus_Detail_Locator_New}

    ${PayerDashboard_AdjustmentInfo_ProviderName_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_ProviderName_Detail_Locator}     ${substringToReplace}    ${data_list[0]['ProviderName']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_ProviderName_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_ProviderName_Detail_Locator_New}

   ${PayerDashboard_AdjustmentInfo_ProviderNumber_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_ProviderNumber_Detail_Locator}     ${substringToReplace}    ${data_list[0]['BillingProviderNumber']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_ProviderNumber_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_ProviderNumber_Detail_Locator_New}

   ${PayerDashboard_AdjustmentInfo_ClaimNum_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_ClaimNum_Detail_Locator}     ${substringToReplace}    ${data_list[0]['ClaimNumber']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_ClaimNum_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_ClaimNum_Detail_Locator_New}

#   ${PayerDashboard_AdjustmentInfo_MediRecNum_Detail_Locator_New}=      Replace String      ${PayerDashboard_AdjustmentInfo_MediRecNum_Detail_Locator}     ${substringToReplace}    ${data_list[0]['MRNumber']}
#   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_MediRecNum_Detail_Locator_New}
#   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_MediRecNum_Detail_Locator_New}

   ${formattedAdmitDate}             TestDataFormatter.formatDate           ${data_list[0]['AdmitDate']}
   ${PayerDashboard_AdjustmentInfo_AdmitDate_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_AdmitDate_Detail_Locator}   ${substringToReplace}    ${formattedAdmitDate}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_AdmitDate_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_AdmitDate_Detail_Locator_New}

   ${formattedDischargeDate}             TestDataFormatter.formatDate           ${data_list[0]['DischargeDate']}
   ${PayerDashboard_AdjustmentInfo_DischargeDate_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_DischargeDate_Detail_Locator}   ${substringToReplace}    ${formattedDischargeDate}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_DischargeDate_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_DischargeDate_Detail_Locator_New}

    ${formattedPaidDateDate}             TestDataFormatter.formatDate           ${data_list[0]['PaidDate']}
   ${PayerDashboard_AdjustmentInfo_PaidDate_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_PaidDate_Detail_Locator}   ${substringToReplace}    ${formattedPaidDateDate}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_PaidDate_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_PaidDate_Detail_Locator_New}


     ${adjusted_date}    Set Variable    ${data_list[0]['ReadyForAdjustmentDate'].split('.')[0]}
   ${formattedAdjustmentDate}             TestDataFormatter.formatDate           ${adjusted_date}
   ${PayerDashboard_AdjustmentInfo_AdjustmentRequested_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_AdjustmentRequested_Detail_Locator}   ${substringToReplace}    ${formattedAdjustmentDate}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_AdjustmentRequested_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_AdjustmentRequested_Detail_Locator_New}

#   ${formattedOriginalGrossPay}             TestDataFormatter.formatToCurrency           ${Payer_data_list[0]['OriginalGrossPay']}
#   ${PayerDashboard_AdjustmentInfo_Original_Gross_Pay_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Original_Gross_Pay_Detail_Locator}   ${substringToReplace}    ${formattedOriginalGrossPay}
#   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Original_Gross_Pay_Detail_Locator_New}
#   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Original_Gross_Pay_Detail_Locator_New}

#   ${formattedOriginalNetPay}             TestDataFormatter.formatToCurrency           ${Payer_data_list[0]['OriginalNetPay']}
#   ${PayerDashboard_AdjustmentInfo_Original_Net_Pay_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Original_Net_Pay_Detail_Locator}   ${substringToReplace}    ${formattedOriginalNetPay}
#   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Original_Net_Pay_Detail_Locator_New}
#   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Original_Net_Pay_Detail_Locator_New}
#
#
#   ${formattedIdentifiedGrossPay}             TestDataFormatter.formatToCurrency           ${Payer_data_list[0]['NewGrossPay']}
#   ${PayerDashboard_AdjustmentInfo_Identified_Gross_Pay_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Identified_Gross_Pay_Detail_Locator}   ${substringToReplace}    ${formattedIdentifiedGrossPay}
#   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Identified_Gross_Pay_Detail_Locator_New}
#   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Identified_Gross_Pay_Detail_Locator_New}
#
#
#    ${formattedIdentifiedNetPay}             TestDataFormatter.formatToCurrency           ${Payer_data_list[0]['NewNetPay']}
#   ${PayerDashboard_AdjustmentInfo_Identified_Net_Pay_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Identified_Net_Pay_Detail_Locator}   ${substringToReplace}    ${formattedIdentifiedNetPay}
#   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Identified_Net_Pay_Detail_Locator_New}
#   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Identified_Net_Pay_Detail_Locator_New}
#
#   ${VerifiedAdjustor}             TestDataFormatter.VerifyIfNull           ${data_list[0]['Adjustor']}
#   ${PayerDashboard_AdjustmentInfo_Adjustor_Name_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Adjustor_Name_Detail_Locator}   ${substringToReplace}    ${VerifiedAdjustor}
#   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Adjustor_Name_Detail_Locator_New}
#   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Adjustor_Name_Detail_Locator_New}
#
#   ${VerifiedAdjustmentDate}             TestDataFormatter.VerifyIfNull           ${data_list[0]['AdjustmentDate']}
#   ${PayerDashboard_AdjustmentInfo_Adjustment_date_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Adjustment_date_Detail_Locator}   ${substringToReplace}    ${VerifiedAdjustmentDate}
#   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Adjustment_date_Detail_Locator_New}
#   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Adjustment_date_Detail_Locator_New}
#
###   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Payer_Confirmed_Pay_Detail_Locator}
###   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Payer_Confirmed_Pay_Detail_Locator}
###   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Payer_Confirmed_Savings_Detail_Locator}
###   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Payer_Confirmed_Savings_Detail_Locator}
#
    ${PayerDashboard_AdjustmentInfo_Region_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Region_Detail_Locator}   ${substringToReplace}    ${data_list[0]['Region']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Region_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Region_Detail_Locator_New}

   ${PayerDashboard_AdjustmentInfo_DivisionCode_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_DivisionCode_Detail_Locator}   ${substringToReplace}    ${data_list[0]['DivisionCode']}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_DivisionCode_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_DivisionCode_Detail_Locator_New}

   ${VerifiedReferenceClaim}             TestDataFormatter.VerifyIfNull           ${data_list[0]['ReferenceClaim']}
   ${PayerDashboard_AdjustmentInfo_Reference_Claim_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Reference_Claim_Detail_Locator}   ${substringToReplace}    ${VerifiedReferenceClaim}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Reference_Claim_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Reference_Claim_Detail_Locator_New}


     ${formattedFindingsLetterDate}             TestDataFormatter.formatDate           ${data_list[0]['FindingLettersDate']}
   ${PayerDashboard_AdjustmentInfo_Findings_Letter_Date_Detail_Locator_New}=     Replace String      ${PayerDashboard_AdjustmentInfo_Findings_Letter_Date_Detail_Locator}   ${substringToReplace}     ${formattedFindingsLetterDate}
   Scroll element into view     ${PayerDashboard_AdjustmentInfo_Findings_Letter_Date_Detail_Locator_New}
   Wait Until Element Is Visible    ${PayerDashboard_AdjustmentInfo_Findings_Letter_Date_Detail_Locator_New}
   Element Should Be Visible      ${PayerDashboard_AdjustmentInfo_Findings_Letter_Date_Detail_Locator_New}

   Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_Details_Header_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_Details_Header_Locator}

   Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_Details_Table_OriginalDateOFService_Element_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_Details_Table_OriginalDateOFService_Element_Locator}
   ${actualOriginalDateOFService} =       Get text    ${PayerDashboard_ADJUSTMENT_Details_Table_OriginalDateOFService_Element_Locator}
   ${expectedDateOFService}         TestDataFormatter.formatDateOfService        ${Payer_data_list[0]['OriginalFirstDateOfService']}        ${Payer_data_list[0]['OriginalLastDateOfService']}
   Should be equal          ${actualOriginalDateOFService}            ${expectedDateOFService}

    Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_Details_Table_OriginalRevenue_Element_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_Details_Table_OriginalRevenue_Element_Locator}
   ${actualOriginalRevenue} =       Get text    ${PayerDashboard_ADJUSTMENT_Details_Table_OriginalRevenue_Element_Locator}
   ${actualOriginalRevenueFormatted}     TestDataFormatter.getStringAfterRemovingSpaces            ${actualOriginalRevenue}
   Should be equal          ${actualOriginalRevenueFormatted}            ${Payer_data_list[0]['OriginalRevenueCode']}

   Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_Details_Table_OriginalProcedureCode_Element_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_Details_Table_OriginalProcedureCode_Element_Locator}
   ${actualOriginalProcedureCode} =       Get text    ${PayerDashboard_ADJUSTMENT_Details_Table_OriginalProcedureCode_Element_Locator}
   ${actualOriginalProcedureCodeFormatted}     TestDataFormatter.getStringAfterRemovingSpaces            ${actualOriginalProcedureCode}
   Should be equal          ${actualOriginalProcedureCodeFormatted}            ${Payer_data_list[0]['OriginalProcCode']}


   Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_Details_Table_OriginalModifiers_Element_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_Details_Table_OriginalModifiers_Element_Locator}
   ${actualOriginalModifiers} =       Get text    ${PayerDashboard_ADJUSTMENT_Details_Table_OriginalModifiers_Element_Locator}
   ${actualOriginalModifiersFormatted}     TestDataFormatter.getStringAfterRemovingSpaces            ${actualOriginalModifiers}
   Should be equal          ${actualOriginalModifiersFormatted}           ${Payer_data_list[0]['OriginalModifiers']}

      Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_Details_Table_OriginalUnits_Element_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_Details_Table_OriginalUnits_Element_Locator}
   ${actualOriginalUnits} =       Get text    ${PayerDashboard_ADJUSTMENT_Details_Table_OriginalUnits_Element_Locator}
   ${actualOriginalUnitsFormatted}     TestDataFormatter.getStringAfterRemovingSpaces            ${actualOriginalUnits}
   Should be equal          ${actualOriginalUnitsFormatted}           ${Payer_data_list[0]['OriginalUnits']}

    Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_Details_Table_OriginalPlaceOfService_Element_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_Details_Table_OriginalPlaceOfService_Element_Locator}
   ${actualOriginalPlaceOfService} =       Get text    ${PayerDashboard_ADJUSTMENT_Details_Table_OriginalPlaceOfService_Element_Locator}
   ${actualOriginalPlaceOfServiceFormatted}     TestDataFormatter.getStringAfterRemovingSpaces            ${actualOriginalPlaceOfService}
    Should be equal          ${actualOriginalPlaceOfServiceFormatted}            ${Payer_data_list[0]['OriginalPlaceOfService']}

    Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_Details_Table_OriginalCharges_Element_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_Details_Table_OriginalCharges_Element_Locator}
   ${actualOriginalCharges} =       Get text    ${PayerDashboard_ADJUSTMENT_Details_Table_OriginalCharges_Element_Locator}
   ${actualOriginalChargesFormatted}     TestDataFormatter.getStringAfterRemovingSpaces            ${actualOriginalCharges}
   ${expectedOriginalChargesFormatted} =      TestDataFormatter.formatToCurrency          ${Payer_data_list[0]['OriginalCharges']}

    Should be equal          ${actualOriginalChargesFormatted}             ${expectedOriginalChargesFormatted}


   Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_Details_Table_OriginalGrossPay_Element_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_Details_Table_OriginalGrossPay_Element_Locator}
   ${actualOriginalGrossPay} =       Get text    ${PayerDashboard_ADJUSTMENT_Details_Table_OriginalGrossPay_Element_Locator}
   ${actualOriginalGrossPayFormatted}     TestDataFormatter.getStringAfterRemovingSpaces            ${actualOriginalGrossPay}
   ${expectedOriginalGrossPayFormatted} =      TestDataFormatter.formatToCurrency          ${Payer_data_list[0]['OriginalGrossPay']}

    Should be equal          ${actualOriginalGrossPayFormatted}            ${expectedOriginalGrossPayFormatted}

    Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_Details_Table_AdjustedDateOFService_Element_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_Details_Table_AdjustedDateOFService_Element_Locator}
   ${actualAdjustedDateOFService} =       Get text    ${PayerDashboard_ADJUSTMENT_Details_Table_AdjustedDateOFService_Element_Locator}
   ${expectedDateOFService}         TestDataFormatter.formatDateOfService        ${Payer_data_list[0]['NewFirstDateOfService']}        ${Payer_data_list[0]['NewLastDateOfService']}
   Should be equal          ${actualAdjustedDateOFService}            ${expectedDateOFService}

    Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_Details_Table_AdjustedRevenue_Element_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_Details_Table_AdjustedRevenue_Element_Locator}
   ${actualAdjustedRevenue} =       Get text    ${PayerDashboard_ADJUSTMENT_Details_Table_AdjustedRevenue_Element_Locator}
   ${actualAdjustedRevenueFormatted}     TestDataFormatter.getStringAfterRemovingSpaces            ${actualAdjustedRevenue}
   Should be equal          ${actualAdjustedRevenueFormatted}            ${Payer_data_list[0]['NewRevenueCode']}

   Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_Details_Table_AdjustedProcedureCode_Element_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_Details_Table_AdjustedProcedureCode_Element_Locator}
   ${actualAdjustedProcedureCode} =       Get text    ${PayerDashboard_ADJUSTMENT_Details_Table_AdjustedProcedureCode_Element_Locator}
   ${actualAdjustedProcedureCodeFormatted}     TestDataFormatter.getStringAfterRemovingSpaces            ${actualAdjustedProcedureCode}
   Should be equal          ${actualAdjustedProcedureCodeFormatted}            ${Payer_data_list[0]['NewProcCode']}


   Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_Details_Table_AdjustedModifiers_Element_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_Details_Table_AdjustedModifiers_Element_Locator}
   ${actualAdjustedModifiers} =       Get text    ${PayerDashboard_ADJUSTMENT_Details_Table_AdjustedModifiers_Element_Locator}
   ${actualAdjustedModifiersFormatted}     TestDataFormatter.getStringAfterRemovingSpaces            ${actualAdjustedModifiers}
 #  Should be equal          ${actualAdjustedModifiersFormatted}           ${Payer_data_list[0]['NewModifiers']}

      Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_Details_Table_AdjustedUnits_Element_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_Details_Table_AdjustedUnits_Element_Locator}
   ${actualAdjustedUnits} =       Get text    ${PayerDashboard_ADJUSTMENT_Details_Table_AdjustedUnits_Element_Locator}
   ${actualAdjustedUnitsFormatted}     TestDataFormatter.getStringAfterRemovingSpaces            ${actualAdjustedUnits}
   Should be equal          ${actualAdjustedUnitsFormatted}           ${Payer_data_list[0]['NewUnits']}

    Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_Details_Table_AdjustedPlaceOfService_Element_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_Details_Table_AdjustedPlaceOfService_Element_Locator}
   ${actualAdjustedPlaceOfService} =       Get text    ${PayerDashboard_ADJUSTMENT_Details_Table_AdjustedPlaceOfService_Element_Locator}
   ${actualAdjustedPlaceOfServiceFormatted}     TestDataFormatter.getStringAfterRemovingSpaces            ${actualAdjustedPlaceOfService}
    Should be equal          ${actualAdjustedPlaceOfServiceFormatted}            ${Payer_data_list[0]['NewPlaceOfService']}

    Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_Details_Table_AdjustedCharges_Element_Locator}
   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_Details_Table_AdjustedCharges_Element_Locator}
   ${actualAdjustedCharges} =       Get text    ${PayerDashboard_ADJUSTMENT_Details_Table_AdjustedCharges_Element_Locator}
   ${actualAdjustedChargesFormatted}     TestDataFormatter.getStringAfterRemovingSpaces            ${actualAdjustedCharges}
   ${expectedAdjustedChargesFormatted} =      TestDataFormatter.formatToCurrency          ${Payer_data_list[0]['NewCharges']}
    Should be equal          ${actualAdjustedChargesFormatted}             ${expectedAdjustedChargesFormatted}


#   Wait Until Element Is Visible    ${PayerDashboard_ADJUSTMENT_Details_Table_AdjustedGrossPay_Element_Locator}
#   Element Should Be Visible      ${PayerDashboard_ADJUSTMENT_Details_Table_AdjustedGrossPay_Element_Locator}
#   ${actualAdjustedGrossPay} =       Get text    ${PayerDashboard_ADJUSTMENT_Details_Table_AdjustedGrossPay_Element_Locator}
#   ${actualAdjustedGrossPayFormatted}     TestDataFormatter.getStringAfterRemovingSpaces            ${actualAdjustedGrossPay}
#   ${expectedAdjustedGrossPayFormatted} =      TestDataFormatter.formatToCurrency          ${Payer_data_list[0]['NewGrossPay']}
#    Should be equal          ${actualAdjustedGrossPayFormatted}            ${expectedAdjustedGrossPayFormatted}

Get the Number of claims on Outstanding Claims Page
    Wait Until Element Is Visible    ${Comm_Portal_Payer_View_Claims_button_Locator_Value}    timeout=120
    ${NumberOfClaimsAvaialbleForPayer} =    Get Text    ${Comm_Portal_Payer_View_Claims_button_Locator_Value}
    log      ${NumberOfClaimsAvaialbleForPayer}
    Set global variable        ${NumberOfClaimsAvaialbleForPayer}



Click Export Audit
    Wait Until Element Is Visible        ${PayerDashboard_OutstandingAdjustment_ExportAudit_Button_Locator}        timeout=120
    click element            ${PayerDashboard_OutstandingAdjustment_ExportAudit_Button_Locator}


Verify the columns in the downloaded export
     ${expectedColumns_list}=         create list              Claim Number	Prepay	Days SinceRequest Date	AdjustmentRequest Date	Provider Name	ProviderNumber	Audit Status	AuditNumber	AuditType	IdentifiedSavings	ConfirmedSavings
      ${lists_equal}          Lists should be equal       ${downloaded_data_list[0].keys()}          ${expectedColumns_list}


Verify the record in the downloaded export for Outstanding Adjustment Page
     ${actualNoOfRecords} =     get length  ${downloaded_data_list}
    ${expectedRecords} =      Convert to integer   ${NumberOfClaimsAvaialbleForPayer}
     Should Be Equal       ${expectedRecords}      ${actualNoOfRecords}



Verify the columns in the downloaded export of AdjustmentHistory Page
      ${expectedColumns_list}=         create list             	Claim Number	Prepay	Provider	ProviderNumber	Status	AuditType	IdentifiedSavings	ConfirmedSavings	AdjustmentRequest Date	AdjustmentDate	AdjustmentUser
      ${lists_equal}          Lists should be equal       ${downloaded_data_list[0].keys()}          ${expectedColumns_list}


Fetch the First Record in AdjustMentHistoryPage
    wait until Element is Visible       ${PayerDashboard_AdjustmentHistoryPage_ClaimNumber1_Locator}
    ${firstClaimNumber} =    Get text    ${PayerDashboard_AdjustmentHistoryPage_ClaimNumber1_Locator}
    Set global variable      ${firstClaimNumber}


Click View Final Level Appeals
    Wait Until Element Is Visible        ${PayerDashboard_FinalLevelAppeal_ViewAppeal_Element_Locator}        timeout=120
    click element            ${PayerDashboard_FinalLevelAppeal_ViewAppeal_Element_Locator}

Verify the record in the downloaded export for Adjustment History Page
     ${actualNoOfRecords} =     get length  ${downloaded_data_list}
     Should Be Equal       ${firstClaimNumber}      ${downloaded_data_list[0]['Claim Number']}


Verify Outstanding Final Level Appeals Page Is Displayed
     Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeal_OutstandingAppealsPage_Element_Locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_FinalLevelAppeal_OutstandingAppealsPage_Element_Locator}

Click Final Appeals History page
    Wait Until Element Is Visible        ${PayerDashboard_FinalLevelAppeal_History_Tab_Element_Locator}        timeout=120
    click element            ${PayerDashboard_FinalLevelAppeal_History_Tab_Element_Locator}

Verify Final Level Appeals History Page Is Displayed
     Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_History_Page_Element_Locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_FinalLevelAppeals_History_Page_Element_Locator}

Validate the Final Appeal Details
      ${PayerDashboard_FinalLevelAppeals_HistoryPage_ClaimNumber_Element_Locator_New}=    Replace String    ${PayerDashboard_FinalLevelAppeals_HistoryPage_ClaimNumber_Element_Locator}       ${substringToReplace}       ${data_list[0]['ClaimNumber']}
      Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_HistoryPage_ClaimNumber_Element_Locator_New}
      Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_HistoryPage_ClaimNumber_Element_Locator_New}
      IF  '${data_list[0]['Prepay']}=False'
        ${PrepayValue}=     Set Variable    No
        Set Global Variable     ${PrepayValue}
      ELSE IF   '${data_list[0]['Prepay']}=True'
       ${PrepayValue}=     Set Variable    Yes
       Set Global Variable     ${PrepayValue}
      END
       ${PayerDashboard_FinalLevelAppeals_HistoryPage_Prepay_Element_Locator_New}=     Replace String    ${PayerDashboard_FinalLevelAppeals_HistoryPage_Prepay_Element_Locator}       ${substringToReplace}       ${PrepayValue}
      Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_HistoryPage_Prepay_Element_Locator_New}
      Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_HistoryPage_Prepay_Element_Locator_New}
       ${PayerDashboard_FinalLevelAppeals_HistoryPage_ProviderName_Element_Locator_New}=    Replace String    ${PayerDashboard_FinalLevelAppeals_HistoryPage_ProviderName_Element_Locator}       ${substringToReplace}       ${data_list[0]['ProviderName']}
      Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_HistoryPage_ProviderName_Element_Locator_New}
      Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_HistoryPage_ProviderName_Element_Locator_New}
      ${PayerDashboard_FinalLevelAppeals_HistoryPage_ProviderNumber_Element_Locator_New}=    Replace String    ${PayerDashboard_FinalLevelAppeals_HistoryPage_ProviderNumber_Element_Locator}       ${substringToReplace}       ${data_list[0]['BillingProviderNumber']}
      Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_HistoryPage_ProviderNumber_Element_Locator_New}
      Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_HistoryPage_ProviderNumber_Element_Locator_New}
      ${formattedAuditStatus}             TestDataFormatter.split_by_capital          ${data_list[0]['AuditStatus']}
       ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditStatus_Element_Locator_New}=    Replace String    ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditStatus_Element_Locator}       ${substringToReplace}         ${formattedAuditStatus}
      Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditStatus_Element_Locator_New}
      Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditStatus_Element_Locator_New}
       ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditNumber_Element_Locator_New}=    Replace String    ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditNumber_Element_Locator}       ${substringToReplace}       ${data_list[0]['AuditNumber']}
      Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditNumber_Element_Locator_New}
      Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditNumber_Element_Locator_New}
      ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditType_Element_Locator_New}=    Replace String    ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditType_Element_Locator}       ${substringToReplace}       ${data_list[0]['AuditType']}
      Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditType_Element_Locator_New}
      Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditType_Element_Locator_New}
      ${PayerDashboard_FinalLevelAppeals_HistoryPage_DivisionCode_Element_Locator_New}=    Replace String    ${PayerDashboard_FinalLevelAppeals_HistoryPage_DivisionCode_Element_Locator}       ${substringToReplace}       ${data_list[0]['DivisionCode']}
      Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_HistoryPage_DivisionCode_Element_Locator_New}
      Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_HistoryPage_DivisionCode_Element_Locator_New}

      ${sqlQueryToExec}=       Replace string        ${FinalAppealsDetailsSqlQuery}     auditNumber      ${data_list[0]['AuditNumber']}
      Log to console     ${sqlQueryToExec}
      Connect to DB for a specific Database     ${sqlQueryToExec}     ${DBName}
      ${formatted1IdentifiedSavings}=      Catenate       $          ${data_list[0]['IdentifiedGrossSavings']}
      ${formatted2IdentifiedSavings}=      Replace String    ${formatted1IdentifiedSavings}      ${SPACE}        ${empty}

      ${PayerDashboard_FinalLevelAppeals_HistoryPage_IdentifiedSavings_Element_Locator_New}=    Replace String    ${PayerDashboard_FinalLevelAppeals_HistoryPage_IdentifiedSavings_Element_Locator}       ${substringToReplace}         ${formatted2IdentifiedSavings}
      Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_HistoryPage_IdentifiedSavings_ALLElements_Locator}
      Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_HistoryPage_IdentifiedSavings_ALLElements_Locator}
       Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_HistoryPage_InitialFindings_AllElements_Locator}
      Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_HistoryPage_InitialFindings_AllElements_Locator}
       Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_HistoryPage_FirstFindings_AllElements_Locator}
      Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_HistoryPage_FirstFindings_AllElements_Locator}
      Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_HistoryPage_SecondFindings_AllElements_Locator}
      Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_HistoryPage_SecondFindings_AllElements_Locator}
      Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_HistoryPage_FinalFindings_AllElements_Locator}
      Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_HistoryPage_FinalFindings_AllElements_Locator}
       Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_HistoryPage_ProviderName_Information_Icon_Element_Locator}
      Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_HistoryPage_ProviderName_Information_Icon_Element_Locator}
      Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_HistoryPage_Initial_Findings_Information_Icon_Element_Locator}
      Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_HistoryPage_Initial_Findings_Information_Icon_Element_Locator}
      Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_HistoryPage_FirstAppeal_Findings_Information_Icon_Element_Locator}
      Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_HistoryPage_FirstAppeal_Findings_Information_Icon_Element_Locator}
	  IF       "${DBName}"=="MSSTATE" and "${DBName}"=="HMBCBS"
              Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_HistoryPage_SecondAppeal_Findings_Information_Icon_Element_Locator}
              Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_HistoryPage_SecondAppeal_Findings_Information_Icon_Element_Locator}
	  END
	  Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_HistoryPage_FinalAppeal_Findings_Information_Icon_Element_Locator}
      Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_HistoryPage_FinalAppeal_Findings_Information_Icon_Element_Locator}

Verify data after applying filter Functionality by providing Provider Number in Outstanding Final Level Appeals Page
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_HistoryPage_Filtered_Results_Element_Locator}
    IF   ${present} == True
        ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_ProviderNumber_AllElements_Locator}
        FOR    ${i}     IN RANGE    1   ${element_count}+1
        ${get_ProviderNumber}=  Get Text      ${PayerDashboard_FinalLevelAppeals_HistoryPage_ProviderNumber_AllElements_Locator} [${i}]
        Should be equal      ${get_ProviderNumber}    ${data_list[0]['BillingProviderNumber']}
        END
        ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
        WHILE    ${present} == True
              Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
              ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_ProviderNumber_AllElements_Locator}
              FOR    ${i}     IN RANGE    1   ${element_count}+1
                 ${get_ProviderNumber}=  Get Text      ${RPayerDashboard_FinalLevelAppeals_HistoryPage_ProviderNumber_AllElements_Locator} [${i}]
                 Should be equal      ${get_ProviderNumber}    ${data_list[0]['BillingProviderNumber']}
              END
        END
    ELSE
                Page should contain        There are no Final Appeal Requests which meet the criteria.
    END


Verify filter Functionality by providing Provider Number in Final Appeal History Page
       [Arguments]   ${Num_PassedByUser}
       Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_History_Filter_ProviderNumber_TextField_Locator}
       Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_History_Filter_ProviderNumber_TextField_Locator}
       Click Element                    ${PayerDashboard_FinalLevelAppeals_History_Filter_ProviderNumber_TextField_Locator}
       Input Text                       ${PayerDashboard_FinalLevelAppeals_History_Filter_ProviderNumber_TextField_Locator}      ${Num_PassedByUser}
       Sleep    3

Verify filter Functionality by providing Claim Number in Final Appeal History Page
     [Arguments]   ${Num_PassedByUser}
       Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_History_Filter_ClaimNumber_TextField_Locator}
       Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_History_Filter_ClaimNumber_TextField_Locator}
       Click Element                    ${PayerDashboard_FinalLevelAppeals_History_Filter_ClaimNumber_TextField_Locator}
       Input Text                       ${PayerDashboard_FinalLevelAppeals_History_Filter_ClaimNumber_TextField_Locator}      ${Num_PassedByUser}
       Sleep    3


Verify filter Functionality by providing Audit Number in Final Appeal History Page
     [Arguments]   ${Num_PassedByUser}
       Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_History_Filter_AuditNumber_TextField_Locator}
       Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_History_Filter_AuditNumber_TextField_Locator}
       Click Element                    ${PayerDashboard_FinalLevelAppeals_History_Filter_AuditNumber_TextField_Locator}
       Input Text                       ${PayerDashboard_FinalLevelAppeals_History_Filter_AuditNumber_TextField_Locator}      ${Num_PassedByUser}
       Sleep    3

Click Apply Filter Button in Final Appeal History Page
        Wait Until Element Is Visible           ${PayerDashboard_FinalLevelAppeals_History_Filter_ApplyFilter_Button_Locator}    timeout=120
        Click Button                           ${PayerDashboard_FinalLevelAppeals_History_Filter_ApplyFilter_Button_Locator}



Verify data after applying filter Functionality by providing Claim Number in Final Appeal History Page
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_HistoryPage_Filtered_Results_Element_Locator}
    IF   ${present} == True
        ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_ClaimNumber_AllElements_Locator}
        FOR    ${i}     IN RANGE    1   ${element_count}+1
        ${get_ClaimNumber}=  Get Text      ${PayerDashboard_FinalLevelAppeals_HistoryPage_ClaimNumber_AllElements_Locator} [${i}]
        Should be equal      ${get_ClaimNumber}    ${data_list[0]['ClaimNumber']}
        END
        ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
        WHILE    ${present} == True
              Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
              ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_ClaimNumber_AllElements_Locator}
              FOR    ${i}     IN RANGE    1   ${element_count}+1
                 ${get_ClaimNumber}=  Get Text      ${RPayerDashboard_FinalLevelAppeals_HistoryPage_ClaimNumber_AllElements_Locator} [${i}]
                 Should be equal      ${get_ClaimNumber}    ${data_list[0]['ClaimNumber']}
              END
        END
    ELSE
                Page should contain        There are no Final Level Appeals History Results which meet the criteria.
    END


Verify data after applying filter Functionality by providing Audit Number in Final Appeal History Page
      ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_HistoryPage_Filtered_Results_Element_Locator}
      IF   ${present} == True
        ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditNumber_AllElements_Locator}
        FOR    ${i}     IN RANGE    1   ${element_count}+1
        ${get_AuditNumber}=  Get Text      ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditNumber_AllElements_Locator} [${i}]
        Should be equal      ${get_AuditNumber}    ${data_list[0]['AuditNumber']}
        END
        ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
        WHILE    ${present} == True
              Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
              ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditNumber_AllElements_Locator}
              FOR    ${i}     IN RANGE    1   ${element_count}+1
                 ${get_AuditNumber}=  Get Text      ${RPayerDashboard_FinalLevelAppeals_HistoryPage_AuditNumber_AllElements_Locator} [${i}]
                 Should be equal      ${get_AuditNumber}    ${data_list[0]['AuditNumber']}
              END
        END
      ELSE
                Page should contain        There are no Final Level Appeals History Results which meet the criteria.
      END



Verify data after applying filter Functionality by providing Prepay As No
      ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_HistoryPage_Filtered_Results_Element_Locator}
      IF  ${present} == True
            Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_History_Prepay_No_Element_Locator}         timeout=120
            Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_History_Prepay_No_Element_Locator}
            Wait until element is not visible    ${PayerDashboard_FinalLevelAppeals_History_Prepay_Yes_Element_Locator}
            ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
            WHILE    ${present} == True
              Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
              Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_History_Prepay_No_Element_Locator}         timeout=120
              Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_History_Prepay_No_Element_Locator}
              Wait until element is not visible    ${PayerDashboard_FinalLevelAppeals_History_Prepay_Yes_Element_Locator}
      END
      ELSE
             Page should contain        There are no Final Level Appeals History Results which meet the criteria.
      END

Verify data after applying filter Functionality by providing Prepay As Yes
        ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_HistoryPage_Filtered_Results_Element_Locator}
        IF  ${present} == True
            Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_History_Prepay_Yes_Element_Locator}         timeout=120
            Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_History_Prepay_Yes_Element_Locator}
            Wait until element is not visible    ${PayerDashboard_FinalLevelAppeals_History_Prepay_No_Element_Locator}
            ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
            WHILE    ${present} == True
              Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
              Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_History_Prepay_Yes_Element_Locator}         timeout=120
              Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_History_Prepay_Yes_Element_Locator}
              Wait until element is not visible    ${PayerDashboard_FinalLevelAppeals_History_Prepay_No_Element_Locator}
        END
        ELSE

              ${text_1_exists}=    Run Keyword And Return Status    Page Should Contain      There are no Final Level Appeals History Results which meet the criteria.
              ${text_2_exists}=    Run Keyword And Return Status    Page Should Contain         There are no Final Appeal Requests which meet the criteria.
              Run Keyword If    ${text_1_exists} or ${text_2_exists}    Log    Page contains expected text
    ...       ELSE    Fail    Page does not contain expected text

        END

Apply filter Functionality by providing ClaimType as
    [Arguments]        ${Option}
    Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_History_Filter_ClaimType_Locator}   timeout=60
     IF    ${Option} == 'Inpatient'
    ${OptionToChoose}    Set Variable    1: I
    ELSE IF     ${Option} == 'Outpatient'
    ${OptionToChoose}    Set Variable    2: O
    END
    Select from list by value    ${PayerDashboard_FinalLevelAppeals_History_Filter_ClaimType_Locator}      ${OptionToChoose}

Verify data after applying filter Functionality by providing ClaimType
     ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_HistoryPage_Filtered_Results_Element_Locator}
     IF  ${present} == True
        ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_ClaimNumber_AllElements_Locator}
        Click element        ${PayerDashboard_FinalLevelAppeals_HistoryPage_ClaimNumber_AllElements_Locator}
        ${e}=       set variable    1
        WHILE      ${element_count}>=${e}
        sleep   5
        IF      ${e}< ${element_count}
            ${a}=   get text        ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ClaimType_Element_Locator}
            IF  "${a}"== "Inpatient"
            Click Next Request Button in Adjustment History
            ${e}=   evaluate          ${e}+1
            ELSE
            Break
            END

        ELSE IF  ${e}== ${element_count}
            ${a}=   get text        ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ClaimType_Element_Locator}
            IF  "${a}"== "Inpatient"
            log     pass
            ${e}=   evaluate          ${e}+1
            ELSE
            Break
            END
        END
        END

     ELSE
                Page should contain        There are no Final Level Appeals History Results which meet the criteria.
     END

Verify the columns in the downloaded export of Final Appeal Page
      ${expectedColumns_list}=         create list             	Claim Number	Prepay      	Provider Name	Provider Number	    Medical Record Number     Audit Status	Audit Number    Audit Type 	Identified Savings	    Division Code    Initial Findings     First Appeal	 Second Appeal     Final Appeal
      ${lists_equal}          Lists should be equal       ${downloaded_data_list[0].keys()}          ${expectedColumns_list}

Fetch the First Record in FinalAppealHistoryPage
    wait until Element is Visible       ${PayerDashboard_FinalLevelAppeals_HistoryPage_ClaimNumber_AllElements_Locator}
    ${firstClaimNumber} =    Get text    ${PayerDashboard_FinalLevelAppeals_HistoryPage_ClaimNumber_AllElements_Locator}
    Set global variable      ${firstClaimNumber}

Verify the record in the downloaded export for Final Appeal Page
     ${actualNoOfRecords} =     get length  ${downloaded_data_list}
     Should Be Equal       ${firstClaimNumber}      ${downloaded_data_list[0]['Claim Number']}

Double Click Claim Number header in Payer dashboard Final Appeals History and verify sorting is done in Ascending order
    wait until Element is visible   ${PayerDashboard_FinalLevelAppeals_HistoryPage_ClaimNumberColumnHeader_Locator}
    Double Click Element   ${PayerDashboard_FinalLevelAppeals_HistoryPage_ClaimNumberColumnHeader_Locator}
    sleep   5
    ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_ClaimNumber_AllElements_Locator}
    @{ClaimNumber_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_ClaimNumber}=  Get Text      ${PayerDashboard_FinalLevelAppeals_HistoryPage_ClaimNumber_AllElements_Locator} [${i}]
    Append To List      ${ClaimNumber_list}    ${get_ClaimNumber}
    END
    log      ${ClaimNumber_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
        IF    ${present} == True
          Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
          ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_ClaimNumber_AllElements_Locator}
          @{ClaimNumber_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_ClaimNumber}=  Get Text      ${PayerDashboard_FinalLevelAppeals_HistoryPage_ClaimNumber_AllElements_Locator} [${i}]
             Append To List      ${ClaimNumber_list}    ${get_ClaimNumber}
          END
        END
    log      ${ClaimNumber_list}
    ${Sort_order}=  Copy list  ${ClaimNumber_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${ClaimNumber_list}     ${Sort_order}

Double Click Prepay header in Payer dashboard Final Appeals History and verify sorting is done in Ascending order
    wait until Element is visible   ${PayerDashboard_FinalLevelAppeals_HistoryPage_PrepayColumnHeader_Locator}
    Double Click Element   ${PayerDashboard_FinalLevelAppeals_HistoryPage_PrepayColumnHeader_Locator}
    sleep   5
    ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_Prepay_AllElements_Locator}
    @{Prepay_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_Prepay}=  Get Text      ${PayerDashboard_FinalLevelAppeals_HistoryPage_Prepay_AllElements_Locator} [${i}]
    Append To List      ${Prepay_list}    ${get_Prepay}
    END
    log      ${Prepay_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
    IF    ${present} == True
          Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
          ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_Prepay_AllElements_Locator}
          @{Prepay_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_Prepay}=  Get Text      ${PayerDashboard_FinalLevelAppeals_HistoryPage_Prepay_AllElements_Locator} [${i}]
             Append To List      ${Prepay_list}    ${get_Prepay}
          END
    END
    log      ${Prepay_list}
    ${Sort_order}=  Copy list  ${Prepay_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${Prepay_list}     ${Sort_order}


Double Click Provider Name header in Payer dashboard Final Appeals History and verify sorting is done in Ascending order
     wait until Element is visible   ${PayerDashboard_FinalLevelAppeals_HistoryPage_ProviderNameColumnHeader_Locator}
    Double Click Element   ${PayerDashboard_FinalLevelAppeals_HistoryPage_ProviderNameColumnHeader_Locator}
    sleep   5
    ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_ProviderName_AllElements_Locator}
    @{ProviderName_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_ProviderName}=  Get Text      ${PayerDashboard_FinalLevelAppeals_HistoryPage_ProviderName_AllElements_Locator} [${i}]
    Append To List      ${ProviderName_list}    ${get_ProviderName}
    END
    log      ${ProviderName_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
    IF    ${present} == True
          Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
          ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_ProviderName_AllElements_Locator}
          @{ProviderName_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_ProviderName}=  Get Text      ${PayerDashboard_FinalLevelAppeals_HistoryPage_ProviderName_AllElements_Locator} [${i}]
             Append To List      ${ProviderName_list}    ${get_ProviderName}
          END
    END
    log      ${ProviderName_list}
    ${Sort_order}=  Copy list  ${ProviderName_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${ProviderName_list}     ${Sort_order}

Double Click Provider Number header in Payer dashboard Final Appeals History and verify sorting is done in Ascending order
     wait until Element is visible   ${PayerDashboard_FinalLevelAppeals_HistoryPage_ProviderNumberColumnHeader_Locator}
    Double Click Element   ${PayerDashboard_FinalLevelAppeals_HistoryPage_ProviderNumberColumnHeader_Locator}
    sleep   5
    ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_ProviderNumber_AllElements_Locator}
    @{ProviderNumber_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_ProviderNumber}=  Get Text      ${PayerDashboard_FinalLevelAppeals_HistoryPage_ProviderNumber_AllElements_Locator} [${i}]
    Append To List      ${ProviderNumber_list}    ${get_ProviderNumber}
    END
    log      ${ProviderNumber_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
    IF    ${present} == True
          Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
          ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_ProviderNumber_AllElements_Locator}
          @{ProviderNumber_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_ProviderNumber}=  Get Text      ${PayerDashboard_FinalLevelAppeals_HistoryPage_ProviderNumber_AllElements_Locator} [${i}]
             Append To List      ${ProviderNumber_list}    ${get_ProviderNumber}
          END
    END
    log      ${ProviderNumber_list}
    ${Sort_order}=  Copy list  ${ProviderNumber_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${ProviderNumber_list}     ${Sort_order}

Double Click Audit Status header in Payer dashboard Final Appeals History and verify sorting is done in Ascending order
     wait until Element is visible   ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditStatusColumnHeader_Locator}
    Double Click Element   ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditStatusColumnHeader_Locator}
    sleep   5
    ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditStatus_AllElements_Locator}
    @{AuditStatus_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_AuditStatus}=  Get Text      ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditStatus_AllElements_Locator} [${i}]
    Append To List      ${AuditStatus_list}    ${get_AuditStatus}
    END
    log      ${AuditStatus_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
    IF    ${present} == True
          Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
          ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditStatus_AllElements_Locator}
          @{AuditStatus_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_AuditStatus}=  Get Text      ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditStatus_AllElements_Locator} [${i}]
             Append To List      ${AuditStatus_list}    ${get_AuditStatus}
          END
    END
    log      ${AuditStatus_list}
    ${Sort_order}=  Copy list  ${AuditStatus_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${AuditStatus_list}     ${Sort_order}

Double Click Audit Number header in Payer dashboard Final Appeals History and verify sorting is done in Ascending order
     wait until Element is visible   ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditNumberColumnHeader_Locator}
    Double Click Element   ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditNumberColumnHeader_Locator}
    sleep   5
    ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditNumber_AllElements_Locator}
    @{AuditNumber_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_AuditNumber}=  Get Text      ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditNumber_AllElements_Locator} [${i}]
    Append To List      ${AuditNumber_list}    ${get_AuditNumber}
    END
    log      ${AuditNumber_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
    IF    ${present} == True
          Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
          ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditNumber_AllElements_Locator}
          @{AuditNumber_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_AuditNumber}=  Get Text      ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditNumber_AllElements_Locator} [${i}]
             Append To List      ${AuditNumber_list}    ${get_AuditNumber}
          END
    END
    log      ${AuditNumber_list}
    ${Sort_order}=  Copy list  ${AuditNumber_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${AuditNumber_list}     ${Sort_order}

Double Click Audit Type header in Payer dashboard Final Appeals History and verify sorting is done in Ascending order
     wait until Element is visible   ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditTypeColumnHeader_Locator}
    Double Click Element   ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditTypeColumnHeader_Locator}
    sleep   5
    ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditType_AllElements_Locator}
    @{AuditType_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_AuditType}=  Get Text      ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditType_AllElements_Locator} [${i}]
    Append To List      ${AuditType_list}    ${get_AuditType}
    END
    log      ${AuditType_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
    IF    ${present} == True
          Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
          ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditType_AllElements_Locator}
          @{AuditType_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_AuditType}=  Get Text      ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditType_AllElements_Locator} [${i}]
             Append To List      ${AuditType_list}    ${get_AuditType}
          END
    END
    log      ${AuditType_list}
    ${Sort_order}=  Copy list  ${AuditType_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${AuditType_list}     ${Sort_order}

Double Click IdentifiedSavings header in Payer dashboard Final Appeals History and verify sorting is done in Ascending order
     wait until Element is visible   ${PayerDashboard_FinalLevelAppeals_HistoryPage_IdentifiedSavingsColumnHeader_Locator}
    Double Click Element   ${PayerDashboard_FinalLevelAppeals_HistoryPage_IdentifiedSavingsColumnHeader_Locator}
    sleep   5
    ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_IdentifiedSavings_AllElements_Locator}
    @{IdentifiedSavings_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_IdentifiedSavings}=  Get Text      ${PayerDashboard_FinalLevelAppeals_HistoryPage_IdentifiedSavings_AllElements_Locator} [${i}]
    ${get_IdentifiedSavingsFormatted}=    Replace string       ${get_IdentifiedSavings}       $         ${empty}
    Append To List      ${IdentifiedSavings_list}    ${get_IdentifiedSavingsFormatted}
    END
    log      ${IdentifiedSavings_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
    IF    ${present} == True
          Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
          ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_IdentifiedSavings_AllElements_Locator}
          @{IdentifiedSavings_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_IdentifiedSavings}=  Get Text      ${PayerDashboard_FinalLevelAppeals_HistoryPage_IdentifiedSavings_AllElements_Locator} [${i}]
             ${get_IdentifiedSavingsFormatted}=    Replace string       ${get_IdentifiedSavings}       $         ${empty}
             Append To List      ${IdentifiedSavings_list}    ${get_IdentifiedSavingsFormatted}
          END
    END
    log      ${IdentifiedSavings_list}
    ${Sort_order}=  Copy list  ${IdentifiedSavings_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${IdentifiedSavings_list}     ${Sort_order}

Double Click Division Code header in Payer dashboard Final Appeals History and verify sorting is done in Ascending order
     wait until Element is visible   ${PayerDashboard_FinalLevelAppeals_HistoryPage_DivisionCodeColumnHeader_Locator}
    Double Click Element   ${PayerDashboard_FinalLevelAppeals_HistoryPage_DivisionCodeColumnHeader_Locator}
    sleep   5
    ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_DivisionCode_AllElements_Locator}
    @{DivisionCode_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_DivisionCode}=  Get Text      ${PayerDashboard_FinalLevelAppeals_HistoryPage_DivisionCode_AllElements_Locator} [${i}]
    Append To List      ${DivisionCode_list}    ${get_DivisionCode}
    END
    log      ${DivisionCode_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
    IF    ${present} == True
          Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
          ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_DivisionCode_AllElements_Locator}
          @{DivisionCode_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_DivisionCode}=  Get Text      ${PayerDashboard_FinalLevelAppeals_HistoryPage_DivisionCode_AllElements_Locator} [${i}]
             Append To List      ${DivisionCode_list}    ${get_DivisionCode}
          END
    END
    log      ${DivisionCode_list}
    ${Sort_order}=  Copy list  ${DivisionCode_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${DivisionCode_list}     ${Sort_order}


Double Click Initial Findings header in Payer dashboard Final Appeals History and verify sorting is done in Ascending order
        wait until Element is visible   ${PayerDashboard_FinalLevelAppeals_HistoryPage_InitialFindingsColumnHeader_Locator}
    Double Click Element   ${PayerDashboard_FinalLevelAppeals_HistoryPage_InitialFindingsColumnHeader_Locator}
    sleep   5
    ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_InitialFindings_AllElements_Locator}
    @{Date_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_Date}=  Get Text      ${PayerDashboard_FinalLevelAppeals_HistoryPage_InitialFindings_AllElements_Locator} [${i}]
    ${get_DateFormatted} =     Replace string       ${get_Date}      info\n\n           ${empty}
    Append To List      ${Date_list}    ${get_DateFormatted}
    END
    log      ${Date_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
    IF    ${present} == True
          Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
          ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_InitialFindings_AllElements_Locator}
          @{Date_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_Date}=  Get Text      ${PayerDashboard_FinalLevelAppeals_HistoryPage_InitialFindings_AllElements_Locator} [${i}]
             ${get_DateFormatted} =     Replace string       ${get_Date}      info\n\n           ${empty}
             Append To List      ${Date_list}    ${get_DateFormatted}
          END
    END
    log      ${Date_list}
    ${Sort_order}=  Copy list  ${Date_list}
    ${sorted_dates}       Sort Dates MM/DD/YYYY      ${Sort_order}
    log      ${sorted_dates}
    lists should be equal       ${Date_list}     ${sorted_dates}



Connect to Db with more than 10 records
     [arguments]     ${payerDashabordPaginationQuery}
     CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity To Fetch More than 10 Records    ${payerDashabordPaginationQuery}


Verify that only 10 records per page are displayed
   ${element_count}=       get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_ClaimNumber_AllElements_Locator}
   ${element_count} =    Convert to string      ${element_count}
   Should be equal       ${element_count}      10


Verify clicking on Next displays next page
     Click element           ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_NextPage_Element_Locator}
     Page should contain element     ${BiilingAnalyst_List_view_Second_page_Locator}
     ${actual_text}=    Get text    ${BiilingAnalyst_List_view_Second_page_Locator}
     Should contain    ${actual_text}          You're on page
     Should contain    ${actual_text}          2

Verify clicking on Previous displays previous page
     Click element           ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PreviousPage_Element_Locator}
     Page should contain element     ${BiilingAnalyst_List_view_First_page_Locator}
     ${actual_text}=    Get text    ${BiilingAnalyst_List_view_First_page_Locator}
     Should contain    ${actual_text}          You're on page
     Should contain    ${actual_text}          1



Return Final Appeal History ClaimNumber hyperlink locator with Claim number passed by user
     [Arguments]   ${ClaimNum_PassedByUser}
     ${Comm_Portal_Final_Appeal_ClaimNumber_Locator_New} =     Replace String      ${PayerDashboard_FinalLevelAppeals_HistoryPage_ClaimNumber_Element_Locator}   ${substringToReplace}    ${ClaimNum_PassedByUser}
     Set Global Variable    ${Comm_Portal_Final_Appeal_ClaimNumber_Locator_New}

Click ClaimNumber in Final Appeals page
        Wait Until Element Is Visible   ${Comm_Portal_Final_Appeal_ClaimNumber_Locator_New}     timeout=120
        Click Element       ${Comm_Portal_Final_Appeal_ClaimNumber_Locator_New}

Verify Final Appeal History Details page is displayed
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_FinalAppealDetails_Header_Element_Locator}         timeout=120
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_FinalAppealDetails_Header_Element_Locator}

Verify the Details related to Inpatient Appeal are displayed
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditNumber_Header_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditNumber_Header_Element_Locator}
      ${auditNumber}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditNumber_Header_Element_Locator}
      Should contain           ${auditNumber}             ${data_list[0]['AuditNumber']}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatienAccountNumber_Header_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatienAccountNumber_Header_Element_Locator}
      ${AccountNumber}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatienAccountNumber_Header_Element_Locator}
     Should Contain      ${AccountNumber}        ${data_list[0]['PatientAccountNumber']}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatienName_Header_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatienName_Header_Element_Locator}
      ${PatientName}             TestDataFormatter.formatPatientName          ${data_list[0]['PatientFirstName']}    ${data_list[0]['PatientLastName']}
      ${patientName}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatienName_Header_Element_Locator}
      Should be equal           ${patientName}             ${PatientName}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatientInformation_Section_Header_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatientInformation_Section_Header_Element_Locator}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatientInformation_Section_DateOfBirth_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatientInformation_Section_DateOfBirth_Element_Locator}
      ${formattedDOB}             TestDataFormatter.formatDate           ${data_list[0]['DateOfBirth']}
      ${Dob}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatientInformation_Section_DateOfBirth_Element_Locator}
      Should be equal           ${Dob}              ${formattedDOB}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatientInformation_Section_SubscriberId_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatientInformation_Section_SubscriberId_Element_Locator}
      ${subscriberId}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatientInformation_Section_SubscriberId_Element_Locator}
      Should be equal           ${subscriberId}             ${data_list[0]['SubscriberId']}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatientInformation_Section_GroupID_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatientInformation_Section_GroupID_Element_Locator}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditInformation_Section_Header_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditInformation_Section_Header_Element_Locator}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditInformation_Section_AuditType_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditInformation_Section_AuditType_Element_Locator}
      ${AuditType}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditInformation_Section_AuditType_Element_Locator}
      Should be equal           ${AuditType}             ${data_list[0]['AuditType']}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditInformation_Section_AuditNumber_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditInformation_Section_AuditNumber_Element_Locator}
      ${AuditNumber}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditInformation_Section_AuditNumber_Element_Locator}
      Should be equal           ${AuditNumber}             ${data_list[0]['AuditNumber']}
       Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditInformation_Section_AuditStatus_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditInformation_Section_AuditStatus_Element_Locator}
      ${AuditStatus}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditInformation_Section_AuditStatus_Element_Locator}
      ${formattedAuditStatus}             TestDataFormatter.split_by_capital          ${data_list[0]['AuditStatus']}
      Should be equal           ${AuditStatus}             ${formattedAuditStatus}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ProviderInformation_Section_Header_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ProviderInformation_Section_Header_Element_Locator}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ProviderInformation_Section_ProviderName_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ProviderInformation_Section_ProviderName_Element_Locator}
      ${ProviderName}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ProviderInformation_Section_ProviderName_Element_Locator}
      Should be equal           ${ProviderName}             ${data_list[0]['ProviderName']}
       Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ProviderInformation_Section_ProviderNumber_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ProviderInformation_Section_ProviderNumber_Element_Locator}
      ${ProviderNumber}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ProviderInformation_Section_ProviderNumber_Element_Locator}
      Should be equal           ${ProviderNumber}             ${data_list[0]['BillingProviderNumber']}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ProviderInformation_Section_SubCertificationNumber_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ProviderInformation_Section_SubCertificationNumber_Element_Locator}
      ${SubCertificationNumber}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ProviderInformation_Section_SubCertificationNumber_Element_Locator}
      Should be equal           ${SubCertificationNumber}             ${data_list[0]['PreCertNumber']}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ClaimInformation_Section_Header_Element_Locator }          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ClaimInformation_Section_Header_Element_Locator }
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_IdentifiedSavings_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_IdentifiedSavings_Element_Locator}
       Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ClaimNumber_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ClaimNumber_Element_Locator}
      ${claimNumber}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ClaimNumber_Element_Locator}
      Should be equal           ${claimNumber}             ${data_list[0]['ClaimNumber']}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ClaimType_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ClaimType_Element_Locator}
      ${claimType}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ClaimType_Element_Locator}
      Should Contain           ${claimType}             ${data_list[0]['ClaimType']}
       Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdmitDate_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdmitDate_Element_Locator}
      ${AdmitDate}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdmitDate_Element_Locator}
	  ${formattedAdmitDate}             TestDataFormatter.formatDate           ${data_list[0]['AdmitDate']}
      Should be equal           ${AdmitDate}             ${formattedAdmitDate}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_DischargeDate_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_DischargeDate_Element_Locator}
      ${DischargeDate}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_DischargeDate_Element_Locator}
	  ${formattedDischarge}             TestDataFormatter.formatDate           ${data_list[0]['DischargeDate']}
      Should be equal           ${DischargeDate}             ${formattedDischarge}
       Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PaidDate_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PaidDate_Element_Locator}
      ${PaidDate}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PaidDate_Element_Locator}
	  ${formattedPaid}             TestDataFormatter.formatDate           ${data_list[0]['PaidDate']}
      Should be equal           ${PaidDate}             ${formattedPaid}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_MedicalRecordNumber_Element_Locator }          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_MedicalRecordNumber_Element_Locator }
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdjustmentRequested_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdjustmentRequested_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_OriginalGrossPay_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_OriginalGrossPay_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_OriginalNetPay_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_OriginalNetPay_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_IdentifiedGrossPay_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_IdentifiedGrossPay_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_IdentifiedNetPay_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_IdentifiedNetPay_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdjustorName_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdjustorName_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdjustmentDate_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdjustmentDate_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PayerConfirmedPay_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PayerConfirmedPay_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PayerConfirmedSavings_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PayerConfirmedSavings_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_Prepay_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_Prepay_Element_Locator}
      Scroll element into view      ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_IP_InformationIcon_Element_Locator}
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_IP_InformationIcon_Element_Locator}
	  Scroll down to the bottom of Final Appeal History page
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_Miscellaneous_Section_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_Miscellaneous_Section_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_Region_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_Region_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ReferenceClaim_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ReferenceClaim_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_InitialFindings_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_InitialFindings_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_FirstAppeal_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_FirstAppeal_Element_Locator}
#	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_SecondAppeal_Element_Locator}          timeout=10
#      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_SecondAppeal_Element_Locator}
      wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_FinalAppeal_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_FinalAppeal_Element_Locator}
	   Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdjustmentSumaryHeader_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdjustmentSumaryHeader_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdjustmentSumaryTable_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdjustmentSumaryTable_Element_Locator}
	   Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_FindingsComments_Section_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_FindingsComments_Section_Element_Locator}
	   Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdjustmentReason_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdjustmentReason_Element_Locator}


Scroll down to the bottom of Final Appeal History page
    Element Should Be Visible    ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdjustmentReason_Element_Locator}     timeout=120
    Scroll Element Into View    ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdjustmentReason_Element_Locator}

Verify the Details related to Outpatient Appeal are displayed
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditNumber_Header_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditNumber_Header_Element_Locator}
      ${auditNumber}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditNumber_Header_Element_Locator}
      Should contain           ${auditNumber}             ${data_list[0]['AuditNumber']}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatienAccountNumber_Header_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatienAccountNumber_Header_Element_Locator}
      ${AccountNumber}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatienAccountNumber_Header_Element_Locator}
     Should Contain      ${AccountNumber}        ${data_list[0]['PatientAccountNumber']}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatienName_Header_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatienName_Header_Element_Locator}
      ${PatientName}             TestDataFormatter.formatPatientName          ${data_list[0]['PatientFirstName']}    ${data_list[0]['PatientLastName']}
      ${patientName}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatienName_Header_Element_Locator}
      Should be equal           ${patientName}             ${PatientName}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatientInformation_Section_Header_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatientInformation_Section_Header_Element_Locator}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatientInformation_Section_DateOfBirth_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatientInformation_Section_DateOfBirth_Element_Locator}
      ${formattedDOB}             TestDataFormatter.formatDate           ${data_list[0]['DateOfBirth']}
      ${Dob}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatientInformation_Section_DateOfBirth_Element_Locator}
      Should be equal           ${Dob}              ${formattedDOB}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatientInformation_Section_SubscriberId_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatientInformation_Section_SubscriberId_Element_Locator}
      ${subscriberId}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatientInformation_Section_SubscriberId_Element_Locator}
      Should be equal           ${subscriberId}             ${data_list[0]['SubscriberId']}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatientInformation_Section_GroupID_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PatientInformation_Section_GroupID_Element_Locator}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditInformation_Section_Header_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditInformation_Section_Header_Element_Locator}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditInformation_Section_AuditType_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditInformation_Section_AuditType_Element_Locator}
      ${AuditType}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditInformation_Section_AuditType_Element_Locator}
      Should be equal           ${AuditType}             ${data_list[0]['AuditType']}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditInformation_Section_AuditNumber_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditInformation_Section_AuditNumber_Element_Locator}
      ${AuditNumber}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditInformation_Section_AuditNumber_Element_Locator}
      Should be equal           ${AuditNumber}             ${data_list[0]['AuditNumber']}
       Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditInformation_Section_AuditStatus_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditInformation_Section_AuditStatus_Element_Locator}
      ${AuditStatus}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AuditInformation_Section_AuditStatus_Element_Locator}
      ${formattedAuditStatus}             TestDataFormatter.split_by_capital          ${data_list[0]['AuditStatus']}
      Should be equal           ${AuditStatus}             ${formattedAuditStatus}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ProviderInformation_Section_Header_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ProviderInformation_Section_Header_Element_Locator}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ProviderInformation_Section_ProviderName_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ProviderInformation_Section_ProviderName_Element_Locator}
      ${ProviderName}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ProviderInformation_Section_ProviderName_Element_Locator}
      Should be equal           ${ProviderName}             ${data_list[0]['ProviderName']}
       Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ProviderInformation_Section_ProviderNumber_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ProviderInformation_Section_ProviderNumber_Element_Locator}
      ${ProviderNumber}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ProviderInformation_Section_ProviderNumber_Element_Locator}
      Should be equal           ${ProviderNumber}             ${data_list[0]['BillingProviderNumber']}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ProviderInformation_Section_SubCertificationNumber_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ProviderInformation_Section_SubCertificationNumber_Element_Locator}
      ${SubCertificationNumber}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ProviderInformation_Section_SubCertificationNumber_Element_Locator}
      Should be equal           ${SubCertificationNumber}             ${data_list[0]['PreCertNumber']}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ClaimInformation_Section_Header_Element_Locator }          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ClaimInformation_Section_Header_Element_Locator }
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_IdentifiedSavings_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_IdentifiedSavings_Element_Locator}
       Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ClaimNumber_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ClaimNumber_Element_Locator}
      ${claimNumber}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ClaimNumber_Element_Locator}
      Should be equal           ${claimNumber}             ${data_list[0]['ClaimNumber']}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ClaimType_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ClaimType_Element_Locator}
      ${claimType}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ClaimType_Element_Locator}
      Should Contain           ${claimType}             ${data_list[0]['ClaimType']}
       Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdmitDate_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdmitDate_Element_Locator}
      ${AdmitDate}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdmitDate_Element_Locator}
	  ${formattedAdmitDate}             TestDataFormatter.formatDate           ${data_list[0]['AdmitDate']}
      Should be equal           ${AdmitDate}             ${formattedAdmitDate}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_DischargeDate_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_DischargeDate_Element_Locator}
      ${DischargeDate}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_DischargeDate_Element_Locator}
	  ${formattedDischarge}             TestDataFormatter.formatDate           ${data_list[0]['DischargeDate']}
      Should be equal           ${DischargeDate}             ${formattedDischarge}
       Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PaidDate_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PaidDate_Element_Locator}
      ${PaidDate}=     Get text     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PaidDate_Element_Locator}
	  ${formattedPaid}             TestDataFormatter.formatDate           ${data_list[0]['PaidDate']}
      Should be equal           ${PaidDate}             ${formattedPaid}
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_MedicalRecordNumber_Element_Locator }          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_MedicalRecordNumber_Element_Locator }
      Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdjustmentRequested_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdjustmentRequested_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_OriginalGrossPay_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_OriginalGrossPay_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_OriginalNetPay_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_OriginalNetPay_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_IdentifiedGrossPay_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_IdentifiedGrossPay_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_IdentifiedNetPay_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_IdentifiedNetPay_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdjustorName_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdjustorName_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdjustmentDate_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdjustmentDate_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PayerConfirmedPay_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PayerConfirmedPay_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PayerConfirmedSavings_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_PayerConfirmedSavings_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_Prepay_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_Prepay_Element_Locator}
	  Scroll element into view      ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_OP_InformationIcon_Element_Locator}
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_OP_InformationIcon_Element_Locator}
	  Scroll down to the bottom of Final Appeal History page
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_Miscellaneous_Section_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_Miscellaneous_Section_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_Region_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_Region_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ReferenceClaim_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_ReferenceClaim_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_InitialFindings_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_InitialFindings_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_FirstAppeal_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_FirstAppeal_Element_Locator}
#	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_SecondAppeal_Element_Locator}          timeout=10
#      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_SecondAppeal_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_FinalAppeal_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_FinalAppeal_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_FinalAppealDetails_Original_Values_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_FinalAppealDetails_Original_Values_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_FinalAppealDetails_Adjusted_Values_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_FinalAppealDetails_Adjusted_Values_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_FindingsComments_Section_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_FindingsComments_Section_Element_Locator}
	  Wait until element is visible     ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdjustmentReason_Element_Locator}          timeout=10
      Element should be visible       ${PayerDashboard_FinalLevelAppeals_History_DetailsPage_AdjustmentReason_Element_Locator}


Verify filter Functionality by providing Claim Number in Outstanding Final Appeal Page
     [Arguments]   ${Num_PassedByUser}
       Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_OutstandingFinalAppealsPage_Filter_ClaimNumber_TextField_Locator}
       Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_OutstandingFinalAppealsPage_Filter_ClaimNumber_TextField_Locator}
       Click Element                    ${PayerDashboard_FinalLevelAppeals_OutstandingFinalAppealsPage_Filter_ClaimNumber_TextField_Locator}
       Input Text                       ${PayerDashboard_FinalLevelAppeals_OutstandingFinalAppealsPage_Filter_ClaimNumber_TextField_Locator}      ${Num_PassedByUser}
       Sleep    3


Verify filter Functionality by providing Audit Number in Outstanding Final Appeal Page
     [Arguments]   ${Num_PassedByUser}
       Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_OutstandingFinalAppealsPage_Filter_AuditNumber_TextField_Locator}
       Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_OutstandingFinalAppealsPage_Filter_AuditNumber_TextField_Locator}
       Click Element                    ${PayerDashboard_FinalLevelAppeals_OutstandingFinalAppealsPage_Filter_AuditNumber_TextField_Locator}
       Input Text                       ${PayerDashboard_FinalLevelAppeals_OutstandingFinalAppealsPage_Filter_AuditNumber_TextField_Locator}      ${Num_PassedByUser}
       Sleep    3

Verify filter Functionality by providing Provider Number

     [Arguments]   ${Num_PassedByUser}
       Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_OutstandingFinalAppealsPage_Filter_ProviderNumber_TextField_Locator}
       Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_OutstandingFinalAppealsPage_Filter_ProviderNumber_TextField_Locator}
       Click Element                    ${PayerDashboard_FinalLevelAppeals_OutstandingFinalAppealsPage_Filter_ProviderNumber_TextField_Locator}
       Input Text                       ${PayerDashboard_FinalLevelAppeals_OutstandingFinalAppealsPage_Filter_ProviderNumber_TextField_Locator}      ${Num_PassedByUser}
       Sleep    3


Click Apply Filter Button In Outstanding Final Appeals Page
        Wait Until Element Is Visible           ${PayerDashboard_FinalLevelAppeals_OutstandingFinalAppealsPage_Filter_ApplyFilter_Button_Locator}    timeout=120
        Click Button                           ${PayerDashboard_FinalLevelAppeals_OutstandingFinalAppealsPage_Filter_ApplyFilter_Button_Locator}

Verify data after applying filter Functionality by providing Claim Number in Outstanding Final Level Appeals Page
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_HistoryPage_Filtered_Results_Element_Locator}
    IF   ${present} == True
        ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ClaimNumber_AllElements_Locator}
        FOR    ${i}     IN RANGE    1   ${element_count}+1
        ${get_ClaimNumber}=  Get Text      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ClaimNumber_AllElements_Locator} [${i}]
        Should be equal      ${get_ClaimNumber}    ${data_list[0]['ClaimNumber']}
        END
        ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
        WHILE    ${present} == True
              Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
              ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ClaimNumber_AllElements_Locator}
              FOR    ${i}     IN RANGE    1   ${element_count}+1
                 ${get_ClaimNumber}=  Get Text      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ClaimNumber_AllElements_Locator} [${i}]
                 Should be equal      ${get_ClaimNumber}    ${data_list[0]['ClaimNumber']}
              END
        END
    ELSE
                Page should contain        There are no Final Appeal Requests which meet the criteria.
    END


Verify data after applying filter Functionality by providing Audit Number in Outstanding Final Appeal Page
      ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_HistoryPage_Filtered_Results_Element_Locator}
      IF   ${present} == True
        ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_AuditNumber_AllElements_Locator}
        FOR    ${i}     IN RANGE    1   ${element_count}+1
        ${get_AuditNumber}=  Get Text      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_AuditNumber_AllElements_Locator} [${i}]
        Should be equal      ${get_AuditNumber}    ${data_list[0]['AuditNumber']}
        END
        ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
        WHILE    ${present} == True
              Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
              ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_AuditNumber_AllElements_Locator}
              FOR    ${i}     IN RANGE    1   ${element_count}+1
                 ${get_AuditNumber}=  Get Text      ${RPayerDashboard_FinalLevelAppeals_HistoryPage_AuditNumber_AllElements_Locator} [${i}]
                 Should be equal      ${get_AuditNumber}    ${data_list[0]['AuditNumber']}
              END
        END
      ELSE
                Page should contain        There are no Final Appeal Requests which meet the criteria.
      END


Verify data after applying filter Functionality by providing ClaimType in Outstanding Final Appeal Page
     ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_HistoryPage_Filtered_Results_Element_Locator}
     IF  ${present} == True
        ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_ClaimNumber_AllElements_Locator}
        Click element        ${PayerDashboard_FinalLevelAppeals_HistoryPage_ClaimNumber_AllElements_Locator}
        ${e}=       set variable    1
        WHILE      ${element_count}>=${e}
        sleep   5
        IF      ${e}< ${element_count}
            ${a}=   get text        ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ClaimType_Element_Locator}
            IF  "${a}"== "Inpatient"
            Click Next Request Button in Outstanding Final Appeal
            ${e}=   evaluate          ${e}+1
            ELSE
            Break
            END

        ELSE IF  ${e}== ${element_count}
            ${a}=   get text        ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ClaimType_Element_Locator}
            IF  "${a}"== "Inpatient"
            log     pass
            ${e}=   evaluate          ${e}+1
            ELSE
            Break
            END
        END
        END

     ELSE
                Page should contain        There are no Final Level Appeals History Results which meet the criteria.
     END


Click Next Request Button in Outstanding Final Appeal
     Wait until element is visible       ${PayerDashboard_OutstandingFinalAppealsPage_NextRequest_button_Locator}     timeout=10
     Click element            ${PayerDashboard_OutstandingFinalAppealsPage_NextRequest_button_Locator}


Return Outstanding Final Appeal ClaimNumber hyperlink locator with Claim number passed by user
     [Arguments]   ${ClaimNum_PassedByUser}
     ${Comm_Portal_Final_Appeal_ClaimNumber_Locator_New} =     Replace String      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ClaimNumber_Element_Locator}   ${substringToReplace}    ${ClaimNum_PassedByUser}
     Set Global Variable    ${Comm_Portal_Final_Appeal_ClaimNumber_Locator_New}

Verify Outstanding Final Appeal Details page is displayed
      Wait Until Element Is Visible    ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Element_Locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Element_Locator}


Click Uphold Appeal Button
    Element Should Be Visible    ${PayerDashboard_OutstandingFinalAppealsPage_Uphold_FinalAppeal_Button_Locator}     timeout=120
    Scroll Element Into View    ${PayerDashboard_OutstandingFinalAppealsPage_Uphold_FinalAppeal_Button_Locator}
    Click element       ${PayerDashboard_OutstandingFinalAppealsPage_Uphold_FinalAppeal_Button_Locator}

Verify the fields related to Upholding an appeal are displayed
     Element Should Be Visible    ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdAppeal_Section_Label_Element_Locator}     timeout=120
    Scroll Element Into View    ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdAppeal_Section_Label_Element_Locator}
    Wait Until Element Is Visible    ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Uphold_Comment_Section_Element_Locator }           timeout=120
     Element Should Be Visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Uphold_Comment_Section_Element_Locator }
    Wait Until Element Is Visible    ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Uphold_ESignature_Element_Locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Uphold_ESignature_Element_Locator }
     Wait Until Element Is Visible    ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Uphold_Date_Element_Locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Uphold_Date_Element_Locator}
     Wait Until Element Is Visible    ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdConfirm_Element_Locator}           timeout=120
     Element Should Be Visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdConfirm_Element_Locator}
     Wait Until Element Is Visible    ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdCancel_Element_Locator }           timeout=120
     Element Should Be Visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdCancel_Element_Locator }




Verify Authorized eSignature details are autofilled for "Uphold Final Decision" Section
    IF  '$Payer_comm_usr_name == "PayerUser"'
        ${esignature} =     Set variable    Payer User
    ELSE
        ${esignature} =          ${Payer_comm_usr_name}
    END
    Textfield Value Should Be     ${ PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Uphold_ESignature_Element_Locator}    ${esignature}
    Textfield Value Should Be   ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Uphold_Title_Element_Locator}        ${Payer_Title}
    ${date}=      Get Current Date     result_format=%Y-%m-%d
    Textfield Value Should Be     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Uphold_Date_Element_Locator}    ${date}

Verify clicking on 'Cancel' close the Autorized esignature details section
    Click element        ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdCancel_Element_Locator}
    Element should not be visible     ${ PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Uphold_ESignature_Element_Locator}
    Element should not be visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Uphold_Title_Element_Locator}
    Element should not be visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Uphold_Date_Element_Locator}
    Element should not be visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Uphold_Comment_Section_Element_Locator}


Verify clicking on 'Uphold Final Appeals' displays 'Confirm Uphold Final Appeal' pop up window
    Click element       ${PayerDashboard_OutstandingFinalAppealsPage_Uphold_FinalAppeal_Button_Locator}
    Click element        ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdConfirm_Element_Locator}
    Wait Until Element Is Visible    ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdConfirm_PopUp_Element_Locator}           timeout=30
    Element Should Be Visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdConfirm_PopUp_Element_Locator}

Verify 'Confirm Uphold Final Appeal' pop up window details
    Wait Until Element Is Visible    ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdConfirm_PopUp_ConfimationMessage_Element_Locator}           timeout=120
    Element Should Be Visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdConfirm_PopUp_ConfimationMessage_Element_Locator}
     Wait Until Element Is Visible    ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdConfirm_PopUp_No_Element_Locator}           timeout=120
    Element Should Be Visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdConfirm_PopUp_No_Element_Locator}
     Wait Until Element Is Visible    ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdConfirm_PopUp_Yes_Element_Locator}           timeout=120
    Element Should Be Visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdConfirm_PopUp_Yes_Element_Locator}

Verify clicking on No in 'Confirm Uphold Final Appeal' pop up closes the window
     Click element        ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdConfirm_PopUp_No_Element_Locator}
     Wait until element is not visible    ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdConfirm_PopUp_Element_Locator}           timeout=30
     Element should not be visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdConfirm_PopUp_Element_Locator}

Verify Clicking On Yes In 'Confirm Uphold Final Appeal' Pop Up Displays Confirmation Message Pop Up
     Click element        ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdConfirm_Element_Locator}
     Click element        ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdConfirm_PopUp_Yes_Element_Locator}
     Wait until element is visible    ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdSuccess_PopUp_Element_Locator}           timeout=120
     Element should be visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdSuccess_PopUp_Element_Locator}

Verify Uphold Confirmation pop up window details
     Wait until element is visible    ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdSuccess_PopUp_Message_Element_Locator}           timeout=30
     ${confirmationMessage}=  Get text     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdSuccess_PopUp_Message_Element_Locator}
     Should be equal        ${confirmationMessage}                     You have successfully Upheld the final appeal.
     Wait until element is visible    ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdSuccess_PopUp_GoToDashboard_Element_Locator}           timeout=30
     Element should be visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdSuccess_PopUp_GoToDashboard_Element_Locator}

Verify clicking on 'Go To Dashboard' displays the Home page
     Click element        ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_UpholdSuccess_PopUp_GoToDashboard_Element_Locator}
     wait until element is not visible         ${RecordAnalyst_Dashboard_PageLoad_RedFlower_Image_Locator}           timeout=180
     Wait Until Element Is Visible    ${Comm_Portal_Payer_View_Claims_button_Locator}        timeout=120
     Element should be visible      ${Comm_Portal_Payer_View_Claims_button_Locator}

Verify that the appeal is not displayed in the Outstanding Final Appeal page
    Click View Final Level Appeals
    wait until element is not visible         ${RecordAnalyst_Dashboard_PageLoad_RedFlower_Image_Locator}           timeout=180
    Verify Outstanding Final Level Appeals Page Is Displayed
    Verify filter Functionality by providing Claim Number in Outstanding Final Appeal Page      ${data_list[0]['ClaimNumber']}
    Click Apply Filter Button In Outstanding Final Appeals Page
    wait until element is not visible         ${RecordAnalyst_Dashboard_PageLoad_RedFlower_Image_Locator}           timeout=180
    Scroll down to the bottom of Audit result page
    Return Outstanding Final Appeal ClaimNumber hyperlink locator with Claim number passed by user     ${data_list[0]['ClaimNumber']}
    Element should Not be visible      ${Comm_Portal_Final_Appeal_ClaimNumber_Locator_New}

Verify that the upheld appeal is displayed in the Final Appeal History page with updated status
    Click Final Appeals History page
    Verify Final Level Appeals History Page Is Displayed
    CommonFunctionality.Wait Untill Page Loads
    Click on Filter Icon of Adjustment History
    Verify filter Functionality by providing Audit Number in Final Appeal History Page      ${data_list[0]['AuditNumber']}
    Click Apply Filter Button in Final Appeal History Page
    BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
    CommonFunctionality.Wait Untill Page Loads
    Return Final Appeal History ClaimNumber hyperlink locator with Claim number passed by user     ${data_list[0]['ClaimNumber']}
    Element should be visible      ${Comm_Portal_Final_Appeal_ClaimNumber_Locator_New}
    ${auditStatus}=     Get text       ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditStatus_AllElements_Locator}
    Should be equal       ${auditStatus}          Final Appeal Confirmed

Click Reverse Appeal Button
    click Element     ${PayerDashboard_OutstandingFinalAppealsPage_Reverse_FinalAppeal_Button_Locator}


Verify the fields related to Reverse appeal are displayed
      Wait Until Element Is Visible    ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ReverseReason_Comment_Section_Element_Locator}        timeout=120
     Element should be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ReverseReason_Comment_Section_Element_Locator}
     Wait Until Element Is Visible    ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Reverse_ESignature_Element_Locator}        timeout=120
     Element should be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Reverse_ESignature_Element_Locator}
     Wait Until Element Is Visible    ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Reverse_Title_Element_Locator}        timeout=120
     Element should be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Reverse_Title_Element_Locator}
     Wait Until Element Is Visible    ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Reverse_Date_Element_Locator}        timeout=120
     Element should be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Reverse_Date_Element_Locator}

Verify Authorized eSignature details are autofilled for "Reverse Final Decision" Section
    IF  '$Payer_comm_usr_name == "PayerUser"'
        ${esignature} =     Set variable    Payer User
    ELSE
        ${esignature} =          ${Payer_comm_usr_name}
    END
    Textfield Value Should Be     ${ PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Reverse_ESignature_Element_Locator}    ${esignature}
    Textfield Value Should Be   ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Reverse_Title_Element_Locator}        ${Payer_Title}
    ${date}=      Get Current Date     result_format=%Y-%m-%d
    Textfield Value Should Be     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Reverse_Date_Element_Locator}    ${date}

Verify clicking on 'Cancel' close the Reverse appeal Autorized esignature details section
    Click element    ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ReverseCancel_Element_Locator}
    Wait until element is not visible      ${ PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Reverse_ESignature_Element_Locator}      timeout=30
    Element should not be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Reverse_ESignature_Element_Locator}
    Element should not be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Reverse_Title_Element_Locator}
    Element should not be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_Reverse_Date_Element_Locator}

Verify clicking on 'Reverse Final Appeal' displays 'Confirm Reverse Final Appeal' pop up window
     click Element     ${PayerDashboard_OutstandingFinalAppealsPage_Reverse_FinalAppeal_Button_Locator}
     Input text       ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ReverseReason_Comment_Section_Element_Locator}         Reversing an appeal
     Click element    ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ReverseConfirm_Element_Locator}
     Wait until element is visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ReverseConfirm_PopUp_Element_Locator}      timeout=30
     Element should be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ReverseConfirm_PopUp_Element_Locator}

Verify 'Confirm Reverse Final Appeal' pop up window details
     Wait until element is visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ReverseConfirm_PopUp_ConfimationMessage_Element_Locator}      timeout=30
     ${confirmationMessage}=  Get text      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ReverseConfirm_PopUp_ConfimationMessage_Element_Locator}
     Should be equal        ${confirmationMessage}        Are you ready to reverse the final appeal?
     Wait until element is visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ReverseConfirm_PopUp_No_Element_Locator}      timeout=30
     Element should be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ReverseConfirm_PopUp_No_Element_Locator}
     Wait until element is visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ReverseConfirm_PopUp_Yes_Element_Locator}      timeout=30
     Element should be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ReverseConfirm_PopUp_Yes_Element_Locator}

Verify clicking on No in 'Confirm Reverse Final Appeal' pop up closes the window
    Click element      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ReverseConfirm_PopUp_No_Element_Locator}
    Wait until element is not visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ReverseConfirm_PopUp_Element_Locator}      timeout=30
    Element should not be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ReverseConfirm_PopUp_Element_Locator}

Verify clicking on Yes in 'Confirm Reverse Final Appeal' pop up displays Confirmation Message pop up
     Input text       ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ReverseReason_Comment_Section_Element_Locator}         Reversing an appeal
     Click element    ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ReverseConfirm_Element_Locator}
     Click element      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ReverseConfirm_PopUp_Yes_Element_Locator}
     Wait until element is visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ReverseSuccess_PopUp_Element_Locator}      timeout=30
     Element should be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ReverseSuccess_PopUp_Element_Locator}

Verify Reverse Confirmation pop up window details
      Wait until element is visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ReverseSuccess_PopUp_Message_Element_Locator}      timeout=30
     ${confirmationMessage}=  Get text      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ReverseSuccess_PopUp_Message_Element_Locator}
     Should be equal        ${confirmationMessage}        You have successfully reversed the final appeal.

Verify that the reversed appeal is displayed in the Final Appeal History page with updated status
    Click Final Appeals History page
    Verify Final Level Appeals History Page Is Displayed
    CommonFunctionality.Wait Untill Page Loads
    Click on Filter Icon of Adjustment History
    Verify filter Functionality by providing Audit Number in Final Appeal History Page      ${data_list[0]['AuditNumber']}
    Click Apply Filter Button in Final Appeal History Page
    BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
    CommonFunctionality.Wait Untill Page Loads
    Return Final Appeal History ClaimNumber hyperlink locator with Claim number passed by user     ${data_list[0]['ClaimNumber']}
    Element should be visible      ${Comm_Portal_Final_Appeal_ClaimNumber_Locator_New}
    ${auditStatus}=     Get text       ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditStatus_AllElements_Locator}
    Should be equal       ${auditStatus}          Final Appeal Not Made

Click Modify Appeal Button
    Click element        ${PayerDashboard_OutstandingFinalAppealsPage_Modify_FinalAppeal_Button_Locator}


Verify the fields related to Modify appeal are displayed on clicking Modify Appeal
     Wait until element is visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_OriginalCharges_Element_Locator}      timeout=30
     Element should be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_OriginalCharges_Element_Locator}
     Wait until element is visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_OriginalGrossPay_Element_Locator}      timeout=30
     Element should be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_OriginalGrossPay_Element_Locator}
     Wait until element is visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_OriginalNetPay_Element_Locator}      timeout=30
     Element should be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_OriginalNetPay_Element_Locator}
     Wait until element is visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_CGIIdentifiedGrossPay_Element_Locator}      timeout=30
     Element should be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_CGIIdentifiedGrossPay_Element_Locator}
     Wait until element is visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_CGIIdentifiedNetPay_Element_Locator}      timeout=30
     Element should be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_CGIIdentifiedNetPay_Element_Locator}
     Wait until element is visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_PayerConfirmedPay_Element_Locator}      timeout=30
     Element should be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_PayerConfirmedPay_Element_Locator}
     Wait until element is visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_PayerConfirmedSavings_Element_Locator}      timeout=30
     Element should be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_PayerConfirmedSavings_Element_Locator}
     Wait until element is visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_CGICommission_Element_Locator}      timeout=30
     Element should be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_CGICommission_Element_Locator}
     Wait until element is visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_PayerConfirmedNetSavings_Element_Locator}      timeout=30
     Element should be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_PayerConfirmedNetSavings_Element_Locator}
     Wait until element is visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_AdjustmentReason_Input_Element_Locator }      timeout=30
     Element should be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_AdjustmentReason_Input_Element_Locator }
     Wait until element is visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_Esignature_Element_Locator}      timeout=30
     Element should be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_Esignature_Element_Locator}
     Wait until element is visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_Title_Element_Locator}      timeout=30
     Element should be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_Title_Element_Locator}
      Wait until element is visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_Date_Element_Locator}      timeout=30
     Element should be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_Date_Element_Locator}

     Wait until element is visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_Cancel_Element_Locator}      timeout=30
     Element should be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_Cancel_Element_Locator}
      Wait until element is visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_Confirm_Element_Locator }      timeout=30
     Element should be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_Confirm_Element_Locator }

Verify Authorized eSignature details are autofilled for "Modify Final Decision" Section
     IF  '$Payer_comm_usr_name == "PayerUser"'
        ${esignature} =     Set variable    Payer User
    ELSE
        ${esignature} =          ${Payer_comm_usr_name}
    END

    Textfield Value Should Be     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_Esignature_Element_Locator}    ${esignature}
    Textfield Value Should Be   ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_Title_Element_Locator}        ${Payer_Title}
    ${date}=      Get Current Date     result_format=%Y-%m-%d
    Textfield Value Should Be     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_Date_Element_Locator}    ${date}

Verify clicking on 'Cancel' close the Modify appeal Comments And Esignature details section
     Click element    ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_Cancel_Element_Locator}
     Wait until element is not visible     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_CommentsAndAuthorizedSignatureSection_Element_Locator}
     Element should not be visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_CommentsAndAuthorizedSignatureSection_Element_Locator }

Update Payer Confirmed Pay in Modify Final Appeal section
     Click element    ${PayerDashboard_OutstandingFinalAppealsPage_Modify_FinalAppeal_Button_Locator}
     ${placeholder_value}=    get element attribute    ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_PayerConfirmedPay_Element_Locator}       placeholder
     ${placeholder_valueFormatted1}=         Replace string        ${placeholder_value}           $             ${empty}
     ${placeholder_valueFormatted2}=         Replace string        ${placeholder_valueFormatted1}           ,            ${empty}

     ${PayerConfirmedPay_number}=       convert to number   ${placeholder_valueFormatted2}

    ${RandomNumbertoInput}=     Generate Random Number Less Than    ${PayerConfirmedPay_number}
     Input text      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_PayerConfirmedPay_Element_Locator}         ${RandomNumbertoInput}
     Input text      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_AdjustmentReason_Input_Element_Locator}         Modified Final Appeal


Verify clicking on 'Modify Final Appeal' displays 'Confirm Modify Final Appeal' pop up window
      Click element     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_Confirm_Element_Locator}
      Wait until element is visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_ConfirmModifiedChange_Popup_Element_Locator}          timeout=30
      Element should be visible       ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_ConfirmModifiedChange_Popup_Element_Locator}

Verify 'Confirm Modify Final Appeal' pop up window details
      Wait until element is visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_ConfirmModifiedChange_Popup_Message_Element_Locator}         timeout=30
      ${confirmModifiedText}=     Get Text         ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_ConfirmModifiedChange_Popup_Message_Element_Locator}
      Should be equal        ${confirmModifiedText}               Are you ready to modify the final appeal amount?
      Wait until element is visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_ConfirmModifiedChange_Popup_No_Element_Locator}          timeout=30
      Element should be visible       ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_ConfirmModifiedChange_Popup_No_Element_Locator}
      Wait until element is visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_ConfirmModifiedChange_Popup_Yes_Element_Locator}          timeout=30
      Element should be visible       ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_ConfirmModifiedChange_Popup_Yes_Element_Locator}

Verify clicking on No in 'Confirm Modify Final Appeal' pop up closes the window
     Click element       ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_ConfirmModifiedChange_Popup_No_Element_Locator}
     Wait until element is Not visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_ConfirmModifiedChange_Popup_Message_Element_Locator}         timeout=30
     Element should not be visible        ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_ConfirmModifiedChange_Popup_Message_Element_Locator}         timeout=30


Verify clicking on Yes in 'Confirm Modify Final Appeal' pop up displays Confirmation Message pop up
     Input text      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_AdjustmentReason_Input_Element_Locator}         Modified Final Appeal
     Click element     ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_Confirm_Element_Locator}
     Click element       ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_ConfirmModifiedChange_Popup_Yes_Element_Locator}
     Wait until element is visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_Confirmation_PopUp_Element_Locator}          timeout=150
     Element should be visible       ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_Confirmation_PopUp_Element_Locator}


Verify Modify Confirmation pop up window details
      Wait until element is visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_Confirmation_Popup_Message1_Element_Locator}          timeout=150
      ${sucessText1}=     Get Text         ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_Confirmation_Popup_Message1_Element_Locator}
      ${sucessText2}=     Get Text         ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_Confirmation_Popup_Message2_Element_Locator}
      Log to console      ${sucessText1}
      Log to console      ${sucessText2}
      Wait until element is visible      ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_Confirmation_Popup_GoToDashboard_Element_Locator}          timeout=150
      Element should be visible       ${PayerDashboard_OutstandingFinalAppealsPage_DetailsPage_ModifyAppeal_Confirmation_Popup_GoToDashboard_Element_Locator}


Verify that the Modified appeal is displayed in the Final Appeal History page with updated status
     Click Final Appeals History page
    Verify Final Level Appeals History Page Is Displayed
    CommonFunctionality.Wait Untill Page Loads
    Click on Filter Icon of Adjustment History
    Verify filter Functionality by providing Audit Number in Final Appeal History Page      ${data_list[0]['AuditNumber']}
    Click Apply Filter Button in Final Appeal History Page
    BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
    CommonFunctionality.Wait Untill Page Loads
    Return Final Appeal History ClaimNumber hyperlink locator with Claim number passed by user     ${data_list[0]['ClaimNumber']}
    Element should be visible      ${Comm_Portal_Final_Appeal_ClaimNumber_Locator_New}
    ${auditStatus}=     Get text       ${PayerDashboard_FinalLevelAppeals_HistoryPage_AuditStatus_AllElements_Locator}
    Should be equal       ${auditStatus}          Final Appeal Adjusted With Variance


Double Click Claim Number header in Payer dashboard Outstanding Final Appeals page and verify sorting is done in Ascending order
    wait until Element is visible   ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ClaimNumberColumnHeader_Locator}
    Double Click Element   ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ClaimNumberColumnHeader_Locator}
    sleep   5
    ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ClaimNumber_AllElements_Locator}
    @{ClaimNumber_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_ClaimNumber}=  Get Text      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ClaimNumber_AllElements_Locator} [${i}]
    Append To List      ${ClaimNumber_list}    ${get_ClaimNumber}
    END
    log      ${ClaimNumber_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
   IF   ${present} == True
          Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
          ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ClaimNumber_AllElements_Locator}
          @{ClaimNumber_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_ClaimNumber}=  Get Text      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ClaimNumber_AllElements_Locator} [${i}]
             Append To List      ${ClaimNumber_list}    ${get_ClaimNumber}
          END
    END
    log      ${ClaimNumber_list}
    ${Sort_order}=  Copy list  ${ClaimNumber_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${ClaimNumber_list}     ${Sort_order}

Double Click Prepay header in Payer dashboard Outstanding Final Appeals page and verify sorting is done in Ascending order
     wait until Element is visible   ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_PrepayColumnHeader_Locator}
    Double Click Element   ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_PrepayColumnHeader_Locator}
    sleep   5
    ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_Prepay_AllElements_Locator}
    @{Prepay_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_Prepay}=  Get Text      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_Prepay_AllElements_Locator} [${i}]
    Append To List      ${Prepay_list}    ${get_Prepay}
    END
    log      ${Prepay_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
    WHILE    ${present} == True
          Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
          ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_Prepay_AllElements_Locator}
          @{Prepay_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_Prepay}=  Get Text      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_Prepay_AllElements_Locator} [${i}]
             Append To List      ${Prepay_list}    ${get_Prepay}
          END
    END
    log      ${Prepay_list}
    ${Sort_order}=  Copy list  ${Prepay_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${Prepay_list}     ${Sort_order}

Double Click Provider Name header in Payer dashboard Outstanding Final Appeals page and verify sorting is done in Ascending order
     wait until Element is visible   ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ProviderNameColumnHeader_Locator}
    Double Click Element   ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ProviderNameColumnHeader_Locator}
    sleep   5
    ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ProviderName_AllElements_Locator}
    @{ProviderName_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_ProviderName}=  Get Text      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ProviderName_AllElements_Locator} [${i}]
    Append To List      ${ProviderName_list}    ${get_ProviderName}
    END
    log      ${ProviderName_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
    WHILE    ${present} == True
          Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
          ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ProviderName_AllElements_Locator}
          @{ProviderName_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_ProviderName}=  Get Text      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ProviderName_AllElements_Locator} [${i}]
             Append To List      ${ProviderName_list}    ${get_ProviderName}
          END
    END
    log      ${ProviderName_list}
    ${Sort_order}=  Copy list  ${ProviderName_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${ProviderName_list}     ${Sort_order}

Double Click Provider Number header in Payer dashboard Outstanding Final Appeals page and verify sorting is done in Ascending order
     wait until Element is visible   ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ProviderNumberColumnHeader_Locator}
    Double Click Element   ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ProviderNumberColumnHeader_Locator}
    sleep   5
    ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ProviderNumber_AllElements_Locator}
    @{ProviderNumber_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_ProviderNumber}=  Get Text      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ProviderNumber_AllElements_Locator} [${i}]
    Append To List      ${ProviderNumber_list}    ${get_ProviderNumber}
    END
    log      ${ProviderNumber_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
    WHILE    ${present} == True
          Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
          ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ProviderNumber_AllElements_Locator}
          @{ProviderNumber_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_ProviderNumber}=  Get Text      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ProviderNumber_AllElements_Locator} [${i}]
             Append To List      ${ProviderNumber_list}    ${get_ProviderNumber}
          END
    END
    log      ${ProviderNumber_list}
    ${Sort_order}=  Copy list  ${ProviderNumber_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${ProviderNumber_list}     ${Sort_order}

Double Click Audit Status header in Payer dashboard Outstanding Final Appeals page and verify sorting is done in Ascending order
     wait until Element is visible   ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_AuditStatusColumnHeader_Locator}
    Double Click Element   ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_AuditStatusColumnHeader_Locator}
    sleep   5
    ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_AuditStatus_AllElements_Locator}
    @{AuditStatus_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_AuditStatus}=  Get Text      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_AuditStatus_AllElements_Locator} [${i}]
    Append To List      ${AuditStatus_list}    ${get_AuditStatus}
    END
    log      ${AuditStatus_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
    WHILE    ${present} == True
          Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
          ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_AuditStatus_AllElements_Locator}
          @{AuditStatus_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_AuditStatus}=  Get Text      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_AuditStatus_AllElements_Locator} [${i}]
             Append To List      ${AuditStatus_list}    ${get_AuditStatus}
          END
    END
    log      ${AuditStatus_list}
    ${Sort_order}=  Copy list  ${AuditStatus_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${AuditStatus_list}     ${Sort_order}


Double Click Audit Number header in Payer dashboard Outstanding Final Appeals page and verify sorting is done in Ascending order
     wait until Element is visible   ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_AuditNumberColumnHeader_Locator}
    Double Click Element   ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_AuditNumberColumnHeader_Locator}
    sleep   5
    ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_AuditNumber_AllElements_Locator}
    @{AuditNumber_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_AuditNumber}=  Get Text      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_AuditNumber_AllElements_Locator} [${i}]
    Append To List      ${AuditNumber_list}    ${get_AuditNumber}
    END
    log      ${AuditNumber_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
    WHILE    ${present} == True
          Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
          ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_AuditNumber_AllElements_Locator}
          @{AuditNumber_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_AuditNumber}=  Get Text      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_AuditNumber_AllElements_Locator} [${i}]
             Append To List      ${AuditNumber_list}    ${get_AuditNumber}
          END
    END
    log      ${AuditNumber_list}
    ${Sort_order}=  Copy list  ${AuditNumber_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${AuditNumber_list}     ${Sort_order}

Double Click Audit Type header in Payer dashboard Outstanding Final Appeals page and verify sorting is done in Ascending order
     wait until Element is visible   ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_AuditTypeColumnHeader_Locator}
    Double Click Element   ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_AuditTypeColumnHeader_Locator}
    sleep   5
    ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_AuditType_AllElements_Locator}
    @{AuditType_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_AuditType}=  Get Text      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_AuditType_AllElements_Locator} [${i}]
    Append To List      ${AuditType_list}    ${get_AuditType}
    END
    log      ${AuditType_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
    WHILE    ${present} == True
          Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
          ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_AuditType_AllElements_Locator}
          @{AuditType_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_AuditType}=  Get Text      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_AuditType_AllElements_Locator} [${i}]
             Append To List      ${AuditType_list}    ${get_AuditType}
          END
    END
    log      ${AuditType_list}
    ${Sort_order}=  Copy list  ${AuditType_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${AuditType_list}     ${Sort_order}

Double Click IdentifiedSavings header in Payer dashboard Outstanding Final Appeals page and verify sorting is done in Ascending order
     wait until Element is visible   ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_IdentifiedSavingsColumnHeader_Locator}
    Double Click Element   ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_IdentifiedSavingsColumnHeader_Locator}
    sleep   5
    ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_IdentifiedSavings_AllElements_Locator}
    @{IdentifiedSavings_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_IdentifiedSavings}=  Get Text      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_IdentifiedSavings_AllElements_Locator} [${i}]
    ${get_IdentifiedSavingsFormatted}=    Replace string       ${get_IdentifiedSavings}       $         ${empty}
    Append To List      ${IdentifiedSavings_list}    ${get_IdentifiedSavingsFormatted}
    END
    log      ${IdentifiedSavings_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
    WHILE    ${present} == True
          Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
          ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_IdentifiedSavings_AllElements_Locator}
          @{IdentifiedSavings_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_IdentifiedSavings}=  Get Text      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_IdentifiedSavings_AllElements_Locator} [${i}]
             ${get_IdentifiedSavingsFormatted}=    Replace string       ${get_IdentifiedSavings}       $         ${empty}
             Append To List      ${IdentifiedSavings_list}    ${get_IdentifiedSavingsFormatted}
          END
    END
    log      ${IdentifiedSavings_list}
    ${Sort_order}=  Copy list  ${IdentifiedSavings_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${IdentifiedSavings_list}     ${Sort_order}

Double Click Division Code header in Payer dashboard Outstanding Final Appeals page and verify sorting is done in Ascending order
     wait until Element is visible   ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_DivisionCodeColumnHeader_Locator}
    Double Click Element   ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_DivisionCodeColumnHeader_Locator}
    sleep   5
    ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_DivisionCode_AllElements_Locator}
    @{DivisionCode_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_DivisionCode}=  Get Text      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_DivisionCode_AllElements_Locator} [${i}]
    Append To List      ${DivisionCode_list}    ${get_DivisionCode}
    END
    log      ${DivisionCode_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
    WHILE    ${present} == True
          Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
          ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_DivisionCode_AllElements_Locator}
          @{DivisionCode_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_DivisionCode}=  Get Text      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_DivisionCode_AllElements_Locator} [${i}]
             Append To List      ${DivisionCode_list}    ${get_DivisionCode}
          END
    END
    log      ${DivisionCode_list}
    ${Sort_order}=  Copy list  ${DivisionCode_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${DivisionCode_list}     ${Sort_order}


Double Click Initial Findings header in Payer dashboard Outstanding Final Appeals page and verify sorting is done in Ascending order
        wait until Element is visible   ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_InitialFindingsColumnHeader_Locator}
    Double Click Element   ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_InitialFindingsColumnHeader_Locator}
    sleep   5
    ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_InitialFindings_AllElements_Locator}
    @{Date_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_Date}=  Get Text      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_InitialFindings_AllElements_Locator} [${i}]
    ${get_DateFormatted} =     Replace string       ${get_Date}      info\n\n           ${empty}
    Append To List      ${Date_list}    ${get_DateFormatted}
    END
    log      ${Date_list}
    ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
    WHILE    ${present} == True
          Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
          ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_InitialFindings_AllElements_Locator}
          @{Date_list}=   Create List
          FOR    ${i}     IN RANGE    1   ${element_count}+1
             ${get_Date}=  Get Text      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_InitialFindings_AllElements_Locator} [${i}]
             ${get_DateFormatted} =     Replace string       ${get_Date}      info\n\n           ${empty}
             Append To List      ${Date_list}    ${get_DateFormatted}
          END
    END
    log      ${Date_list}
    ${Sort_order}=  Copy list  ${Date_list}
    ${sorted_dates}       Sort Dates MM/DD/YYYY      ${Sort_order}
    log      ${sorted_dates}
    lists should be equal       ${Date_list}     ${sorted_dates}

Get the number of records on Final Appeals first page
        ${firstPagelements_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_ClaimNumber_AllElements_Locator}
        Set global variable          ${firstPagelements_count}

click Clear Filter button in Final Appeal History page
        Click element       ${PayerDashboard_FinalLevelAppeals_History_Filter_ClearFilter_Button_Locator}

click Clear Filter button in Outstanding Final Appeal page
        Click element     ${PayerDashboard_FinalLevelAppeals_OutstandingFinalAppealsPage_Filter_ClearFilter_Button_Locator}

Verify the records in Final Appeal page after clearing filter
        ${recordCountAfterClaringFilter}=    get element count     ${PayerDashboard_FinalLevelAppeals_HistoryPage_ClaimNumber_AllElements_Locator}
        Should be equal      ${recordCountAfterClaringFilter}        ${firstPagelements_count}

Validate the Final Appeal Details Outstanding Final Level AppealsPage UI
      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ClaimNumber_Element_Locator_New}=      Replace string      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ClaimNumber_Element_Locator}        ${substringToReplace}        ${data_list[0]['ClaimNumber']}
      Wait until element is visible        ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ClaimNumber_Element_Locator_New}      timeout=30
      Element should be visible        ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_ClaimNumber_Element_Locator_New}

Verify Data After Applying Filter Functionality By Providing Medical Record Number In Outstanding Final Level Appeals Page
       ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_HistoryPage_Filtered_Results_Element_Locator}
      IF   ${present} == True
        ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_MedicalRecordNumber_AllElements_Locator}
        FOR    ${i}     IN RANGE    1   ${element_count}+1
        ${get_MRNumber}=  Get Text      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_MedicalRecordNumber_AllElements_Locator} [${i}]
        Should be equal      ${get_MRNumber}    ${data_list[0]['MRNumber']}
        END
        ${present}=    Run Keyword And Return Status        Page Should Contain Element         ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
        WHILE    ${present} == True
              Click element      ${PayerDashboard_FinalLevelAppeals_Page_Next_Link_Locator}
              ${element_count}=    get element count     ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_MedicalRecordNumber_AllElements_Locator}
              FOR    ${i}     IN RANGE    1   ${element_count}+1
                 ${get_MRNumber}=  Get Text      ${PayerDashboard_FinalLevelAppeals_OustandingFinalAppealsPage_MedicalRecordNumber_AllElements_Locator} [${i}]
                 Should be equal      ${get_MRNumber}    ${data_list[0]['MRNumber']}
              END
        END
      ELSE
                Page should contain        There are no Final Appeal Requests which meet the criteria.
      END

Verify filter Functionality by providing valid Medical Record Number
       [Arguments]   ${PayerDashboard_MedicalRecordNumber_PassedByUser}
       Element Should Be Visible        ${PayerDashboard_FinalLevelAppeals_OutstandingFinalAppealsPage_Filter_MedicalRecordNumber_TextField_Locator}
       Wait Until Element Is Visible    ${PayerDashboard_FinalLevelAppeals_OutstandingFinalAppealsPage_Filter_MedicalRecordNumber_TextField_Locator}
       Click Element                    ${PayerDashboard_FinalLevelAppeals_OutstandingFinalAppealsPage_Filter_MedicalRecordNumber_TextField_Locator}
       Input Text                       ${PayerDashboard_FinalLevelAppeals_OutstandingFinalAppealsPage_Filter_MedicalRecordNumber_TextField_Locator}     ${PayerDashboard_MedicalRecordNumber_PassedByUser}
       Sleep    3