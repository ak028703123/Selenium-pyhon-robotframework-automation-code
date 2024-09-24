*** Settings ***
Documentation    Script to Test Communication Portal
Library    SeleniumLibrary
Library    Easter
Library    String
Library    Collections
Library    os
#Library    RPA.PDF

Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//ContactUs_Elements.py
Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//BillingAnalyst_DashBoard_Elements.py
Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//History_Elements.py


*** Keywords ***

Click On Hameburger Icon and Verify Contact Us Option
    Click Element                        ${AuditHistory_HamburgerMenu_Locator}
    wait until Element is visible         ${ContactUs_Logo_Locator}
    Element Should Be Visible             ${ContactUs_Logo_Locator}

Click Contact Us option
    Click Element                        ${AuditHistory_HamburgerMenu_Locator}
    wait until Element is visible         ${ContactUs_Logo_Locator}
    Element Should Be Visible             ${ContactUs_Logo_Locator}
    Click Element       ${ContactUs_Logo_Locator}


#Satheesh
Verify ContactUs page details
    Wait Until Element Is Visible    ${Comm_Portal_ContactUs_Header_label_Locator}
    Element Should Be Visible      ${Comm_Portal_ContactUs_Header_label_Locator}
    Wait Until Element Is Visible    ${Comm_Portal_ContactUs_firstname_label_Locator}
    Element Should Be Visible      ${Comm_Portal_ContactUs_firstname_label_Locator}
    Wait Until Element Is Visible    ${Comm_Portal_ContactUs_Lastname_label_Locator}
    Element Should Be Visible      ${Comm_Portal_ContactUs_Lastname_label_Locator}
    Wait Until Element Is Visible    ${Comm_Portal_ContactUs_EmailAddress_label_Locator}
    Element Should Be Visible      ${Comm_Portal_ContactUs_EmailAddress_label_Locator}
    Wait Until Element Is Visible    ${Comm_Portal_ContactUs_PhoneNumber_label_Locator}
    Element Should Be Visible      ${Comm_Portal_ContactUs_PhoneNumber_label_Locator}
    Wait Until Element Is Visible    ${Comm_Portal_ContactUs_Title_label_Locator}
    Element Should Be Visible      ${Comm_Portal_ContactUs_Title_label_Locator}
    Wait Until Element Is Visible    ${Comm_Portal_ContactUs_ProviderNumber_label_Locator}
    Element Should Be Visible      ${Comm_Portal_ContactUs_ProviderNumber_label_Locator}
    Wait Until Element Is Visible    ${Comm_Portal_ContactUs_Preferred_Contact_Method_label_Locator}
    Element Should Be Visible      ${Comm_Portal_ContactUs_Preferred_Contact_Method_label_Locator}
    Wait Until Element Is Visible    ${Comm_Portal_ContactUs_ContactReason_label_Locator}
    Element Should Be Visible      ${Comm_Portal_ContactUs_ContactReason_label_Locator}
    Wait Until Element Is Visible    ${Comm_Portal_ContactUs_Comment_label_Locator}
    Element Should Be Visible      ${Comm_Portal_ContactUs_Comment_label_Locator}
    Wait Until Element Is Visible    ${Comm_Portal_ContactUs_Cancel_Button_Locator}
    Element Should Be Enabled      ${Comm_Portal_ContactUs_Cancel_Button_Locator}
    Wait Until Element Is Visible    ${Comm_Portal_ContactUs_Submit_Button_Locator}
    Element Should Be Disabled      ${Comm_Portal_ContactUs_Submit_Button_Locator}

Enter all the mandatory fields in ContactUs page
    Input Text   ${Comm_Portal_ContactUs_firstname_Textbox_Locator}     ${First Name}
    Input Text   ${Comm_Portal_ContactUs_Lastname_Textbox_Locator}     ${Last Name}
    Input Text   ${Comm_Portal_ContactUs_EmailAddress_Textbox_Locator}     ${Email Address}
    Input Text   ${Comm_Portal_ContactUs_PhoneNumber_Textbox_Locator}     ${Phone Number}
    Click Element   ${Comm_Portal_ContactUs_Preferred_Contact_Method_NoReplyNeeded_radio_Button_Locator}
    Wait until element is visible     ${Comm_Portal_ContactUs_ContactReason_HelpDesk_radio_Button_Locator}      timeout=30
    Scroll element into view        ${Comm_Portal_ContactUs_ContactReason_HelpDesk_radio_Button_Locator}
    Click Element   ${Comm_Portal_ContactUs_ContactReason_HelpDesk_radio_Button_Locator}
    Input Text   ${Comm_Portal_ContactUs_Comment_Textbox_Locator}     ${Comments}

Verify Submit button is enabled
    Wait Until Element Is Visible    ${Comm_Portal_ContactUs_Submit_Button_Locator}
    Element Should Be Visible      ${Comm_Portal_ContactUs_Submit_Button_Locator}
    Element Should Be Enabled      ${Comm_Portal_ContactUs_Submit_Button_Locator}

Click on cancel button
    wait until Element is visible         ${Comm_Portal_ContactUs_Cancel_Button_Locator}
    Element Should Be Visible             ${Comm_Portal_ContactUs_Cancel_Button_Locator}
    Click Button       ${Comm_Portal_ContactUs_Cancel_Button_Locator}

Verify the data is cleared
    Textfield Value Should Be   ${Comm_Portal_ContactUs_firstname_Textbox_Locator}     ${EMPTY}
    Textfield Value Should Be   ${Comm_Portal_ContactUs_Lastname_Textbox_Locator}     ${EMPTY}
    Textfield Value Should Be   ${Comm_Portal_ContactUs_EmailAddress_Textbox_Locator}     ${EMPTY}
    Textfield Value Should Be   ${Comm_Portal_ContactUs_PhoneNumber_Textbox_Locator}     ${EMPTY}
    Radio button should not be selected         contactMethod
    Element Text Should Be       ${Comm_Portal_ContactUs_Comment_Textbox_Locator}     ${EMPTY}

Enter all the mandatory fields in ContactUs page and delete
    Input Text   ${Comm_Portal_ContactUs_firstname_Textbox_Locator}     ${First Name}
    press keys   ${Comm_Portal_ContactUs_firstname_Textbox_Locator}   CTRL+A+BACKSPACE
    Input Text   ${Comm_Portal_ContactUs_Lastname_Textbox_Locator}     ${Last Name}
    press keys   ${Comm_Portal_ContactUs_Lastname_Textbox_Locator}   CTRL+A+BACKSPACE
    Input Text   ${Comm_Portal_ContactUs_EmailAddress_Textbox_Locator}     ${Email Address}
    press keys   ${Comm_Portal_ContactUs_EmailAddress_Textbox_Locator}   CTRL+A+BACKSPACE
    Input Text   ${Comm_Portal_ContactUs_PhoneNumber_Textbox_Locator}     ${Phone Number}
    press keys   ${Comm_Portal_ContactUs_PhoneNumber_Textbox_Locator}   CTRL+A+BACKSPACE
    Input Text   ${Comm_Portal_ContactUs_Comment_Textbox_Locator}     ${Comments}
    press keys   ${Comm_Portal_ContactUs_Comment_Textbox_Locator}   CTRL+A+BACKSPACE
    Click Element   ${Comm_Portal_ContactUs_Title_label_Locator}

Verify mandatory field notification
    page should contain     First name is required
    page should contain     Last name is required
    page should contain     Email is required
    page should contain     Phone number is required.
    page should contain     Please enter a comment


Click On Submit Button
    Wait Until Element Is Visible       ${Comm_Portal_ContactUs_Submit_Button_Locator}
    Element Should Be Visible           ${Comm_Portal_ContactUs_Submit_Button_Locator}
    Element Should Be Enabled           ${Comm_Portal_ContactUs_Submit_Button_Locator}
    Click Element                       ${Comm_Portal_ContactUs_Submit_Button_Locator}

Verify Confirmation Popup
    Wait Until Element Is Visible            ${Comm_Portal_ContactUs_Confirmation_Popup_Head_Locator}
    Element Should Be Visible                ${Comm_Portal_ContactUs_Confirmation_Popup_Head_Locator}
    Wait Until Element Is Visible            ${Comm_Portal_ContactUs_Confirmation_Popup_Body_Locator}
    Element Should Be Visible                ${Comm_Portal_ContactUs_Confirmation_Popup_Body_Locator}
    ${Comm_Portal_ContactUs_Confirmation_Popup_Body_Locator_new}=        Get Text            ${Comm_Portal_ContactUs_Confirmation_Popup_Body_Locator}
    should be equal            ${Comm_Portal_ContactUs_Confirmation_Popup_Body_Locator_new}             Your submission has been sent successfully! Please allow up to 24 hours for a response from our team.
    Wait Until Element Is Visible           ${Comm_Portal_ContactUs_Confirmation_Popup_GoToDashboard_Locator}
    Element Should Be Visible                   ${Comm_Portal_ContactUs_Confirmation_Popup_GoToDashboard_Locator}
    Click Element                                       ${Comm_Portal_ContactUs_Confirmation_Popup_GoToDashboard_Locator}










