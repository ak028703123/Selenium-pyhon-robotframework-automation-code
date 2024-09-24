import yaml
from yaml import load
import os

with open(os.getcwd()+'\\TestData\\UI\\RecoveryStudio\\ProfileIcon_TestData.yaml') as f:
     var = yaml.full_load(f)

     User_Permission = var.get("User Permission")
     Title = var.get("Title")
     Phone_Number = var.get("Phone Number")
     Email_Address = var.get("Email Address")
     Provider_Number = var.get("Provider")


#satheesh
Comm_Portal_ProfileIcon_Locator= "//em[normalize-space()='account_circle']"
Comm_Portal_ProfileIcon_PayerDropdown_Locator= "//div[@class='profileFooter']//select[@id='clients']"
Comm_Portal_ProfileIcon_PayerDropdown_ApplyButton_Locator="//div[@class='profileFooter']//button[@class='secondary small profile'][normalize-space()='Apply']"
# Comm_Portal_ProfileIcon_Close_Element_Locator= "//em[normalize-space()='close']"
Comm_Portal_Payer_Name_Locator= "//select[@id='clients']//option[text()='Highmark Blue Cross Blue Shield']"
Comm_Portal_LogOut_Button_Locator= "//button[@id='accountDetailLogOutButton']"
Comm_Portal_Confirm_LogOut_PopUp_Head_Locator_Locator= "//h3[normalize-space()='Confirm LogOut']"
Comm_Portal_Confirm_LogOut_PopUp_Body_Locator_Locator= "//p[contains(text(),'Are you sure you want to logout of the CGI Communi')]"
Comm_Portal_Confirm_LogOut_PopUp_Yes_Button_Locator_Locator= "//button[@id='accountDetailYesButton']"
Comm_Portal_Confirm_LogOut_PopUp_No_Button_Locator_Locator= "//button[@id='accountDetailNoButton']"
Comm_Portal_ProfileIcon_ProviderNPI_Locator= "//h6[normalize-space()='Provider NPI:']"
Comm_Portal_ProfileIcon_ProviderNumber_Detail_Locator= "//h6[contains(text(),'" +str(Provider_Number)+"')]"
Comm_Portal_ProfileIcon_EmailAddress_Detail_Locator= "//p[normalize-space()='" +str(Email_Address)+"']"
Comm_Portal_ProfileIcon_UserPermission_Detail_Locator= "//p[normalize-space()='" +str(User_Permission)+"']"
Comm_Portal_ProfileIcon_Title_Detail_Locator= "//p[normalize-space()='" +str(Title)+"']"
Comm_Portal_ProfileIcon_PhoneNum_Detail_Locator= "//p[normalize-space()='" +str(Phone_Number)+"']"
Comm_Portal_ProfileIcon_UpdateProfile_Hyperlink_Locator= "//a[normalize-space()='Update Profile']"
Comm_Portal_LoginPageTitleHeader_Locator="//strong[contains(text(),'Communications Portal Login')]"
























