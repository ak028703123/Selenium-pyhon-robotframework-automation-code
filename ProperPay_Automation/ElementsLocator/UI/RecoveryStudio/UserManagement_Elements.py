import yaml
from yaml import load
import os

with open(os.getcwd()+'\\TestData\\UI\\RecoveryStudio\\UserManagement_TestData.yaml') as f:
    var = yaml.full_load(f)
    UserManagement_Name= var.get("UserManagement_Name")
    UserManagement_Name2= var.get("UserManagement_Name2")
    UserManagement_Email=var.get("UserManagement_Email")
    UserManagement_Name_NPI=var.get("UserManagement_Name_NPI")
    UserManagement_Name_ProviderNumber=var.get("UserManagement_Name_ProviderNumber")
    UserManagement_NPI=var.get("UserManagement_NPI")
    UserManagement_ProviderNumber=var.get("UserManagement_ProviderNumber")
    UserManagement_Role_Type=var.get("UserManagement_Role_Type")
    UserManagement_AccountStatus=var.get("UserManagement_AccountStatus")


UserManagement_Setting_ManageUserIcon_Locator="//div[@class='sideNav']//em[@class='material-icons-outlined' and text()='settings']"
UserManagement_UserManagement_Page_Locator="//h1[@class='title'][contains(text(),'User Management')]"
UserManagement_UserManagementPage_NameColumnHeader_Locator="//th[@data-name='firstName']"
UserManagement_UserManagementPage_EmailColumnHeader_Locator="//th[@data-name='email']"
UserManagement_UserManagementPage_ProviderNumberColumnHeader_Locator="//th[@data-name='providerGroup']"
UserManagement_UserManagementPage_ProviderNPIColumnHeader_Locator="//th[@data-name='providerNPI']"
UserManagement_UserManagementPage_RoleColumnHeader_Locator="//th[@data-name='userAccessOrRoles']"
UserManagement_UserManagementPage_AcountStatusColumnHeader_Locator="//th[@data-name='status']"
UserManagement_UserManagementPage_AcountActionsColumnHeader_Locator="//th[@scope='col' and text()='Account Actions ']"
UserManagement_InviteNewUserPage_NewuserInfo_Textbox_FirstName_Locator="//input[@id='invitePageFirstNameInput']"
UserManagement_InviteNewUserPage_NewuserInfo_Textbox_LastName_Locator="//input[@id='invitePageLastNameInput']"
UserManagement_InviteNewUserPage_NewuserInfo_Textbox_Email_Locator="//input[@id='invitePageEmailInput']"
UserManagement_InviteNewUserPage_NewuserInfo_Textbox_ProviderNumber_Locator="//input[@id='invitePageProviderNumberInput']"
UserManagement_InviteNewUserPage_NewuserInfo_Textbox_ProviderNPI_Locator="//input[@id='invitePageProviderNPIInput']"
UserManagement_InviteNewUserPage_NewuserInfo_Textbox_Title_Locator="//input[@id='invitePageTitleInput']"
UserManagement_InviteNewUserPage_NewuserInfo_Textbox_PhoneNumber_Locator="//input[@id='invitePagePhoneNumberInput']"
UserManagement_InviteNewUserPage_NewuserInfo_Textbox_AdditionalEmail_Locator="//input[@id='invitePageAdditionalEmailInput']"
UserManagement_InviteNewUserPage_NewuserInfo_Textbox_MailingAddress_Locator="//input[@id='invitePageMailingAddressInput']"
UserManagement_InviteNewUserPage_NewuserInfo_Textbox_City_Locator="//input[@id='invitePageCityInput']"
UserManagement_InviteNewUserPage_NewuserInfo_Textbox_State_Locator="//input[@id='invitePageStateInput']"
UserManagement_InviteNewUserPage_NewuserInfo_Textbox_Zip_Locator="//input[@id='invitePageZipInput']"
UserManagement_InviteNewUserPage_NewuserInfo_Radio_UserPermissionRA_Locator="//label[@id='invitePageRecordsAnalystLabel']"
UserManagement_InviteNewUserPage_NewuserInfo_Radio_UserPermissionBA_Locator="//label[@id='invitePageBillingAnalystLabel']"
UserManagement_InviteNewUserPage_NewuserInfo_Checkbox_TermsConditions_Locator="//input[@id='invitePageSign']"
UserManagement_InviteNewUserPage_NewuserInfo_Button_SendInvitation_Locator="//button[@id='invitePageSendInvitationButton']"
UserManagement_InviteNewUserPage_NewuserInfo_Window_ConfirmInvitation_Locator="//h3[normalize-space()='Confirm Invitation']"
UserManagement_InviteNewUserPage_NewuserInfo_Button_ConfirmInvitation_Submit_Locator="//button[@id='invitePageSubmitButton']"
UserManagement_InviteNewUserPage_NewuserInfo_Button_ConfirmInvitation_Cancel_Locator="//button[@id='invitePageInvitationCancelButton']"
UserManagement_Edit_button_Locator="//td//a [text()='" +str(UserManagement_Name)+"']//ancestor::td//following-sibling::td//a[@class='edit'][contains(text(),'Edit')]"
UserManagement_UserManagementPage_Disable_button_Locator="//td//a [text()='" +str(UserManagement_Name)+"']//ancestor::td//following-sibling::td//button[@id='tableDisableUsrButton']"
UserManagement_UserManagementPage_Remove_button_Locator="//td//a [text()='" +str(UserManagement_Name2)+"']//ancestor::td//following-sibling::td//button[@id='tableRemoveButton']"
UserManagement_EditUserInformationpage_Title_Locator="//h1[@class='title'][contains(text(),'Edit User Information')]"
UserManagement_UserManagementPage_All_Remove_buttons_Locator="//button[@id='tableRemoveButton']"


UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_FirstName_Locator="//input[@id='editPageFirstNameInput']"
UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_LastName_Locator="//input[@id='editPageLastNameInput']"
UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_Email_Locator="//input[@id='editPageEmailInput']"
UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_ProviderNumber_Locator="//*[@id='editPageProviderNumberInput']"
UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_ProviderNPI_Locator="//input[@id='editPageProviderNPIInput']"
UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_Title_Locator="//input[@id='editPageTitleInput']"
UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_PhoneNumber_Locator="//input[@id='editPagePhoneNumberInput']"
UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_AdditionalEmail_Locator="//input[@id='editPageAdditionalEmailInput']"
UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_MailingAddress_Locator="//input[@id='editPageMailingAddressInput']"
UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_City_Locator="//input[@id='editPageCityInput']"
UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_State_Locator="//input[@id='editPageStateInput']"
UserManagement_UserManagementPage_EditUserInfo_Page_Textbox_Zip_Locator="//input[@id='editPageZipInput']"
UserManagement_UserManagementPage_EditUserInfo_Page_Paperless_Yes_RadioButton_Locator="//label[normalize-space()='Yes']"
UserManagement_UserManagementPage_EditUserInfo_Page_Paperless_No_RadioButton_Locator="//label[normalize-space()='No']"
UserManagement_UserManagementPage_EditUserInfo_Page_Save_Button_Locator="//button[@id='editPageSaveButton']"
UserManagement_UserManagementPage_EditUserInfo_Page_Cancel_Button_Locator="//button[@id='editPageCancelButton']"
UserManagement_UserManagementPage_EditUserInfo_Page_Window_ConfirmProfileChange_Locator="//h3[normalize-space()='Confirm profile changes']"
UserManagement_UserManagementPage_EditUserInfo_ConfirmProfileChange_Cancel_Button_Locator="//button[@id='editPageProfileCancelButton']"
UserManagement_UserManagementPage_EditUserInfo_ConfirmProfileChange_Save_Button_Locator="//button[@id='editPageProfileSaveButton']"
UserManagement_UserManagementPage_EditUserInfo_ConfirmProfileChange_Popup_Message_Locator="//p[normalize-space()='Are you sure you want to save your profile?']"
UserManagement_ConfirmationSave_ConfirmProfilesave_Go_To_Dashboard_button_Locator="//button[@id='editPageGotoDashboard']"
UserManagement_ConfirmationSave_ConfirmProfilesave_Go_To_UserInformation_button_Locator="//button[@id='editPageGotoUserMgmt']"
UserManagement_ConfirmationSave_ConfirmProfilesave_Confirmation_Window_Locator="//h3[normalize-space()='Confirmation']"
UserManagement_ConfirmationSave_ConfirmProfilesave_Popup_Message_Locator="//p[normalize-space()='You have successfully saved your profile!']"

UserManagement_UserManagementPage_ConfirmDisable_ConfirmDisable_Window_Locator="//h3[normalize-space()='Confirm Disable']"
UserManagement_UserManagementPage_ConfirmDisable_Cancel_Button_Locator="//button[@id='tableDisableUserCancelButton']"
UserManagement_UserManagementPage_ConfirmDisable_DisableUser_Button_Locator="//button[@id='tableDisableUserButton']"
UserManagement_UserManagementPage_ConfirmDisable_DisableUser_Popup_Message_Locator="//p[normalize-space()='Are you sure you want to disable " +str(UserManagement_Name)+"?']"

# UserManagement_UserManagementPage_ConfirmDisable_Confirmation_Window_Locator="//h3[normalize-space()='Confirmation']"
# UserManagement_UserManagementPage_ConfirmDisable_Confirmation_OK_Button_Locator="//button[@id='tableDisableUserConfirmClose']"
# UserManagement_UserManagementPage_ConfirmDisable_Confirmation_Popup_Message_Locator="//p[contains(text(),'You have successfully disabled the users')]"
UserManagement_UserManagementPage_EditUserInfo_EnableUser_Button_Locator="//button[@id='editPageEnableUserButton']"




UserManagement_UserManagementPage_EditUserInfo_Page_Radio_UserPermission_Locator="//label[@id='editPageRecordsAnalystLabel' or @id='editPageBillingAnalystLabel' or @id='editPagePayerLabel' ]"
UserManagement_UserManagementPage_Name_Locator="//a[contains(text(),'"+str(UserManagement_Name)+"')]"
UserManagement_UserDetailPage_Title_Locator="//h3[contains(text(),'User Detail')]"
UserManagement_UserDetailPage_FirstName_Locator="//h5[normalize-space()='First Name']"
UserManagement_UserDetailPage_LastName_Locator="//h5[normalize-space()='Last Name']"
UserManagement_UserDetailPage_EmailAddress_Locator="//h5[normalize-space()='Email Address']"
UserManagement_UserDetailPage_ProviderNPI_Locator="//h5[normalize-space()='Provider NPI']"
UserManagement_UserDetailPage_UserPermission_Locator="//h5[normalize-space()='User Permissions']"
UserManagement_UserDetailPage_titleOpt_Locator="//h5[normalize-space()='Title']"
UserManagement_UserDetailPage_CityOpt_Locator="//h5[normalize-space()='City']"
UserManagement_UserDetailPage_StateOpt_Locator="//h5[normalize-space()='State']"
UserManagement_UserDetailPage_ZipCodeOpt_Locator="//h5[normalize-space()='Zip Code']"
UserManagement_UserDetailPage_MailingAddressOpt_Locator="//h5[normalize-space()='Mailing Address']"
UserManagement_UserDetailPage_PhoneNumberOpt_Locator="//h5[normalize-space()='Phone Number']"
UserManagement_UserManagementPage_Email_Locator="//td//a [text()='" +str(UserManagement_Name)+"']//ancestor::td//following-sibling::td[normalize-space()='" +str(UserManagement_Email)+"']"
UserManagement_UserManagementPage_NPI_Locator="//td//a [text()='" +str(UserManagement_Name_NPI)+"']//ancestor::td//following-sibling::td[normalize-space()='" +str(UserManagement_NPI)+"']"
UserManagement_UserManagementPage_ProviderNumber_Locator="//td//a [text()='" +str(UserManagement_Name_ProviderNumber)+"']//ancestor::td//following-sibling::td[normalize-space()='" +str(UserManagement_ProviderNumber)+"']"
UserManagement_UserManagementPage_RoleType_Locator="//td//a [text()='" +str(UserManagement_Name)+"']//ancestor::td//following-sibling::td//div[text()='" +str(UserManagement_Role_Type)+"']"
UserManagement_UserManagementPage_AccountStatus_Locator="//td//a [text()='" +str(UserManagement_Name)+"']//ancestor::td//following-sibling::td[normalize-space()='" +str(UserManagement_AccountStatus)+"']"

UserManagement_UserManagementPage_ConfirmRemoval_ConfirmRemoval_Window_Locator="//h3[normalize-space()='Confirm Removal']"
UserManagement_UserManagementPage_ConfirmRemoval_RemoveUser_Button_Locator="//button[@id='tableRemoveUserButton']"
UserManagement_UserManagementPage_ConfirmRemoval_Cancel_Button_Locator="//button[@id='tableRemoveUserCancelButton']"
UserManagement_UserManagementPage_ConfirmRemoval_ConfirmRemoval_Popup_Message_Locator="//p[normalize-space()='Are you sure you want to remove " +str(UserManagement_Name2)+"?']"
Usermanagement_UserManagementPage_ConfirmRemoval_Removeuser_Button_Locator="//button[@id='tableRemoveUserButton']"
UserManagement_UserManagementPage_UserRemovedConfirmation_UserRemovedConfirmation_Window_Locator="//h3[normalize-space()='Confirmation']"
UserManagement_UserManagementPage_UserRemovedConfirmation_UserRemovedConfirmation_OK_Button_Locator="//button[@id='tableRemoveUserConfirmClose']"
UserManagement_UserManagementPage_UserRemovedConfirmation_UserRemovedConfirmation_Popup_Message_Locator="//p[normalize-space()='You have successfully removed the user!']"
UserManagement_UserManagementPage_Next_Button_Locator="//a[@aria-label='Next page']"
UserManagement_UserManagementPage_UserName_Locator="//a[text()='" +str(UserManagement_Name2)+"']"




UserManagement_UserDetailPage_Filter_button_locator="//a[@class='filterButton']"
UserManagement_UserDetailPage_Filter_Name_Label_Locator="//label[@id='filterUserNameLabel']"
UserManagement_UserDetailPage_Filter_Email_label_Locator="//label[@id='filterEmailLabel']"
UserManagement_UserDetailPage_Filter_ProviderNumber_NPI_Label_Locator="//label[@id='filterProviderNPILabel']"
UserManagement_UserDetailPage_Filter_RoleType_Dropdown_Locator="//select[@id='filterRoleType']"
UserManagement_UserDetailPage_Filter_AccountStatus_Dropdown_Locator="//select[@id='filterAccountStatus']"
UserManagement_Filter_PatientName_TextField_Locator="//input[@id='filterUserNameInput']"
UserManagement_Filter_Email_TextField_Locator="//input[@id='filterEmailInput']"
UserManagement_Filter_providerNumber_NPI_TextField_Locator="//input[@id='filterProviderNPIInput']"



#AN
UserManagement_UserManagementPage_InviteNewUser_Locator="//button[@id='userMgmtInviteUserButton']"
UserManagement_UserManagementPage_InviteNewUser_Page_Locator="//h1[text()='Invite New User']"
UserManagement_UserManagementPage_InviteNewUser_Page_FirstName_Locator="//label[@id='invitePageFirstNameLabel']"
UserManagement_UserManagementPage_InviteNewUser_Page_LastName_Locator="//label[@id='invitePageLastNameLabel']"
UserManagement_UserManagementPage_InviteNewUser_Page_EmailAddress_Locator="//label[@id='invitePageEmailLabel']"
UserManagement_UserManagementPage_InviteNewUser_Page_ProviderNumber_Locator="//label[@id='invitePageProviderNumberLabel']"
UserManagement_UserManagementPage_InviteNewUser_Page_ProviderNPI_Locator="//label[@id='invitePageProviderNPILabel']"
UserManagement_UserManagementPage_InviteNewUser_Page_Title_Locator="//h1[text()='Invite New User']"
UserManagement_UserManagementPage_InviteNewUser_Page_SubTitle_Locator="//h3[text()='New User Information']"
UserManagement_UserManagementPage_InviteNewUser_Page_FirstName_Locator="//label[@id='invitePageFirstNameLabel']"
UserManagement_UserManagementPage_InviteNewUser_Page_LastName_Locator="//label[@id='invitePageLastNameLabel']"
UserManagement_UserManagementPage_InviteNewUser_Page_EmailAddress_Locator="//label[@id='invitePageEmailLabel']"
UserManagement_UserManagementPage_InviteNewUser_Page_ProviderNumber_Locator="//label[@id='invitePageProviderNumberLabel']"
UserManagement_UserManagementPage_InviteNewUser_Page_ProviderNPI_Locator="//label[@id='invitePageProviderNPILabel']"
UserManagement_UserManagementPage_InviteNewUser_Page_UserPermissionRA_Locator="//label[@id='invitePageRecordsAnalystLabel']"
UserManagement_UserManagementPage_InviteNewUser_Page_UserPermissionBA_Locator="//label[@id='invitePageBillingAnalystLabel']"
UserManagement_UserManagementPage_InviteNewUser_Page_Title_Locator="//label[@id='invitePageTitleLabel']"
UserManagement_UserManagementPage_InviteNewUser_Page_PhoneNo_Locator="//label[@id='invitePagePhoneNumberLabel']"
UserManagement_UserManagementPage_InviteNewUser_Page_AddMailAddress_Locator="//label[@id='invitePageAdditionalEmailLabel']"
UserManagement_UserManagementPage_InviteNewUser_Page_MailingAddress_Locator="//label[@id='invitePageMailingAddressLabel']"
UserManagement_UserManagementPage_InviteNewUser_Page_City_Locator="//label[@id='invitePageCityLabel']"
UserManagement_UserManagementPage_InviteNewUser_Page_State_Locator="//label[@id='invitePageStateLabel']"
UserManagement_UserManagementPage_InviteNewUser_Page_Zip_Locator="//label[@id='invitePageZipLabel']"
UserManagement_UserManagementPage_InviteNewUser_Page_TermsandCondition_Locator="//label[@id='invitePageTerms']"
UserManagement_UserManagementPage_InviteNewUser_Page_CancelButton_Locator="//button[@id='invitePageCancelButton']"
UserManagement_UserManagementPage_InviteNewUser_Page_SubmitlButton_Locator="//button[@id='invitePageSendInvitationButton']"
