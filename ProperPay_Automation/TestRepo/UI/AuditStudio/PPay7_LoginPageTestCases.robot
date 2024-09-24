*** Settings ***
Documentation    PPay7 Login Page Functioal test
Resource    ../ProperPay_Automation/Resource/UI/CommonFunctionality/PPay7_CommonFunctionality.robot
Resource    ../ProperPay_Automation/Resource/UI/AuditStudio/PPay7_LoginPage.robot
Variables    ..//ProperPay_Automation//TestData//UI//AuditStudio//PPay7_LoginPage_TestData.yaml



#Library   DataDriver  Loginpage_TestData.xlsx  sheet_name=InvalidCredential_Login

Test Setup      PPay7_CommonFunctionality.Launch PPay7 login Page
#Test Teardown   CommonFunctionality.Finish TestCase

*** Test Cases ***
Test 1 :ProperPay:Ppay7 login page_Valid User login.
    [Documentation]    This test case verifies if a user is able to login with a valid username and Valid password.
    [Tags]    Functional-

    PPay7_LoginPage.Valid User Login   ${BA_comm_usr_name}    ${BA_comm_pass}
    PPay7_LoginPage.Verify pp7 lable and configuration label is visible on sucessful login





