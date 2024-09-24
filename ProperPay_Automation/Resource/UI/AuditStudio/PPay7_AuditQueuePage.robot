*** Settings ***
Documentation    Script to Test ppay 7
Library    SeleniumLibrary
Library    Easter
Library    String
Library    Collections
Library    DateTime
Variables    ..//ProperPay_Automation//ElementsLocator//UI//AuditStudio//PPay7_AuditQueuePage_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//AuditStudio//PPay7_AuditQueuePage_TestData.yaml

*** Keywords ***

Finish TestCase
    Close Browser

Click Audit Queue icon in hamburger menu
    Wait Until Element Is Visible  ${PPay7_AuditQueuePage_AuditQueue_HamburgerIcon_Locator}       timeout=20
    Element Should Be Visible    ${PPay7_AuditQueuePage_AuditQueue_HamburgerIcon_Locator}
    Click Element   ${PPay7_AuditQueuePage_AuditQueue_HamburgerIcon_Locator}

Verify Audit Queue Landing page
    Wait Until Element Is Visible  ${PPay7_AuditQueuePage_AuditQueue_Label_Locator}       timeout=20
    Element Should Be Visible    ${PPay7_AuditQueuePage_AuditQueue_Label_Locator}
    Wait Until Element Is Visible  ${PPay7_AuditQueuePage_Action_Label_Locator}       timeout=20
    Element Should Be Visible    ${PPay7_AuditQueuePage_Action_Label_Locator}
    Wait Until Element Is Visible  ${PPay7_AuditQueuePage_Assigned_Label_Locator}       timeout=20
    Element Should Be Visible    ${PPay7_AuditQueuePage_Assigned_Label_Locator}
    Wait Until Element Is Visible  ${PPay7_AuditQueuePage_Assigned_UserName_Locator}       timeout=20
    Element Should Be Visible    ${PPay7_AuditQueuePage_Assigned_UserName_Locator}
    Wait Until Element Is Visible  ${PPay7_AuditQueuePage_TableLayout_Label_Locator}       timeout=20
    Element Should Be Visible    ${PPay7_AuditQueuePage_TableLayout_Label_Locator}
    Wait Until Element Is Visible  ${PPay7_AuditQueuePage_Filter_Label_Locator}       timeout=20
    Element Should Be Visible    ${PPay7_AuditQueuePage_Filter_Label_Locator}
    Wait Until Element Is Visible  ${PPay7_AuditQueuePage_Search_Label_Locator}       timeout=20
    Element Should Be Visible    ${PPay7_AuditQueuePage_Search_Label_Locator}
    Wait Until Element Is Visible  ${PPay7_AuditQueuePage_AuditNumber_hyperlink_Locator}       timeout=20
    Element Should Be Visible    ${PPay7_AuditQueuePage_AuditNumber_hyperlink_Locator}