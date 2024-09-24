*** Settings ***
Documentation   Edit studio Login Page Functional test
#Resource    ../ProperPay_Automation/Resource/UI/CommonFunctionality/PPay7_CommonFunctionality.robot
#Resource    ../ProperPay_Automation/Resource/UI/AuditStudio/PPay7_ConfigurationPage.robot
Resource    ../ProperPay_Automation/Resource/UI/EditStudio/LoginPage.robot
Variables    ..//ProperPay_Automation//TestData//UI//EditStudio//LoginPage_TestData.yaml



Test Setup       LoginPage.Launch Edit Studio Page
#Test Teardown   LoginPage.Finish TestCase

*** Test Cases ***

Test 1 :ProperPay:Communication Portal login page_Valid User login.
    [Documentation]    This test case verifies if a user is able to login with a valid username and Valid password.
    [Tags]    Functional-TSA_TC_001
     LoginPage.Valid User Login
