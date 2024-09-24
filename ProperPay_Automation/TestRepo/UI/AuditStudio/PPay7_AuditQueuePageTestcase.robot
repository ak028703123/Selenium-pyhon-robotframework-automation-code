*** Settings ***
Documentation    PPay7 Login Page Functional test
Resource    ../ProperPay_Automation/Resource/UI/CommonFunctionality/PPay7_CommonFunctionality.robot
Resource    ../ProperPay_Automation/Resource/UI/AuditStudio/PPay7_ConfigurationPage.robot
Resource    ../ProperPay_Automation/Resource/UI/AuditStudio/PPay7_LoginPage.robot
Resource    ../ProperPay_Automation/Resource/UI/AuditStudio/PPay7_AuditQueuePage.robot
Variables    ..//ProperPay_Automation//TestData//UI//AuditStudio//PPay7_AuditQueuePage_TestData.yaml
Variables    ..//ProperPay_Automation//TestData//UI//AuditStudio//PPay7_LoginPage_TestData.yaml


#Library   DataDriver  Loginpage_TestData.xlsx  sheet_name=InvalidCredential_Login

Test Setup      PPay7_CommonFunctionality.Launch PPay7 login Page
#Test Teardown   PPay7_CommonFunctionality.Finish TestCase

*** Test Cases ***
Test 1 :ProperPay:Ppay7 Verify Audit Queue page is displayed when clicked on Audit Queue icon in Hamburger menu
    [Documentation]    This test case verifies that Audit Queue page is displayed when clicked on Audit Queue icon in Hamburger menu
    [Tags]    Functional-1

    PPay7_LoginPage.Valid User Login   ${PPay7_name}    ${PPay7_pass}
    PPay7_AuditQueuePage.Click Audit Queue icon in hamburger menu
    PPay7_AuditQueuePage.Verify Audit Queue Landing page
