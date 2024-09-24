import yaml
from yaml import load
import os

with open(os.getcwd()+'\\TestData\\UI\\CommonFunctionality\\CommonFunctionality_TestData.yaml') as f:
    var = yaml.full_load(f)
    UserName = var.get("UserName")
    PatientName_Header = var.get("PatientName_Header")
Admin_comm_LoginPageRockSolidKnw_Locator="//img[@alt='Rock Solid Knowledge']"
Admin_comm_LoginPageSupportlink_Locator="//a[normalize-space()='Support']"
Admin_comm_LoginPageLoginButton_Locator="//button[@id='loginBtn']"
Admin_comm_LoginPageUserName_Locator="//input[@id='Username']"
Admin_comm_LoginPagePassword_Locator="//input[@id='Password']"
Admin_comm_LoginPageLButton_Locator="//button[@name='button']"
Comm_Portal_LoginPageBKgrdImage_Locator="//h1[@class='backgroundimage']"
# Comm_Portal_LoginPageTitleHeader_Locator="//strong[normalize-space()='Communications Portal Login']"
Admin_Comm_Homepage_Users_Tab_Locator="//a[normalize-space()='Users']"
Admin_Comm_Homepage_Users_Tab_SearchUserName_Locator="//input[@id='searchUserName']"
Admin_Comm_Homepage_Users_Tab_SearchReturned_UserName_Locator="//b[@class='tw-text-blue-500'][contains(text(),'"+str(UserName)+"')]"
Admin_Comm_Homepage_Users_Tab_User_Roles_Tab_Locator="//button[normalize-space()='Roles']"
Admin_Comm_Homepage_Users_Tab_Users_Roles_Tab_Role_Billing_Analyst_checkbox_locator="//input[@name='Billing Analyst']"
Admin_Comm_Homepage_Users_Tab_Users_Roles_Tab_Role_Record_Analyst_checkbox_locator="//input[@name='Records Analyst']"
Admin_Comm_Assign_button_locator="//button[@id='assignBtn']"
Admin_Comm_Unassign_button_locator="//button[@id='unAssignBtn']"
Common_PreviousAudit_button_Locator="//button[@id='prevNextButtonsPreviousAudit']"
Common_NextAudit_button_Locator="//button[@id='prevNextButtonsNextAudit']"
Common_PreviousRequest_button_Locator="//button[@id='prevNextPreviousButton']"
Common_NextRequest_button_Locator="//button[@id='prevNextRequestButton']"
Common_PatientName_Header_Locator= "//h1[normalize-space()='" +str(PatientName_Header)+"']"