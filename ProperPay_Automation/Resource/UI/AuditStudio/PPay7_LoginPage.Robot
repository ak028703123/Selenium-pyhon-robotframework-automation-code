*** Settings ***
Documentation    Script to Test ppay 7 Login Page
Library    SeleniumLibrary
Library    XML
Variables    ..//ProperPay_Automation//ElementsLocator//UI//AuditStudio//PPay7_LoginPage_Elements.py
Variables    ..//ProperPay_Automation//ElementsLocator//UI//AuditStudio//PPay7_Homepage_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//AuditStudio//PPay7_LoginPage_TestData.yaml




*** Keywords ***



Valid User Login
   [Arguments]    ${PPay7_usr_name}  ${PPay7_pass}
   #Verify if a user can login with a valid username and a valid password.

    Input Text    ${PPay7_LoginPageUsername_Locator}    ${PPay7_usr_name}
    Input Text    ${PPay7_LoginPagePassword_Locator}    ${PPay7_pass}
    Click Element    ${PPay7_LoginPagechkUboxPolicyPrivacy_Locator}
    Click Button    ${PPay7_LoginPageLoginButton_Locator}
    Wait Until Element Is Visible    ${PPay7_HomePage_PPay7_Label_Locator}          timeout=60
    Element Should Be Visible    ${PPay7_HomePage_PPay7_Label_Locator}


Verify pp7 lable and configuration label is visible on sucessful login

    Wait Until Element Is Visible  ${PPay7_HomePage_Configuration_Label_Locator}       timeout=60
    Element Should Be Visible    ${PPay7_HomePage_Configuration_Label_Locator}