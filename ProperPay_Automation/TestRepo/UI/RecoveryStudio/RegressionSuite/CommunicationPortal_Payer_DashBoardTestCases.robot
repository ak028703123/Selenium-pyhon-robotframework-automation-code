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

#Test Setup      CommonFunctionality.Launch Communication Portal Page
Test Setup      CommonFunctionality.Launch Cloud Communication Portal Page
#Test Teardown   CommonFunctionality.Finish TestCase

*** Variables ***
${sqlQuery}              ${payerDashabordSqlQuery1}
${sqlQuery2}              ${payerDashabordSqlQuery2}


*** Test Cases ***

#
#Test 1 :ProperPay:Communication Portal Payer Dashboard_Verify user is able to login as Payer
#        [Documentation]    This test case verifies if a user is able to login as a Payer with a valid username and Valid password.
#        [Tags]   Functional-TS26_TC_001
#
#        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#
#Test 2 :ProperPay:Communication Portal Payer Dashboard_Verify user is able to login as Payer
#        [Documentation]    This test case verifies if a user is able to login as a Payer with a valid username and Valid password.
#        [Tags]   Functional-TS26_TC_003
#
#        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Verify Adjustments page is displayed
#
### #Fixed -- Data consumption
#Test 3 :ProperPay:Communication Portal Payer Dashboard_Verify Confirmation pop up is display when user clicks on 'Yes' button which is present on Approve Adjustment pop up
#        [Documentation]    This test case Verify Confirmation pop up is display when user clicks on 'Yes' button which is present on Approve Adjustment pop up.
#        [Tags]   Functional-TS26_TC_017
#
##        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##          LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Verify Data Availability    0
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Verify Adjustments page is displayed
#        Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user           ${data_list[0]['ClaimNumber']}
#
#        Payer_Dashboard.Click ClaimNumber in Outstanding Adjustment page
#        Payer_Dashboard.Scroll down to the bottom of Adjustment detail page
#        Payer_Dashboard.Verify Approve Adjustment button is present
#        Payer_Dashboard.Click Approve Adjustment button
#        Payer_Dashboard.Scroll down to the Approve Adjustment button
#        Payer_Dashboard.Click Approve Adjustment button on Adjustment Approve Form
#        Payer_Dashboard.Verify Confirm Approve Adjustment pop up is displayed
#        Payer_Dashboard.Verify Confirm Approve Adjustment pop up message is displayed
#        Payer_Dashboard.Verify Yes and No button is displayed on Confirm Approve Adjustment pop up
#        Payer_Dashboard.Click Yes on Confirm Approve Adjustment pop up
#        Payer_Dashboard.Verify Confirmation pop up is displayed
#        Payer_Dashboard.Verify Confirmation pop up message is displayed
#        Payer_Dashboard.Verify Go to dashboard button is displayed on Confirmation pop up
#        Payer_Dashboard.Click Go to dashboard button on Confirmation pop up
#        LoginPage.Verify Payer Dashboard is visible
##
###
###
####Fixed
#Test 4:ProperPay:Communication Portal Payer Dashboard_Verify user is able to filter records by providing DAYS SINCE ADJUSTMENT REQUESTED- 1 OR 2 OR 3 OR 4 OR >5
#        [Documentation]    This test case verifies that user is able to filter records by providing DAYS SINCE ADJUSTMENT REQUESTED- 1 OR 2 OR 3 OR 4 OR >5
#        [Tags]   Functional-TS26_TC_031
##        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Verify Data Availability    1
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Click on Filter Icon of Adjustment History
#        Payer_Dashboard.Verify filter Functionality by providing DAYS SINCE ADJUSTMENT REQUESTED
#        Payer_Dashboard.Click on Apply Filter Icon
#        Payer_Dashboard.Verify data after applying filter Functionality by providing DAYS SINCE ADJUSTMENT REQUESTED
###
#Test 5 :ProperPay:Communication Portal Payer Dashboard_Verify User is able to clear the filter result by clicking on Clear Filters button
#        [Documentation]    This test case verifies that user is able to clear the filter result by clicking on Clear Filters button
#        [Tags]   Functional-TS26_TC_032
##        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#         CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Verify Data Availability    1
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Get the first 2 Claimnumber Elements from the Payer dashboard page
#        Payer_Dashboard.Validate filter clearing functionality
#

##Fixed
#Test 6 :ProperPay:Communication Portal Payer Dashboard_Verify User lands on the OutStanding Adjustments Dashboard by default after clicking the "View Claims" button
#        [Documentation]    This test case verifies that User lands on the OutStanding Adjustments Dashboard by default after clicking the "View Claims" button
#        [Tags]   Functional-TS26_TC_004
#
#        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Verify Data Availability    0
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Verify outstanding adjustment tab is selected by default



####FIXED
#Test 7 :ProperPay:Communication Portal Payer Dashboard_Verify user is able to filter records by providing valid Claim Number
#        [Documentation]    This test case verifies that user is able to filter records by providing valid Claim Number
#        [Tags]   Functional-TS26_TC_025
#
##        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Verify Data Availability    1
#
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Click on Filter Icon of Adjustment History
#        Payer_Dashboard.Create dynamic locators for the Claims  ${data_list[0]['ClaimNumber']}  ${data_list[1]['ClaimNumber']}
#        Payer_Dashboard.Verify filter Functionality by providing valid Claim Number   ${data_list[0]['ClaimNumber']}
#        Payer_Dashboard.Click on Apply Filter Icon
#        Payer_Dashboard.Verify data after applying filter Functionality by providing valid Claim Number

######FIXED
#Test 8 :ProperPay:Communication Portal Payer Dashboard_Verify user is able to see all the details once clicked on 'Claim Number'
#        [Documentation]    This test case verifies user is able to see all the details once clicked on 'Claim Number'
#        [Tags]   Functional-TS26_TC_008_01
##        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##        CommonFunctionality.Connect to DB to Read the Test Data for Payer dashboard     ${sqlQuery2}
#         CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data for Payer dashboard     ${sqlQuery2}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Verify Data Availability    0
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user           ${data_list[0]['ClaimNumber']}
#        Payer_Dashboard.Click ClaimNumber in Outstanding Adjustment page
#        Payer_Dashboard.Verify Adjustment details entered is visible in Payer dashboard
#        Payer_Dashboard.Scroll down to the bottom of Adjustment detail page
#        Payer_Dashboard.Verify Change Adjustment amount button is present
#        Payer_Dashboard.Verify Approve Adjustment button is present
#        Payer_Dashboard.Verify Deny Adjustment button is present

# Fixed --  Data consumption
#Test 9 :ProperPay:Communication Portal Payer Dashboard_Verify Confirm Adjustment Change Popup is displayed with the confirm adjustment message with "yes"and "No"Buttons on clicking Change Adjustment Amount Buttton
#        [Documentation]    This test case verifies Confirm Adjustment Change Popup is displayed with the confirm adjustment message with "yes"and "No" Buttons on clicking Change Adjustment Amount Buttton
#        [Tags]   Functional-TS26_TC_011
##        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Verify Data Availability    0
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user              ${data_list[0]['ClaimNumber']}
#        Payer_Dashboard.Click ClaimNumber in Outstanding Adjustment page
#        Payer_Dashboard.Scroll down to the bottom of Adjustment detail page
#        Payer_Dashboard.Click on Change Adjustment Amount Tab
#        Payer_Dashboard.Enter Adjustment reason
#        Payer_Dashboard.Click on Change Adjustment Amount Button
#        Payer_Dashboard.Verify CONFIRM ADJUSTMENT CHANGE pop up

####Fixed
#Test 10 :ProperPay:Communication Portal Payer Dashboard_Verify Confirm Approve Adjustment Popup is displayed with the confirm adjustment message with "yes"and "No"Buttons on clicking Approve Adjustment Buttton
#        [Documentation]    This test case verifies Confirm Approve Adjustment Popup is displayed with the confirm adjustment message with "yes"and "No"Buttons on clicking Approve Adjustment Buttton
#        [Tags]   Functional-TS26_TC_016#
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Verify Data Availability    0
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user              ${data_list[0]['ClaimNumber']}
#        Payer_Dashboard.Click ClaimNumber in Outstanding Adjustment page
#        Payer_Dashboard.Scroll down to the bottom of Adjustment detail page
#        Payer_Dashboard.Click on Approve Adjustment Tab
#        Payer_Dashboard.Click on Approve Adjustment Button
#        Payer_Dashboard.Verify CONFIRM APPROVE ADJUSTMENT pop up

### Fixed
#Test 11 :ProperPay:Communication Portal Payer Dashboard_Verify 'Claim Number' is clickable and other columns are not clickable on the Outstanding Adjustments Tab
#        [Documentation]    This test case verifies Verify 'Claim Number' is clickable and other columns are not clickable on the Outstanding Adjustments Tab
#        [Tags]   Functional-TS26_TC_007
##        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##        CommonFunctionality.Connect to DB to Read the Test Data for Payer dashboard     ${sqlQuery2}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#         CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data for Payer dashboard     ${sqlQuery2}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Verify Data Availability    1
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Verify 'Claim Number' is clickable and other columns are not clickable in Outstanding Adjustment page
#
#####Fixed
#Test 12 :ProperPay:Communication Portal Payer Dashboard_Verify 'Claim Number' is clickable and other columns are not clickable in Adjustment history tab
#        [Documentation]    This test case verifies Verify 'Claim Number' is clickable and other columns are not clickable in Adjustment history tab
#        [Tags]   Functional-TS26_TC_036
#
##        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##        CommonFunctionality.Connect to DB to Read the Test Data for Payer dashboard     ${sqlQuery2}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data for Payer dashboard     ${sqlQuery2}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Verify Data Availability    1
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Click on Adjustment History Button
#        Payer_Dashboard.Verify 'Claim Number' is clickable and other columns are not clickable in Adjustment History page
##
##Fixed
#Test 13 :ProperPay:Communication Portal Payer Dashboard_Verify "Authorized eSignature"tab is displayed after Payer clicks on the "Approve Adjustment" Tab
#        [Documentation]    This test case verifies "Authorized eSignature"tab is displayed after Payer clicks on the "Approve Adjustment" Tab
#        [Tags]   Functional-TS26_TC_014
#
##        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#         Payer_Dashboard.Verify Data Availability    0
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user              ${data_list[0]['ClaimNumber']}
#        Payer_Dashboard.Click ClaimNumber in Outstanding Adjustment page
#        Payer_Dashboard.Scroll down to the bottom of Adjustment detail page
#        Payer_Dashboard.Click on Approve Adjustment Tab
#        Payer_Dashboard.Verify Comments and Authorized eSignature panel is displayed with details for "Approve Adjustment" Tab
#        Payer_Dashboard.Verify Authorized eSignature details are autofilled for "Approve Adjustment" Tab

###Fixed
#Test 14 :ProperPay:Communication Portal Payer Dashboard_After entering required details like Esignature,Date,Title verify the Approve Adjustment Button is enabled
#        [Documentation]    This test case verifies the Approve Adjustment Button is enabled After entering required details like Esignature,Date,Title
#        [Tags]   Functional-TS26_TC_015
#
##         CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#         CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Verify Data Availability    0
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user              ${data_list[0]['ClaimNumber']}
#        Payer_Dashboard.Click ClaimNumber in Outstanding Adjustment page
#        Payer_Dashboard.Scroll down to the bottom of Adjustment detail page
#        Payer_Dashboard.Click on Approve Adjustment Tab
#        Payer_Dashboard.Verify Authorized eSignature details are autofilled for "Approve Adjustment" Tab
#        Payer_Dashboard.Verify Approve Adjustment button is enabled
#
### Fixed
#Test 15 :ProperPay:Communication Portal Payer Dashboard_Verify user is able to filter records by providing valid Audit Number
#        [Documentation]    This test case verifies user is able to filter records by providing valid Audit Number
#        [Tags]   Functional-TS26_TC_026
#
##        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Verify Data Availability    1
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Click on Filter Icon of OUTSTANDING ADJUSTMENTS
#        Payer_Dashboard.Verify filter Functionality by providing Valid Audit Number in Outstanding Adjustment       ${data_list[0]['AuditNumber']}
#        Payer_Dashboard.Click Apply Filter Button in Outstanding Adjustment
#        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#        Payer_Dashboard.Verify data after applying filter Functionality by providing Valid Audit Number in Outstanding Adjustment
##
######Fixed
#Test 16 :ProperPay:Communication Portal Payer Dashboard_Verify user is able to filter records by providing Provider Number
#        [Documentation]    This test case verifies user is able to filter records by providing Provider Number
#        [Tags]   Functional-TS26_TC_029
#
##        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#         CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Verify Data Availability    0
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Click on Filter Icon of OUTSTANDING ADJUSTMENTS
#        Payer_Dashboard.Verify filter Functionality by providing Provider Number in Outstanding Adjustment       ${data_list[0]['BillingProviderNumber']}
#        Payer_Dashboard.Click Apply Filter Button in Outstanding Adjustment
#        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#        Payer_Dashboard.Verify data after applying filter Functionality by providing Provider Number in Outstanding Adjustment
#
#
####Fixed
#Test 17 :ProperPay:Communication Portal Payer Dashboard_Verify Next and Previous button both in Outstanding Adjustments and Adjustment History moves to corresponding Adjustment and Audits
#        [Documentation]    This test case verifies Next and Previous button both in Outstanding Adjustments and Adjustment History moves to corresponding Adjustment and Audits
#        [Tags]   Functional-TS26_TC_038
#        #${MoreThanOneClaimNeeded} = "1"
##        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#         CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Verify Data Availability    1
#        Payer_Dashboard.Click View Claims button
#        #Outstanding Adjustments
#        #Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user           ${data_list[0]['ClaimNumber']}
#        Payer_Dashboard.Get the first 2 Claimnumber Elements from the Payer dashboard page
#        Payer_Dashboard.Get the first 2 Patientnumber Elements from the Outstanding Adjustments dashboard page
#        Payer_Dashboard.Click ClaimNumber1 in Outstanding Adjustment page
#        Payer_Dashboard.Return Patient name locator with patient name passed by user for Payer dashboard
#        Payer_Dashboard.Verify Patient name1
#        Payer_Dashboard.Click Next Request Button
#        #Payer_Dashboard.Return Patient name locator with patient name passed by user for Payer dashboard
#        Payer_Dashboard.Verify next Patient name2
#        Payer_Dashboard.Click Previous Request Button
#        #Payer_Dashboard.Return Patient name locator with patient name passed by user for Payer dashboard
#        Payer_Dashboard.Verify Patient name1
#        #Adjustment History
#        Payer_Dashboard.Click on Outstanding Adjustment Breadcrumbs
#        Payer_Dashboard.Click on Adjustment History Button
#        #Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user             ${data_list[0]['ClaimNumber']}
#        Payer_Dashboard.Get the first 2 Claimnumber Elements from the Payer dashboard page
#        Payer_Dashboard.Get the first 2 Patientnumber Elements from the Adjustments history dashboard page
#        Payer_Dashboard.Click ClaimNumber1 in Adjustment History page
#        Payer_Dashboard.Return Patient name locator with patient name passed by user for Payer dashboard
#        Payer_Dashboard.Verify Patient name1
#        Payer_Dashboard.Click Next Request Button in Adjustment History
#        #Payer_Dashboard.Return Patient name locator with next patient name passed by user for Payer dashboard
#        Payer_Dashboard.Verify next Patient name2
#        Payer_Dashboard.Click Previous Request Button in Adjustment History
#        #Payer_Dashboard.Return Patient name locator with patient name passed by user for Payer dashboard
#         Payer_Dashboard.Verify Patient name1

###Fixed
#Test 18 :ProperPay:Communication Portal Payer Dashboard_Verify user is able to filter records by providing AUDIT STATUS (Adjustment history tab)
#        [Documentation]    This test case verifies user is able to filter records by providing AUDIT STATUS (Adjustment history tab)
#        [Tags]   Functional-TS26_TC_040
#
#        #${MoreThanOneClaimNeeded} = "1"
#
##        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#         CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Verify Data Availability    1
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Click on Adjustment History Button
#        Payer_Dashboard.Click on Filter Icon of Adjustment History
#        Payer_Dashboard.Verify filter Functionality by providing Audit Status in Adjustment history page        ${data_list[0]['AuditStatus']}
#        Payer_Dashboard.Click on Apply Filter button in Adjustment History
#        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#        Payer_Dashboard.Verify data after applying filter Functionality by providing Audit Status in Adjustment History
#
#####Fixed
#Test 19 :ProperPay:Communication Portal Payer Dashboard_validate_Verify user is able to filter records by providing DAYS SINCE ADJUSTMENT REQUESTED- >5
#     [Documentation]    This test case Verifies that user is able to filter records by providing DAYS REMAINING UNTIL DUE DATE - >5
#     [Tags]    Functional-TS01_TC_003_07
#
##        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Verify Data Availability    1
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Click on Filter Icon of Adjustment History
#        Payer_Dashboard.Verify filter Functionality by providing DAYS SINCE ADJUSTMENT REQUESTED - >5
#        Payer_Dashboard.Click on Apply Filter Icon
#        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#        Payer_Dashboard.Verify data after applying filter Functionality by providing DAYS SINCE ADJUSTMENT REQUESTED - >5
#
#
#####Fixed
#Test 20:ProperPay:Communication Portal Payer Dashboard_Verify User is able to see Outstanding Claims, Overview and Monthly Savings Graph
#        [Documentation]    This test case verifies that User is able to see Outstanding Claims, Overview and Monthly Savings Graph
#        [Tags]   Functional-TS26_TC_002
#        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Verify User is able to see Outstanding Claims, Overview and Monthly Savings Graph
######Fixed
#Test 21:ProperPay:Communication Portal Payer Dashboard_Verify On the 'Outstanding adjustment' page verify that the following Columns are displayed
#        [Documentation]    This test case verifies that On the 'Outstanding adjustment' page verify that the following  Columns are displayed
#        [Tags]   Functional-TS26_TC_005
#        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Verify that the following Columns are displayed
##
#####Fixed
#Test 22:ProperPay:Communication Portal Payer Dashboard_Verify "Comments and Authorized eSignature"tab is displayed after Payer clicks on the "Change Adjustment Amount" Tab
#        [Documentation]    This test case verifies that "Comments and Authorized eSignature"tab is displayed after Payer clicks on the "Change Adjustment Amount" Tab
#        [Tags]   Functional-TS26_TC_009
#
##        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#         CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user              ${data_list[0]['ClaimNumber']}
#        Payer_Dashboard.Click ClaimNumber in Outstanding Adjustment page
#        Payer_Dashboard.Scroll down to the bottom of Adjustment detail page
#        Payer_Dashboard.Click on Change Adjustment Amount Tab
#        Payer_Dashboard.Verify Comments and Authorized eSignature panel is displayed with details
#        Payer_Dashboard.Scroll down to the ADJUSTMENT REASON
#        Payer_Dashboard.Verify Authorized eSignature details are autofilled
######Fixed
#Test 23 :ProperPay:Communication Portal Payer Dashboard_Verify the Change Adjustment Amount Button is enabled After entering required details like Comments and PAYER CONFIRM PAY (Optional)
#        [Documentation]    This test case verifies that the Change Adjustment Amount Button is enabled After entering required details like Comments and PAYER CONFIRM PAY (Optional)
#        [Tags]   Functional-TS26_TC_010
#
##        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#         CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user              ${data_list[0]['ClaimNumber']}
#        Payer_Dashboard.Click ClaimNumber in Outstanding Adjustment page
#        Payer_Dashboard.Scroll down to the bottom of Adjustment detail page
#        Payer_Dashboard.Click on Change Adjustment Amount Tab
#        Payer_Dashboard.Scroll down to the ADJUSTMENT REASON
#        Payer_Dashboard.Verify Change Adjustment Amount button is enabled
########FIXED
#Test 24 :ProperPay:Communication Portal Payer Dashboard_Verify user is able to change the adjustment Amount.
#        [Documentation]    This test case verifies user is able to change  the adjustment Amount.
#        [Tags]   Functional-TS26_TC_012
##        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##        CommonFunctionality.Connect to DB to Read the Test Data for Payer dashboard     ${sqlQuery2}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#         CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data for Payer dashboard     ${sqlQuery2}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user              ${data_list[0]['ClaimNumber']}
#        Payer_Dashboard.Click ClaimNumber in Outstanding Adjustment page
#        Payer_Dashboard.Scroll down to the bottom of Adjustment detail page
#        Payer_Dashboard.Verify Change Adjustment amount button is present
#        Payer_Dashboard.Click on Change Adjustment Amount Tab
#        Payer_Dashboard.Scroll down to the ADJUSTMENT REASON
#        Payer_Dashboard.Verify user is able to change the adjustment Amount
#        Payer_Dashboard.Click on Change Adjustment Amount Button and click yes button
#        Payer_Dashboard.Verify Confirmation PopUp with message
#        Payer_Dashboard.Click Go to dashboard button on Confirmation pop up
#        LoginPage.Verify Payer Dashboard is visible

###Fixed -
Test 25 :ProperPay:Communication Portal Payer Dashboard_Verify After entering DENY REASON verify the Deny Adjustment Button is enabled
        [Documentation]    This test case verifies After entering DENY REASON verify the Deny Adjustment Button is enabled
        [Tags]   Functional-TS26_TC_020
#         CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
#         LoginPage.Valid User Login  ${Payer_comm_usr_name}  ${Payer_comm_pass}
          CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
         LoginPage.Verify Payer Dashboard is visible
         Payer_Dashboard.Click View Claims button
         Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user              ${data_list[0]['ClaimNumber']}
         Payer_Dashboard.Click ClaimNumber in Outstanding Adjustment page
         Payer_Dashboard.Scroll down to the bottom of Adjustment detail page
#         Payer_Dashboard.Click on Deny Adjustment Tab and Enter Reason
#         Payer_Dashboard.Verify the Deny Adjustment Button is enabled
####Fixed-- Data consumption
Test 26 :ProperPay:Communication Portal Payer Dashboard_Verify Confirm Deny Adjustment Popup is displayed with the confirm adjustment message with "yes"and "No"Buttons on clicking Deny Adjustment Buttton
        [Documentation]    This test case verifies Confirm Deny Adjustment Popup is displayed with the confirm adjustment message with "yes"and "No"Buttons on clicking Deny Adjustment Buttton
        [Tags]   Functional-TS26_TC_021
#        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
#        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Claims button
        Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user              ${data_list[0]['ClaimNumber']}
        Payer_Dashboard.Click ClaimNumber in Outstanding Adjustment page
        Payer_Dashboard.Scroll down to the bottom of Adjustment detail page
        Payer_Dashboard.Click on Deny Adjustment Tab and Enter Reason
#        Payer_Dashboard.Click on Deny Adjustment Button
#        Payer_Dashboard.Verify CONFIRM DENY ADJUSTMENT Popup
####FIxed - data consumption
#Test 27 :ProperPay:Communication Portal Payer Dashboard_Verify Confirmation pop up is display when user clicks on 'Yes' button which is present on Deny Adjustment pop up
#        [Documentation]    This test case verifies Confirmation pop up is display when user clicks on 'Yes' button which is present on Deny Adjustment pop up
#        [Tags]   Functional-TS26_TC_022
##        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user              ${data_list[0]['ClaimNumber']}
#        Payer_Dashboard.Click ClaimNumber in Outstanding Adjustment page
#        Payer_Dashboard.Scroll down to the bottom of Adjustment detail page
#        Payer_Dashboard.Click on Deny Adjustment Tab and Enter Reason
#        Payer_Dashboard.Click on Deny Adjustment Button
##        Payer_Dashboard.Click on Yes Button and Verify Confirmation Message
##        Payer_Dashboard.Click Go to dashboard button on Confirmation pop up
##        LoginPage.Verify Payer Dashboard is visible
######Fixed
#Test 28 :ProperPay:Communication Portal Payer Dashboard_Verify "CANCEL Deny Adjustment" functionality.
#        [Documentation]    This test case verifies "CANCEL Deny Adjustment" functionality.
#        [Tags]   Functional-TS26_TC_023
##        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user              ${data_list[0]['ClaimNumber']}
#        Payer_Dashboard.Click ClaimNumber in Outstanding Adjustment page
#        Payer_Dashboard.Scroll down to the bottom of Adjustment detail page
#        Payer_Dashboard.Click on Deny Adjustment Tab and Enter Reason
#        Payer_Dashboard.Scroll down to the Deny Adjustment Button
#        Payer_Dashboard.Click on DenyAdjustment Cancel Button
#        Payer_Dashboard.Verify Comments and Authorized eSignature panel is Not displayed
##
######Fixed
#Test 29 :ProperPay:Communication Portal Payer Dashboard_Verify On the 'ADJUSTMENT HISTORY' page verify that the following Columns are displayed
#        [Documentation]    This test case verifies On the 'ADJUSTMENT HISTORY' page verify that the following Columns are displayed
#        [Tags]   Functional-TS26_TC_035
#        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Click on Adjustment History Button
#        Payer_Dashboard.Verify that the following Columns are displayed on Adjustment History Page
##
########Fixed
#Test 30 :ProperPay:Communication Portal Payer Dashboard_Verify filter panel on Outstanding Adjustment page
#        [Documentation]    This test case verifies that filter panel on Outstanding Adjustment page
#        [Tags]   Functional-TS26_TC_024
#        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Click on Filter Icon of OUTSTANDING ADJUSTMENTS
#        Payer_Dashboard.Verify On Outstanding Adjustment page,below filter panel has follwing filter fields
##
#######Fixed
#Test 31:ProperPay:Communication Portal Payer Dashboard_Verify On the 'ADJUSTMENT HISTORY' page verify that the following Columns are displayed
#        [Documentation]    This test case verifies On the 'ADJUSTMENT HISTORY' page verify that the following Columns are displayed
#        [Tags]   Functional-TS26_TC_035
#        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Click on Adjustment History Button
#        Payer_Dashboard.Verify that the following Columns are displayed on Adjustment History Page
####
###
########FIXED
#Test 32 :ProperPay:Communication Portal Payer Dashboard_Verify that user is able to see all the details once clicked on 'Claim Number' on Adjustment history tab
#
#        [Documentation]    This test case verifies that user is able to see all the details once clicked on 'Claim Number' on Adjustment history tab
#        [Tags]   Functional-TS26_TC_037
##        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##        CommonFunctionality.Connect to DB to Read the Test Data for Payer dashboard     ${sqlQuery2}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#          CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data for Payer dashboard     ${sqlQuery2}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Click on Adjustment History Button
#        Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user             ${data_list[0]['ClaimNumber']}
#        Payer_Dashboard.Click ClaimNumber in Adjustment History page
#        Payer_Dashboard.Verify Adjustment details is visible in ADJUSTMENT HISTORY Page
#####Fixed
#Test 33 :ProperPay:Communication Portal Payer Dashboard_Verify filter panel on Outstanding Adjustment page
#        [Documentation]    This test case verifies that filter panel on Adjustment Historypage
#        [Tags]   Functional-TS26_TC_039
#
#        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Click on Adjustment History Button
#        Payer_Dashboard.Click on Filter Icon of Adjustment History
#
#####Fixed
#Test 34 :ProperPay:Communication Portal Payer Dashboard_Verify "Comments and Authorized eSignature" panel is displayed after Payer clicks on the "Deny Adjustment" Tab
#        [Documentation]    This test case verifies "Comments and Authorized eSignature" panel is displayed after Payer clicks on the "Deny Adjustment" Tab
#        [Tags]   Functional-TS26_TC_019
##        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#          CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user             ${data_list[0]['ClaimNumber']}
#        Payer_Dashboard.Click ClaimNumber in Adjustment History page
#        Payer_Dashboard.Scroll down to the bottom of Adjustment detail page
#        Payer_Dashboard.Click on Deny Adjustment Tab and Enter Reason
#        Payer_Dashboard.Verify that Authorized eSignature Panel is displayed
#######Fixed
#Test 35 :ProperPay:Communication Portal Payer Dashboard_Verify Verify User toggles between "Outstanding Adjustments" and "Adjustment History"
#        [Documentation]    This test case verifies User toggles between "Outstanding Adjustments" and "Adjustment History"
#        [Tags]   Functional-TS26_TC_006
#        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Verify outstanding adjustment tab is selected by default
#        Payer_Dashboard.Click on Adjustment History Button
#        Payer_Dashboard.Verify Adjustment History Page is displayed
#        Payer_Dashboard.Click on Outstanding Adjustment Button
#        Payer_Dashboard.Verify Outstanding Adjustment Page is displayed
#
#####Fixed
#Test 36 :ProperPay:Communication Portal Payer Dashboard_Verify "CANCEL ADJUSTMENT AMOUNT" functionality." functionality
#        [Documentation]    This test case verifies CANCEL ADJUSTMENT AMOUNT
#        [Tags]   Functional-TS26_TC_013
##        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user              ${data_list[0]['ClaimNumber']}
#        Payer_Dashboard.Click ClaimNumber in Outstanding Adjustment page
#        Payer_Dashboard.Scroll down to the bottom of Adjustment detail page
#        Payer_Dashboard.Click on Change Adjustment Amount Tab
#        Payer_Dashboard.Scroll down to the Change Adjustment Amount Button
#        Payer_Dashboard.Click On Change Adjustment Cancel Button
#        Payer_Dashboard.Verify Comments and Authorized eSignature panel is Not displayed
#
########FIXED
#Test 37 :ProperPay:Communication Portal Payer Dashboard_Verify User can sort the list of availabe Outstanding Claims based on all the column header displayed.
#        [Documentation]    This test case verifies User can sort the list of availabe Outstanding Claims based on all  the column header displayed.
#        [Tags]   Functional-TS26_TC_033
#        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Double click Claim Number header in Oustanding Adjustment and verify sorting is done in Ascending order
#        Payer_Dashboard.Click Days Since Request header in Oustanding Adjustment and verify sorting is done in Ascending order
#        Payer_Dashboard.Click ADJUSTMENT REQUEST DATE header in Oustanding Adjustment and verify sorting is done in Ascending order
#        Payer_Dashboard.Click Provider Name header in Oustanding Adjustment and verify sorting is done in Ascending order
#        Payer_Dashboard.Click Provider Number header in Oustanding Adjustment and verify sorting is done in Ascending order
#        Payer_Dashboard.Click Audit Status header in Oustanding Adjustment and verify sorting is done in Ascending order
#        Payer_Dashboard.Click Audit Number header in Oustanding Adjustment and verify sorting is done in Ascending order
#        Payer_Dashboard.Click Audit Type header in Oustanding Adjustment and verify sorting is done in Ascending order
#        Payer_Dashboard.Click Identified Savings header in Oustanding Adjustment and verify sorting is done in Ascending order
#        Payer_Dashboard.Click Confirmed Savings header in Oustanding Adjustment and verify sorting is done in Ascending order
##
#######FIXED
#Test 38 :ProperPay:Communication Portal Payer Dashboard_Verify User can sort the list of availabe Adjustment History based on all the column header displayed.
#        [Documentation]    This test case verifies User can sort the list of availabe Adjustment History based on all  the column header displayed.
#        [Tags]   Functional-TS26_TC_041
#        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Verify Data Availability    1
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Click on Adjustment History Button
#        Payer_Dashboard.Double click Claim Number header in Adjustment History and verify sorting is done in Ascending order
#        Payer_Dashboard.Double Click Provider Name header in Oustanding Adjustment and verify sorting is done in Ascending order
#        Payer_Dashboard.Double Click Provider Number header in Oustanding Adjustment and verify sorting is done in Ascending order
#        Payer_Dashboard.Double click Status header in Adjustment History and verify sorting is done in Ascending order
#        Payer_Dashboard.Double click Audit Type in Adjustment History and verify sorting is done in Ascending order
#        Payer_Dashboard.Double click Identified Saving in Adjustment History and verify sorting is done in Ascending order
#        Payer_Dashboard.Double click Confirmed Saving in Adjustment History and verify sorting is done in Ascending order
#        Payer_Dashboard.Double click ADJUSTMENT REQUEST DATE in Adjustment History and verify sorting is done in Ascending order
#        Payer_Dashboard.Double click ADJUSTMENT User in Adjustment History and verify sorting is done in Ascending order
#
#####Fixed
#Test 39 :ProperPay:Communication Portal Payer Dashboard_Verify "CANCEL APPROVE ADJUSTMENT" functionality
#        [Documentation]    This test case verifies CANCEL APPROVE ADJUSTMENT
#        [Tags]   Functional-TS26_TC_018
##        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#          CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user              ${data_list[0]['ClaimNumber']}
#        Payer_Dashboard.Click ClaimNumber in Outstanding Adjustment page
#        Payer_Dashboard.Scroll down to the bottom of Adjustment detail page
#        Payer_Dashboard.Click Approve Adjustment button
#        Payer_Dashboard.Scroll down to the Approve Adjustment button
#        Payer_Dashboard.Click on Approve Adjustment Cancel Button
#        Payer_Dashboard.Verify Comments and Authorized eSignature panel is Not displayed
#
#
###Fixed
#Test 40 :ProperPay:Communication Portal Payer Dashboard_Validate User can view the drop down 'items per page' and it contains 5 by default . Also, user have option to select either 5 or 10 items per page (Both in Outstanding Adjustment and Adjustment History)
#    [Documentation]  This test case verifies User is able to to select 10 as items per page and verfies 10 records are displayed
#    [Tags]  Functional TS26_TC_034
##    CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##    LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#      CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#   LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#    LoginPage.Verify Payer Dashboard is visible
#    Payer_Dashboard.Click View Claims button
#    History.Scroll down to the bottom of Audit History Page
#
#    Payer_Dashboard.Verify the page displays only 10 records by default
#    Payer_Dashboard.Selects Item Per Page as 5          ${Items Per Page_OA}
#
#    Payer_Dashboard.Verify the page displays only 5 records
#    Payer_Dashboard.Click on Adjustment History Button
#    History.Scroll down to the bottom of Audit History Page
#    Payer_Dashboard.Verify the page displays only 10 records by default
#    Payer_Dashboard.Selects Item Per Page as 5          ${Items Per Page_AH}
#    Payer_Dashboard.Verify the page displays only 5 records
#
#Test 41 :ProperPay:Communication Portal Payer Dashboard_Validate Prepay column on Outstanding adjustments
#    [Documentation]  This test case verifies User is able to to sort the prepay column, verify prepay column is not clickable and Apply filter using the Prepay
#    [Tags]   Functional TS27_TC_001
#
##        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##        CommonFunctionality.Connect to DB to Read the Test Data for Payer dashboard     ${sqlQuery2}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${sqlQuery}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data for Payer dashboard     ${sqlQuery2}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Verify Data Availability    0
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Verify 'Claim Number' is clickable and 'PrePay' columns is not clickable in Outstanding Adjustment page
#        Payer_Dashboard.Double click Claim Number header in Oustanding Adjustment and verify sorting is done in Ascending order
#        #Payer_Dashboard.Click Prepay header in Oustanding Adjustment and verify sorting is done in Ascending order #Defect has been raised, once defect is fixed , uncomment this
#        Payer_Dashboard.Click on Filter Icon of Adjustment History
#        Payer_Dashboard.Apply filter Functionality by providing Prepay              'No'
#        Payer_Dashboard.Click on Apply Filter Icon
#        Payer_Dashboard.Verify data after applying filter Functionality by providing Prepay             'No'
#        Payer_Dashboard.Apply filter Functionality by providing Prepay              'Yes'
#        Payer_Dashboard.Click on Apply Filter Icon
#        Payer_Dashboard.Verify data after applying filter Functionality by providing Prepay             'Yes'

#Test 42 :ProperPay: Communication Portal Payer Dashboard verify that Regional Specialty Data report page can be viewed
#    [Documentation]  This test case verifies User is able to view the Regional Specialty Data report
#    [Tags]   Functional TS28_TC_001
#
#        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click on Analytics tab
#        Payer_Dashboard.Verify Analytics Page Is Displayed
#        Payer_Dashboard.Verify the Regional Specialty Data Table Details
#        Payer_Dashboard.Verify clicking on Regional Specialty Data Report View Button Open Regional Specialty Data Report
#


#Test 43 :ProperPay: Communication Portal Payer Dashboard verify that Medical Record Request Summary report page can be viewed
#    [Documentation]  This test case verifies User is able to view the Medical Record Request Summary report
#    [Tags]   Functional TS28_TC_002
#
#        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click on Analytics tab
#        Payer_Dashboard.Verify Analytics Page Is Displayed
#        Payer_Dashboard.Verify the Medical Record Request Summary Table Details
#        Payer_Dashboard.Verify clicking on Medical Record Request Summary View Button Open Medical Record Request Summary Report
#
#
#
#Test 44 :ProperPay: Communication Portal Payer Dashboard verify that Multi Source Claims Comparison report page can be viewed
#    [Documentation]  This test case verifies User is able to view the Multi Source Claims Comparison report
#    [Tags]   Functional TS28_TC_003
#
#        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click on Analytics tab
#        Payer_Dashboard.Verify Analytics Page Is Displayed
#        Payer_Dashboard.Verify the Multi Source Claims Comparison Table Details
#        Payer_Dashboard.Verify clicking on Multi Source Claims Comparison View Button Open Multi Source Claims Comparison Report
#
#
#
#Test 45 :ProperPay: Communication Portal Payer Dashboard verify that Audit Summaries by Errors and Savings report page can be viewed
#    [Documentation]  This test case verifies User is able to view the Audit Summaries by Errors and Savings report
#    [Tags]   Functional TS28_TC_004
#
#        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click on Analytics tab
#        Payer_Dashboard.Verify Analytics Page Is Displayed
#        Payer_Dashboard.Verify the Multi Source Claims Comparison Table Details
#        Payer_Dashboard.Verify clicking on Audit Summaries by Errors and Savings View Button Open Audit Summaries by Errors and Savings Report
#
#
#
#Test 46 :ProperPay: Communication Portal Payer Dashboard verify that Provider Audit Summary By DRG report page can be viewed
#    [Documentation]  This test case verifies User is able to view the Provider Audit Summary By DRG report
#    [Tags]   Functional TS28_TC_005
#
#        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click on Analytics tab
#        Payer_Dashboard.Verify Analytics Page Is Displayed
#        Payer_Dashboard.Verify the Provider Audit Summary By DRG Table Details
#        Payer_Dashboard.Verify clicking on Provider Audit Summary By DRG View Button Open provider Audit Summary Report
#
#
#Test 47 :ProperPay: Communication Portal Payer Dashboard verify that Provider Error Dashboard report page can be viewed
#    [Documentation]  This test case verifies User is able to view the Provider Error Dashboard report
#    [Tags]   Functional TS28_TC_006
#
#        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click on Analytics tab
#        Payer_Dashboard.Verify Analytics Page Is Displayed
#        Payer_Dashboard.Verify the Provider Error Dashboard Table Details
#        Payer_Dashboard.Verify clicking on Provider Error Dashboard View Button Open Provider Error Dashboard Report
#
#
#Test 48 :ProperPay: Communication Portal Payer Dashboard verify that Identified Audit Findings report page can be viewed
#    [Documentation]  This test case verifies User is able to view the Identified Audit Findings report
#    [Tags]   Functional TS28_TC_007
#
#        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click on Analytics tab
#        Payer_Dashboard.Verify Analytics Page Is Displayed
#        Payer_Dashboard.Verify the Identified Audit Findings Table Details
#        Payer_Dashboard.Verify clicking on Identified Audit Findings View Button Open Identified Audit Findings Report
#
#
#Test 49 :ProperPay: Communication Portal Payer Dashboard verify that Medical Record Detailed Summary report page can be viewed
#    [Documentation]  This test case verifies User is able to view the Medical Record Detailed Summary report
#    [Tags]   Functional TS28_TC_008
#
#        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click on Analytics tab
#        Payer_Dashboard.Verify Analytics Page Is Displayed
#        Payer_Dashboard.Verify the Medical Record Detailed Summary Table Details
#        Payer_Dashboard.Verify clicking on Medical Record Detailed Summary View Button Open Medical Record Detailed Summary Report
#
#
#
#Test 50 :ProperPay: Communication Portal Payer Dashboard verify that Claims with DRG Comparison report page can be viewed
#    [Documentation]  This test case verifies User is able to view the Claims with DRG Comparison report
#    [Tags]   Functional TS28_TC_009
#
#        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click on Analytics tab
#        Payer_Dashboard.Verify Analytics Page Is Displayed
#        Payer_Dashboard.Verify the Claims with DRG Comparison Table Details
#        Payer_Dashboard.Verify clicking on Claims with DRG Comparison View Button Open Claims with DRG Comparison Report
#
#Test 51 :ProperPay: Communication Portal Payer Dashboard verify that Analytics page reports can be searched
#    [Documentation]  This test case verifies User is able to search for the desired analytics report using search box
#    [Tags]   Functional TS29_TC_001
#
#        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click on Analytics tab
#        Payer_Dashboard.Verify Analytics Page Is Displayed
#        Payer_Dashboard.Enter the report name in Search box      ${PayerDashboard_Analytics_ReportName}
#        Payer_Dashboard.Verify that searched report is displayed in the search results
#
#Test 52 :ProperPay: Communication Portal Payer Dashboard verify the Adjustment details / summary for Inpatient claims
#    [Documentation]  This test case verifies User is able to search for the desired analytics report using search box
#    [Tags]   Functional TS30_TC_001
##        CommonFunctionality.Connect to DB to Read the Test Data     ${payerDashabordSqlQuery3}
##        CommonFunctionality.Connect to DB to Read the Test Data for Payer dashboard     ${sqlQuery2}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${payerDashabordSqlQuery3}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data for Payer dashboard     ${sqlQuery2}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Verify Data Availability    0
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Verify Adjustments page is displayed
#        Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user           ${data_list[0]['ClaimNumber']}
#        Payer_Dashboard.Click ClaimNumber in Outstanding Adjustment page
#        Payer_Dashboard.Verify the Adjustment Details and Summary in Outstanding adjustment details page for Inpatient record
#
#Test 53 :ProperPay: Communication Portal Payer Dashboard verify the Adjustment details / summary for Outpatient claims
#    [Documentation]  This test case verifies User is able to search for the desired analytics report using search box
#    [Tags]   Functional TS30_TC_002
##        CommonFunctionality.Connect to DB to Read the Test Data     ${payerDashabordSqlQuery4}
##        CommonFunctionality.Connect to DB to Read the Test Data for Outpatient record     ${payerDashabordSqlQuery5}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${payerDashabordSqlQuery4}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data for Outpatient record      ${payerDashabordSqlQuery5}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Verify Data Availability    0
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Verify Adjustments page is displayed
#        Payer_Dashboard.Return ClaimNumber hyperlink locator with Claim number passed by user           ${data_list[0]['ClaimNumber']}
#        Payer_Dashboard.Click ClaimNumber in Outstanding Adjustment page
#        Payer_Dashboard.Verify the Adjustment Details and Summary in Outstanding adjustment details page for Outpatient record
#
#Test 54: ProperPay:Communication Portal Payer Dashboard ExportToExcel_validate_User is able to download the Outstanding Adjustments results using Export To Excel button
#        [Documentation]    This test case Verifies that User is able to download the audit History results using Export To Excel button
#        [Tags]    Functional-TS31_TC_001
#
##        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##        CommonFunctionality.Connect to DB to Read the Test Data for Payer dashboard     ${sqlQuery2}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${payerDashabordSqlQuery3}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data for Payer dashboard     ${sqlQuery2}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Verify Data Availability    0
#        Payer_Dashboard.Get the Number of claims on Outstanding Claims Page
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Click Export Audit
#        CommonFunctionality.Read from Excel           ${OutstandingAdjustmentDownloadedExcelPath}
#        Payer_Dashboard.Verify the columns in the downloaded export
#        Payer_Dashboard.Verify the record in the downloaded export for Outstanding Adjustment Page
#
#
#Test 55: ProperPay:Communication Portal Payer Dashboard ExportToExcel_validate_User is able to download the Outstanding Adjustments History results using Export To Excel button
#        [Documentation]    This test case Verifies that User is able to download the audit History results using Export To Excel button
#        [Tags]    Functional-TS31_TC_002
#
##        CommonFunctionality.Connect to DB to Read the Test Data     ${sqlQuery}
##        CommonFunctionality.Connect to DB to Read the Test Data for Payer dashboard     ${sqlQuery2}
##        LoginPage.Valid User Login  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${payerDashabordSqlQuery3}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data for Payer dashboard     ${sqlQuery2}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Verify Data Availability    0
#        Payer_Dashboard.Get the Number of claims on Outstanding Claims Page
#        Payer_Dashboard.Click View Claims button
#        Payer_Dashboard.Click on Adjustment History Button
#        Payer_Dashboard.Fetch the First Record in AdjustMentHistoryPage
#        Payer_Dashboard.Click Export Audit
#        CommonFunctionality.Read from Excel           ${AdjustmentHistoryDownloadedExcelPath}
#        Payer_Dashboard.Verify the columns in the downloaded export of AdjustmentHistory Page
#        Payer_Dashboard.Verify the record in the downloaded export for Adjustment History Page
#
#Test 56: ProperPay:Communication Portal Payer Dashboard Final Level Appeals History Page UI
#        [Documentation]    This test case Verifies the Final Level Appeal History page UI
#        [Tags]    Functional-TS32_TC_001
#
##        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${finalAppealsSqlQuery}
##        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${finalAppealsSqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click View Final Level Appeals
#        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
#        Payer_Dashboard.Click Final Appeals History page
#        Payer_Dashboard.Verify Final Level Appeals History Page Is Displayed
#        CommonFunctionality.Wait Untill Page Loads
#        Payer_Dashboard.Click on Filter Icon of Adjustment History
#        Payer_Dashboard.Verify filter Functionality by providing Claim Number in Final Appeal History Page      ${data_list[0]['ClaimNumber']}
#        Payer_Dashboard.Click Apply Filter Button in Final Appeal History Page
#        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#        CommonFunctionality.Wait Untill Page Loads
#        Payer_Dashboard.Validate the Final Appeal Details
#
###
#Test 57: ProperPay:Communication Portal Payer Dashboard Final Level Appeals History Page Verify Filter functionality based on Claim Number
#        [Documentation]    This test case Verifies the Final Level Appeal History page Claim Number filter functionality
#        [Tags]    Functional-TS33_TC_001
##        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${finalAppealsSqlQuery}
##        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#         CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${finalAppealsSqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click View Final Level Appeals
#        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
#        Payer_Dashboard.Click Final Appeals History page
#        Payer_Dashboard.Verify Final Level Appeals History Page Is Displayed
#        CommonFunctionality.Wait Untill Page Loads
#        Payer_Dashboard.Click on Filter Icon of Adjustment History
#        Payer_Dashboard.Verify filter Functionality by providing Claim Number in Final Appeal History Page      ${data_list[0]['ClaimNumber']}
#        Payer_Dashboard.Click Apply Filter Button in Final Appeal History Page
#        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
#        CommonFunctionality.Wait Untill Page Loads
#        Payer_Dashboard.Verify data after applying filter Functionality by providing Claim Number in Final Appeal History Page

#
#
Test 58 :ProperPay:Communication Portal Payer Dashboard_FinalAppealHistory page Verify user is able to filter records by providing Provider Number
        [Documentation]    This test case verifies user is able to filter records by providing Provider Number in FinalAppealHistory page
        [Tags]   Functional-TS33_TC_002
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${finalAppealsSqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
         CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${finalAppealsSqlQuery}
        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Final Level Appeals
        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
        Payer_Dashboard.Click Final Appeals History page
        Payer_Dashboard.Verify Final Level Appeals History Page Is Displayed
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Click on Filter Icon of Adjustment History
        Payer_Dashboard.Verify filter Functionality by providing Provider Number in Final Appeal History Page      ${data_list[0]['BillingProviderNumber']}
        Payer_Dashboard.Click Apply Filter Button in Final Appeal History Page
        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Verify data after applying filter Functionality by providing Provider Number in Final Appeal History Page


Test 59 :ProperPay:Communication Portal Payer Dashboard_FinalAppealHistory page Verify user is able to filter records by providing Audit Number
        [Documentation]    This test case verifies user is able to filter records by providing Audit Number FinalAppealHistory page
        [Tags]   Functional-TS33_TC_003
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${finalAppealsSqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${finalAppealsSqlQuery}
        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Final Level Appeals
        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
        Payer_Dashboard.Click Final Appeals History page
        Payer_Dashboard.Verify Final Level Appeals History Page Is Displayed
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Click on Filter Icon of Adjustment History
        Payer_Dashboard.Verify filter Functionality by providing Audit Number in Final Appeal History Page      ${data_list[0]['AuditNumber']}
        Payer_Dashboard.Click Apply Filter Button in Final Appeal History Page
        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Verify data after applying filter Functionality by providing Audit Number in Final Appeal History Page


est 60 :ProperPay:Communication Portal Payer Dashboard_FinalAppealHistory page Verify user is able to filter records by providing Prepay
        [Documentation]    This test case verifies user is able to filter records by providing Prepay FinalAppealHistory page
        [Tags]   Functional-TS33_TC_004
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${finalAppealsSqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${finalAppealsSqlQuery}
        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Final Level Appeals
        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
        Payer_Dashboard.Click Final Appeals History page
        Payer_Dashboard.Verify Final Level Appeals History Page Is Displayed
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Click on Filter Icon of Adjustment History
        Payer_Dashboard.Apply filter Functionality by providing Prepay              'No'
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Click Apply Filter Button in Final Appeal History Page
        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Verify data after applying filter Functionality by providing Prepay As No
        Payer_Dashboard.Apply filter Functionality by providing Prepay              'Yes'
        Payer_Dashboard.Click Apply Filter Button in Final Appeal History Page
        CommonFunctionality.Wait Untill Page Loads
        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
        Payer_Dashboard.Verify data after applying filter Functionality by providing Prepay As Yes



Test 61 :ProperPay:Communication Portal Payer Dashboard_FinalAppealHistory page Verify user is able to filter Final Appeals by providing Claim Type
        [Documentation]    This test case verifies user is able to filter Final Appeals by providing Claim Type in FinalAppealHistory page
        [Tags]   Functional-TS33_TC_005
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${finalAppealsSqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${finalAppealsSqlQuery}
        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Final Level Appeals
        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
        Payer_Dashboard.Click Final Appeals History page
        Payer_Dashboard.Verify Final Level Appeals History Page Is Displayed
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Click on Filter Icon of Adjustment History
        Payer_Dashboard.Apply filter Functionality by providing ClaimType as         'Inpatient'
        Payer_Dashboard.Click Apply Filter Button in Final Appeal History Page
        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Verify data after applying filter Functionality by providing ClaimType

Test 62 :ProperPay:Communication Portal Payer Dashboard_FinalAppealHistory page Verify user is able to clear filter
        [Documentation]    This test case verifies user is able to clear filter in FinalAppealHistory page
        [Tags]   Functional-TS33_TC_006
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${finalAppealsSqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${finalAppealsSqlQuery}
        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Final Level Appeals
        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
        Payer_Dashboard.Click Final Appeals History page
        Payer_Dashboard.Verify Final Level Appeals History Page Is Displayed
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Get the number of records on Final Appeals first page
        Payer_Dashboard.Click on Filter Icon of Adjustment History
        Payer_Dashboard.Verify filter Functionality by providing Audit Number in Final Appeal History Page      ${data_list[0]['AuditNumber']}
        Payer_Dashboard.Click Apply Filter Button in Final Appeal History Page
        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Verify data after applying filter Functionality by providing Audit Number in Final Appeal History Page
        Payer_Dashboard.click Clear Filter button in Final Appeal History page
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Verify the records in Final Appeal page after clearing filter


Test 63: ProperPay:Communication Portal Payer Dashboard ExportToExcel_validate_User is able to download the Final Appeals History results using Export To Excel button
        [Documentation]    This test case Verifies that User is able to download the Final Appeals History results using Export To Excel button
        [Tags]    Functional-TS34_TC_001
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${finalAppealsSqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${finalAppealsSqlQuery}
        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Final Level Appeals
        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
        Payer_Dashboard.Click Final Appeals History page
        Payer_Dashboard.Verify Final Level Appeals History Page Is Displayed
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Fetch the First Record in FinalAppealHistoryPage
        Payer_Dashboard.Click Export Audit
        CommonFunctionality.Read from Excel           ${FinalAppealsHistoryDownloadedExcelPath}
        Payer_Dashboard.Verify the columns in the downloaded export of Final Appeal Page
        Payer_Dashboard.Verify the record in the downloaded export for Final Appeal Page

Test 64 :ProperPay:Communication Portal Payer Dashboard_Verify User can sort the list of availabe Final Appeals History based on all the column header displayed.
        [Documentation]    This test case verifies User can sort the list of availabe Final Appeals History based on all  the column header displayed.
        [Tags]   Functional-TS35_TC_01
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${finalAppealsSqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${finalAppealsSqlQuery}
        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Final Level Appeals
        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
        Payer_Dashboard.Click Final Appeals History page
        Payer_Dashboard.Verify Final Level Appeals History Page Is Displayed
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Double Click Claim Number header in Payer dashboard Final Appeals History and verify sorting is done in Ascending order
        Payer_Dashboard.Double Click Prepay header in Payer dashboard Final Appeals History and verify sorting is done in Ascending order
        Payer_Dashboard.Double Click Provider Name header in Payer dashboard Final Appeals History and verify sorting is done in Ascending order
        Payer_Dashboard.Double Click Provider Number header in Payer dashboard Final Appeals History and verify sorting is done in Ascending order
        Payer_Dashboard.Double Click Audit Status header in Payer dashboard Final Appeals History and verify sorting is done in Ascending order
        Payer_Dashboard.Double Click Audit Number header in Payer dashboard Final Appeals History and verify sorting is done in Ascending order
        Payer_Dashboard.Double Click Audit Type header in Payer dashboard Final Appeals History and verify sorting is done in Ascending order
        Payer_Dashboard.Double Click IdentifiedSavings header in Payer dashboard Final Appeals History and verify sorting is done in Ascending order
        Payer_Dashboard.Double Click Division Code header in Payer dashboard Final Appeals History and verify sorting is done in Ascending order
        Payer_Dashboard.Double Click Initial Findings header in Payer dashboard Final Appeals History and verify sorting is done in Ascending order
##### Not done
#Test 65 :ProperPay:Communication Portal Payer Dashboard_Final Appeals History page Verify the pagination links
#        [Documentation]    This test case verifies User can navigate through Final Appeal History pages
#        [Tags]   Functional-TS36_TC_01
#        Payer_Dashboard.Connect to Db with more than 10 records         ${payerDashabordPaginationQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click View Final Level Appeals
#        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
#        Payer_Dashboard.Click Final Appeals History page
#        Payer_Dashboard.Verify Final Level Appeals History Page Is Displayed
#        CommonFunctionality.Wait Untill Page Loads
#        RecordAnalyst_Dashboard.Verify that only 10 records per page are displayed
#        Payer_Dashboard.Verify clicking on Next displays next page
#        Payer_Dashboard.Verify clicking on Previous displays previous page

Test 66 :ProperPay:Communication Portal Payer Dashboard_Verify Final Level Appeal History Details page for Inpatient Audits.
        [Documentation]    This test case verifies Final Level Appeal History Details page for Inpatient Appeal
        [Tags]   Functional-TS37_TC_01
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${IPfinalAppealsSqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${IPfinalAppealsSqlQuery}
        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Final Level Appeals
        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
        Payer_Dashboard.Click Final Appeals History page
        Payer_Dashboard.Verify Final Level Appeals History Page Is Displayed
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Return Final Appeal History ClaimNumber hyperlink locator with Claim number passed by user     ${data_list[0]['ClaimNumber']}
        Payer_Dashboard.Click ClaimNumber in Final Appeals page
        Payer_Dashboard.Verify Final Appeal History Details page is displayed
        Payer_Dashboard.Verify the Details related to Inpatient Appeal are displayed
#
Test 67 :ProperPay:Communication Portal Payer Dashboard_Verify Final Level Appeal History Details page for Outpatient Audits.
        [Documentation]    This test case verifies Final Level Appeal History Details page for Outpatient Audits
        [Tags]   Functional-TS38_TC_01
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${OPfinalAppealsSqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        CommonFunctionality.Connect to Cloud DB to Read the Test Data According to TestData Avaialablity        ${OPfinalAppealsSqlQuery}
        LoginPage.Valid User Login According to Test Data Availability      ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Final Level Appeals
        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
        Payer_Dashboard.Click Final Appeals History page
        Payer_Dashboard.Verify Final Level Appeals History Page Is Displayed
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Return Final Appeal History ClaimNumber hyperlink locator with Claim number passed by user     ${data_list[0]['ClaimNumber']}
        Payer_Dashboard.Click ClaimNumber in Final Appeals page
        Payer_Dashboard.Verify Final Appeal History Details page is displayed
        Payer_Dashboard.Verify the Details related to Outpatient Appeal are displayed

Test 67: ProperPay:Communication Portal Payer Dashboard Outstanding Final Level AppealsPage UI
        [Documentation]    This test case Verifies the Outstanding Final Level AppealsPage UI
        [Tags]    Functional-TS39_TC_001

#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${OutstandingfinalAppealsSqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${OutstandingfinalAppealsSqlQuery}
        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Final Level Appeals
        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Click on Filter Icon of Adjustment History
        Payer_Dashboard.Verify filter Functionality by providing Claim Number in Outstanding Final Appeal Page      ${data_list[0]['ClaimNumber']}
        Payer_Dashboard.Click Apply Filter Button In Outstanding Final Appeals Page
        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Validate the Final Appeal Details Outstanding Final Level AppealsPage UI


Test 68: ProperPay:Communication Portal Payer Dashboard Outstanding Final Level Appeals Page Verify Filter functionality based on Claim Number
        [Documentation]    This test case Verifies the Outstanding Final Level Appeals page Claim Number filter functionality
        [Tags]    Functional-TS40_TC_001
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${OutstandingfinalAppealsSqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
         CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${OutstandingfinalAppealsSqlQuery}
        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Final Level Appeals
        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Click on Filter Icon of Adjustment History
        Payer_Dashboard.Verify filter Functionality by providing Claim Number in Outstanding Final Appeal Page      ${data_list[0]['ClaimNumber']}
        Payer_Dashboard.Click Apply Filter Button in Outstanding Final Appeals Page
        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Verify data after applying filter Functionality by providing Claim Number in Outstanding Final Level Appeals Page


Test 69 :ProperPay:Communication Portal Payer Dashboard_Outstanding Final Level Appeals page Verify user is able to filter records by providing Audit Number
        [Documentation]    This test case verifies user is able to filter records by providing Audit Number Outstanding Final Level Appeals page
        [Tags]   Functional-TS40_TC_002
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${OutstandingfinalAppealsSqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
         CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${OutstandingfinalAppealsSqlQuery}
        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Final Level Appeals
        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Click on Filter Icon of Adjustment History
        Payer_Dashboard.Verify filter Functionality by providing Audit Number in Outstanding Final Appeal Page      ${data_list[0]['AuditNumber']}
        Payer_Dashboard.Click Apply Filter Button in Outstanding Final Appeals Page
        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Verify data after applying filter Functionality by providing Audit Number in Outstanding Final Appeal Page


Test 70 :ProperPay:Communication Portal Payer Dashboard_Outstanding Final Appeal page Verify user is able to filter records by providing Prepay
        [Documentation]    This test case verifies user is able to filter records by providing Prepay Outstanding Final Appeal page
        [Tags]   Functional-TS40_TC_003
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${OutstandingfinalAppealsSqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
         CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${OutstandingfinalAppealsSqlQuery}
        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Final Level Appeals
        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Click on Filter Icon of Adjustment History
        Payer_Dashboard.Apply filter Functionality by providing Prepay              'No'
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Click Apply Filter Button in Outstanding Final Appeals Page
        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Verify data after applying filter Functionality by providing Prepay As No
        Payer_Dashboard.Apply filter Functionality by providing Prepay              'Yes'
        Payer_Dashboard.Click Apply Filter Button in Outstanding Final Appeals Page
        CommonFunctionality.Wait Untill Page Loads
        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
        Payer_Dashboard.Verify data after applying filter Functionality by providing Prepay As Yes


Test 71 :ProperPay:Communication Portal Payer Dashboard_FinalAppealHistory page Verify user is able to filter Final Appeals by providing Claim Type
        [Documentation]    This test case verifies user is able to filter Final Appeals by providing Claim Type in FinalAppealHistory page
        [Tags]   Functional-TS40_TC_004
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${IPOutstandingfinalAppealsSqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
         CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${OutstandingfinalAppealsSqlQuery}
        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Final Level Appeals
        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Click on Filter Icon of Adjustment History
        Payer_Dashboard.Apply filter Functionality by providing ClaimType as         'Inpatient'
        Payer_Dashboard.Click Apply Filter Button in Outstanding Final Appeals Page
        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Verify data after applying filter Functionality by providing ClaimType in Outstanding Final Appeal Page


Test 72 :ProperPay:Communication Portal Payer Dashboard_Outstanding Final Appeal page Verify user is able to filter records by providing Provider Number
        [Documentation]    This test case verifies user is able to filter records by providing Provider Number in Outstanding Final Appeal page
        [Tags]   Functional-TS40_TC_005
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${OutstandingfinalAppealsSqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
         CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${OutstandingfinalAppealsSqlQuery}
        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Final Level Appeals
        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Click on Filter Icon of Adjustment History
        Payer_Dashboard.Verify filter Functionality by providing Provider Number      ${data_list[0]['BillingProviderNumber']}
        Payer_Dashboard.Click Apply Filter Button in Outstanding Final Appeals Page
        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Verify Data After Applying Filter Functionality By Providing Provider Number In Outstanding Final Level Appeals Page


Test 73 :ProperPay:Communication Portal Payer Dashboard_Outstanding Final Appeal page Verify user is able to filter records by providing Medical Record Number
        [Documentation]    This test case verifies user is able to filter records by providing Medical Record Number in Outstanding Final Appeal page
        [Tags]   Functional-TS40_TC_006
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${OutstandingfinalAppealsSqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
         CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${OutstandingfinalAppealsSqlQuery}
        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Final Level Appeals
        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Click on Filter Icon of Adjustment History
        Payer_Dashboard.Verify filter Functionality by providing valid Medical Record Number      ${data_list[0]['MRNumber']}
        Payer_Dashboard.Click Apply Filter Button in Outstanding Final Appeals Page
        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Verify Data After Applying Filter Functionality By Providing Medical Record Number In Outstanding Final Level Appeals Page

Test 74: ProperPay:Communication Portal Payer Dashboard Outstanding Final Level Appeals Page Verify user is able to Clear Filter.
        [Documentation]    This test case Verifies the Outstanding Final Level Appeals page verify clear filter functionality
        [Tags]    Functional-TS40_TC_007
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${OutstandingfinalAppealsSqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
         CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${OutstandingfinalAppealsSqlQuery}
        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Final Level Appeals
        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Get the number of records on Final Appeals first page
        Payer_Dashboard.Click on Filter Icon of Adjustment History
        Payer_Dashboard.Verify filter Functionality by providing Claim Number in Outstanding Final Appeal Page      ${data_list[0]['ClaimNumber']}
        Payer_Dashboard.Click Apply Filter Button in Outstanding Final Appeals Page
        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Verify data after applying filter Functionality by providing Claim Number in Outstanding Final Level Appeals Page
        Payer_Dashboard.click Clear Filter button in Outstanding Final Appeal page
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Verify the records in Final Appeal page after clearing filter
##### not done
#Test 75 :ProperPay:Communication Portal Payer Dashboard_Final Appeals Outtanding Appeals page Verify the pagination links
#        [Documentation]    This test case verifies User can navigate through Outstanding Final Appeal pages
#        [Tags]   Functional-TS41_TC_01
#        Payer_Dashboard.Connect to Db with more than 10 records         ${OutstandingfinalAppealsSqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
#        LoginPage.Verify Payer Dashboard is visible
#        Payer_Dashboard.Click View Final Level Appeals
#        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
#        CommonFunctionality.Wait Untill Page Loads
#        RecordAnalyst_Dashboard.Verify that only 10 records per page are displayed
#        Payer_Dashboard.Verify clicking on Next displays next page
#        Payer_Dashboard.Verify clicking on Previous displays previous page

Test 76: ProperPay:Communication Portal Payer Dashboard ExportToExcel_validate_User is able to download the Final Appeals History results using Export To Excel button
        [Documentation]    This test case Verifies that User is able to download the Final Appeals History results using Export To Excel button
        [Tags]    Functional-TS42_TC_001
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${OutstandingfinalAppealsSqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
         CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${OutstandingfinalAppealsSqlQuery}
        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Final Level Appeals
        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Fetch the First Record in FinalAppealHistoryPage
        Payer_Dashboard.Click Export Audit
        CommonFunctionality.Read from Excel           ${OutstandingFinalAppealDownloadedExcelPath}
        Payer_Dashboard.Verify the columns in the downloaded export of Final Appeal Page
        Payer_Dashboard.Verify the record in the downloaded export for Final Appeal Page

Test 79 :ProperPay:Communication Portal Payer Dashboard_Verify User can sort the list of availabe Final Appeals History based on all the column header displayed.
        [Documentation]    This test case verifies User can sort the list of availabe Final Appeals History based on all  the column header displayed.
        [Tags]   Functional-TS46_TC_01
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${finalAppealsSqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
         CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${finalAppealsSqlQuery}
        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Final Level Appeals
        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Double Click Claim Number header in Payer dashboard Outstanding Final Appeals page and verify sorting is done in Ascending order
        Payer_Dashboard.Double Click Prepay header in Payer dashboard Outstanding Final Appeals page and verify sorting is done in Ascending order
        Payer_Dashboard.Double Click Provider Name header in Payer dashboard Outstanding Final Appeals page and verify sorting is done in Ascending order
        Payer_Dashboard.Double Click Provider Number header in Payer dashboard Outstanding Final Appeals page and verify sorting is done in Ascending order
        Payer_Dashboard.Double Click Audit Status header in Payer dashboard Outstanding Final Appeals page and verify sorting is done in Ascending order
        Payer_Dashboard.Double Click Audit Number header in Payer dashboard Outstanding Final Appeals page and verify sorting is done in Ascending order
        Payer_Dashboard.Double Click Audit Type header in Payer dashboard Outstanding Final Appeals page and verify sorting is done in Ascending order
        Payer_Dashboard.Double Click IdentifiedSavings header in Payer dashboard Outstanding Final Appeals page and verify sorting is done in Ascending order
        Payer_Dashboard.Double Click Division Code header in Payer dashboard Outstanding Final Appeals page and verify sorting is done in Ascending order
#        Payer_Dashboard.Double Click Initial Findings header in Payer dashboard Outstanding Final Appeals page and verify sorting is done in Ascending order


Test 77: ProperPay:Communication Portal Payer Dashboard Outstanding Final Appeal Verify user is able to uphold Final appeal
        [Documentation]    This test case Verifies that User is able to uphold Final appeal from Outstanding Final Appeal page
        [Tags]    Functional-TS43_TC_001
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${OutstandingfinalAppealsSqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${OutstandingfinalAppealsSqlQuery}
        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Final Level Appeals
        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Click on Filter Icon of Adjustment History
        Payer_Dashboard.Verify filter Functionality by providing Claim Number in Outstanding Final Appeal Page      ${data_list[0]['ClaimNumber']}
        Payer_Dashboard.Click Apply Filter Button In Outstanding Final Appeals Page
        CommonFunctionality.Wait Untill Page Loads
        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
        Payer_Dashboard.Return Outstanding Final Appeal ClaimNumber hyperlink locator with Claim number passed by user     ${data_list[0]['ClaimNumber']}
        Payer_Dashboard.Click ClaimNumber in Final Appeals page
        Payer_Dashboard.Verify Outstanding Final Appeal Details page is displayed
        Payer_Dashboard.Click Uphold Appeal Button
        Payer_Dashboard.Verify the fields related to Upholding an appeal are displayed
        Payer_Dashboard.Verify Authorized eSignature details are autofilled for "Uphold Final Decision" Section
        Payer_Dashboard.Verify clicking on 'Cancel' close the Autorized esignature details section
        Payer_Dashboard.Verify clicking on 'Uphold Final Appeals' displays 'Confirm Uphold Final Appeal' pop up window
        Payer_Dashboard.Verify 'Confirm Uphold Final Appeal' pop up window details
        Payer_Dashboard.Verify clicking on No in 'Confirm Uphold Final Appeal' pop up closes the window
        Payer_Dashboard.Verify Clicking On Yes In 'Confirm Uphold Final Appeal' Pop Up Displays Confirmation Message Pop Up
        Payer_Dashboard.Verify Uphold Confirmation pop up window details
        Payer_Dashboard.Verify clicking on 'Go To Dashboard' displays the Home page
        Payer_Dashboard.Verify that the appeal is not displayed in the Outstanding Final Appeal page
        Payer_Dashboard.Return Outstanding Final Appeal ClaimNumber hyperlink locator with Claim number passed by user     ${data_list[0]['ClaimNumber']}        Payer_Dashboard.Verify that the upheld appeal is displayed in the Final Appeal History page with updated status


Test 78: ProperPay:Communication Portal Payer Dashboard Outstanding Final Appeal Verify user is able to Reverse Final appeal
        [Documentation]    This test case Verifies that User is able to Reverse Final appeal from Outstanding Final Appeal page
        [Tags]    Functional-TS44_TC_001
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${OutstandingfinalAppealsSqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${OutstandingfinalAppealsSqlQuery}
        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Final Level Appeals
        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Click on Filter Icon of Adjustment History
        Payer_Dashboard.Verify filter Functionality by providing Claim Number in Outstanding Final Appeal Page      ${data_list[0]['ClaimNumber']}
        Payer_Dashboard.Click Apply Filter Button In Outstanding Final Appeals Page
        CommonFunctionality.Wait Untill Page Loads
        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
        Payer_Dashboard.Return Outstanding Final Appeal ClaimNumber hyperlink locator with Claim number passed by user     ${data_list[0]['ClaimNumber']}
        Payer_Dashboard.Click ClaimNumber in Final Appeals page
        Payer_Dashboard.Verify Outstanding Final Appeal Details page is displayed
        Payer_Dashboard.Click Reverse Appeal Button
        Payer_Dashboard.Verify the fields related to Reverse appeal are displayed
        Payer_Dashboard.Verify Authorized eSignature details are autofilled for "Reverse Final Decision" Section
        Payer_Dashboard.Verify clicking on 'Cancel' close the Reverse appeal Autorized esignature details section
        Payer_Dashboard.Verify clicking on 'Reverse Final Appeal' displays 'Confirm Reverse Final Appeal' pop up window
        Payer_Dashboard.Verify 'Confirm Reverse Final Appeal' pop up window details
        Payer_Dashboard.Verify clicking on No in 'Confirm Reverse Final Appeal' pop up closes the window
        Payer_Dashboard.Verify clicking on Yes in 'Confirm Reverse Final Appeal' pop up displays Confirmation Message pop up
        Payer_Dashboard.Verify Reverse Confirmation pop up window details
        Payer_Dashboard.Verify clicking on 'Go To Dashboard' displays the Home page
        Payer_Dashboard.Verify that the appeal is not displayed in the Outstanding Final Appeal page
        Payer_Dashboard.Verify that the reversed appeal is displayed in the Final Appeal History page with updated status


Test 79: ProperPay:Communication Portal Payer Dashboard Outstanding Final Appeal Verify user is able to Modify Final appeal
        [Documentation]    This test case Verifies that User is able to Modify Final appeal from Outstanding Appeal page
        [Tags]    Functional-TS45_TC_001
#        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${OutstandingfinalAppealsSqlQuery}
#        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        CommonFunctionality.Connect to DB to Read the Test Data According to TestData Avaialablity     ${OutstandingfinalAppealsSqlQuery}
        LoginPage.Valid User Login According to Test Data Availability  ${Payer_comm_usr_name}   ${Payer_comm_pass}
        LoginPage.Verify Payer Dashboard is visible
        Payer_Dashboard.Click View Final Level Appeals
        Payer_Dashboard.Verify Outstanding Final Level Appeals Page Is Displayed
        CommonFunctionality.Wait Untill Page Loads
        Payer_Dashboard.Click on Filter Icon of Adjustment History
        Payer_Dashboard.Verify filter Functionality by providing Claim Number in Outstanding Final Appeal Page      ${data_list[0]['ClaimNumber']}
        Payer_Dashboard.Click Apply Filter Button In Outstanding Final Appeals Page
        CommonFunctionality.Wait Untill Page Loads
        BillingAnalyst_Dashboard.Scroll down to the bottom of Audit result page
        Payer_Dashboard.Return Outstanding Final Appeal ClaimNumber hyperlink locator with Claim number passed by user     ${data_list[0]['ClaimNumber']}
        Payer_Dashboard.Click ClaimNumber in Final Appeals page
        Payer_Dashboard.Verify Outstanding Final Appeal Details page is displayed
        Payer_Dashboard.Click Modify Appeal Button
        Payer_Dashboard.Verify the fields related to Modify appeal are displayed on clicking Modify Appeal
        Payer_Dashboard.Verify Authorized eSignature details are autofilled for "Modify Final Decision" Section
        Payer_Dashboard.Verify clicking on 'Cancel' close the Modify appeal Comments And Esignature details section
        Payer_Dashboard.Update Payer Confirmed Pay in Modify Final Appeal section
        Payer_Dashboard.Verify clicking on 'Modify Final Appeal' displays 'Confirm Modify Final Appeal' pop up window
        Payer_Dashboard.Verify 'Confirm Modify Final Appeal' pop up window details
        Payer_Dashboard.Verify clicking on No in 'Confirm Modify Final Appeal' pop up closes the window
        Payer_Dashboard.Verify clicking on Yes in 'Confirm Modify Final Appeal' pop up displays Confirmation Message pop up
        Payer_Dashboard.Verify Modify Confirmation pop up window details
        Payer_Dashboard.Verify clicking on 'Go To Dashboard' displays the Home page
        Payer_Dashboard.Verify that appeal is not displayed in the Outstanding Final Appeal page
        Payer_Dashboard.Verify that the Modified appeal is displayed in the Final Appeal History page with updated status








