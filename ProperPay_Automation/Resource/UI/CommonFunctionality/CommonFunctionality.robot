
*** Settings ***
Documentation    Script to Test Communication Portal
Library    SeleniumLibrary
Library    ..//ProperPay_Automation//Resource/Database//Read_csv.py
Library    ..//ProperPay_Automation//Resource/Database//DatabaseConnection.py
Library    ..//ProperPay_Automation//Resource/UI//CommonFunctionality//ExcelReader.py
Library    BuiltIn
Library    ExcelLibrary
Library    OperatingSystem

Library    ..//ProperPay_Automation//Resource/Database//TestDataFormatter.py
Variables    ..//ProperPay_Automation//ElementsLocator//UI//CommonFunctionality//CommonFunctionality_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//CommonFunctionality//CommonFunctionality_TestData.yaml


*** Variables ***
${HMBCBS_DBName}     HMBCBS_ProviderPortal
${GATEW_DBName}      GATEW_ProviderPortal
${MSCOMM_DBName}      MSCOMM_ProviderPortal
${MSSTATE_DBName}      MSSTATE_ProviderPortal

*** Keywords ***


Finish TestCase
    Close Browser

Launch AdminUI Page
    Set Selenium Implicit Wait    10
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --start-maximized
    Call Method    ${options}    add_argument      disable-web-security
    Call Method    ${options}    add_argument      allow-running-insecure-content
    Create WebDriver    Chrome    options=${options}
    Go To    ${Admin_comm_url}
    Wait Until Keyword Succeeds    2x    10s    Title Should Be    ${Admin_comm_LandingPageTitle}
    Wait Until Element Is Visible    ${Admin_comm_LoginPageRockSolidKnw_Locator}
    Wait Until Element Is Visible    ${Admin_comm_LoginPageSupportlink_Locator}
    Click Button     ${Admin_comm_LoginPageLoginButton_Locator}

Login AdmiUI Page
    [Arguments]   ${comm_usr_name}    ${comm_pass}
    Wait Until Keyword Succeeds    2x    10s    Title Should Be    ${Admin_comm_LoginPageTitle}
    Input Text     ${Admin_comm_LoginPageUserName_Locator}    ${comm_usr_name}
    Input Text     ${Admin_comm_LoginPagePassword_Locator}    ${comm_pass}
    Click Button   ${Admin_comm_LoginPageLButton_Locator}


Launch Communication Portal Page
    Set Selenium Implicit Wait    10
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --start-maximized
#    Call Method    ${options}    add_argument      disable-web-security
#    Call Method    ${options}    add_argument      allow-running-insecure-content
    Create WebDriver    Chrome   options=${options}
    Go To    ${comm_url}
    Wait Until Keyword Succeeds    10x    2s    Title Should Be    ${comm_LandingPageTitle}
    #Wait Until Element Is Visible     ${Comm_Portal_LoginPageBKgrdImage_Locator}   timeout=120
#    Element Should Be Visible         ${Comm_Portal_LoginPageTitleHeader_Locator}


Launch Communication Portal Page in new tab

    Execute Javascript    window.open('')
    ${windows}    Get Window Handles
    Log    ${windows}
    Switch Window    ${windows}[1]
    Set Selenium Implicit Wait    10
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --start-maximized
    Call Method    ${options}    add_argument      disable-web-security
    Call Method    ${options}    add_argument      allow-running-insecure-content
    Create WebDriver    Chrome   options=${options}
    Go To    ${comm_url}
    Wait Until Element Is Visible    ${Comm_Portal_LoginPageBKgrdImage_Locator}
    Element Should Be Visible    ${Comm_Portal_LoginPageTitleHeader_Locator}


Open the required user in Admin page

   [Arguments]  ${comm_usr_name}
   Wait Until Element Is Visible   ${Admin_Comm_Homepage_Users_Tab_Locator}
   Click Element    ${Admin_Comm_Homepage_Users_Tab_Locator}
   Wait Until Element Is Visible   ${Admin_Comm_Homepage_Users_Tab_SearchUserName_Locator}
   Input Text    ${Admin_Comm_Homepage_Users_Tab_SearchUserName_Locator}    ${comm_usr_name}
   Press Keys    ${Admin_Comm_Homepage_Users_Tab_SearchUserName_Locator}    RETURN
   Sleep  5
   Wait Until Element Is Visible   ${Admin_Comm_Homepage_Users_Tab_SearchReturned_UserName_Locator}
   Click Element    ${Admin_Comm_Homepage_Users_Tab_SearchReturned_UserName_Locator}
   Wait Until Element Is Visible   ${Admin_Comm_Homepage_Users_Tab_User_Roles_Tab_Locator}
   sleep  2
   Double Click Element       ${Admin_Comm_Homepage_Users_Tab_User_Roles_Tab_Locator}


User Role Configuration in Admin page
   [Arguments]   ${Required_Role}

   Run Keyword If    "${Required_Role}"=="Billing Analyst"
   ...    Run Keywords
   ...    Wait Until Element Is Visible   ${Admin_Comm_Homepage_Users_Tab_Users_Roles_Tab_Role_Record_Analyst_checkbox_locator}     timeout=120
   ...    AND    Click Element    ${Admin_Comm_Homepage_Users_Tab_Users_Roles_Tab_Role_Record_Analyst_checkbox_locator}

   ...    ELSE IF   "${Required_Role}"=="Record Analyst"
   ...    Run Keywords

   ...    Wait Until Element Is Visible   ${Admin_Comm_Homepage_Users_Tab_Users_Roles_Tab_Role_Billing_Analyst_checkbox_locator}     timeout=120
   ...    AND     Click Element    ${Admin_Comm_Homepage_Users_Tab_Users_Roles_Tab_Role_Billing_Analyst_checkbox_locator}


   ${Status}=     Run Keyword And Return Status    Element Should be Enabled    ${Admin_Comm_Assign_button_locator}
   IF    '${Status}'=='True'
       Click Element   ${Admin_Comm_Assign_button_locator}
   ELSE
        Click Element   ${Admin_Comm_Unassign_button_locator}
   END


Reset User Role Configuration in Admin page

   [Arguments]    ${Reset_Role}
   Run Keyword If    "${Reset_Role}"=="Record Analyst"
   ...    Run Keywords
   ...    Wait Until Element Is Visible   ${Admin_Comm_Homepage_Users_Tab_Users_Roles_Tab_Role_Record_Analyst_checkbox_locator}     timeout=120
   ...    AND    Click Element    ${Admin_Comm_Homepage_Users_Tab_Users_Roles_Tab_Role_Record_Analyst_checkbox_locator}

   ...    ELSE IF   "${Reset_Role}"=="Billing Analyst"
   ...    Run Keywords
   ...    Wait Until Element Is Visible   ${Admin_Comm_Homepage_Users_Tab_Users_Roles_Tab_Role_Billing_Analyst_checkbox_locator}     timeout=120
   ...    AND     Click Element    ${Admin_Comm_Homepage_Users_Tab_Users_Roles_Tab_Role_Billing_Analyst_checkbox_locator}


   ${Status}=     Run Keyword And Return Status    Element Should be Enabled    ${Admin_Comm_Assign_button_locator}
   IF    '${Status}'=='True'
       Click Element   ${Admin_Comm_Assign_button_locator}
   ELSE
        Click Element   ${Admin_Comm_Unassign_button_locator}
   END


Verify Patient name
        wait until Element is Visible   ${Common_PatientName_Header_Locator_New}      timeout=120
        Element should be Visible   ${Common_PatientName_Header_Locator_New}


Return Patient name locator with patient name passed by user
     [Arguments]   ${data_list[0]['PatientAccountNumber']}
     ${Common_PatientName_Header_Locator_New}=     Replace String      ${Common_PatientName_Header_Locator}   ${PatientName_Header}   ${data_list[0]['PatientAccountNumber']}
     Set Global Variable    ${Common_PatientName_Header_Locator_New}



Click Next Audit Button
     Wait Until Element Is Visible   ${Common_NextAudit_button_Locator}        timeout=120
     Click Element    ${Common_NextAudit_button_Locator}

Click Previous Audit Button
     Wait Until Element Is Visible   ${Common_PreviousAudit_button_Locator}        timeout=120
     Click Element    ${Common_PreviousAudit_button_Locator}

Click Next Request Button
     Wait Until Element Is Visible   ${Common_NextRequest_button_Locator}        timeout=120
     Click Element    ${Common_NextRequest_button_Locator}

Click Previous Request Button
     Wait Until Element Is Visible   ${Common_PreviousRequest_button_Locator}        timeout=120
     Click Element    ${Common_PreviousRequest_button_Locator}


Verify Record Requests tab is selected
     Wait Until Element Is Visible    ${Comm_Portal_HomePage_RecordRequestsTab_Selected_Locator}     timeout=120
     Element Should Be Visible      ${Comm_Portal_HomePage_RecordRequestsTab_Selected_Locator}

Verify Audit Results tab is selected
     Wait Until Element Is Visible    ${Comm_Portal_HomePage_AuditResultsTab_Selected_Locator}    timeout=120
     Element Should Be Visible      ${Comm_Portal_HomePage_AuditResultsTab_Selected_Locator}


#AN

Launch Communication Portal Page Edge Browser
     Set Selenium Implicit Wait    10
     Open Browser     ${comm_url}   ${Browser1}                          timeout=120
     maximize browser window
     Wait Until Keyword Succeeds    10x    2s    Title Should Be    ${comm_LandingPageTitle}
     Element Should Be Visible         ${Comm_Portal_LoginPageTitleHeader_Locator}

#Satheesh

Scroll down to the bottom of Admin Ui page
       Sleep  5
       Execute JavaScript         window.scrollTo(0, document.body.scrollHeight)


Connect to DB to Read the Test Data
    [Arguments]  ${sqlQuery}
    run keyword     DatabaseConnection.readTheDataFromDB     ${sqlQuery}
    ${data_list}    Read_csv.read_csv_file
    Set Global Variable   ${data_list}
    ${testdata_length} =     get length  ${data_list}
    run keyword if   ${testdata_length} < 1     Fail       Test data length is less than 1


Wait Untill Page Loads
      wait until element is not visible         ${RecordAnalyst_Dashboard_PageLoad_RedFlower_Image_Locator}           timeout=120


Connect to DB to Read the Test Data for Payer dashboard
    [Arguments]  ${sqlQuery}
    log     ${sqlQuery}
    ${OderBy}           Set Variable        order by LetterSentDate DESC
    ${AuditNumber}      Set Variable        ${data_list[0]['AuditNumber']}
    ${sqlQueryToExec_temp}=       BuiltIn.Catenate      ${sqlQuery}     ${AuditNumber}
    ${sqlQueryToExec}=       BuiltIn.Catenate      ${sqlQueryToExec_temp}     ${OderBy}
    log     ${sqlQueryToExec}
    run keyword     DatabaseConnection.readTheDataFromDB     ${sqlQueryToExec}
  #  My Method       ${sqlQueryToExec}
    ${Payer_data_list}    Read_csv.read_csv_file
    log      ${Payer_data_list}
    Set Global Variable   ${Payer_data_list}


Connect to DB to Read the Test Data from required Table number
    [Arguments]  ${sqlQuery}    ${TableNumber}
    run keyword     DatabaseConnection.readTheDataFromDBusingTablenumber     ${sqlQuery}    ${TableNumber}
    ${data_list}    Read_csv.read_csv_file
    Set Global Variable   ${data_list}
    ${testdata_length} =     get length  ${data_list}
    run keyword if   ${testdata_length} < 1     Fail       Test data length is less than 1



Connect to DB to Read the Test Data According to TestData Avaialablity
    [Arguments]  ${sqlQuery}
    run keyword     DatabaseConnection.readTheDataFromDBAccordingToDB        ${HMBCBS_DBName}      ${sqlQuery}
    ${data_list}    Read_csv.read_csv_file
    ${testdata_length} =     get length  ${data_list}

    IF    ${testdata_length} > 0
       Set Global Variable   ${data_list}
       ${DBName}      Set Variable      HMBCBS
       Set Global Variable   ${DBName}
       log     ${DBName}
   ELSE IF  ${testdata_length} < 1
        run keyword     DatabaseConnection.readTheDataFromDBAccordingToDB         ${GATEW_DBName}      ${sqlQuery}
        ${data_list}    Read_csv.read_csv_file
        ${testdata_length} =     get length  ${data_list}
        IF  ${testdata_length} > 0
             Set Global Variable   ${data_list}
             ${DBName}      Set Variable       GATEW
             Set Global Variable   ${DBName}
             log     ${DBName}
        END
   END
   IF    ${testdata_length} < 1
        run keyword     DatabaseConnection.readTheDataFromDBAccordingToDB         ${MSCOMM_DBName}      ${sqlQuery}
             ${data_list}    Read_csv.read_csv_file
             ${testdata_length} =     get length  ${data_list}
             IF  ${testdata_length} > 0
                  Set Global Variable   ${data_list}
                  ${DBName}      Set Variable       MSCOMM
                  Set Global Variable   ${DBName}
                  log     ${DBName}
             END
    END
   IF    ${testdata_length} < 1
        run keyword     DatabaseConnection.readTheDataFromDBAccordingToDB         ${MSSTATE_DBName}      ${sqlQuery}
             ${data_list}    Read_csv.read_csv_file
             ${testdata_length} =     get length  ${data_list}
             IF  ${testdata_length} > 0
                  Set Global Variable   ${data_list}
                  ${DBName}      Set Variable       MSSTATE
                  Set Global Variable   ${DBName}
                  log     ${DBName}
             END
   END

    run keyword if   ${testdata_length} < 1     Fail       Test data length is less than 1




Launch Communication Portal Page For Export Audit
    Set Selenium Implicit Wait    10

    Create WebDriver    Chrome    options=

    Go To    ${comm_url}
    Wait Until Keyword Succeeds    10x    2s    Title Should Be    ${comm_LandingPageTitle}
    #Wait Until Element Is Visible     ${Comm_Portal_LoginPageBKgrdImage_Locator}   timeout=120
#    Element Should Be Visible         ${Comm_Portal_LoginPageTitleHeader_Locator}




Read from Excel
     [Arguments]    ${DownloadedExcelPath}
     ${user_home}=    Get Environment Variable    UserProfile
     ${formatted_user_home}=     Replace String        ${user_home}       \\        /
     log         ${user_home}
     ${CurrentTimeStamp}             TestDataFormatter.getCurrentDateAndTime
    ${DownloadedExcel_Path1} =          BuiltIn.Catenate    ${formatted_user_home}     ${DownloadedExcelPath}     ${CurrentTimeStamp}     .xlsx
     ${DownloadedExcel_exactPath} =   Replace String        ${DownloadedExcel_Path1}       ${SPACE}        ${EMPTY}
     sleep      3
     ${downloaded_data_list}        ExcelReader.readFromExcel             ${DownloadedExcel_exactPath}
      set global variable               ${downloaded_data_list}


Connect to DB to Read the Test Data for Outpatient record
    [Arguments]  ${sqlQuery}
    log     ${sqlQuery}
    ${AuditNumber}      Set Variable        ${data_list[0]['AuditNumber']}
    ${sqlQueryToExec}=       BuiltIn.Catenate      ${sqlQuery}     ${AuditNumber}
    log     ${sqlQueryToExec}
    run keyword     DatabaseConnection.readTheDataFromDB     ${sqlQueryToExec}
  #  My Method       ${sqlQueryToExec}
    ${Payer_data_list}    Read_csv.read_csv_file
    log      ${Payer_data_list}
    Set Global Variable   ${Payer_data_list}


Connect to DB for a specific Database
      [Arguments]  ${sqlQuery}      ${DBName}
      ${DBNameNew} =     BuiltIn.Catenate      ${DBName}    _ProviderPortal
      ${DBNameNewFormatted} =     Replace String      ${DBNameNew}    ${SPACE}        ${EMPTY}
      Log to console     ${DBNameNewFormatted}
      run keyword     DatabaseConnection.readTheDataFromDBAccordingToDB        ${DBNameNewFormatted}     ${sqlQuery}
      ${data_list}    Read_csv.read_csv_file
      Set Global Variable   ${data_list}
      ${testdata_length} =     get length  ${data_list}


Connect to DB to Read the Test Data According to TestData Avaialablity To Fetch More than 10 Records
    [Arguments]  ${sqlQuery}
    run keyword     DatabaseConnection.readTheDataFromDBAccordingToDB        ${HMBCBS_DBName}      ${sqlQuery}
    ${data_list}    Read_csv.read_csv_file
    ${testdata_length} =     get length  ${data_list}

    IF    ${testdata_length} > 10
       Set Global Variable   ${data_list}
       ${DBName}      Set Variable      HMBCBS
       Set Global Variable   ${DBName}
       log     ${DBName}
   ELSE IF  ${testdata_length} < 1
        run keyword     DatabaseConnection.readTheDataFromDBAccordingToDB         ${GATEW_DBName}      ${sqlQuery}
        ${data_list}    Read_csv.read_csv_file
        ${testdata_length} =     get length  ${data_list}
        IF  ${testdata_length} > 10
             Set Global Variable   ${data_list}
             ${DBName}      Set Variable       GATEW
             Set Global Variable   ${DBName}
             log     ${DBName}
        END
   END
   IF    ${testdata_length} < 11
        run keyword     DatabaseConnection.readTheDataFromDBAccordingToDB         ${MSCOMM_DBName}      ${sqlQuery}
             ${data_list}    Read_csv.read_csv_file
             ${testdata_length} =     get length  ${data_list}
             IF  ${testdata_length} > 10
                  Set Global Variable   ${data_list}
                  ${DBName}      Set Variable       MSCOMM
                  Set Global Variable   ${DBName}
                  log     ${DBName}
             END
    END
   IF    ${testdata_length} < 11
        run keyword     DatabaseConnection.readTheDataFromDBAccordingToDB         ${MSSTATE_DBName}      ${sqlQuery}
             ${data_list}    Read_csv.read_csv_file
             ${testdata_length} =     get length  ${data_list}
             IF  ${testdata_length} > 10
                  Set Global Variable   ${data_list}
                  ${DBName}      Set Variable       MSSTATE
                  Set Global Variable   ${DBName}
                  log     ${DBName}
             END
   END

    run keyword if   ${testdata_length} < 11     Fail       Test data length is less than 11

Connect to CAS_CAM for a specific Client
      [Arguments]  ${sqlQuery}      ${DBName}
      ${DBNameNew} =     BuiltIn.Catenate      ${DBName}    _CAS_CAM
      ${DBNameNewFormatted} =     Replace String      ${DBNameNew}    ${SPACE}        ${EMPTY}
      Log to console     ${DBNameNewFormatted}
      run keyword     DatabaseConnection.readTheDataFromDBAccordingToClientFromCASCAM        ${DBNameNewFormatted}     ${sqlQuery}
      ${data_list}    Read_csv.read_csv_file
      Set Global Variable   ${data_list}
      ${testdata_length} =     get length  ${data_list}

Launch Cloud Communication Portal Page
    Set Selenium Implicit Wait    10
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --start-maximized
#    Call Method    ${options}    add_argument      disable-web-security
#    Call Method    ${options}    add_argument      allow-running-insecure-content
    Create WebDriver    Chrome   options=${options}
    Go To    ${cloud_comm_url}
    Wait Until Keyword Succeeds    10x    2s    Title Should Be    ${comm_LandingPageTitle}
    #Wait Until Element Is Visible     ${Comm_Portal_LoginPageBKgrdImage_Locator}   timeout=120
#    Element Should Be Visible         ${Comm_Portal_LoginPageTitleHeader_Locator}


Connect to Cloud DB to Read the Test Data According to TestData Avaialablity
    [Arguments]  ${sqlQuery}
    run keyword     DatabaseConnection.readTheDataFromCloudDBAccordingToDB        HMBCBS_CONF      ${sqlQuery}
    ${data_list}    Read_csv.read_csv_file
    ${testdata_length} =     get length  ${data_list}

    IF    ${testdata_length} > 0
       Set Global Variable   ${data_list}
       ${DBName}      Set Variable      HMBCBS
       Set Global Variable   ${DBName}
       log     ${DBName}
#   ELSE IF  ${testdata_length} < 1
#        run keyword     DatabaseConnection.readTheDataFromDBAccordingToDB         ${GATEW_DBName}      ${sqlQuery}
#        ${data_list}    Read_csv.read_csv_file
#        ${testdata_length} =     get length  ${data_list}
#        IF  ${testdata_length} > 0
#             Set Global Variable   ${data_list}
#             ${DBName}      Set Variable       GATEW
#             Set Global Variable   ${DBName}
#             log     ${DBName}
#        END
   END

    run keyword if   ${testdata_length} < 1     Fail       Test data length is less than 1


Connect to Cloud DB for a specific Database
      [Arguments]  ${sqlQuery}      ${DBName}
      IF      '${DBName}=="HMBCBS"'
        run keyword     DatabaseConnection.readTheDataFromDBAccordingToDB        HMBCBS_CONF     ${sqlQuery}
        ${data_list}    Read_csv.read_csv_file
        Set Global Variable   ${data_list}
        ${testdata_length} =     get length  ${data_list}
      ELSE
          Log to console     Unknown DB
      END

Connect to Cloud DB to Read the Test Data According to TestData Avaialablity To Fetch More than 10 Records
    [Arguments]  ${sqlQuery}
    run keyword     DatabaseConnection.readTheDataFromCloudDBAccordingToDB        HMBCBS_CONF      ${sqlQuery}
    ${data_list}    Read_csv.read_csv_file
    ${testdata_length} =     get length  ${data_list}

    IF    ${testdata_length} > 10
       Set Global Variable   ${data_list}
       ${DBName}      Set Variable      HMBCBS
       Set Global Variable   ${DBName}
       log     ${DBName}
   END

    run keyword if   ${testdata_length} < 11     Fail       Test data length is less than 11


Connect to Cloud DB to Read the Test Data for Payer dashboard
    [Arguments]  ${sqlQuery}
    log     ${sqlQuery}
    ${OderBy}           Set Variable        order by LetterSentDate DESC
    ${AuditNumber}      Set Variable        ${data_list[0]['AuditNumber']}
    ${sqlQueryToExec_temp}=       BuiltIn.Catenate      ${sqlQuery}     ${AuditNumber}
    ${sqlQueryToExec}=       BuiltIn.Catenate      ${sqlQueryToExec_temp}     ${OderBy}
    IF      '${DBName}=="HMBCBS"'
        run keyword     DatabaseConnection.readTheDataFromDBAccordingToDB        HMBCBS_CONF     ${sqlQueryToExec}
        ${Payer_data_list}    Read_csv.read_csv_file
        Set Global Variable   ${Payer_data_list}
        ${testdata_length} =     get length  ${data_list}
    ELSE
          Log to console     Unknown DB
    END


Connect to Cloud DB to Read the Test Data for Outpatient record
    [Arguments]  ${sqlQuery}
    log     ${sqlQuery}
    ${AuditNumber}      Set Variable        ${data_list[0]['AuditNumber']}
    ${sqlQueryToExec}=       BuiltIn.Catenate      ${sqlQuery}     ${AuditNumber}
    log     ${sqlQueryToExec}
    IF      '${DBName}=="HMBCBS"'
        run keyword     DatabaseConnection.readTheDataFromDBAccordingToDB        HMBCBS_CONF     ${sqlQueryToExec}
        ${Payer_data_list}    Read_csv.read_csv_file
        Set Global Variable   ${Payer_data_list}
        ${testdata_length} =     get length  ${data_list}
    ELSE
          Log to console     Unknown DB
    END
