*** Settings ***
Documentation    Script to Test Communication Portal
Library    SeleniumLibrary
Library    Easter
Library    String
Library    Collections
Library    DateTime

Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//History_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//AuditHistory_TestData.yaml
Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//RecordAnalyst_DashBoard_Elements.py

*** Variables ***
${substringToReplace}    texttoreplace


*** Keywords ***

#Satheesh
Verify History page is displayed on clicking History Icon
    Sleep   3
    click Element       ${AuditHistory_HamburgerMenu_Locator}
    wait until Element is Visible   ${AuditHistory_HistoryIcon_Locator}      timeout=120
    Element should be Visible   ${AuditHistory_HistoryIcon_Locator}
    click Element   ${AuditHistory_HistoryIcon_Locator}
    wait until Element is Visible   ${AuditHistory_Header_Locator}      timeout=120
    Element should be Visible   ${AuditHistory_Header_Locator}
    sleep   3

Return Patient name hyperlink locator with patient account number passed by user
     [Arguments]   ${PtAccName_PassedByUser}
     ${PtAccName_PassedByUser}             TestDataFormatter.formatPatientName          ${PtAccName_PassedByUser}         ${empty}
     ${AuditHistory_PatientName_Hyperlink_New}=     Replace String      ${AuditHistory_PatientName_Hyperlink_Locator}   ${HistoryTab_PatientName}    ${PtAccName_PassedByUser}
     Set Global Variable    ${AuditHistory_PatientName_Hyperlink_New}

Click Patient Hyperlink in History Tab
        Wait Until Element Is Visible   ${AuditHistory_PatientName_Hyperlink_New}    timeout=120
        Click Element       ${AuditHistory_PatientName_Hyperlink_New}

#Verify Patient name and Audit Number
#        wait until Element is Visible   ${AuditHistory_PatientName_Header_Locator}      timeout=120
#        Element should be Visible   ${AuditHistory_PatientName_Header_Locator}
#        wait until Element is Visible   ${AuditHistory_PatientAuditNumber_Locator}      timeout=120
#        Element should be Visible   ${AuditHistory_PatientAuditNumber_Locator}

Verify Patient details in History page
   ${PatientName}             TestDataFormatter.formatPatientName          ${data_list[0]['PatientFirstName']}    ${data_list[0]['PatientLastName']}
   ${AuditHistory_PatientName_Header_Locator_New} =  Replace String   ${AuditHistory_PatientName_Header_Locator}  ${substringToReplace}  ${PatientName}
   Wait Until Element Is Visible    ${AuditHistory_PatientName_Header_Locator_New}
   Element Should Be Visible      ${AuditHistory_PatientName_Header_Locator_New}
   ${formattedDOB}             TestDataFormatter.formatDate           ${data_list[0]['PatientDob']}
   ${AuditHistory_DOB_Detail_Locator_New}=     Replace String      ${AuditHistory_DOB_Detail_Locator}   ${substringToReplace}    ${formattedDOB}
   Wait Until Element Is Visible    ${AuditHistory_DOB_Detail_Locator_New}
   Element Should Be Visible      ${AuditHistory_DOB_Detail_Locator_New}
   ${AuditHistory_AuditStatus_Locator_New}=     Replace String      ${AuditHistory_AuditStatus_Locator}   ${substringToReplace}    ${data_list[0]['PatientAccountNumber']}
   Wait Until Element Is Visible    ${AuditHistory_AuditStatus_Locator_New}
   Element Should Be Visible      ${AuditHistory_AuditStatus_Locator_New}
   ${AuditHistory_AuditNum_Locator_New}=     Replace String      ${AuditHistory_AuditNum_Locator}   ${substringToReplace}    ${data_list[0]['AuditNumber']}
   Wait Until Element Is Visible    ${AuditHistory_AuditNum_Locator_New}
   Element Should Be Visible      ${AuditHistory_AuditNum_Locator_New}
#   ${dateOfService}             TestDataFormatter.formatDateOfService          ${data_list[0]['AdmitDate']}    ${data_list[0]['DischargeDate']}
#   ${RecordAnalyst_DOS_Detail_Locator_New}=     Replace String      ${RecordAnalyst_DOS_Detail_Locator}   ${substringToReplace}    ${dateOfService}
#   Wait Until Element Is Visible    ${RecordAnalyst_DOS_Detail_Locator_New}
#   Element Should Be Visible      ${RecordAnalyst_DOS_Detail_Locator_New}
#   ${RecordAnalyst_MediRecNum_Detail_Locator_New}=     Replace String      ${RecordAnalyst_MediRecNum_Detail_Locator}   ${substringToReplace}    ${data_list[0]['MRNumber']}
#   Wait Until Element Is Visible    ${RecordAnalyst_MediRecNum_Detail_Locator_New}
#   Element Should Be Visible      ${RecordAnalyst_MediRecNum_Detail_Locator_New}
   ${AuditHistory_Claimnum_Locator_New}=     Replace String      ${AuditHistory_Claimnum_Locator}   ${substringToReplace}    ${data_list[0]['ClaimNumber']}
   Wait Until Element Is Visible    ${AuditHistory_Claimnum_Locator_New}
   Element Should Be Visible      ${AuditHistory_Claimnum_Locator_New}
#   ${RecordAnalyst_ProviderName_Detail_Locator_New}=     Replace String      ${RecordAnalyst_ProviderName_Detail_Locator}   ${substringToReplace}    ${data_list[0]['ProviderName']}
#   Wait Until Element Is Visible    ${RecordAnalyst_ProviderName_Detail_Locator_New}
#   Element Should Be Visible      ${RecordAnalyst_ProviderName_Detail_Locator_New}
#   ${RecordAnalyst_ProviderId_Detail_Locator_New}=     Replace String      ${RecordAnalyst_ProviderId_Detail_Locator}   ${substringToReplace}    ${data_list[0]['ProviderNumber']}
#   Wait Until Element Is Visible    ${RecordAnalyst_ProviderID_Detail_Locator_New}
#   Element Should Be Visible      ${RecordAnalyst_ProviderID_Detail_Locator_New}


Ascending order sort verification for Patient name by default in History Tab
    wait until Element is Visible       ${AuditHistory_PatientsName_Table_Locator}
    ${element_count}=    get element count     ${AuditHistory_PatientsName_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${AuditHistory_PatientsName_Table_Locator} [${i}]
    Append To List      ${username_list}    ${get_username}
    END
    log      ${username_list}
    ${Sort_order}=  Copy list  ${username_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${username_list}     ${Sort_order}


Double click patient Name header in History Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${AuditHistory_PatientName_ColumnHeader_Locator}
    Double click Element   ${AuditHistory_PatientName_ColumnHeader_Locator}
    sleep   5

    ${element_count}=    get element count     ${AuditHistory_PatientsName_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${AuditHistory_PatientsName_Table_Locator} [${i}]
    Append To List      ${username_list}    ${get_username}
    END
    log      ${username_list}
    ${Sort_order}=  Copy list  ${username_list}
    sort list     ${Sort_order}
    log      ${Sort_order}
    lists should be equal       ${username_list}     ${Sort_order}

Double Click patient Account Number Header in History Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${AuditHistory_PatientAccountNumber_ColumnHeader_Locator}       timeout=20
    click Element    ${AuditHistory_PatientAccountNumber_ColumnHeader_Locator}
    click Element    ${AuditHistory_PatientAccountNumber_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${AuditHistory_PatientAccountNumber_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${AuditHistory_PatientAccountNumber_Table_Locator} [${i}]
    Append To List      ${username_list}    ${get_username}
    END
    log      ${username_list}
    ${sort_order}=  Evaluate     sorted(${username_list}, key=int, reverse=False)
    log      ${sort_order}
    lists should be equal       ${username_list}     ${sort_order}

Double Click Medical Record Number header in History Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${AuditHistory_MedicalRecordNumber_ColumnHeader_Locator}        timeout=20
    Double click Element   ${AuditHistory_MedicalRecordNumber_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${AuditHistory_MedicalRecordNumber_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${AuditHistory_MedicalRecordNumber_Table_Locator} [${i}]
    Append To List      ${username_list}    ${get_username}
    END
    log      ${username_list}
    ${sort_order}=  Copy list  ${username_list}
    sort list     ${sort_order}
    log      ${sort_order}
    lists should be equal       ${username_list}     ${sort_order}

Double Click Provider Number header in History Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${AuditHistory_ProviderNumber_ColumnHeader_Locator}        timeout=20
    Double click Element   ${AuditHistory_ProviderNumber_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${AuditHistory_ProviderNumber_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${AuditHistory_ProviderNumber_Table_Locator} [${i}]
    Append To List      ${username_list}    ${get_username}
    END
    log      ${username_list}
    ${sort_order}=  Copy list  ${username_list}
    sort list     ${sort_order}
    log      ${sort_order}
    lists should be equal       ${username_list}     ${sort_order}

Double Click Dates of Service header in History Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${AuditHistory_Datesofservice_ColumnHeader_Locator}         timeout=20
    Double click Element   ${AuditHistory_Datesofservice_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${AuditHistory_DatesOfService_Table_Locator}
    @{username_list}=   Create List
    @{converted_list}=       Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${AuditHistory_DatesOfService_Table_Locator} [${i}]

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



Double Click Portal Status header in History Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${AuditHistory_PortalStatus_ColumnHeader_Locator}       timeout=20
    Double click Element   ${AuditHistory_PortalStatus_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${AuditHistory_PortalStatus_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${AuditHistory_PortalStatus_Table_Locator} [${i}]
    Append To List      ${username_list}    ${get_username}
    END
    log      ${username_list}
    ${sort_order}=  Copy list  ${username_list}
    sort list     ${sort_order}
    log      ${sort_order}
    lists should be equal       ${username_list}     ${sort_order}

Double Click Status Date header in History Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${AuditHistory_StatusDate_ColumnHeader_Locator}     timeout=20
    Double click Element   ${AuditHistory_StatusDate_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${AuditHistory_StatusDate_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${AuditHistory_StatusDate_Table_Locator} [${i}]
    Append To List      ${username_list}    ${get_username}
    END
    log      ${username_list}
    ${sort_order}=  Copy list  ${username_list}
    sort list     ${sort_order}
    log      ${sort_order}
    lists should be equal       ${username_list}     ${sort_order}

Double Click Audit Number header in History Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${AuditHistory_AuditNumber_ColumnHeader_Locator}        timeout=20
    click Element   ${AuditHistory_AuditNumber_ColumnHeader_Locator}
#    click Element   ${AuditHistory_AuditNumber_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${AuditHistory_AuditNumber_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${AuditHistory_AuditNumber_Table_Locator} [${i}]
    Append To List      ${username_list}    ${get_username}
    END
    log      ${username_list}
#    ${sort_order}=  Copy list  ${username_list}
    ${sort_order}=  Evaluate     sorted(${username_list}, key=int, reverse=False)
#    sort list     ${sort_order}
    log      ${sort_order}
    lists should be equal       ${username_list}     ${sort_order}

Double Click Claim Number header in History Tab and verify sorting is done in Ascending order
    wait until Element is visible   ${AuditHistory_ClaimNumber_ColumnHeader_Locator}            timeout=20
    click Element   ${AuditHistory_ClaimNumber_ColumnHeader_Locator}
#    click Element   ${AuditHistory_ClaimNumber_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${AuditHistory_ClaimNumber_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${AuditHistory_ClaimNumber_Table_Locator} [${i}]
    Append To List      ${username_list}    ${get_username}
    END
    log      ${username_list}
    ${sort_order}=  Copy list  ${username_list}
    sort list     ${sort_order}
    log      ${sort_order}
    lists should be equal       ${username_list}     ${sort_order}

Scroll down to the bottom of Audit History Page
    Execute javascript          window.scrollTo(0,2000)
    sleep  3


Verify Items Per Page is present and contains 10 by default
    wait until Element is Visible       ${AuditHistory_ItemsPerPage_label_Locator}
    Element should be visible              ${AuditHistory_ItemsPerPage10_Locator}
    ${element_count}=    get element count     ${AuditHistory_PatientsName_Table_Locator}
    @{AuditStatus_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_AuditStatus}=  Get Text      ${AuditHistory_PatientsName_Table_Locator} [${i}]
    Append To List      ${AuditStatus_list}    ${get_AuditStatus}
    END
    log      ${AuditStatus_list}
    should be true         ${element_count}<=${10}

Selects Item Per Page as 20
    ${IPP} =  Get Element Count   ${AuditHistory_ItemsPerPage_Dropdown_Locator}
    Run Keyword If    ${IPP} > 0   Select From List By label    ${AuditHistory_ItemsPerPage_Dropdown_Locator}   ${Items Per Page}
    sleep   5

Verifies History Tab displays 20 records
    wait until Element is Visible       ${AuditHistory_PatientsName_Table_Locator}
    ${element_count}=    get element count     ${AuditHistory_PatientsName_Table_Locator}
    should be true         ${element_count}>=${Items Per Page}

Return Overdue locator with patient account number passed by user for BA
     [Arguments]         ${PtAccNumAuditResult_PassedByUser}
     ${BillingAnalyst_Overdue_locator_New}=     Replace String      ${BillingAnalyst_Overdue_locator}   ${PtAccNumAppeal}    ${PtAccNumAuditResult_PassedByUser}
     Set Global Variable    ${BillingAnalyst_Overdue_locator_New}

     ${BillingAnalyst_Apoproaching_Overdue_locator_New}=     Replace String      ${BillingAnalyst_Apoproaching_Overdue_locator}   ${PtAccNumAppeal}    ${PtAccNumAuditResult_PassedByUser}
     Set Global Variable    ${BillingAnalyst_Apoproaching_Overdue_locator_New}

     ${BillingAnalyst_NotApoproaching_Overdue_locator_New}=     Replace String      ${BillingAnalyst_NotApoproaching_Overdue_locator}   ${PtAccNumAppeal}    ${PtAccNumAuditResult_PassedByUser}
     Set Global Variable    ${BillingAnalyst_NotApoproaching_Overdue_locator_New}

     Set Global Variable            ${PtAccNumAuditResult_PassedByUser}


Verify patient record request Overdue status for BA
    Wait Until Element Is Visible    ${BillingAnalyst_AuditFindings_ReviewButton_Locator}          timeout=20
    ${Overdue_locator_count} =   Get Element Count   ${BillingAnalyst_Overdue_locator_New}
    ${Apoproaching_Overdue_locator_count} =   Get Element Count   ${BillingAnalyst_Apoproaching_Overdue_locator_New}
    ${NotApoproaching_Overdue_locator_count} =   Get Element Count   ${BillingAnalyst_NotApoproaching_Overdue_locator_New}

    IF   ${Overdue_locator_count}>0
    ${status}=   set variable    Overdue
    ${BA_Overdue}=     get variable value        ${PtAccNumAuditResult_PassedByUser}
    log   ${status}
    log     ${BA_Overdue}
    Set Global Variable          ${BA_Overdue}

    ELSE IF    ${Apoproaching_Overdue_locator_count}>0
    ${status}=    set variable    Approaching Overdue
    ${BA_App_overdue}=     get variable value       ${PtAccNumAuditResult_PassedByUser}
    log   ${status}
    log     ${BA_App_Overdue}
    Set Global Variable          ${BA_App_Overdue}

    ELSE IF    ${NotApoproaching_Overdue_locator_count}>0
    ${status}=    Set Variable    Not Approaching Overdue
    ${BA_Non_Overdue}=     get variable value        ${PtAccNumAuditResult_PassedByUser}
    log   ${status}
    log     ${BA_Non_Overdue}
    Set Global Variable          ${BA_Non_Overdue}
    END

Clicks on filter icon
    wait until Element is visible       ${AuditHistory_Filter_button_Locator}
    click Element       ${AuditHistory_Filter_button_Locator}

Verify filter Functionality by providing Valid Patient Account Number for RA and BA
    [Arguments]         ${PassedByUser}
    sleep   3
    wait until Element is Visible       ${AuditHistory_PatientAccountNumber_FilterOption_TextBox_Locator}            timeout=30
    Input Text         ${AuditHistory_PatientAccountNumber_FilterOption_TextBox_Locator}        ${PassedByUser}
    Click button        ${AuditHistory_ApplyFilter_button_Locator}

Verify for Audit Status of Overdue record for RA
    Element should be visible        ${AuditHistory_RA_OverdueAuditStatus_Locator}
    ${Overdue}=      Get Text    ${AuditHistory_RA_OverdueAuditStatus_Locator}
    should be equal         ${Overdue}          ${RA_Overdue_AuditStatus}

Verify for Audit Status of Non_Overdue record for RA
    Element should be visible        ${AuditHistory_RA_NonOverdueAuditStatus_Locator}
    ${Non_Overdue}=      Get Text    ${AuditHistory_RA_NonOverdueAuditStatus_Locator}
    should be equal         ${Non_Overdue}          ${RA_Non_Overdue_AuditStatus}

Verify for Audit Status of Overdue record for BA
    Element should be visible        ${AuditHistory_BA_OverdueAuditStatus_Locator}
    ${Overdue}=      Get Text    ${AuditHistory_BA_OverdueAuditStatus_Locator}
    should be equal         ${Overdue}          ${BA_Overdue_AuditStatus}

Verify for Audit Status of Non_Overdue record for BA
    Element should be visible        ${AuditHistory_BA_NonOverdueAuditStatus_Locator}
    ${Non_Overdue}=      Get Text    ${AuditHistory_BA_NonOverdueAuditStatus_Locator}
    should be equal         ${Non_Overdue}          ${BA_Non_Overdue_AuditStatus}


click on Homepage Icon on Hamburger Icon
    wait until Element is visible       ${AuditHistory_HamburgerHomeIcon_Locator}
    click Element       ${AuditHistory_HamburgerHomeIcon_Locator}

Verify filter Functionality by providing Portal Status (Dropdown)
    Wait until Element is Visible       ${AuditHistory_AuditStatus_Filter_Dropdown_Locator}
    Select From List By Label    ${AuditHistory_AuditStatus_Filter_Dropdown_Locator}    ${Audit_Status_Name}
    Click button        ${AuditHistory_ApplyFilter_button_Locator}

Verify result is displayed for Portal Status
    wait until Element is visible   ${AuditHistory_PortalStatus_ColumnHeader_Locator}       timeout=20
    ${element_count}=    get element count     ${AuditHistory_PortalStatus_Table_Locator}
    @{AuditStatus_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_AuditStatus}=  Get Text      ${AuditHistory_PortalStatus_Table_Locator} [${i}]
    Append To List      ${AuditStatus_list}    ${get_AuditStatus}
    END
    log      ${AuditStatus_list}
    ${Duplicates}=   remove duplicates      ${AuditStatus_list}
    ${AuditStatus}=     catenate        @{Duplicates}
    log         ${AuditStatus}
    should be equal       ${AuditStatus}       ${Audit_Status_Name}


Scroll down to desired element
    wait until Element is visible   ${AuditHistory_PortalStatus_ColumnHeader_Locator}       timeout=20
    Execute javascript          window.scrollTo(0,500)
    sleep       5

Click next page button
    Wait Until Element Is Visible           ${AuditHistory_Nextpage_Locator}
    Click Element                           ${AuditHistory_Nextpage_Locator}

Click on page number
    Wait Until Element Is Visible           ${AuditHistory_Page_number}
    Click Element                           ${AuditHistory_Page_number}

Verify the selected page number is displayed
    Wait Until Element Is Visible       ${AuditHistory_Selected_Page_Number_Locator}
    Element Should Be Visible       ${AuditHistory_Selected_Page_Number_Locator}
    Page Should Contain Element          ${AuditHistory_Selected_Page_Number_Locator}
    ${page number}=    Get Text       ${AuditHistory_Page_number}
    should be equal         ${page number}          ${Page_Number}









#AN


Verify Patient Account Number displayed on tile
        Sleep    5
        Element Should Be Visible         ${Comm_Portal_FilterButton_PatientAccountNumber_TextField_Locator}
        Wait Until Element Is Visible     ${Comm_Portal_FilterButton_PatientAccountNumber_TextField_Locator}
        Click Element                     ${Comm_Portal_FilterButton_PatientAccountNumber_TextField_Locator}
        Input Text                        ${Comm_Portal_FilterButton_PatientAccountNumber_TextField_Locator}                    ${data_list[0]['PatientAccountNumber']}
        Sleep    3
        Wait Until Element Is Visible           ${Comm_Portal_FilterButton_ApplyFilterButton_Locator}         timeout=120
        Click Button                            ${Comm_Portal_FilterButton_ApplyFilterButton_Locator}
#        Element Should Be Visible              ${Comm_Portal_PatientAccNumber_Locator}

Verify Upload Documents Tab is enabled
          [Arguments]         ${PtAccNumber_PassedByUser}
          ${AuditHistory_PatientAccountNumber_Locator_New} =  Replace String   ${AuditHistory_PatientAccountNumber_Locator}      ${substringToReplace}      ${PtAccNumber_PassedByUser}
         FOR   ${i}  IN RANGE    10
                ${buttonEnabled}=     Run Keyword And Return Status    Element Should be enabled    ${AuditHistory_PatientAccountNumber_Locator_New}
                run keyword if      ${buttonEnabled}     exit for loop
                Click next page button
         END


Navigate to Homepage of portal
        Wait Until Element Is Visible              ${AuditHistory_Breadcrumbs_Locator}                   timeout=120
        Click Element                              ${AuditHistory_Breadcrumbs_Locator}

Return patient account number passed by user in filter Textfield
     [Arguments]         ${PtAccNum_PassedByUser}
     ${Comm_Portal_PatientAccountNumber_Locator_New}=     Replace String    ${Comm_Portal_PatientAccountNumber_Locator}                    ${HistoryTab_PatientAccountNumber}           ${PtAccNum_PassedByUser}
     Set Global Variable            ${Comm_Portal_PatientAccountNumber_Locator_New}

Return patient account number passed by user in Audit History Page
     [Arguments]         ${PtAccNumber_PassedByUser}
     ${AuditHistory_PatientAccountNumber_Locator}=     Replace String    ${AuditHistory_PatientAccountNumber_Locator}                    ${HistoryTab_PatientAccountNumber}             ${PtAccNumber_PassedByUser}
     Set Global Variable      ${AuditHistory_PatientAccountNumber_Locator}
     Set Global Variable      ${AuditHistory_PatientAccountNumber_Locator}

Verify patient tile is not present on either RA and BA dashboard
        Verify Patient Account Number displayed on tile
        Element Should Not Be Visible           ${Comm_Portal_PatientAccountNumber_Locator}
        Wait Until Element Is Visible     ${Comm_Portal_HomePage_RecordRequestsTab_Locator}
        Click Element               ${Comm_Portal_HomePage_RecordRequestsTab_Locator}
        BillingAnalyst_Dashboard.Click Filter Button
#        Verify RA Dashboard is visible
        Verify Patient Account Number displayed on tile
        Element Should Not Be Visible           ${Comm_Portal_PatientAccountNumber_Locator}

Verify patient tile is present on either RA and BA dashboard

         Verify Patient Account Number displayed on tile
         ${PatientAccNumber}=     Run Keyword And Return Status    Element Should be visible    ${Comm_Portal_PatientAccNumber_Locator}
         IF    '${PatientAccNumber}'=='True'
         Wait Until Element Is Visible     ${Comm_Portal_PatientAccNumber_Locator}
         ELSE
         Wait Until Element Is Visible     ${Comm_Portal_HomePage_RecordRequestsTab_Locator}
         Click Element               ${Comm_Portal_HomePage_RecordRequestsTab_Locator}
         Sleep  5
         BillingAnalyst_Dashboard.Click Filter Button
         Verify RA Dashboard is visible
         Verify Patient Account Number displayed on tile
         END


Verify Upload Documents Tab is disable
      Sleep    5
      [Arguments]         ${PtAccNumber_PassedByUser}
      ${AuditHistory_PatientAccountNumber_Locator_New} =  Replace String   ${AuditHistory_PatientAccountNumber_Locator}  ${substringToReplace}  ${PtAccNumber_PassedByUser}
      FOR   ${i}  IN RANGE    10
                ${buttonDisabled}=     Run Keyword And Return Status    Element Should be disabled    ${AuditHistory_PatientAccountNumber_Locator_New}
                run keyword if      ${buttonDisabled}     exit for loop
                Click next page button
      END
      Wait Until Element Is Visible          ${AuditHistory_PatientAccountNumber_Locator_New}
      Element Should Be Disabled             ${AuditHistory_PatientAccountNumber_Locator_New}

Click Filter Button
        Wait Until Element Is Visible           ${AuditHistory_FilterButton_Locator}
        Click Element                           ${AuditHistory_FilterButton_Locator}

Click Apply Filter Button
        Wait Until Element Is Visible           ${AuditHistory_ApplyFilterButton_Locator}                                timeout=120
        Click Button                            ${AuditHistory_ApplyFilterButton_Locator}

Verify filter Functionality by providing From status Date and To Status Date
       Element Should Be Visible        ${AuditHistory_filter_FromstatusDateLabel_Locator}
       Wait Until Element Is Visible    ${AuditHistory_filter_FromstatusDateLabel_Locator}
       Click Element                    ${AuditHistory_filter_FromstatusDate_Textfield_Locator}
       Input Text                       ${AuditHistory_filter_FromstatusDate_Textfield_Locator}              ${FromstatusDate}
       Sleep    5

       Element Should Be Visible        ${AuditHistory_filter_TostatusDateLabel_Locator}
       Wait Until Element Is Visible    ${AuditHistory_filter_TostatusDateLabel_Locator}
       Click Element                    ${AuditHistory_filter_TostatusDate_Textfield_Locator}
       Input Text                       ${AuditHistory_filter_TostatusDate_Textfield_Locator}                    ${TostatusDate}
       Sleep    5

Verify data after applying filter Functionality providing From status Date and To Status Date

     ${DATE1}=   Convert date        ${FromstatusDate}           date_format=%m/%d/%Y
     ${DATE2}=   Convert date        ${TostatusDate}              date_format=%m/%d/%Y
     ${c}=   convert date        ${DATE1}        epoch
     ${d}=   convert date        ${DATE2}        epoch
     ${element_count}=    get element count     ${AuditHistory_StatusDate_Table_Locator}
     @{StatusDate_list}=   Create List
     FOR    ${i}     IN RANGE    1   ${element_count}+1
        ${get_StatusDate}=  Get Text      ${AuditHistory_StatusDate_Table_Locator} [${i}]
        ${e}=   convert date         ${get_StatusDate}       date_format=%m/%d/%Y
        ${f}=   convert date         ${e}       epoch
        IF  ${f}> ${c} and ${f}<${d}
            Append To List      ${StatusDate_list}    ${f}
        ELSE
            BREAK
        END
    END
    log      ${StatusDate_list}

Verify Filter Options panel is visible
        Wait Until Element Is Visible    ${AuditHistory_filter_FromstatusDateLabel_Locator}
        Element Should Be Visible       ${AuditHistory_filter_FromstatusDateLabel_Locator}
        Wait Until Element Is Visible    ${AuditHistory_filter_TostatusDateLabel_Locator}
        Element Should Be Visible       ${AuditHistory_filter_TostatusDateLabel_Locator}
        Wait Until Element Is Visible    ${AuditHistory_filter_PatientAccountNumberLabel_Locator}
        Element Should Be Visible        ${AuditHistory_filter_PatientAccountNumberLabel_Locator}
        Wait Until Element Is Visible    ${AuditHistory_filter_MRNumberLabel_Locator}
        Element Should Be Visible        ${AuditHistory_filter_MRNumberLabel_Locator}
        Wait Until Element Is Visible    ${AuditHistory_filter_AuditStatusLabel_Locator}
        Element Should Be Visible        ${AuditHistory_filter_AuditStatusLabel_Locator}
        Wait Until Element Is Visible    ${AuditHistory_filter_AuditNumberLabel_Locator}
        Element Should Be Visible        ${AuditHistory_filter_AuditNumberLabel_Locator}
        Wait Until Element Is Visible    ${AuditHistory_filter_ClaimTypeLabel_Locator}
        Element Should Be Visible        ${AuditHistory_filter_ClaimTypeLabel_Locator}
        Wait Until Element Is Visible    ${AuditHistory_filter_ProviderNumberLabel_Locator}
        Element Should Be Visible        ${AuditHistory_filter_ProviderNumberLabel_Locator}
        Wait Until Element Is Visible    ${AuditHistory_ApplyFilterButton_Locator}
        Element Should Be Visible        ${AuditHistory_ApplyFilterButton_Locator}
        Wait Until Element Is Visible    ${AuditHistory_ClearFilterButton_Locator}
        Element Should Be Visible        ${AuditHistory_ClearFilterButton_Locator}


#Scroll down to the Audit History Page
#       Sleep  5
#       Execute JavaScript         window.scrollTo(0, document.body.scrollHeight)
#AK

Click on dashboard breadcrumbs
    Wait Until Element Is Visible          ${AuditHistory_dashboard_hyperlink_Locator}
    Click Element                           ${AuditHistory_dashboard_hyperlink_Locator}


Click on History Tab
    Click Element       ${AuditHistory_HamburgerMenu_Locator}
    wait until Element is Visible   ${AuditHistory_HistoryIcon_Locator}      timeout=120
    Element should be Visible   ${AuditHistory_HistoryIcon_Locator}
    click Element   ${AuditHistory_HistoryIcon_Locator}
    sleep   5


Zoom in zoom Out communication Portal
                Sleep       5
                Execute javascript       document.body.style.zoom="60%"
#                Press combination         Key.ctrl    '-'
#                Sleep       20

#AK

Fetch the Number of Records in History Page
    wait until Element is visible   ${AuditHistory_AuditNumber_ColumnHeader_Locator}        timeout=20
    click Element   ${AuditHistory_AuditNumber_ColumnHeader_Locator}
    sleep   3
    ${element_count}=    get element count     ${AuditHistory_AuditNumber_Table_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${AuditHistory_AuditNumber_Table_Locator} [${i}]
    Append To List      ${username_list}    ${get_username}
    END
    Set global variable      ${username_list}

Click Export Audit
    Wait Until Element Is Visible        ${AuditHistory_ExportAudit_Button_Locator}        timeout=120
    click element            ${AuditHistory_ExportAudit_Button_Locator}


Verify the columns in the downloaded export
     ${expectedColumns_list}=         create list         	Patient Name	    Patient AccountNumber 	     	Medical RecordNumber	    ProviderNumber	    Dates OfService	        Audit Status	Status Date	        AuditNumber	        Claim Number      Prepay

      ${lists_equal}          Lists should be equal       ${downloaded_data_list[0].keys()}          ${expectedColumns_list}


Verify the record in the downloaded export
     ${actualNoOfRecords} =     get length  ${downloaded_data_list}
     ${expectedAuditNumber} =      Convert to integer   ${username_list[0]}
     Should Be Equal       ${expectedAuditNumber}      ${downloaded_data_list[0]['AuditNumber']}