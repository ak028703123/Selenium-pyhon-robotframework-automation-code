*** Settings ***
Documentation    Script to Test Communication Portal
Library    SeleniumLibrary
Library    Easter
Library    String
Library    Collections
Library    os


Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//UserManagement_Elements.py
Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//RecordAnalyst_DashBoard_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//UserManagement_TestData.yaml
Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//RecordAnalyst_DashBoard_TestData.yaml


*** Keywords ***

#AK


Click User Management Setting_ManageUser Icon
      Wait Until Element Is Visible              ${UserManagement_Setting_ManageUserIcon_Locator}                   timeout=60
      Click Element                              ${UserManagement_Setting_ManageUserIcon_Locator}


Verify user is navigated to User Management Page
     Wait Until Element Is Visible              ${UserManagement_UserManagement_Page_Locator}                   timeout=60
     Click Element                              ${UserManagement_UserManagement_Page_Locator}

Verify User Management Page information
        Wait Until Element Is Visible    ${UserManagement_UserManagementPage_NameColumnHeader_Locator}
        Element Should Be Visible       ${UserManagement_UserManagementPage_NameColumnHeader_Locator}
        Wait Until Element Is Visible    ${UserManagement_UserManagementPage_EmailColumnHeader_Locator}
        Element Should Be Visible       ${UserManagement_UserManagementPage_EmailColumnHeader_Locator}
        Wait Until Element Is Visible    ${UserManagement_UserManagementPage_ProviderNumberColumnHeader_Locator}
        Element Should Be Visible        ${UserManagement_UserManagementPage_ProviderNumberColumnHeader_Locator}
        Wait Until Element Is Visible    ${UserManagement_UserManagementPage_ProviderNPIColumnHeader_Locator}
        Element Should Be Visible        ${ UserManagement_UserManagementPage_ProviderNPIColumnHeader_Locator}
        Wait Until Element Is Visible    ${UserManagement_UserManagementPage_RoleColumnHeader_Locator}
        Element Should Be Visible        ${UserManagement_UserManagementPage_RoleColumnHeader_Locator}
        Wait Until Element Is Visible    ${UserManagement_UserManagementPage_AcountStatusColumnHeader_Locator}
        Element Should Be Visible        ${UserManagement_UserManagementPage_AcountStatusColumnHeader_Locator}
        Wait Until Element Is Visible    ${UserManagement_UserManagementPage_AcountActionsColumnHeader_Locator}
        Element Should Be Visible        ${UserManagement_UserManagementPage_AcountActionsColumnHeader_Locator}

Enter all the Required user info on Invite New User page
    Input Text   ${UserManagement_InviteNewUserPage_NewuserInfo_Textbox_FirstName_Locator}     ${NewUser_FirstName}
    Input Text   ${UserManagement_InviteNewUserPage_NewuserInfo_Textbox_LastName_Locator}     ${NewUser_LastName}
    Input Text   ${UserManagement_InviteNewUserPage_NewuserInfo_Textbox_Email_Locator}     ${NewUser_Email}
#    Input Text   ${UserManagement_InviteNewUserPage_NewuserInfo_Textbox_ProviderNumber_Locator}     ${NewUser_PrvdrNum}
    Input Text   ${UserManagement_InviteNewUserPage_NewuserInfo_Textbox_ProviderNPI_Locator}     ${NewUser_PrvdrNPI}
    Wait Until Element Is Visible    ${UserManagement_InviteNewUserPage_NewuserInfo_Radio_UserPermissionRA_Locator}
    Click Element    ${UserManagement_InviteNewUserPage_NewuserInfo_Radio_UserPermissionRA_Locator}
    Wait Until Element Is Visible    ${UserManagement_InviteNewUserPage_NewuserInfo_Checkbox_TermsConditions_Locator}
    Click Element    ${UserManagement_InviteNewUserPage_NewuserInfo_Checkbox_TermsConditions_Locator}

Enter all the Optional user info on Invite New User page
    Input Text   ${UserManagement_InviteNewUserPage_NewuserInfo_Textbox_Title_Locator}     ${NewUser_Title}
    Input Text   ${UserManagement_InviteNewUserPage_NewuserInfo_Textbox_PhoneNumber_Locator}     ${NewUser_Phone}
    Input Text   ${UserManagement_InviteNewUserPage_NewuserInfo_Textbox_AdditionalEmail_Locator}     ${NewUser_AdditionalEmail}
    Input Text   ${UserManagement_InviteNewUserPage_NewuserInfo_Textbox_MailingAddress_Locator}     ${NewUser_MailingAddress}
    Input Text   ${UserManagement_InviteNewUserPage_NewuserInfo_Textbox_City_Locator}     ${NewUser_City}
    Input Text   ${UserManagement_InviteNewUserPage_NewuserInfo_Textbox_State_Locator}     ${NewUser_State}
    Input Text   ${UserManagement_InviteNewUserPage_NewuserInfo_Textbox_Zip_Locator}     ${NewUser_Zip}


Verify Send Invitation button is enabled
    Sleep    5
    Wait Until Element Is Visible    ${UserManagement_InviteNewUserPage_NewuserInfo_Button_SendInvitation_Locator}    timeout=60
    Element Should Be Enabled    ${UserManagement_InviteNewUserPage_NewuserInfo_Button_SendInvitation_Locator}


Click Send Invitation Button
     Wait Until Element Is Visible           ${UserManagement_InviteNewUserPage_NewuserInfo_Button_SendInvitation_Locator}
     Click Button                            ${UserManagement_InviteNewUserPage_NewuserInfo_Button_SendInvitation_Locator}


Verify Confirm Invitation window is displayed with buttons

     Wait Until Element Is Visible    ${UserManagement_InviteNewUserPage_NewuserInfo_Window_ConfirmInvitation_Locator}    timeout=60
     Element Should Be Visible    ${UserManagement_InviteNewUserPage_NewuserInfo_Window_ConfirmInvitation_Locator}
     Element Should Be Visible    ${UserManagement_InviteNewUserPage_NewuserInfo_Button_ConfirmInvitation_Submit_Locator}
     Element Should Be Visible    ${UserManagement_InviteNewUserPage_NewuserInfo_Button_ConfirmInvitation_Cancel_Locator}


Click Submit button on confirm invitation popup
     Wait Until Element Is Visible           ${UserManagement_InviteNewUserPage_NewuserInfo_Button_ConfirmInvitation_Submit_Locator}      timeout=60
     Click Element        ${UserManagement_InviteNewUserPage_NewuserInfo_Button_ConfirmInvitation_Submit_Locator}


Click Edit User Button
     Wait Until Element Is Visible           ${UserManagement_Edit_button_Locator}      timeout=60
     Click Element                           ${UserManagement_Edit_button_Locator}

Verify Edit User Info Page is displayed
       Wait Until Element Is Visible    ${UserManagement_EditUserInformationpage_Title_Locator}    timeout=60
       Element Should Be Visible    ${UserManagement_EditUserInformationpage_Title_Locator}


Verify Edit User Info Page information
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_FirstName_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_FirstName_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_LastName_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_LastName_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_Email_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_Email_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_ProviderNumber_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_ProviderNumber_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_ProviderNPI_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_ProviderNPI_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_EditUserInfo_Page_Radio_UserPermission_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_EditUserInfo_Page_Radio_UserPermission_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_Title_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_Title_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_PhoneNumber_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_PhoneNumber_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_AdditionalEmail_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_AdditionalEmail_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_MailingAddress_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_MailingAddress_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_State_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_State_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_Zip_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_Zip_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_City_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_City_Locator}


Click on the name in User management
   Wait Until Element Is Visible    ${UserManagement_UserManagementPage_Name_Locator}
   Click Element    ${UserManagement_UserManagementPage_Name_Locator}


Verify User Detail page is displayed
     Wait Until Element Is Visible    ${UserManagement_UserDetailPage_Title_Locator}    timeout=60
     Element Should Be Visible    ${UserManagement_UserDetailPage_Title_Locator}


Verify User Detail Page Info
           Wait Until Element Is Visible                ${UserManagement_UserDetailPage_FirstName_Locator}
           Element Should Be Visible                    ${UserManagement_UserDetailPage_FirstName_Locator}
           Wait Until Element Is Visible                ${UserManagement_UserDetailPage_LastName_Locator}
           Element Should Be Visible                    ${UserManagement_UserDetailPage_LastName_Locator}
           Wait Until Element Is Visible                ${UserManagement_UserDetailPage_EmailAddress_Locator}
           Element Should Be Visible                    ${UserManagement_UserDetailPage_EmailAddress_Locator}
           Wait Until Element Is Visible                ${UserManagement_UserDetailPage_ProviderNPI_Locator}
           Element Should Be Visible                    ${UserManagement_UserDetailPage_ProviderNPI_Locator}
           Wait Until Element Is Visible                ${UserManagement_UserDetailPage_UserPermission_Locator}
           Element Should Be Visible                    ${UserManagement_UserDetailPage_UserPermission_Locator}
           Wait Until Element Is Visible                ${UserManagement_UserDetailPage_titleOpt_Locator}
           Element Should Be Visible                    ${UserManagement_UserDetailPage_titleOpt_Locator}
           Wait Until Element Is Visible                ${UserManagement_UserDetailPage_CityOpt_Locator}
           Element Should Be Visible                    ${UserManagement_UserDetailPage_CityOpt_Locator}
           Wait Until Element Is Visible                ${UserManagement_UserDetailPage_StateOpt_Locator}
           Element Should Be Visible                    ${UserManagement_UserDetailPage_StateOpt_Locator}
           Wait Until Element Is Visible                ${UserManagement_UserDetailPage_ZipCodeOpt_Locator}
           Element Should Be Visible                    ${UserManagement_UserDetailPage_ZipCodeOpt_Locator}
           Wait Until Element Is Visible                ${UserManagement_UserDetailPage_MailingAddressOpt_Locator}
           Element Should Be Visible                    ${UserManagement_UserDetailPage_MailingAddressOpt_Locator}
           Wait Until Element Is Visible                ${UserManagement_UserDetailPage_PhoneNumberOpt_Locator}
           Element Should Be Visible                    ${UserManagement_UserDetailPage_PhoneNumberOpt_Locator}



Click paperless No option button
   Wait Until Element Is Visible    ${UserManagement_UserManagementPage_EditUserInfo_Page_Paperless_No_RadioButton_Locator}
   Click Element    ${UserManagement_UserManagementPage_EditUserInfo_Page_Paperless_No_RadioButton_Locator}

Click paperless Yes option button
   Wait Until Element Is Visible    ${UserManagement_UserManagementPage_EditUserInfo_Page_Paperless_Yes_RadioButton_Locator}
   Click Element            ${UserManagement_UserManagementPage_EditUserInfo_Page_Paperless_Yes_RadioButton_Locator}

Click on Save Button
    Wait Until Element Is Visible    ${UserManagement_UserManagementPage_EditUserInfo_Page_Save_Button_Locator}
    Click Element    ${UserManagement_UserManagementPage_EditUserInfo_Page_Save_Button_Locator}

Verify Confirm Profile Changes window is displayed with buttons
     Wait Until Element Is Visible    ${UserManagement_UserManagementPage_EditUserInfo_Page_Window_ConfirmProfileChange_Locator}    timeout=60
     Element Should Be Visible    ${UserManagement_UserManagementPage_EditUserInfo_Page_Window_ConfirmProfileChange_Locator}
     Element Should Be Visible    ${UserManagement_UserManagementPage_EditUserInfo_ConfirmProfileChange_Cancel_Button_Locator}
     Element Should Be Visible    ${UserManagement_UserManagementPage_EditUserInfo_ConfirmProfileChange_Save_Button_Locator}

Click Save Button on Confirm profile change popup
    Wait Until Element Is Visible    ${UserManagement_UserManagementPage_EditUserInfo_ConfirmProfileChange_Save_Button_Locator}
    Click Element    ${UserManagement_UserManagementPage_EditUserInfo_ConfirmProfileChange_Save_Button_Locator}



Verify Confirm Profile Changes pop up message is displayed
    Wait Until Element Is Visible     ${UserManagement_UserManagementPage_EditUserInfo_ConfirmProfileChange_Popup_Message_Locator}
    Element Should Be Visible         ${UserManagement_UserManagementPage_EditUserInfo_ConfirmProfileChange_Popup_Message_Locator}

Verify Profile Saved Pop Up Message Is Displayed
    Wait Until Element Is Visible     ${UserManagement_ConfirmationSave_ConfirmProfilesave_Popup_Message_Locator}
    Element Should Be Visible         ${UserManagement_ConfirmationSave_ConfirmProfilesave_Popup_Message_Locator}



Verify Profile Saved Confirmation window is displayed with buttons
     Wait Until Element Is Visible    ${UserManagement_ConfirmationSave_ConfirmProfilesave_Confirmation_Window_Locator}    timeout=60
     Element Should Be Visible    ${UserManagement_ConfirmationSave_ConfirmProfilesave_Confirmation_Window_Locator}
     Element Should Be Visible    ${UserManagement_ConfirmationSave_ConfirmProfilesave_Go_To_Dashboard_button_Locator}
     Element Should Be Visible    ${UserManagement_ConfirmationSave_ConfirmProfilesave_Go_To_UserInformation_button_Locator}
     Element Should Be Visible    ${UserManagement_ConfirmationSave_ConfirmProfilesave_Popup_Message_Locator}



Click Disable Button
     Wait Until Element Is Visible           ${UserManagement_UserManagementPage_Disable_button_Locator}      timeout=60
     Click Element                           ${UserManagement_UserManagementPage_Disable_button_Locator}

Verify Disable Button is disabled
     Wait Until Element Is Visible           ${UserManagement_UserManagementPage_Disable_button_Locator}      timeout=60
     Element Should Be Disabled              ${UserManagement_UserManagementPage_Disable_button_Locator}


Verify Confirm Disable window is displayed with buttons
     Wait Until Element Is Visible    ${UserManagement_UserManagementPage_ConfirmDisable_ConfirmDisable_Window_Locator}    timeout=60
     Element Should Be Visible    ${UserManagement_UserManagementPage_ConfirmDisable_ConfirmDisable_Window_Locator}
     Element Should Be Visible    ${UserManagement_UserManagementPage_ConfirmDisable_DisableUser_Button_Locator}
     Element Should Be Visible    ${UserManagement_UserManagementPage_ConfirmDisable_Cancel_Button_Locator}
     Element Should Be Visible    ${UserManagement_UserManagementPage_ConfirmDisable_DisableUser_Popup_Message_Locator}

Click Disable User Button
     Wait Until Element Is Visible           ${UserManagement_UserManagementPage_ConfirmDisable_DisableUser_Button_Locator}      timeout=60
     Click Element                           ${UserManagement_UserManagementPage_ConfirmDisable_DisableUser_Button_Locator}

#Verify User disable Confirmation window is displayed with OK button
#     Wait Until Element Is Visible    ${UserManagement_UserManagementPage_ConfirmDisable_Confirmation_Window_Locator}    timeout=60
#     Element Should Be Visible    ${UserManagement_UserManagementPage_ConfirmDisable_Confirmation_Window_Locator}
#     Element Should Be Visible    ${UserManagement_UserManagementPage_ConfirmDisable_Confirmation_OK_Button_Locator}
#     Element Should Be Visible    ${UserManagement_UserManagementPage_ConfirmDisable_Confirmation_Popup_Message_Locator}

Click OK on User Disable confirmation PopUp
     Wait Until Element Is Visible           ${UserManagement_UserManagementPage_ConfirmDisable_Confirmation_OK_Button_Locator}      timeout=60
     Click Element                           ${UserManagement_UserManagementPage_ConfirmDisable_Confirmation_OK_Button_Locator}

Click Enable user button
     Wait Until Element Is Visible           ${UserManagement_UserManagementPage_EditUserInfo_EnableUser_Button_Locator}      timeout=60
     Click Element                           ${UserManagement_UserManagementPage_EditUserInfo_EnableUser_Button_Locator}

Click Remove Button
     Wait Until Element Is Visible           ${UserManagement_UserManagementPage_Remove_button_Locator}      timeout=60
     Click Element                           ${UserManagement_UserManagementPage_Remove_button_Locator}

Verify Confirm Removal window is displayed with buttons
     Wait Until Element Is Visible    ${UserManagement_UserManagementPage_ConfirmRemoval_ConfirmRemoval_Window_Locator}    timeout=60
     Element Should Be Visible    ${UserManagement_UserManagementPage_ConfirmRemoval_ConfirmRemoval_Window_Locator}
     Element Should Be Visible    ${UserManagement_UserManagementPage_ConfirmRemoval_RemoveUser_Button_Locator}
     Element Should Be Visible    ${UserManagement_UserManagementPage_ConfirmRemoval_Cancel_Button_Locator}
     Element Should Be Visible    ${UserManagement_UserManagementPage_ConfirmRemoval_ConfirmRemoval_Popup_Message_Locator}


Click Remove User Button
      Wait Until Element Is Visible           ${Usermanagement_UserManagementPage_ConfirmRemoval_Removeuser_Button_Locator}      timeout=60
      Click Element                           ${Usermanagement_UserManagementPage_ConfirmRemoval_Removeuser_Button_Locator}

Click Next Button
     Wait Until Element Is Visible           ${UserManagement_UserManagementPage_Next_Button_Locator}      timeout=60
     Click Element                           ${UserManagement_UserManagementPage_Next_Button_Locator}


Verify User Removed Confirmation window is displayed with OK button
     Wait Until Element Is Visible    ${UserManagement_UserManagementPage_UserRemovedConfirmation_UserRemovedConfirmation_Window_Locator}    timeout=180
     Element Should Be Visible    ${UserManagement_UserManagementPage_UserRemovedConfirmation_UserRemovedConfirmation_Window_Locator}
     Element Should Be Visible    ${UserManagement_UserManagementPage_UserRemovedConfirmation_UserRemovedConfirmation_OK_Button_Locator}
     Element Should Be Visible    ${UserManagement_UserManagementPage_UserRemovedConfirmation_UserRemovedConfirmation_Popup_Message_Locator}


Verify removed user is not displayed on the user management page
     Element Should Not Be Visible    ${UserManagement_UserManagementPage_UserName_Locator}



Click OK on User Removed confirmation PopUp
     Wait Until Element Is Visible           ${UserManagement_UserManagementPage_UserRemovedConfirmation_UserRemovedConfirmation_OK_Button_Locator}      timeout=60
     Click Element                           ${UserManagement_UserManagementPage_UserRemovedConfirmation_UserRemovedConfirmation_OK_Button_Locator}



Verify Filter panel is visible with filter option fields
     Wait Until Element Is Visible    ${UserManagement_UserDetailPage_Filter_Name_Label_Locator}
     Element Should Be Visible       ${UserManagement_UserDetailPage_Filter_Name_Label_Locator}
     Wait Until Element Is Visible    ${UserManagement_UserDetailPage_Filter_Email_label_Locator}
     Element Should Be Visible       ${UserManagement_UserDetailPage_Filter_Email_label_Locator}
     Wait Until Element Is Visible    ${UserManagement_UserDetailPage_Filter_ProviderNumber_NPI_Label_Locator}
     Element Should Be Visible        ${UserManagement_UserDetailPage_Filter_ProviderNumber_NPI_Label_Locator}
     Wait Until Element Is Visible    ${UserManagement_UserDetailPage_Filter_RoleType_Dropdown_Locator}
     Element Should Be Visible        ${UserManagement_UserDetailPage_Filter_RoleType_Dropdown_Locator}
     Wait Until Element Is Visible    ${UserManagement_UserDetailPage_Filter_AccountStatus_Dropdown_Locator}
     Element Should Be Visible        ${UserManagement_UserDetailPage_Filter_AccountStatus_Dropdown_Locator}
     Wait Until Element Is Visible    ${RecordAnalyst_FilterButton_ClearFilterButton_Locator}
     Element Should Be Visible        ${RecordAnalyst_FilterButton_ClearFilterButton_Locator}
     Wait Until Element Is Visible    ${RecordAnalyst_FilterButton_ApplyFilterButton_Locator}
     Element Should Be Visible        ${RecordAnalyst_FilterButton_ApplyFilterButton_Locator}



Click on the filter button
     Wait Until Element Is Visible           ${UserManagement_UserDetailPage_Filter_button_locator}      timeout=60
     Click Element                           ${UserManagement_UserDetailPage_Filter_button_locator}




Verify filter Functionality by providing Valid Patient Name
       [Arguments]   ${PtName_PassedByUser}
       Element Should Be Visible        ${UserManagement_Filter_PatientName_TextField_Locator}
       Wait Until Element Is Visible    ${UserManagement_Filter_PatientName_TextField_Locator}
       Click Element                    ${UserManagement_Filter_PatientName_TextField_Locator}
       Input Text                       ${UserManagement_Filter_PatientName_TextField_Locator}     ${PtName_PassedByUser}
       Sleep    3

Verify data after applying filter Functionality by providing Valid Patient Name
       Wait Until Element Is Visible    ${UserManagement_UserManagementPage_Name_Locator}     timeout=60
       Element Should Be Visible        ${UserManagement_UserManagementPage_Name_Locator}


Verify filter Functionality by providing Valid Email
       [Arguments]   ${Email_PassedByUser}
       Element Should Be Visible        ${UserManagement_Filter_Email_TextField_Locator}
       Wait Until Element Is Visible    ${UserManagement_Filter_Email_TextField_Locator}
       Click Element                    ${UserManagement_Filter_Email_TextField_Locator}
       Input Text                       ${UserManagement_Filter_Email_TextField_Locator}     ${Email_PassedByUser}
       Sleep    3

Verify data after applying filter Functionality by providing Valid Email
       Wait Until Element Is Visible    ${UserManagement_UserManagementPage_Email_Locator}    timeout=60
       Element Should Be Visible        ${UserManagement_UserManagementPage_Email_Locator}




Verify filter Functionality by providing valid Provider Number or NPI
      [Arguments]   ${ProviderNumber_NPI_PassedByUser}
       Element Should Be Visible        ${UserManagement_Filter_providerNumber_NPI_TextField_Locator}
       Wait Until Element Is Visible    ${UserManagement_Filter_providerNumber_NPI_TextField_Locator}
       Click Element                    ${UserManagement_Filter_providerNumber_NPI_TextField_Locator}
       Input Text                       ${UserManagement_Filter_providerNumber_NPI_TextField_Locator}     ${ProviderNumber_NPI_PassedByUser}
       Sleep    3


Verify data after applying filter Functionality by providing Valid NPI
       Wait Until Element Is Visible    ${UserManagement_UserManagementPage_NPI_Locator}    timeout=60
       Element Should Be Visible        ${UserManagement_UserManagementPage_NPI_Locator}


Verify data after applying filter Functionality by providing Valid Provider Number
       Wait Until Element Is Visible    ${UserManagement_UserManagementPage_ProviderNumber_Locator}     timeout=60
       Element Should Be Visible        ${UserManagement_UserManagementPage_ProviderNumber_Locator}



Verify filter Functionality by providing Role Type
    Wait Until Element Is Visible    ${UserManagement_UserDetailPage_Filter_RoleType_Dropdown_Locator}   timeout=60
    sleep   2
    ${c} =  Get Element Count   ${UserManagement_UserDetailPage_Filter_RoleType_Dropdown_Locator}
    Run Keyword If    ${c} > 0   Select From List By Value    ${UserManagement_UserDetailPage_Filter_RoleType_Dropdown_Locator}      ${UserManagement_Role_Type}

Verify data after applying filter Functionality by Role Type
       Wait Until Element Is Visible    ${UserManagement_UserManagementPage_RoleType_Locator}     timeout=60
       Element Should Be Visible        ${UserManagement_UserManagementPage_RoleType_Locator}

UserManagement.Verify filter Functionality by providing Account Status
    Wait Until Element Is Visible    ${UserManagement_UserDetailPage_Filter_AccountStatus_Dropdown_Locator}   timeout=60
    sleep   2
    ${c} =  Get Element Count   ${UserManagement_UserDetailPage_Filter_AccountStatus_Dropdown_Locator}
    Run Keyword If    ${c} > 0   Select From List By Value    ${UserManagement_UserDetailPage_Filter_AccountStatus_Dropdown_Locator}      ${UserManagement_AccountStatus}


Verify data after applying filter Functionality by Account Status
       Wait Until Element Is Visible    ${UserManagement_UserManagementPage_AccountStatus_Locator}     timeout=60
       Element Should Be Visible        ${UserManagement_UserManagementPage_AccountStatus_Locator}



Validate filter clearing functionality
    Wait Until Element Is Visible    ${UserManagement_UserManagementPage_All_Remove_buttons_Locator}                                             timeout=120
    ${RemoveButton_Count_BeforeapplyingFilter} =   Get Element Count   ${UserManagement_UserManagementPage_All_Remove_buttons_Locator}
    Verify filter Functionality by providing Valid Patient Name    ${UserManagement_Name}
    Sleep    5
    Verify data after applying filter Functionality by providing Valid Patient Name
    Click Clear Filter Button
    Sleep    5
    ${RemoveButton_Count_AfterClearingFilter} =   Get Element Count   ${UserManagement_UserManagementPage_All_Remove_buttons_Locator}
    Should Be Equal    ${RemoveButton_Count_BeforeapplyingFilter}    ${RemoveButton_Count_AfterClearingFilter}


#AN
Click on Invite New User Button
                    Wait Until Element Is Visible           ${UserManagement_UserManagementPage_InviteNewUser_Locator}
                    Click Button                            ${UserManagement_UserManagementPage_InviteNewUser_Locator}

Verify user is navigated to Invite New User Page
                   Wait Until Element Is Visible               ${UserManagement_UserManagementPage_InviteNewUser_Page_Locator}
                   Element Should Be Visible                    ${UserManagement_UserManagementPage_InviteNewUser_Page_Locator}

Verify Invite New User Page information
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_InviteNewUser_Page_Title_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_InviteNewUser_Page_Title_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_InviteNewUser_Page_SubTitle_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_InviteNewUser_Page_SubTitle_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_InviteNewUser_Page_FirstName_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_InviteNewUser_Page_FirstName_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_InviteNewUser_Page_LastName_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_InviteNewUser_Page_LastName_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_InviteNewUser_Page_EmailAddress_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_InviteNewUser_Page_EmailAddress_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_InviteNewUser_Page_ProviderNumber_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_InviteNewUser_Page_ProviderNumber_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_InviteNewUser_Page_ProviderNPI_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_InviteNewUser_Page_ProviderNPI_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_InviteNewUser_Page_UserPermissionRA_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_InviteNewUser_Page_UserPermissionRA_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_InviteNewUser_Page_UserPermissionBA_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_InviteNewUser_Page_UserPermissionBA_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_InviteNewUser_Page_Title_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_InviteNewUser_Page_Title_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_InviteNewUser_Page_PhoneNo_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_InviteNewUser_Page_PhoneNo_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_InviteNewUser_Page_AddMailAddress_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_InviteNewUser_Page_AddMailAddress_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_InviteNewUser_Page_MailingAddress_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_InviteNewUser_Page_MailingAddress_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_InviteNewUser_Page_State_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_InviteNewUser_Page_State_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_InviteNewUser_Page_Zip_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_InviteNewUser_Page_Zip_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_InviteNewUser_Page_TermsandCondition_Locator}
                   Element Should Be Visible                    ${UserManagement_UserManagementPage_InviteNewUser_Page_TermsandCondition_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_InviteNewUser_Page_CancelButton_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_InviteNewUser_Page_CancelButton_Locator}
                  Wait Until Element Is Visible                ${UserManagement_UserManagementPage_InviteNewUser_Page_SubmitlButton_Locator}
                  Element Should Be Visible                    ${UserManagement_UserManagementPage_InviteNewUser_Page_SubmitlButton_Locator}

Scroll to the right
    Sleep   10
    Scroll Element Into View                           ${UserManagement_UserManagementPage_Remove_button_Locator}
    Wait Until Element Is Visible                      ${UserManagement_UserManagementPage_Remove_button_Locator}

Scroll down to the bottom of page
     Execute javascript        window.scrollTo(0,document.body.scrollHeight)
#      Execute javascript          window.scrollTo(0,2000)
     Sleep    5


#Satheesh


