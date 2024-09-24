*** Settings ***
Documentation    Script to Test Communication Portal Login Page
Library    SeleniumLibrary
Library    XML
Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//LoginPage_Elements.py
Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//Homepage_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//LoginPage_TestData.yaml



*** Keywords ***


Login Button Not enabled without entering username and password

    Input Text    ${Comm_Portal_LoginPagePassword_Locator}    ${comm_pass_empty}
    Input Text    ${Comm_Portal_LoginPageUsername_Locator}    ${comm_usr_name_empty}
    Click Element    ${Comm_Portal_LoginPagechkUboxPolicyPrivacy_Locator}
    Sleep   5
    Element Should Be Disabled  ${Comm_Portal_LoginPageLoginButton_Locator}

Password Field Encrypted
#Verify password field is encrypted
    Input Password    ${Comm_Portal_LoginPagePassword_Locator}    ${comm_pass}
    ${PasswordType}=    Get Element Attribute     ${Comm_Portal_LoginPagePassword_Locator}    attribute=type
    Log  ${PasswordType}
    Should Be equal as strings    ${PasswordType}    password    Password field is not masked


Visibility eye icon functionality
#Verify visibility eye icon functionality

   Input Password    ${Comm_Portal_LoginPagePassword_Locator}    ${comm_pass}
   Click Element    ${Comm_Portal_LoginPageEyeVisible_Locator}
   ${PasswordType}=    Get Element Attribute     ${Comm_Portal_LoginPagePassword_Locator}    attribute=type
   sleep    10
   Should Be equal as strings    ${PasswordType}    text    Password field is not masked
   Click Element    ${Comm_Portal_LoginPageEyeVisible_Locator}
   ${PasswordType}=    Get Element Attribute     ${Comm_Portal_LoginPagePassword_Locator}    attribute=type
   sleep    10
   Should Be equal as strings    ${PasswordType}    password    Password field is masked


Valid User Login
   [Arguments]    ${comm_usr_name}  ${comm_pass}
   #Verify if a user can login with a valid username and a valid password.
    Input Text    ${Comm_Portal_LoginPagePassword_Locator}    ${comm_pass}
    Input Text    ${Comm_Portal_LoginPageUsername_Locator}    ${comm_usr_name}
    Click Element    ${Comm_Portal_LoginPagechkUboxPolicyPrivacy_Locator}
    Click Button    ${Comm_Portal_LoginPageLoginButton_Locator}
    Wait Until Element Is Visible    ${Comm_Portal_LoginPage_SelectClient_CommPortal_Window}   timeout=120
    sleep   4
    ${c} =  SeleniumLibrary.Get Element Count   ${Comm_Portal_LoginPage_SelectClient_selector_Locator}
    Run Keyword If    ${c} > 0   Select From List By Value    ${Comm_Portal_LoginPage_SelectClient_selector_Locator}      ${Client_Name}
    Wait Until Element Is Visible    ${Comm_Portal_LoginPage_SelectClient_SelectClient_Applybutton_locator}
    Click Element    ${Comm_Portal_LoginPage_SelectClient_SelectClient_Applybutton_locator}
#    ...    AND    Click Element   ${Comm_Portal_LoginPage_SelectClient_SelectClient_Applybutton_locator}


Invalid User login
   #Verify if a user will not be able to login with a valid username and invalid password.

    Input Text    ${Comm_Portal_LoginPagePassword_Locator}    ${comm_pass_invalid}
    Input Text    ${Comm_Portal_LoginPageUsername_Locator}   ${comm_usr_name}
    Click Element    ${Comm_Portal_LoginPagechkUboxPolicyPrivacy_Locator}
    Click Button    ${Comm_Portal_LoginPageLoginButton_Locator}
    Wait Until Element Is Visible    ${Comm_Portal_LoginUnsuccessful_Locator}
    Element Should Be Visible    ${Comm_Portal_LoginUnsuccessful_Locator}


Close Login Portal Unsuccessful popup
    Wait Until Element Is Visible    ${Comm_Portal_LoginUnsuccessful_Close_Locator}
    Click Button   ${Comm_Portal_LoginUnsuccessful_Close_Locator}

Verify dashboard icon and dashboards are visible on sucessful login

     Wait Until Element Is Visible    ${Comm_Portal_HomePage_DashbrdIcon_Locator}
     Element Should Be Visible    ${Comm_Portal_HomePage_DashbrdIcon_Locator}
     Wait Until Element Is Visible    ${Comm_Portal_HomePage_AuditResultsTab_Locator}    timeout=120
     Element Should Be Visible    ${Comm_Portal_HomePage_AuditResultsTab_Locator}
     Wait Until Element Is Visible     ${Comm_Portal_HomePage_RecordRequestsTab_Locator}    timeout=120
     Element Should Be Visible     ${Comm_Portal_HomePage_RecordRequestsTab_Locator}

Validate Portal Login Unsuccessful Message
     Wait Until Element Is Visible    ${Comm_Portal_LoginUnsuccessfulMsg_Locator}
     ${Login_Unscfu_msg_Actual}=    Get Text    ${Comm_Portal_LoginUnsuccessfulMsg_Locator}
     Should Contain    ${Login_Unscfu_msg_Actual}    The portal login attempt was unsuccessful. Please verify your credentials
     Should Contain    ${Login_Unscfu_msg_Actual}    are correct and try again. You may also try the 'Reset Password?' link to
     Should Contain    ${Login_Unscfu_msg_Actual}    reset your password. If you still cannot login after several attempts and
     Should Contain    ${Login_Unscfu_msg_Actual}    a password reset, please contact the CGI Portal helpdesk.


Verify Payer Dashboard is visible
      Wait Until Element Is Visible    ${Comm_Portal_Homepage_PayerDashboard_ViewClaims_Button_Locator}    timeout=120
      Element Should Be Visible    ${Comm_Portal_Homepage_PayerDashboard_ViewClaims_Button_Locator}

Verify RA Dashboard is visible
      Wait Until Element Is Visible    ${Comm_Portal_HomePage_RecordRequestsTab_Locator}       timeout=160
      Element Should Be Visible     ${Comm_Portal_HomePage_RecordRequestsTab_Locator}

Verify BA Dashboard is visible
      Wait Until Element Is Visible    ${Comm_Portal_HomePage_AuditResultsTab_Locator}    timeout=120
      Element Should Be Visible     ${Comm_Portal_HomePage_AuditResultsTab_Locator}

Verify Payer Dashboard is not visible
      Element Should Not Be Visible    ${Comm_Portal_Homepage_PayerDashboard_ViewClaims_Button_Locator}

Verify RA Dashboard is not visible
      Element Should Not Be Visible    ${Comm_Portal_HomePage_RecordRequestsTab_Locator}

Verify BA Dashboard is not visible
      Element Should Not Be Visible     ${Comm_Portal_HomePage_AuditResultsTab_Locator}



Login to Outlook
    Sleep    20
    Execute Javascript    window.open('')
    Get Window Titles
    Switch Window  title=undefined
    Go To  ${OutLook_URL}
    Wait Until Keyword Succeeds    2x    10s    Title Should Be    ${OutLook_Page_Title}
    Maximize Browser Window
    Wait Until Element Is Visible    ${Outlook_logo_locator}
    Input Text     ${Outlook_userId_Locator}    ${Outllok_userID}
    Input Text     ${Outlook_Password_Locator}    ${Outllok_Password}
    Click Element   ${Outlook_signIn_Locator}
    ${c} =  Get Element Count   ${OutLook_timezone_selector_Locator}
    Run Keyword If    ${c} > 0   Select From List By Value    ${OutLook_timezone_selector_Locator}   India Standard Time
    ...    AND    Click Element   ${Outlook_save_locator}

Click Reset password link
    Wait Until Element Is Visible    ${Comm_Portal_LoginPage_ResetpasswordLink_locator}
    Click Element   ${Comm_Portal_LoginPage_ResetpasswordLink_locator}

Enter email and click send request button
   Wait Until Element Is Visible    ${Comm_Portal_LoginPage_ResetpasswordWindow_locator}
   Input Text     ${Comm_Portal_LoginPage_ResetpasswordWindow_emailfield_locator}    ${Outllok_userID}
   Double Click Element    ${Comm_Portal_LoginPage_ResetpasswordWindow_SendRequest_button_locator}


Validate Create New Password Message
         Execute Javascript     ("document.body.style.zoom='80%'")
         Sleep    5
         Wait Until Element Is Visible    ${Comm_Portal_LoginPage_CreateNewPasswordWindow_Message_locator}
         ${Comm_Portal_CreateNewPassword_msg_Actual}=    Get Text    ${Comm_Portal_LoginPage_CreateNewPasswordWindow_Message_locator}
         Should Contain    ${Comm_Portal_CreateNewPassword_msg_Actual}    Set your new password following below requirements.
         Should Contain    ${Comm_Portal_CreateNewPassword_msg_Actual}   • At least 6 characters long
         Should Contain    ${Comm_Portal_CreateNewPassword_msg_Actual}    • At least one of the following: uppercase, lowercase, digit, special
         Should Contain    ${Comm_Portal_CreateNewPassword_msg_Actual}    characters.
         Should Contain    ${Comm_Portal_CreateNewPassword_msg_Actual}    • The allowed special characters are ~ ! @ # $ % ^ * - _ = + [ { ] } / ; : , . ?

Validate Password reset Sucess Message
#         Wait Until Element Is Visible    ${Comm_Portal_LoginPage_PasswordReset_SucessMessage_locator}
#     ${Comm_Portal_PasswordReset_Sucessmsg_Actual}=    Get Text    ${Comm_Portal_LoginPage_PasswordReset_SucessMessage_locator}
#     Should Contain    ${Comm_Portal_PasswordReset_Sucessmsg_Actual}    Success
#     Should Contain    ${Comm_Portal_PasswordReset_Sucessmsg_Actual}    Password Reset done successfully. Please Login to Portal with
#     Should Contain    ${Comm_Portal_PasswordReset_Sucessmsg_Actual}    username and new Password.
#

        Wait Until Element IS visible               ${Comm_Portal_LoginPage_PasswordReset_SucessMessage_Title_locator}         timeout=120
       	${Comm_Portal_LoginPage_PasswordReset_SucessMessage_Title_locator}=      Get Text              ${Comm_Portal_LoginPage_PasswordReset_SucessMessage_Title_locator}
        Log     	${Comm_Portal_LoginPage_PasswordReset_SucessMessage_Title_locator}
        Should Contain             ${Comm_Portal_LoginPage_PasswordReset_SucessMessage_Title_locator}       Success
	    Wait Until Element IS visible          ${Comm_Portal_LoginPage_PasswordReset_SucessMessage_Body_locator}         timeout=120
       	${Comm_Portal_LoginPage_PasswordReset_SucessMessage_Body_locator}=      Get Text              ${Comm_Portal_LoginPage_PasswordReset_SucessMessage_Body_locator}
        Log      ${Comm_Portal_LoginPage_PasswordReset_SucessMessage_Body_locator}
        Should Contain          ${Comm_Portal_LoginPage_PasswordReset_SucessMessage_Body_locator}    Password Reset done successfully. Please Login to Portal with username and new Password.

click on the password reset code email

  Wait Until Element Is Visible    ${Outlook_email_Password_reset_code_email_locator}   timeout=120
  Click Element   ${Outlook_email_Password_reset_code_email_locator}

Fetch password reset code from email
  Wait Until Element Is Visible    ${Outlook_email_Password_reset_code_locator}  timeout=120
  ${Code}=    Get Text    ${Outlook_email_Password_reset_code_locator}
  Set Global Variable  ${Code}


Enter Reset code and click validate

   Switch Window  title:${comm_LandingPageTitle}
   Wait Until Element Is Visible    ${Comm_Portal_LoginPage_ResetPasswordWindow_locator}
   Input Text   ${Comm_Portal_LoginPage_ResetPasswordWindow_Code_textbox_locator}     ${Code}
   Click Button    ${Comm_Portal_LoginPage_ResetPasswordWindow_Validate_button_locator}


Create new password and click submit

     Wait Until Element Is Visible    ${Comm_Portal_LoginPage_CreateNewPasswordWindow_locator}
     Input Text        ${Comm_Portal_LoginPage_CreateNewPasswordWindow_Password_textfield_locator}           ${NewPassword}
     Sleep  5
     Input Text     ${Comm_Portal_LoginPage_CreateNewPasswordWindow_ConfirmPassword_textfield_locator}        ${NewPassword}
     Click Button    ${Comm_Portal_LoginPage_CreateNewPasswordWindow_Submit_button_locator}

Click Sign Up Now link and validate the message
     Wait Until Element Is Visible   ${Comm_Portal_LoginPage_SignUpNow_Link_Locator}
     Click Element     ${Comm_Portal_LoginPage_SignUpNow_Link_Locator}
     Wait Until Element Is Visible    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Locator}
     Element Should Be Visible     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Locator}
     ${Comm_Portal_SignUpNow_Site_Administrator_Registration_msg_Actual}=    Get Text    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_message_Locator}
     Should Contain    ${Comm_Portal_SignUpNow_Site_Administrator_Registration_msg_Actual}      You will be designated as the CGI Communications Portal's Site Admin (Security Officer).
     Should Contain    ${Comm_Portal_SignUpNow_Site_Administrator_Registration_msg_Actual}      A Site Administrator is the primary contact between your site/office and CGI. Site Administrators are responsible for adding and deactivating users in the portal, as well as setting user Roles. If you are not the appropriate person in your office to be the Site Administrator, please ask that person to register.
     Should Contain    ${Comm_Portal_SignUpNow_Site_Administrator_Registration_msg_Actual}      The following are a summary of responsibilities for a Portal Site Administrator:
     Should Contain    ${Comm_Portal_SignUpNow_Site_Administrator_Registration_msg_Actual}      Educating users not to share passwords with anyone, even among Licensee Authorized Users.
     Should Contain    ${Comm_Portal_SignUpNow_Site_Administrator_Registration_msg_Actual}      Adding or terminating the access of any Licensee Authorized Users to the Portal Services
     Should Contain    ${Comm_Portal_SignUpNow_Site_Administrator_Registration_msg_Actual}      Managing the access of any Licensee Authorized Users to the Portal Services by granting or
     Should Contain    ${Comm_Portal_SignUpNow_Site_Administrator_Registration_msg_Actual}      denying access to specific functions of the Portal Services.
     Should Contain    ${Comm_Portal_SignUpNow_Site_Administrator_Registration_msg_Actual}      Ensuring that information accessed via the Portal is only used for legitimate business purposes.
     Should Contain    ${Comm_Portal_SignUpNow_Site_Administrator_Registration_msg_Actual}      To learn more about the Site Administrator's role and responsibilities, view the  Site Administrator Agreement
     Should Contain    ${Comm_Portal_SignUpNow_Site_Administrator_Registration_msg_Actual}      I certify that I am the appropriate, authorized person for my facility.



Check certifed person checkbox and click on Continue Registration button and verify registarion page is displayed
    Wait Until Element Is Visible    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_certifiedPerson_Checkbox_Locator}
    Click Element    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_certifiedPerson_Checkbox_Locator}
    Wait Until Element Is Visible    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_ContinueReg_button_Locator}
    Click Element    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_ContinueReg_button_Locator}
     Wait Until Element Is Visible    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfield_firstname_Locator}
     Element Should Be Visible     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfield_firstname_Locator}


#Click on click here link of Site Administrator Registration page and validate dialouge window message
#
#      Wait Until Element Is Visible    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_click_here_link_Locator}
#      Click Element    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_click_here_link_Locator}
#      Element Should Be Visible     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_click here_dialogue_window_Locator}
#      ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_click here_dialogue_window_Locator_msg_Actual}=    Get Text    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_click_here_dialogue_window_Locator}
#      Should Contain    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_click here_dialogue_window_Locator_msg_Actual}     A Site Administrator is the primary contact between your
#      Should Contain    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_click here_dialogue_window_Locator_msg_Actual}     site/office and CGI. Site Administrators are responsible for adding and deactivating users in the portal,
#      Should Contain    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_click here_dialogue_window_Locator_msg_Actual}    as well as setting user Roles. If you are not the appropriate person in your office to be the Site
#      Should Contain    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_click here_dialogue_window_Locator_msg_Actual}    Administrator, please ask that person to register.


#Click on Continue link of Site Administrator Registration page
#     Wait Until Element Is Visible    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_Continue_link_Locator}
#     Click Element    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_Continue_link_Locator}
#     Wait Until Element Is Visible    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfield_firstname_Locator}
#     Element Should Be Visible     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfield_firstname_Locator}


Verify registration form is displayed with the Submit button disbaled
     Element Should Be Visible     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfield_firstname_Locator}
     Element Should Be Visible     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfield_lastname_Locator}
     Element Should Be Visible     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfield_Title_Locator}
     Element Should Be Visible     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfield_email_Locator}
#     Element Should Be Visible     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfield_PrvdrFacName_Locator}
#     Element Should Be Visible     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfield_PrvdrFacPhone_Locator}
#     Element Should Be Visible     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfield_PrvdrNum_Locator}
     #Element Should Be Enabled     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_radio_PaperLessOption_Locator}
     #Element Should Be Enabled    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_radio_PaperLessOptionNo_Locator}
     #Element Should Be Visible     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfiled_MedicalRecordEmails_Locator}
#    Element Should Be Visible     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfiled_AuditFindingEmails_Locator}
     Element Should Be Disabled    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_button_submit_Locator}



Enter all the non mandatory fields and verify that the submit button is not enabled
    Input Text   ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfield_Title_Locator}     ${NewReg_Title}
    Click Element    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_radio_PaperLessOptionYes_Locator}
    #Input Text   ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfiled_MedicalRecordEmails_Locator}     ${NewReg_MedicalRecordEmails}
    #Input Text   ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfiled_AuditFindingEmails_Locator}     ${NewReg_AuditFindingEmails_Locator}
    Element Should Be Disabled    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_button_submit_Locator}
    
Enter all the mandatory fields and verify that the submit button is enabled
    Input Text   ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfield_firstname_Locator}     ${NewReg_FirstName}
    Input Text   ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfield_lastname_Locator}     ${NewReg_LastName}
    Input Text   ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfield_email_Locator}     ${NewReg_Email}
  #  Input Text   ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfield_Comment_Locator}    ${NewReg_Comment}
    Input Text   ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_ProviderScreening_Number_Textfield_Locator}             ${Provider_NPI_Number}
    Scroll down to the cancel button
    sleep      30
    Select From List By Value      ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Payer_Dropdown_Locator}                 ${Client}       timeout=60
    Click Element                   ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_LookUpClaim_Button_Locator}
#    Input Text   ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfield_client_Locator}     ${NewReg_Client}
#    Input Text   ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfield_PrvdrFacName_Locator}     ${NewReg_PrvdrFacName}
#   Input Text   ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfield_PrvdrFacPhone_Locator}     ${NewReg_PrvdrFacPhone}
  Input Text   ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfield_PrvdrNum_Locator}     ${NewReg_PrvdrNum}
    Wait Until Element Is Visible    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_SiteAdministratorAgreement_checkbox_Locator}
   Click Element    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_SiteAdministratorAgreement_checkbox_Locator}
   Element Should Be Enabled    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_button_submit_Locator}
#

Click submit button and Verify REGISTRATION CONFIRMATION window is displayed with buttons

     Click Button   ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_button_submit_Locator}
     Wait Until Element Is Visible    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_window_RegConfirm_Locator}    timeout=120
     Element Should Be Visible    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_window_RegConfirm_Locator}
     Element Should Be Visible    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Button_Yes_RegConfirm_Locator}
     Element Should Be Visible    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Button_No_RegConfirm_Locator}

Click on No and verify REGISTRATION CONFIRMATION window is closed
     Wait Until Element Is Visible    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Button_No_RegConfirm_Locator}
     Click Button   ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Button_No_RegConfirm_Locator}
     Element Should Not Be Visible     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_window_RegConfirm_Locator}
     Element Should Be Visible    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Locator}

Click on the Submit and click on the button Yes and Verify REGISTRATION SUCCESSFUL window is diaplyed with the message
     Click Button   ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_button_submit_Locator}
     Wait Until Element Is Visible    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_window_RegConfirm_Locator}     timeout=120
     Element Should Be Visible    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_window_RegConfirm_Locator}
     Wait Until Element Is Visible    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Button_Yes_RegConfirm_Locator}  timeout=120
     Click Button    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Button_Yes_RegConfirm_Locator}
     Wait Until Element Is Visible    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Window_RegSucessful_Locator}    timeout=120
     Element Should Be Visible    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Window_RegSucessful_Locator}
     Wait Until Element Is Visible    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_RegSucessfulWindow_message_Locator}    timeout=120
     ${SignUpNow_RegSucessful_msg_Actual}=    Get Text    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_RegSucessfulWindow_message_Locator}
     Should Contain    ${SignUpNow_RegSucessful_msg_Actual}    Your information is being reviewed by our portal helpdesk.
     Should Contain    ${SignUpNow_RegSucessful_msg_Actual}    And you will be notified when the registration is complete.

#AN

Click on SignupNow and Click on Continue link
        Wait Until Element Is Visible   ${Comm_Portal_LoginPage_SignUpNow_Link_Locator}         timeout=120
        Click Element     ${Comm_Portal_LoginPage_SignUpNow_Link_Locator}
        Element Should Be Visible     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Locator}
        ${Comm_Portal_SignUpNow_Site_Administrator_Registration_msg_Actual}=    Get Text   ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_message_Locator}
        Wait Until Element Is Visible    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_Continue_link_Locator}
        Click Element    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_Continue_link_Locator}

Scroll down PAPERLESS OPTION Site Administrator Registration
     Scroll Element Into View            ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_radio_PaperLessOptionYes_Locator}
     Wait Until Element Is Visible      ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_radio_PaperLessOptionYes_Locator}

Scroll down to the bottom of CGI Communications Portal - Site Administrator Registration
     sleep  5
     Scroll Element Into View            ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_button_Cancel_Locator}
     Wait Until Element Is Visible      ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_button_Cancel_Locator}


Verify tooltip message for Email Address
          Wait Until Element IS visible    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfield_email_Locator}  timeout=120
          Click Element                    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfield_email_Locator}
          ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Emailadress_Note_MessageLocator}=      Get Text              ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Emailadress_Note_MessageLocator}
          Should Contain             ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Emailadress_Note_MessageLocator}     NOTE: THIS EMAIL ADDRESS SHOULD BE YOUR FACILITY/WORK EMAIL ADDRESS AND WILL
          Should Contain             ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Emailadress_Note_MessageLocator}     BECOME YOUR USERNAME FOR PORTAL LOGIN. YOUR USERNAME AND PASSWORD, TWO FACTOR
          Should Contain             ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Emailadress_Note_MessageLocator}     AUTHENTICATION CODE, AND PORTAL ADMINISTRATION EMAILS WILL BE SENT TO THE GIVEN EMAIL ADDRESS.

Verify tooltip message and Note for Provider Number
          Wait Until Element IS visible    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfield_PrvdrNum_Locator}
          Click Element                    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfield_PrvdrNum_Locator}
          ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_ProviderNumber_ToolTip_Message_HeaderLocator}=      Get Text              ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_ProviderNumber_ToolTip_Message_HeaderLocator}
          Should Contain             ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_ProviderNumber_ToolTip_Message_HeaderLocator}           Multiple provider number may be added by separating each number with a Comma (,)
          ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_ProviderNumber_ToolTip_Message_BodyLocator}=     Get Text              ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_ProviderNumber_ToolTip_Message_BodyLocator}
          Should Contain             ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_ProviderNumber_ToolTip_Message_BodyLocator}             Please locate Provider Number on the top right corner of CGI letters sent to the Provider.
          Wait Until Element IS visible                     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_ProviderNumber_Note_MessageLocator}
          ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_ProviderNumber_Note_MessageLocator}=     Get Text                         ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_ProviderNumber_Note_MessageLocator}
          Should Contain           ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_ProviderNumber_Note_MessageLocator}           NOTE: PLEASE ENTER THE PROVIDER NUMBER ASSOCIATED WITH THE PAYER. THIS IS THE NUMBER WHICH IDENTIFIES
          Should Contain           ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_ProviderNumber_Note_MessageLocator}           YOU AND YOUR FACILITY AS PART OF THE SUBMITTED HEALTHCARE CLAIMS

#Verify tooltip message for CONTACT EMAILS TO RECEIVE MEDICAL RECORD REQUESTS FROM CGI
#          Wait Until Element IS visible    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfiled_MedicalRecordEmails_Locator}   timeout=120
#          Click Element                    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfiled_MedicalRecordEmails_Locator}
#          ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_MedicalRecord_ToolTip_Message_HeaderLocator}=      Get Text              ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_MedicalRecord_ToolTip_Message_HeaderLocator}
#          Should Contain                    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_MedicalRecord_ToolTip_Message_HeaderLocator}    Multiple email addresses may be added by separating each address with a Semicolon (;)
#          ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_MedicalRecord_ToolTip_Message_BodyLocator} =        Get Text           ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_MedicalRecord_ToolTip_Message_BodyLocator}
#          should Contain                    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_MedicalRecord_ToolTip_Message_BodyLocator}       Please enter the work email address of either individuals or group emails that should receive Medical Record Requests from CGI.
#          should Contain                    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_MedicalRecord_ToolTip_Message_BodyLocator}        Emails do not include PHI, but are sent in lieu of letters to inform the Provider when medical record requests are posted on the Communications Portal
#          should Contain                    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_MedicalRecord_ToolTip_Message_BodyLocator}        Please note: Once access to the portal is granted, you are able to add/remove contact emails as needed, and invite users from your site to access the portal.
#
#
#Verify tooltip message for CONTACT EMAILS TO AUDIT FINDINGS/APPEAL DECISIONS FROM CGI
#          Wait Until Element IS visible    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfiled_AuditFindingEmails_Locator}   timeout=120
#          Click Element                    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_Textfiled_AuditFindingEmails_Locator}
#          ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_AuditFindingEmails_ToolTip_Message_HeaderLocator}=      Get Text              ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_AuditFindingEmails_ToolTip_Message_HeaderLocator}
#          Should Contain                    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_AuditFindingEmails_ToolTip_Message_HeaderLocator}      Multiple email addresses may be added by separating each address with a Semicolon (;)
#          ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_AuditFindingEmails_ToolTip_Message_BodyLocator} =        Get Text             ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_AuditFindingEmails_ToolTip_Message_BodyLocator}
#          should Contain                    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_AuditFindingEmails_ToolTip_Message_BodyLocator}       Please enter the work email address of either individuals or group emails that should receive Audit Findings or Appeal Decisions from CGI
#          should Contain                    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_AuditFindingEmails_ToolTip_Message_BodyLocator}        Emails do not include PHI, but are sent in lieu of letters to inform the Provider when medical record requests are posted on the Communications Portal
#          should Contain                    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_AuditFindingEmails_ToolTip_Message_BodyLocator}        Please note: Once access to the portal is granted, you are able to add/remove contact emails as needed, and invite users from your site to access the portal.

#Satheesh

Checkbox validation for End User Policy & Privacy Notice
     Click Element    ${Comm_Portal_LoginPagechkUboxPolicyPrivacy_Locator}
     Checkbox should be Selected    ${Comm_Portal_LoginPagechkUboxPolicyPrivacy_Locator}
     Click Element    ${Comm_Portal_LoginPagechkUboxPolicyPrivacy_Locator}
     Checkbox should not be Selected    ${Comm_Portal_LoginPagechkUboxPolicyPrivacy_Locator}

Click End User Policy & Privacy Notice and validate the message
     Wait Until Element Is Visible   ${Comm_Portal_LoginPage_End_User_Policy_and_Privacy_Notice_Link_Locator}
     Click Element     ${Comm_Portal_LoginPage_End_User_Policy_and_Privacy_Notice_Link_Locator}
     Wait Until Element Is Visible    ${Comm_Portal_LoginPage_End_User_Policy_and_Privacy_Notice_Header_page_Locator}
     Element Should Be Visible     ${Comm_Portal_LoginPage_End_User_Policy_and_Privacy_Notice_Header_page_Locator}
     ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}=    Get Text    ${Comm_Portal_LoginPage_SignUpNow_End_User_Policy_and_Privacy_Notice_page_message_Locator}
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         PLEASE READ THE TERMS AND CONDITIONS OF THIS AGREEMENT CAREFULLY. THESE TERMS AND CONDITIONS ARE A BINDING LEGAL AGREEMENT BETWEEN YOU AND CGI. BY CONTINUING TO USE THE PROPERPAY PORTAL, YOU AGREE TO THE FOLLOWING TERMS. IF YOU DO NOT AGREE TO BE BOUND BY THESE TERMS AND CONDITIONS, DO NOT USE THE PORTAL.
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         This ProperPay Portal Use Agreement (the "Agreement") is entered into by CGI Technologies and Solutions Inc. ("CGI”) and the healthcare provider or healthcare payor ("Licensee" or “you”). This Agreement governs use of the ProperPay platform and services as such services are made available on the ProperPay portal (collectively "Portal Services"), used by Licensee , and all user guides, operating manuals, functional specifications, materials and information relating to any Portal Service that CGI may make available (“Documentation”).
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         ACCEPTANCE OF AGREEMENT
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         You consent to allow CGI to communicate with you electronically regarding the Portal Services or as otherwise specified in this Agreement by using the Portal Services. CGI may at any time, at its sole discretion, update and revise this Agreement by posting an amended Agreement. Any changes to this Agreement will be effective immediately upon posting on the Portal. Please check here periodically for changes to the Agreement. Use of the Portal Services by Licensee or any Licensee Authorized User (as defined below) following the posting any changes on the Portal Services constitutes acceptance of those changes
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         AUTHORIZED USERS
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         CGI has been engaged or otherwise authorized by subscribers (each, a "ProperPay Subscriber") to make the Portal Services available to you and your Licensee Authorized Users (as defined below) to facilitate the exchange of health care information for payment and other healthcare administrative and operational purposes. You are being given access to the Portal Services either because you are (i) a ProperPay Subscriber, a healthcare provider or a healthcare payor or (ii) an employee or agent authorized by such person or entity to access the Portal Services (a "Licensee Authorized User").
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         When you accept this Agreement, you agree to provide for the secure exchange of healthcare and other information electronically through identity management and authentication. Licensee further agrees that it is responsible for providing current, accurate and complete information regarding Licensee and the identifying information of any Licensee Authorized Users allowed to access the Portal Services and Documentation on behalf of Licensee. Each Licensee Authorized User accessing the Portal Services on behalf of Licensee represents that Licensee has authorized such person to access and use the Portal Services and Documentation on Licensee's behalf.
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         Each Licensee Authorized User agrees that the provision of a username and password ("Login Information") is their signature and authorization for CGI to authorize a Licensee Authorized User to access the Portal Services and Documentation. Each Licensee Authorized User represents that each such Licensee Authorized User is a natural person who is acting as an employee, owner, director, officer, or contractor of a company, partnership, sole proprietorship, non-profit, or government agency and all of Licensee Authorized User’s communications or transactions with CGI occur solely within the context of CGI conducting due diligence regarding or providing or receiving a product or service.
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         You acknowledge that Licensee Authorized Users may submit personal information (including personally-identifiable information) through the Portal Services ("Personal Information") and that CGI may disclose or release such Personal Information:
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         (i) to Licensee, other Licensees and ProperPay Subscribers, as well as CGI's service providers, and their respective employees, distributors and agents, in the provision or operation of the Portal Services;
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         (ii) to a party or parties that acquire assets of CGI relating to a particular Portal Service (whether by merger, acquisition or other similar transaction),
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         (iii) to suggest personally relevant features, offer you customized content, invite you to participate in research activities such as surveys and focus groups, inform you about changes, improvements or additions to the Portal Services that CGI offers, and
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         (iv) for other purposes allowed under applicable law. For example, CGI may contact Licensee Authorized Users regarding account status and other matters relevant to the Portal Services and/or the information collected. CGI may also use Licensee Authorized Users' Personal Information for the purpose of improving the operation of the Portal Service.
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         In addition, CGI may collect, use, or retain information that is not Personal Information to the extent permitted by law. For example, CGI may collect, compile, and utilize aggregate statistical information about Licensee Authorized Users and/or Licensee, as well as usage data, for product improvement and other purposes. Note that Personal Information does not include: publicly available information from government records; deidentified or aggregated consumer information; health or medical information covered by the Health Insurance Portability and Accountability Act of 1996 (“HIPAA”) and the California Confidentiality of Medical Information Act (“CMIA”) or clinical trial data; or personal information covered by certain sector-specific privacy laws, including the Fair Credit Reporting Act (“FCRA”), the Gramm-Leach-Bliley Act (“GLBA”) or California Financial Information Privacy Act (“FIPA”), and the Driver's Privacy Protection Act of 1994. Residents of states with privacy laws containing individual privacy rights may have additional personal information rights and choices including but not limited to California, Colorado, Connecticut,  Virginia and Utah.
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         GENERAL RESPONSIBILITIES
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         Licensee is responsible for implementing and maintaining the quality and security procedures to be followed by Licensee Authorized Users using the Portal Services. Licensee will ensure that Licensee Authorized Users follow appropriate procedures to safeguard the security of Licensee's hardware, software and information. Licensee is responsible for ensuring the Licensee Authorized Users’ compliance with the terms of this Agreement. Licensee is responsible for adequate protection, security and backup of data and/or equipment used in connection with the Portal Services. Accordingly,
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         Licensee agrees to indemnify and hold harmless CGI and affiliates from and against any and all claims, demands, actions, losses, damages, costs and expenses, including reasonable attorney's fees, arising from or relating to use of the Portal Services or Documentation, violation or alleged violations of this Agreement, or violation or alleged violation of any rights of another by Licensee, any unauthorized user, or any employee, officer, director or affiliate of Licensee which accesses the Portal Services or Documentation.
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         USER CONDUCT
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         Neither Licensee nor any Licensee Authorized User may access or use the Portal Services or Documentation in any unlawful manner or for any unlawful purpose or in violation of this Agreement or applicable laws, rules and regulations. Licensee agrees that it and Licensee Authorized Users will only access and use the Portal Services and Documentation solely for Licensee's internal business purposes, consistent with this Agreement.
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         Licensee shall not, and shall not permit any Licensee Authorized User to, post, upload or otherwise transfer to or via servers or communication lines by any means, including but not limited to web page content, linked web pages, e-mail or FTP, anything which (i) is obscene or constitutes child pornography under applicable law, (ii) is defamatory, (iii) contains any computer code that disrupts, disables, harms or otherwise impedes the operation of any Portal Service or any associated data, software, firmware, hardware, computer or network (sometimes referred to as "viruses" or "worms"), or (iv) is commercial or promotional in nature. Licensee is solely responsible for all usage of the Portal Services and Documentation through Licensee's account and all related fees and any fees associated with use of other services accessed through the Portal Services on Licensee's account, whether or not authorized by Licensee.
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         Licensee will not permit any other individuals to use the Portal Services or Documentation unless they are Licensee Authorized Users. Licensee agrees not to, and not to permit any Licensee Authorized User to,
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         (a) reproduce, duplicate, copy, sell, trade, resell, or exploit for any commercial purposes any portion of the Portal Services or Documentation (including Login Information), use of the Portal Services or Documentation, or access to the Portal Services or Documentation and
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         (b) collect any information about any Portal Service users or otherwise use any information obtained from the Portal Services in order to contact, advertise to, solicit or sell to any user;
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         (c) compile or collect any content, data or materials from the Portal Services or Documentation as part of a database or other work or composition, including, without limitation, use of any robot, spider, crawler, site search/retrieval application or other manual or automatic device or process to retrieve, index, “data mine”, harvest, scrape or in any way reproduce or circumvent the data, navigational structure or presentation of the Portal Services or Documentation;
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         (d) interfere with, disrupt, create an undue burden on or otherwise impair the Portal Services, the networks or services connected to the Portal Services or any other party’s use of the Portal Services, including, without limitation, any attempt to circumvent the access controls or security measures of the Portal Services; or
     Should Contain    ${Comm_Portal_End_User_Policy_and_Privacy_Notice_msg_Actual}         (e) “frame” or “mirror” any part of the Portal Services without CGI’s prior written authorization.
     Click Element     ${Comm_Portal_LoginPage_End_User_Policy_and_Privacy_Notice_close_Popup_Locator}

Click CGI Cookie Policy and validate the message
     Click Element      ${Comm_Portal_LoginPage_CGI_Cookie_Policy_Link_Locator}
#     ${new_window_identifer}=     Get window identifiers
#    Switch window       ${new_window_identifer[2]}
     Switch Window      new
     Wait Until Element Is Visible     ${Comm_Portal_LoginPage_CGI_Cookie_Policy_popup_Locator}        timeout=60
     Element Should Be Visible         ${Comm_Portal_LoginPage_CGI_Cookie_Policy_popup_Locator}
     ${Comm_Portal_CGI_Cookie_Policy_Notice_msg_Actual}=    Get Text    ${Comm_Portal_LoginPage_CGI_Cookie_Policy_Notice_page_message_Locator}
     Should Contain     ${Comm_Portal_CGI_Cookie_Policy_Notice_msg_Actual}                  Cookie consent
     Should Contain     ${Comm_Portal_CGI_Cookie_Policy_Notice_msg_Actual}                  Cookies are small text files sent to your device through your web browser to enable our systems to recognize your device.
     Should Contain     ${Comm_Portal_CGI_Cookie_Policy_Notice_msg_Actual}                  Our website uses strictly necessary cookies to ensure basic functionality, enhance security, and enable core features of our website.
     Should Contain     ${Comm_Portal_CGI_Cookie_Policy_Notice_msg_Actual}                  These cookies are set by default and do not require your consent. However, disabling these cookies may impact your user experience.
     Should Contain     ${Comm_Portal_CGI_Cookie_Policy_Notice_msg_Actual}                  Accept all cookies
     Should Contain     ${Comm_Portal_CGI_Cookie_Policy_Notice_msg_Actual}                  Decline all cookies
     Should Contain     ${Comm_Portal_CGI_Cookie_Policy_Notice_msg_Actual}                  Customize cookies
     click button       ${Comm_Portal_LoginPage_CGI_Cookie_Policy_AcceptAllCookies_Button_Locator}
     Wait Until Element Is Visible     ${Comm_Portal_LoginPage_CGI_Cookie_Policy_Title_Locator}
     Element Should Be Visible         ${Comm_Portal_LoginPage_CGI_Cookie_Policy_Title_Locator}

Click Site Administrator Agreement and validate the message
     Click Element      ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Agreement_Link_Locator}
     Wait Until Element Is Visible     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Agreement_Window_Header_Locator}
     Element Should Be Visible         ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Agreement_Window_Header_Locator}
     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Agreement_Window_page_msg_Actual}=    Get Text    ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Agreement_Window_page_message_Locator}
     Should Contain     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Agreement_Window_page_msg_Actual}                  LICENSEE DESIGNATED SITE ADMINISTRATOR
     Should Contain     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Agreement_Window_page_msg_Actual}                  Licensee is required to designate one Licensee Authorized User as a security officer (the "Licensee Designated Site Administrator") and to ensure that the Licensee Designated Site Administrator complies with the obligations under this Agreement. The Licensee Designated Site Administrator serves as Licensee's primary contact with CGI regarding security and password issues.
     Should Contain     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Agreement_Window_page_msg_Actual}                  Licensee represents and warrants that its Licensee Designated Site Administrator is knowledgeable concerning the statutory and regulatory requirements applicable to Licensee and the electronic storage and transmission of patient information within and from Licensee, including HIPAA and any state medical privacy mandates. Licensee Designated Site Administrator is responsible for remaining actively informed of developments concerning these legal requirements and will identify security services, products and solutions to ensure Licensee adheres to legal requirements related to information privacy and security.
     Should Contain     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Agreement_Window_page_msg_Actual}                  Licensee Designated Site Administrator responsibilities include:
     Should Contain     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Agreement_Window_page_msg_Actual}                  1. Educating users not to share passwords with anyone, even among Licensee Authorized Users.
     Should Contain     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Agreement_Window_page_msg_Actual}                  2. Adding or terminating the access of any Licensee Authorized Users to the Portal Services.
     Should Contain     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Agreement_Window_page_msg_Actual}                  3. Managing the access of any Licensee Authorized Users to the Portal Services by granting or
	 Should Contain     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Agreement_Window_page_msg_Actual}                    denying access to specific functions of the Portal Services.
     Should Contain     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Agreement_Window_page_msg_Actual}                  4. Ensuring that information accessed via the Portal is only used for legitimate business purposes.
     Should Contain     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Agreement_Window_page_msg_Actual}                  PASSWORDS
     Should Contain     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Agreement_Window_page_msg_Actual}                  Licensee's Designated Site Administrator (as defined below) shall be responsible for access and use of the Portal Services on Licensee's behalf and for the confidentiality of all passwords issued to Licensee and/or Licensee Authorized Users. CGI may unilaterally suspend or terminate some or all of Licensee's access to the Portal Services if CGI has reason to believe that (1) an unauthorized user is accessing and/or using the Portal Service on Licensee's behalf, (2) Licensee Authorized Users are sharing passwords or using the Login Information of any other Licensee Authorized User, (3) Licensee is not regularly monitoring its roster of Licensee Authorized Users and notifying CGI when an individual's access to the Portal Services should be terminated, or (4) any other acts or omissions to suggest that Licensee and/or Licensee Designated Site Administrator is not actively engaged in monitoring Licensee and Licensee Authorized Users' access to the Portal Services. The suspension or termination of Licensee Designated Site Administrator's access to the Portal Services will also prevent other Licensee Authorized Users from accessing the Portal Services, until such time as Licensee has resolved the security concern to CGI's satisfaction. Licensee agrees to immediately notify CGI of any unauthorized use of any password or any other breach of security.
     Should Contain     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Agreement_Window_page_msg_Actual}                  USE OF LICENSEE DATA
     Should Contain     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Agreement_Window_page_msg_Actual}                  Notwithstanding anything to the contrary in this Agreement or any other written agreement between the parties, Licensee authorizes CGI and its affiliates to use Licensee data to enable electronic communication to provide services to Licensee, and/or Licensee’s Authorized Users.

Close button for Site Administrator Agreement popup window
    Wait Until Element Is Visible     ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Agreement_Window_Close_Button_Locator}
    Element Should Be Visible         ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Agreement_Window_Close_Button_Locator}
    Click button                      ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Agreement_Window_Close_Button_Locator}

Click Portal Demonstration Hyperlink and Validate the URL
    Wait Until Element Is Visible     ${Comm_Portal_LoginPage_Portal_Demonstration_Link_Locator}
    Element Should Be Visible         ${Comm_Portal_LoginPage_Portal_Demonstration_Link_Locator}
    Click Element                     ${Comm_Portal_LoginPage_Portal_Demonstration_Link_Locator}
    sleep       3
    switch window           new
    ${url} =  Execute Javascript    return window.location.href
    should Contain    ${url}           portal.cgicleve.com/PortalMediaFiles/CommunicationsPortalDemonstration.mp4
    close window
    switch window           main

Click User Quick Start Guide and Validate the URL
    Wait Until Element Is Visible     ${Comm_Portal_LoginPage_User_Quick_Start_Guide_Link_Locator}
    Element Should Be Visible         ${Comm_Portal_LoginPage_User_Quick_Start_Guide_Link_Locator}
    Click Element                     ${Comm_Portal_LoginPage_User_Quick_Start_Guide_Link_Locator}
    sleep       3
    switch window           new
    ${url} =  Execute Javascript    return window.location.href
    should Contain    ${url}           portal.cgicleve.com/PortalMediaFiles/CommunicationsPortalUserGuide.pdf
    close window
    switch window           main

#MAIL
#Click CGI Help Desk and Validate the URL
#    Wait Until Element Is Visible     ${Comm_Portal_LoginPage_CGI_HelpDesk_Link_Locator}
#    Element Should Be Visible         ${Comm_Portal_LoginPage_CGI_HelpDesk_Link_Locator}
#    Click Element                     ${Comm_Portal_LoginPage_CGI_HelpDesk_Link_Locator}
#    sleep       3
#    Close all browsers

Click HIPAA Privacy Policy and Validate the URL
    Wait Until Element Is Visible     ${Comm_Portal_LoginPage_HIPAA_Privacy_Policy_Link_Locator}
    Element Should Be Visible         ${Comm_Portal_LoginPage_HIPAA_Privacy_Policy_Link_Locator}
    Click Element                     ${Comm_Portal_LoginPage_HIPAA_Privacy_Policy_Link_Locator}
    sleep       3
    switch window           new
    ${url} =  Execute Javascript    return window.location.href
    should be equal    ${url}           https://www.cgi.com/us/en-us/us-rights-notices
    Close all browsers

Scroll down to the bottom of page Reset Password Page
     Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
     Sleep    5

Zoom in zoom Out communication Portal
                Sleep       5
#                Execute javascript       document.body.style.zoom="60%"
#                Press key               / key.ctrl - -
                Sleep       20

Scroll down to the cancel button
    Scroll Element Into View             ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_button_Cancel_Locator}
    Wait Until Element Is Visible              ${Comm_Portal_LoginPage_SignUpNow_Site_Administrator_Registration_page_button_Cancel_Locator}



Valid User Login According to Test Data Availability
   [Arguments]    ${comm_usr_name}  ${comm_pass}
   #Verify if a user can login with a valid username and a valid password.
    Input Text    ${Comm_Portal_LoginPagePassword_Locator}    ${comm_pass}
    Input Text    ${Comm_Portal_LoginPageUsername_Locator}    ${comm_usr_name}
    Click Element    ${Comm_Portal_LoginPagechkUboxPolicyPrivacy_Locator}
    Click Button    ${Comm_Portal_LoginPageLoginButton_Locator}
    Wait Until Element Is Visible    ${Comm_Portal_LoginPage_SelectClient_CommPortal_Window}   timeout=120
    sleep   4
    ${c} =  SeleniumLibrary.Get Element Count   ${Comm_Portal_LoginPage_SelectClient_selector_Locator}
    Run Keyword If    ${c} > 0   Select From List By Value    ${Comm_Portal_LoginPage_SelectClient_selector_Locator}            ${DBName}
    Wait Until Element Is Visible    ${Comm_Portal_LoginPage_SelectClient_SelectClient_Applybutton_locator}
    Click Element    ${Comm_Portal_LoginPage_SelectClient_SelectClient_Applybutton_locator}


