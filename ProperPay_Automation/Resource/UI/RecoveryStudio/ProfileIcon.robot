*** Settings ***
Documentation    Script to Test Communication Portal
Library    SeleniumLibrary
Library    Easter
Library    String
Library    Collections
Library    os
#Library    RPA.PDF

Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//ProfileIcon_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//Payer_DashBoard_TestData.yaml


*** Keywords ***

Click Profile Icon
    Wait Until Element Is Visible           ${Comm_Portal_ProfileIcon_Locator}          timeout=120
    Click Element                           ${Comm_Portal_ProfileIcon_Locator}


Select Payer from Payer dropdown in Profile Icon
    [Arguments]     ${User_option}
    Wait until Element is Visible       ${Comm_Portal_ProfileIcon_PayerDropdown_Locator}
    Element Should Be Visible        ${Comm_Portal_ProfileIcon_PayerDropdown_Locator}
    Select From List By Value        ${Comm_Portal_ProfileIcon_PayerDropdown_Locator}                       ${User_option}
    sleep       3
    Click button        ${Comm_Portal_ProfileIcon_PayerDropdown_ApplyButton_Locator}

Verify selected Payer records are displayed
     Element should be visible        ${Comm_Portal_Payer_Name_Locator}
     ${Payer}=      Get Text    ${Comm_Portal_Payer_Name_Locator}
     should be equal         ${Payer}          ${selected_payer}

Click Logout Button
    Wait Until Element Is Visible           ${Comm_Portal_LogOut_Button_Locator}          timeout=120
    Click Element                           ${Comm_Portal_LogOut_Button_Locator}

Confim Logout popup with "Yes" option
    Wait Until Element Is Visible          ${Comm_Portal_Confirm_LogOut_PopUp_Head_Locator_Locator}
    Element Should Be Visible              ${Comm_Portal_Confirm_LogOut_PopUp_Head_Locator_Locator}
    Wait Until Element Is Visible          ${Comm_Portal_Confirm_LogOut_PopUp_Body_Locator_Locator}
    Element Should Be Visible              ${Comm_Portal_Confirm_LogOut_PopUp_Body_Locator_Locator}
    ${Confirm_LogOut_PopUp_Body_Locator}=         Get Text        ${Comm_Portal_Confirm_LogOut_PopUp_Body_Locator_Locator}
    should Contain             ${Confirm_LogOut_PopUp_Body_Locator}          Are you sure you want to logout of the CGI Communications Portal?
    Sleep    2
    Wait Until Element Is Visible           ${Comm_Portal_Confirm_LogOut_PopUp_Yes_Button_Locator_Locator}
    Element Should Be Visible               ${Comm_Portal_Confirm_LogOut_PopUp_Yes_Button_Locator_Locator}
    Click Button                           ${Comm_Portal_Confirm_LogOut_PopUp_Yes_Button_Locator_Locator}
    Sleep    2

Verify Communication login page is displayed
    Wait Until Element Is Visible       ${Comm_Portal_LoginPageTitleHeader_Locator}
    Element Should Be Visible         ${Comm_Portal_LoginPageTitleHeader_Locator}

Verify Profile icon details entered is visible
    Wait Until Element Is Visible    ${Comm_Portal_ProfileIcon_ProviderNPI_Locator}
    Element Should Be Visible      ${Comm_Portal_ProfileIcon_ProviderNPI_Locator}
    #Wait Until Element Is Visible    ${Comm_Portal_ProfileIcon_ProviderNumber_Detail_Locator}
    #Element Should Be Visible      ${Comm_Portal_ProfileIcon_ProviderNumber_Detail_Locator}
    Wait Until Element Is Visible    ${Comm_Portal_ProfileIcon_EmailAddress_Detail_Locator}
    Element Should Be Visible      ${Comm_Portal_ProfileIcon_EmailAddress_Detail_Locator}
    Wait Until Element Is Visible    ${Comm_Portal_ProfileIcon_UserPermission_Detail_Locator}
    Element Should Be Visible      ${Comm_Portal_ProfileIcon_UserPermission_Detail_Locator}
    Wait Until Element Is Visible    ${Comm_Portal_ProfileIcon_Title_Detail_Locator}
    Element Should Be Visible      ${Comm_Portal_ProfileIcon_Title_Detail_Locator}
    Wait Until Element Is Visible    ${Comm_Portal_ProfileIcon_PhoneNum_Detail_Locator}
    Element Should Be Visible      ${Comm_Portal_ProfileIcon_PhoneNum_Detail_Locator}
    Wait Until Element Is Visible    ${Comm_Portal_ProfileIcon_PayerDropdown_Locator}
    Element Should Be Visible      ${Comm_Portal_ProfileIcon_PayerDropdown_Locator}
    Wait Until Element Is Visible    ${Comm_Portal_ProfileIcon_PayerDropdown_ApplyButton_Locator}
    Element Should Be Visible      ${Comm_Portal_ProfileIcon_PayerDropdown_ApplyButton_Locator}
    Wait Until Element Is Visible    ${Comm_Portal_ProfileIcon_UpdateProfile_Hyperlink_Locator}
    Element Should Be Visible      ${Comm_Portal_ProfileIcon_UpdateProfile_Hyperlink_Locator}
    Wait Until Element Is Visible    ${Comm_Portal_LogOut_Button_Locator}
    Element Should Be Visible      ${Comm_Portal_LogOut_Button_Locator}

Click Update profile hyperlink
    Wait Until Element Is Visible           ${Comm_Portal_ProfileIcon_UpdateProfile_Hyperlink_Locator}          timeout=120
    Element Should Be Visible      ${Comm_Portal_ProfileIcon_UpdateProfile_Hyperlink_Locator}
    Click Element                           ${Comm_Portal_ProfileIcon_UpdateProfile_Hyperlink_Locator}

Verify Confirm Logout popup
    Wait Until Element Is Visible          ${Comm_Portal_Confirm_LogOut_PopUp_Head_Locator_Locator}
    Element Should Be Visible              ${Comm_Portal_Confirm_LogOut_PopUp_Head_Locator_Locator}
    Wait Until Element Is Visible          ${Comm_Portal_Confirm_LogOut_PopUp_Body_Locator_Locator}
    Element Should Be Visible              ${Comm_Portal_Confirm_LogOut_PopUp_Body_Locator_Locator}
    ${Confirm_LogOut_PopUp_Body_Locator}=         Get Text        ${Comm_Portal_Confirm_LogOut_PopUp_Body_Locator_Locator}
    should Contain             ${Confirm_LogOut_PopUp_Body_Locator}          Are you sure you want to logout of the CGI Communications Portal?
    Sleep    2
    Element should be enabled       ${Comm_Portal_Confirm_LogOut_PopUp_No_Button_Locator_Locator}
    Element should be enabled       ${Comm_Portal_Confirm_LogOut_PopUp_Yes_Button_Locator_Locator}