import yaml
from yaml import load
import os

with open(os.getcwd()+'\\TestData\\UI\\RecoveryStudio\\UserManagement_TestData.yaml') as f:
    var = yaml.full_load(f)



#AN
CommPortal_HameburgerIcon_Locator="//input[@type='checkbox']"
ContactUs_Logo_Locator="//span[normalize-space()='Contact Us']"
Comm_Portal_ContactUs_Confirmation_Popup_Head_Locator="//h3[text()='Confirmation']"
Comm_Portal_ContactUs_Confirmation_Popup_Body_Locator="//div[@class='content']//p"
Comm_Portal_ContactUs_Confirmation_Popup_GoToDashboard_Locator="//div//button[@id='contactFormGoToDashboardButton']"




#Satheesh
Comm_Portal_ContactUs_Header_label_Locator= "//h1[@class='title']"
Comm_Portal_ContactUs_firstname_label_Locator= "//label[@id='contactFormFirstNameLabel']"
Comm_Portal_ContactUs_Lastname_label_Locator= "//label[@id='contactFormLastNameLabel']"
Comm_Portal_ContactUs_EmailAddress_label_Locator= "//label[@id='contactFormEmailAddressLabel']"
Comm_Portal_ContactUs_PhoneNumber_label_Locator= "//label[@id='contactFormPhoneNumberLabel']"
Comm_Portal_ContactUs_Title_label_Locator= "//label[@id='contactFormTitleLabel']"
Comm_Portal_ContactUs_ProviderNumber_label_Locator= "//label[@for='provider']"
Comm_Portal_ContactUs_Preferred_Contact_Method_label_Locator= "//label[@id='contactFormContactMethodLabel']"
Comm_Portal_ContactUs_ContactReason_label_Locator= "//label[@id='contactFormContactReasonLabel']"
Comm_Portal_ContactUs_Comment_label_Locator= "//label[@id='contactFormCommentsLabel']"
Comm_Portal_ContactUs_Cancel_Button_Locator= "//button[@id='contactFormCancelButton']"
Comm_Portal_ContactUs_Submit_Button_Locator= "//button[@id='contactFormSubmitButton']"

Comm_Portal_ContactUs_firstname_Textbox_Locator= "//input[@id='contactFormFirstNameInput']"
Comm_Portal_ContactUs_Lastname_Textbox_Locator= "//input[@id='contactFormLastNameInput']"
Comm_Portal_ContactUs_EmailAddress_Textbox_Locator= "//input[@id='contactFormEmailAddressInput']"
Comm_Portal_ContactUs_PhoneNumber_Textbox_Locator= "//input[@id='contactFormPhoneNumberInput']"
Comm_Portal_ContactUs_Title_Textbox_Locator= "//input[@id='contactFormTitleInput']"
Comm_Portal_ContactUs_ProviderNumber_Dropdown_Locator= "//select[@id='provider']"
Comm_Portal_ContactUs_Preferred_Contact_Method_Phone_radio_Button_Locator= "//label[normalize-space()='Phone']//span[@class='checkmark']"
Comm_Portal_ContactUs_Preferred_Contact_Method_Email_radio_Button_Locator= "//label[normalize-space()='Email']//span[@class='checkmark']"
Comm_Portal_ContactUs_Preferred_Contact_Method_NoReplyNeeded_radio_Button_Locator= "//label[normalize-space()='No Reply Needed']//span[@class='checkmark']"
Comm_Portal_ContactUs_ContactReason_HelpDesk_radio_Button_Locator= "//label[normalize-space()='Help Desk/Support']//span[@class='checkmark']"
Comm_Portal_ContactUs_ContactReason_GeneralFeedback_radio_Button_Locator= "//label[normalize-space()='General Feedback']//span[@class='checkmark']"
Comm_Portal_ContactUs_Comment_Textbox_Locator= "//textarea[@id='contactFormCommentsInput']"
























