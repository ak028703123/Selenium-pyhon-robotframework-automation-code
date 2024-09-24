
*** Settings ***
Documentation     Communication Portal Record Analyst DashBoard Functioal test
Resource    ../ProperPay_Automation/Resource/UI/CommonFunctionality/CommonFunctionality.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/LoginPage.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/RecordAnalyst_Dashboard.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/BillingAnalyst_Dashboard.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/Payer_Dashboard.robot
Resource    ../ProperPay_Automation/Resource/UI/RecoveryStudio/History.robot

#Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//RecordAnalyst_DashBoard_Elements.py
#Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//RecordAnalyst_DashBoard_TestData.yaml
Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//Payer_Dashboard_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//RecoveryStudio//Payer_Dashboard_TestData.yaml
Variables    ..//ProperPay_Automation//ElementsLocator//UI//RecoveryStudio//History_Elements.py

Test Setup      CommonFunctionality.Launch Communication Portal Page

Test Teardown   CommonFunctionality.Finish TestCase

*** Variables ***
${sqlQuery}              ${payerDashabordSqlQuery1}

*** Test Cases ***
Test 1 :ProperPay:Communication Portal Payer Dashboard_Verify user is able to login as Payer
        [Documentation]    This test case verifies if a user is able to login as a Payer with a valid username and Valid password.
        [Tags]   Functional-TS26_TC_001

        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible


#fail due to defect
Test 3 :ProperPay:Communication Portal Payer Dashboard_Verify Confirmation pop up is display when user clicks on 'Yes' button which is present on Approve Adjustment pop up
        [Documentation]    This test case Verify Confirmation pop up is display when user clicks on 'Yes' button which is present on Approve Adjustment pop up.
        [Tags]   Functional-TS26_TC_017

        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Verify Data Availability    0
        Payer_Dashboard.Click View Claims button
        Payer_Dashboard.Verify Adjustments page is displayed
        Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user           ${data_list[0]['ClaimNumber']}


        Payer_Dashboard.Click ClaimNumber in Outstanding Adjustment page
        Payer_Dashboard.Scroll down to the bottom of Adjustment detail page
        Payer_Dashboard.Verify Approve Adjustment button is present
        Payer_Dashboard.Click Approve Adjustment button
        Payer_Dashboard.Scroll down to the Approve Adjustment button
        Payer_Dashboard.Click Approve Adjustment button on Adjustment Approve Form
        Payer_Dashboard.Verify Confirm Approve Adjustment pop up is displayed
        Payer_Dashboard.Verify Confirm Approve Adjustment pop up message is displayed
        Payer_Dashboard.Verify Yes and No button is displayed on Confirm Approve Adjustment pop up
        Payer_Dashboard.Click Yes on Confirm Approve Adjustment pop up
        Payer_Dashboard.Verify Confirmation pop up is displayed
        Payer_Dashboard.Verify Confirmation pop up message is displayed
        Payer_Dashboard.Verify Go to dashboard button is displayed on Confirmation pop up
        Payer_Dashboard.Click Go to dashboard button on Confirmation pop up
        LoginPage.Verify Payer Dashboard is visible

#
##Satheesh
Test 3 :ProperPay:Communication Portal Payer Dashboard_Verify user is able to see all the details once clicked on 'Claim Number'
        [Documentation]    This test case verifies user is able to see all the details once clicked on 'Claim Number'
        [Tags]   Functional-TS26_TC_008_01

        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Claims button
        Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user           ${data_list[0]['ClaimNumber']}
        Payer_Dashboard.Click ClaimNumber in Outstanding Adjustment page
        Payer_Dashboard.Verify Adjustment details entered is visible in Payer dashboard
        Payer_Dashboard.Scroll down to the bottom of Adjustment detail page
        Payer_Dashboard.Verify Change Adjustment amount button is present
        Payer_Dashboard.Verify Approve Adjustment button is present
        Payer_Dashboard.Verify Deny Adjustment button is present
#
#
Test 4 :ProperPay:Communication Portal Payer Dashboard_Verify 'Claim Number' is clickable and other columns are not clickable on the Outstanding Adjustments Tab
        [Documentation]    This test case verifies Verify 'Claim Number' is clickable and other columns are not clickable on the Outstanding Adjustments Tab
        [Tags]   Functional-TS26_TC_007
        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Verify Data Availability    1
        Payer_Dashboard.Click View Claims button
        Payer_Dashboard.Verify 'Claim Number' is clickable and other columns are not clickable in Outstanding Adjustment page
#
#Fail due to defect
Test 5 :ProperPay:Communication Portal Payer Dashboard_Verify user is able to change the adjustment Amount.
        [Documentation]    This test case verifies user is able to change  the adjustment Amount.
        [Tags]   Functional-TS26_TC_012
        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Claims button
        Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user              ${data_list[0]['ClaimNumber']}
        Payer_Dashboard.Click ClaimNumber in Outstanding Adjustment page
        Payer_Dashboard.Scroll down to the bottom of Adjustment detail page
        Payer_Dashboard.Verify Change Adjustment amount button is present
        Payer_Dashboard.Click on Change Adjustment Amount Tab
        Payer_Dashboard.Scroll down to the ADJUSTMENT REASON
        Payer_Dashboard.Verify user is able to change the adjustment Amount
        Payer_Dashboard.Click on Change Adjustment Amount Button and click yes button
        Payer_Dashboard.Verify Confirmation PopUp with message
        Payer_Dashboard.Click Go to dashboard button on Confirmation pop up
        LoginPage.Verify Payer Dashboard is visible
#
##Fail due to defect
Test 6 :ProperPay:Communication Portal Payer Dashboard_Verify Confirmation pop up is display when user clicks on 'Yes' button which is present on Deny Adjustment pop up
        [Documentation]    This test case verifies Confirmation pop up is display when user clicks on 'Yes' button which is present on Deny Adjustment pop up
        [Tags]   Functional-TS26_TC_022
        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Claims button
        Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user              ${data_list[0]['ClaimNumber']}
        Payer_Dashboard.Click ClaimNumber in Outstanding Adjustment page
        Payer_Dashboard.Scroll down to the bottom of Adjustment detail page
        Payer_Dashboard.Click on Deny Adjustment Tab and Enter Reason
        Payer_Dashboard.Click on Deny Adjustment Button
        Payer_Dashboard.Click on Yes Button and Verify Confirmation Message
        Payer_Dashboard.Click Go to dashboard button on Confirmation pop up
        LoginPage.Verify Payer Dashboard is visible

Test 7 :ProperPay:Communication Portal Payer Dashboard_Verify "CANCEL Deny Adjustment" functionality.
        [Documentation]    This test case verifies "CANCEL Deny Adjustment" functionality.
        [Tags]   Functional-TS26_TC_023
        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Claims button
        Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user              ${data_list[0]['ClaimNumber']}
        Payer_Dashboard.Click ClaimNumber in Outstanding Adjustment page
        Payer_Dashboard.Scroll down to the bottom of Adjustment detail page
        Payer_Dashboard.Click on Deny Adjustment Tab and Enter Reason
        Payer_Dashboard.Scroll down to the Deny Adjustment Button
        Payer_Dashboard.Click on DenyAdjustment Cancel Button
        Payer_Dashboard.Verify Comments and Authorized eSignature panel is Not displayed

Test 8 :ProperPay:Communication Portal Payer Dashboard_Verify "CANCEL ADJUSTMENT AMOUNT" functionality." functionality
        [Documentation]    This test case verifies CANCEL ADJUSTMENT AMOUNT
        [Tags]   Functional-TS26_TC_013
        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Claims button
        Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user              ${data_list[0]['ClaimNumber']}
        Payer_Dashboard.Click ClaimNumber in Outstanding Adjustment page
        Payer_Dashboard.Scroll down to the bottom of Adjustment detail page
        Payer_Dashboard.Click on Change Adjustment Amount Tab
        Payer_Dashboard.Scroll down to the Change Adjustment Amount Button
        Payer_Dashboard.Click On Change Adjustment Cancel Button
        Payer_Dashboard.Verify Comments and Authorized eSignature panel is Not displayed

#
##AK
Test 9 :ProperPay:Communication Portal Payer Dashboard_Verify "CANCEL APPROVE ADJUSTMENT" functionality
        [Documentation]    This test case verifies CANCEL APPROVE ADJUSTMENT
        [Tags]   Functional-TS26_TC_018
        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Claims button
        Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user              ${data_list[0]['ClaimNumber']}
        Payer_Dashboard.Click ClaimNumber in Outstanding Adjustment page
        Payer_Dashboard.Scroll down to the bottom of Adjustment detail page
        Payer_Dashboard.Click Approve Adjustment button
        Payer_Dashboard.Scroll down to the Approve Adjustment button
        Payer_Dashboard.Click on Approve Adjustment Cancel Button
        Payer_Dashboard.Verify Comments and Authorized eSignature panel is Not displayed














