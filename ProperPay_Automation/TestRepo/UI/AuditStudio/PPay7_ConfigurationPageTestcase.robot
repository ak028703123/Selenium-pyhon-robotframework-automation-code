*** Settings ***
Documentation    PPay7 Login Page Functional test
Resource    ../ProperPay_Automation/Resource/UI/CommonFunctionality/PPay7_CommonFunctionality.robot
Resource    ../ProperPay_Automation/Resource/UI/AuditStudio/PPay7_ConfigurationPage.robot
Resource    ../ProperPay_Automation/Resource/UI/AuditStudio/PPay7_LoginPage.robot
Variables    ..//ProperPay_Automation//TestData//UI//AuditStudio//PPay7_LoginPage_TestData.yaml



#Library   DataDriver  Loginpage_TestData.xlsx  sheet_name=InvalidCredential_Login

Test Setup      PPay7_CommonFunctionality.Launch PPay7 login Page
Test Teardown   PPay7_CommonFunctionality.Finish TestCase

*** Test Cases ***
#Test 1 :ProperPay:Ppay7 Verify configuration page is displayed upon login
#    [Documentation]    This test case verifies that configuration page is displayed upon login with 4 sections(Audit,Edit, Exclusion and Ranking,Pricing, Users and Roles)
#    [Tags]    Functional-1
#
#    PPay7_LoginPage.Valid User Login   ${PPay7_name}    ${PPay7_pass}
#    PPay7_LoginPage.Verify pp7 lable and configuration label is visible on sucessful login
#    PPay7_ConfigurationPage.Verify configuration page is visible with 4 sections(Audit,Edit, Exclusion and Ranking,Pricing, Users and Roles)
#
#
#Test 2 :ProperPay:Ppay7 Verify user is able to see management column and Action column with manage button enabled and Items per page and Next and prev button in Audit section
#    [Documentation]    This test case verifies that user is able to see management column and Action column with manage button enabled and Items per page and Next and prev button in Audit section
#    [Tags]    Functional-2
#
#    PPay7_LoginPage.Valid User Login   ${BA_comm_usr_name}    ${BA_comm_pass}
#    PPay7_LoginPage.Verify pp7 lable and configuration label is visible on sucessful login
#    PPay7_ConfigurationPage.Verify configuration page is visible with 4 sections(Audit,Edit, Exclusion and Ranking,Pricing, Users and Roles)
#    PPay7_ConfigurationPage.Verify Management and Action Column is displayed under Audit Configuration
#    PPay7_ConfigurationPage.Verify Manage button is enabled
#    PPay7_ConfigurationPage.Verify items per page is displayed under Audit Configuration
#    PPay7_ConfigurationPage.Verify Next page,Previous page, First page and Last page buttons are displayed under Audit Configuration


#Test 3 :ProperPay:Ppay7 Verify user is able to sort data by using management header column
#    [Documentation]    This test case verifies that user is able to sort data by using management header column
#    [Tags]    Functional-3
#
#    PPay7_LoginPage.Valid User Login   ${BA_comm_usr_name}    ${BA_comm_pass}
#    PPay7_LoginPage.Verify pp7 lable and configuration label is visible on sucessful login
#    PPay7_ConfigurationPage.Verify configuration page is visible with 4 sections(Audit,Edit, Exclusion and Ranking,Pricing, Users and Roles)
#    PPay7_ConfigurationPage.Click Management header in Audit Configuration Table and verify sorting is done in alphabetically

#
#Test 4 :ProperPay:Ppay7 Verify User can view the drop down 'items per page' and it contains 10 by default .Also,user have option to select either 20 or 30 items per page in Audit section .
#    [Documentation]    This test case verifies that User can view the drop down 'items per page' and it contains 10 by default.Also,user have option to select either 20 or 30 items per page in Audit section.
#    [Tags]    Functional-4
#
#    PPay7_LoginPage.Valid User Login   ${BA_comm_usr_name}    ${BA_comm_pass}
#    PPay7_LoginPage.Verify pp7 lable and configuration label is visible on sucessful login
#    PPay7_ConfigurationPage.Verify configuration page is visible with 4 sections(Audit,Edit, Exclusion and Ranking,Pricing, Users and Roles)
#    PPay7_ConfigurationPage.Verify Items Per Page is present and contains 10 by default in audit configuration
#    PPay7_ConfigurationPage.Selects Item Per Page as 20 in audit configuration
#    PPay7_ConfigurationPage.Verifies in audit configuration displays 20 records

#
#Test 5 :ProperPay:Ppay7 Verify User clicks on Next and Previous icon moves to corresponding page in Audit section
#    [Documentation]    This test case verifies that User clicks on Next and Previous icon moves to corresponding page in Audit section.
#    [Tags]   Functional-5
#
#    PPay7_LoginPage.Valid User Login   ${BA_comm_usr_name}    ${BA_comm_pass}
#    PPay7_LoginPage.Verify pp7 lable and configuration label is visible on sucessful login
#    PPay7_ConfigurationPage.Verify configuration page is visible with 4 sections(Audit,Edit, Exclusion and Ranking,Pricing, Users and Roles)
#    PPay7_ConfigurationPage.Click Next Page Button in audit configuration
#    PPay7_ConfigurationPage.Verify payer Options is visible in audit configuration
#    PPay7_ConfigurationPage.Click Previous Page Button in audit configuration
#    PPay7_ConfigurationPage.Verify payer User Group is visible in audit configuration

#
#Test 6 :ProperPay:Ppay7 Verify User first and Last page icon moves to corresponding page in Audit section
#    [Documentation]    This test case verifies that User clicks on first and Last page icon moves to corresponding page Audit section.
#    [Tags]   Functional-6
#
#    PPay7_LoginPage.Valid User Login   ${BA_comm_usr_name}    ${BA_comm_pass}
#    PPay7_LoginPage.Verify pp7 lable and configuration label is visible on sucessful login
#    PPay7_ConfigurationPage.Verify configuration page is visible with 4 sections(Audit,Edit, Exclusion and Ranking,Pricing, Users and Roles)
#    PPay7_ConfigurationPage.Click Next Page Button in audit configuration
#    PPay7_ConfigurationPage.Click First Page Button in audit configuration
#    PPay7_ConfigurationPage.Verify payer User Group is visible in audit configuration
#    PPay7_ConfigurationPage.Click Last Page Button in audit configuration
#    PPay7_ConfigurationPage.Verify payer Options is visible in audit configuration

#Test 7 :ProperPay:Ppay7 Verify User is navigated to user group list when clicked on Manage button on user group
#    [Documentation]    This test case verifies that User is navigated to user group list when clicked on Manage button on user group
#    [Tags]   Functional-7
#
#    PPay7_LoginPage.Valid User Login   ${BA_comm_usr_name}    ${BA_comm_pass}
#    PPay7_LoginPage.Verify pp7 lable and configuration label is visible on sucessful login
#    PPay7_ConfigurationPage.Verify configuration page is visible with 4 sections(Audit,Edit, Exclusion and Ranking,Pricing, Users and Roles)
#    PPay7_ConfigurationPage.Click on manage button on user group
#    PPay7_ConfigurationPage.Verify User Group List page is visible on clicking Manage button of User Group
#    PPay7_ConfigurationPage.Verify User Group List page is having column headers


#Test 8 :ProperPay:Ppay7 Verify user is able to sort data by using management header column
#    [Documentation]    This test case verifies that user is able to sort data by using management header column
#    [Tags]    Functional-8
#
#    PPay7_LoginPage.Valid User Login   ${BA_comm_usr_name}    ${BA_comm_pass}
#    PPay7_LoginPage.Verify pp7 lable and configuration label is visible on sucessful login
#    PPay7_ConfigurationPage.Verify configuration page is visible with 4 sections(Audit,Edit, Exclusion and Ranking,Pricing, Users and Roles)
#    PPay7_ConfigurationPage.Click on manage button on user group
#    PPay7_ConfigurationPage.Verify User Group List page is visible on clicking Manage button of User Group
#    PPay7_ConfigurationPage.Click User Group header in User Group List Table and verify sorting is done in alphabetically
#    PPay7_ConfigurationPage.Click Active header in User Group List Table and verify sorting is done in alphabetically
#    PPay7_ConfigurationPage.Click Created By header in User Group List Table and verify sorting is done in alphabetically
#    PPay7_ConfigurationPage.Click Date Created header in User Group List Table and verify sorting is done in Ascending order
#    PPay7_ConfigurationPage.Click Last Update header in User Group List Table and verify sorting is done in Ascending order
#    PPay7_ConfigurationPage.Click Last Modified By header in User Group List Table and verify sorting is done in Ascending order

#Test 9 :ProperPay:Ppay7 Verify User is able to search by using the search field.
#    [Documentation]    This test case verifies that User is able to search records by using the search field
#    [Tags]    Functional-9
#
#    PPay7_LoginPage.Valid User Login   ${BA_comm_usr_name}    ${BA_comm_pass}
#    PPay7_LoginPage.Verify pp7 lable and configuration label is visible on sucessful login
#    PPay7_ConfigurationPage.Verify configuration page is visible with 4 sections(Audit,Edit, Exclusion and Ranking,Pricing, Users and Roles)
#    PPay7_ConfigurationPage.Click on manage button on user group
#    PPay7_ConfigurationPage.Verify User Group List page is visible on clicking Manage button of User Group
#    PPay7_ConfigurationPage.Click on the search box in user group list
#    PPay7_ConfigurationPage.Enter text in the search box in user group list
#    PPay7_ConfigurationPage.Validate the entered user group list in the search box is displayed
#
#Test 10 :ProperPay:Ppay7 Verify User can view the drop down'items per page'and it contains 10 by default.Also,user have option to select either 25 or 50 items per page in user group of audit section.
#    [Documentation]    This test case verifies that User can view the drop down'items per page'and it contains 10 by default.Also,user have option to select either 25 or 50 items per page in user group of audit section.
#    [Tags]    Functional-10
#
#    PPay7_LoginPage.Valid User Login   ${BA_comm_usr_name}    ${BA_comm_pass}
#    PPay7_LoginPage.Verify pp7 lable and configuration label is visible on sucessful login
#    PPay7_ConfigurationPage.Verify configuration page is visible with 4 sections(Audit,Edit, Exclusion and Ranking,Pricing, Users and Roles)
#    PPay7_ConfigurationPage.Click on manage button on user group
#    PPay7_ConfigurationPage.Verify User Group List page is visible on clicking Manage button of User Group
#    PPay7_ConfigurationPage.Verify Items Per Page is present and contains 10 by default in user group of audit section
#    PPay7_ConfigurationPage.Selects Item Per Page as 25 in user group of audit section
#    PPay7_ConfigurationPage.Verifies user group of audit configuration displays 25 records

#Test 11 :ProperPay:Ppay7 Verify User clicks on Next and Previous icon moves to corresponding page in Audit section
#    [Documentation]    This test case verifies that User clicks on Next and Previous icon moves to corresponding page in Audit section.
#    [Tags]   Functional-11
#
#    PPay7_LoginPage.Valid User Login   ${BA_comm_usr_name}    ${BA_comm_pass}
#    PPay7_LoginPage.Verify pp7 lable and configuration label is visible on sucessful login
#    PPay7_ConfigurationPage.Verify configuration page is visible with 4 sections(Audit,Edit, Exclusion and Ranking,Pricing, Users and Roles)
#    PPay7_ConfigurationPage.Click on manage button on user group
#    PPay7_ConfigurationPage.Verify User Group List page is visible on clicking Manage button of User Group


#    PPay7_ConfigurationPage.Click Next Page Button in audit configuration
#    PPay7_ConfigurationPage.Verify payer Options is visible in audit configuration
#    PPay7_ConfigurationPage.Click Previous Page Button in audit configuration
#    PPay7_ConfigurationPage.Verify payer User Group is visible in audit configuration