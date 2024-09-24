*** Settings ***
Documentation    Script to Test ppay 7
Library    SeleniumLibrary
Library    Easter
Library    String
Library    Collections
Library    DateTime
Variables    ..//ProperPay_Automation//ElementsLocator//UI//AuditStudio//PPay7_ConfigurationPage_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//AuditStudio//PPay7_ConfigurationPage_TestData.yaml

*** Keywords ***

Finish TestCase
    Close Browser



Verify configuration page is visible with 4 sections(Audit,Edit, Exclusion and Ranking,Pricing, Users and Roles)

    Wait Until Element Is Visible  ${PPay7_ConfigurationPage_Audit_Label_Locator}       timeout=20
    Element Should Be Visible    ${PPay7_ConfigurationPage_Audit_Label_Locator}
    Wait Until Element Is Visible  ${PPay7_ConfigurationPage_Edit_Exclusion_Ranking_Label_Locator}
    Element Should Be Visible    ${PPay7_ConfigurationPage_Edit_Exclusion_Ranking_Label_Locator}
    Wait Until Element Is Visible  ${PPay7_ConfigurationPage_Pricing_Label_Locator}
    Element Should Be Visible    ${PPay7_ConfigurationPage_Pricing_Label_Locator}
    Wait Until Element Is Visible  ${PPay7_ConfigurationPage_Users_Roles_Label_Locator}
    Element Should Be Visible    ${PPay7_ConfigurationPage_Users_Roles_Label_Locator}


Verify Management and Action Column is displayed under Audit Configuration
    Wait Until Element Is Visible    ${PPay7_ConfigurationPage_Audit_Management_Label_Locator}
    Element Should Be Visible    ${PPay7_ConfigurationPage_Audit_Management_Label_Locator}
    Wait Until Element Is Visible    ${PPay7_ConfigurationPage_Audit_Action_Label_Locator}
    Element Should Be Visible    ${PPay7_ConfigurationPage_Audit_Action_Label_Locator}


Verify Manage button is enabled
   Wait Until Element Is Visible    ${PPay7_ConfigurationPage_Audit_Manage_Button_Locator}
   Element Should Be Visible    ${PPay7_ConfigurationPage_Audit_Manage_Button_Locator}
   Element Should Be Enabled    ${PPay7_ConfigurationPage_Audit_Manage_Button_Locator}

Verify items per page is displayed under Audit Configuration
    Wait Until Element Is Visible    ${PPay7_ConfigurationPage_Audit_ItemsPerPage_Label_Locator}
    Element Should Be Visible    ${PPay7_ConfigurationPage_Audit_ItemsPerPage_Label_Locator}


Verify Next page,Previous page, First page and Last page buttons are displayed under Audit Configuration
    Wait Until Element Is Visible    ${PPay7_ConfigurationPage_Audit_NextPage_Button_Locator}
    Element Should Be Visible    ${PPay7_ConfigurationPage_Audit_NextPage_Button_Locator}
    Wait Until Element Is Visible    ${PPay7_ConfigurationPage_Audit_PreviousPage_Button_Locator}
    Element Should Be Visible    ${PPay7_ConfigurationPage_Audit_PreviousPage_Button_Locator}
    Wait Until Element Is Visible    ${PPay7_ConfigurationPage_Audit_FirstPage_Button_Locator}
    Element Should Be Visible    ${PPay7_ConfigurationPage_Audit_FirstPage_Button_Locator}
    Wait Until Element Is Visible    ${PPay7_ConfigurationPage_Audit_LastPage_Button_Locator}
    Element Should Be Visible    ${PPay7_ConfigurationPage_Audit_LastPage_Button_Locator}


Click Management header in Audit Configuration Table and verify sorting is done in alphabetically
    wait until Element is visible   ${PPay7_ConfigurationPage_Audit_Management_Label_Locator}        timeout=20
    click Element   ${PPay7_ConfigurationPage_Audit_Management_Label_Locator}
    sleep   3

    ${element_count}=    get element count     ${PPay7_ConfigurationPage_Audit_Table_Management_RowText_Locator}
    @{username_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_username}=  Get Text      ${PPay7_ConfigurationPage_Audit_Table_Management_RowText_Locator} [${i}]
    Append To List      ${username_list}    ${get_username}
    END
    log      ${username_list}
    ${sort_order}=  Copy list  ${username_list}
    sort list     ${sort_order}
    log      ${sort_order}
    lists should be equal       ${username_list}     ${sort_order}


Verify Items Per Page is present and contains 10 by default in audit configuration
    wait until Element is Visible       ${PPay7_ConfigurationPage_Audit_ItemsPerPage_Label_Locator}
    Element should be visible              ${PPay7_ConfigurationPage_Audit_ItemsPerPage10_Locator}
    ${element_count}=    get element count     ${PPay7_ConfigurationPage_Audit_Table_Management_RowText_Locator}
    should be equal         ${element_count}         ${10}

Selects Item Per Page as 20 in audit configuration
    Wait Until Element Is Visible    ${PPay7_ConfigurationPage_Audit_ItemsPerPage_DropDown_Locator}      timeout=60
    Click Element    ${PPay7_ConfigurationPage_Audit_ItemsPerPage_DropDown_Locator}
    Wait Until Element Is Visible    ${PPay7_ConfigurationPage_Audit_ItemsPerPage_DropDownOption20_Locator}          timeout=60
    Click Element    ${PPay7_ConfigurationPage_Audit_ItemsPerPage_DropDownOption20_Locator}



Verifies in audit configuration displays 20 records
    wait until Element is Visible       ${PPay7_ConfigurationPage_Audit_Table_Management_RowText_Locator}
    ${element_count}=    get element count     ${PPay7_ConfigurationPage_Audit_Table_Management_RowText_Locator}
    Run Keyword If    ${element_count}>10    log    audit configuration displays more than 10 records


Click Next Page Button in audit configuration
    Wait Until Element Is Visible    ${PPay7_ConfigurationPage_Audit_NextPage_Button_Locator}      timeout=60
    Click Element    ${PPay7_ConfigurationPage_Audit_NextPage_Button_Locator}

Click Last Page Button in audit configuration
    Wait Until Element Is Visible    ${PPay7_ConfigurationPage_Audit_LastPage_Button_Locator}      timeout=60
    Click Element    ${PPay7_ConfigurationPage_Audit_LastPage_Button_Locator}


Click Previous Page Button in audit configuration
    Wait Until Element Is Visible    ${PPay7_ConfigurationPage_Audit_PreviousPage_Button_Locator}      timeout=60
    Click Element    ${PPay7_ConfigurationPage_Audit_PreviousPage_Button_Locator}

Click First Page Button in audit configuration
    Wait Until Element Is Visible    ${PPay7_ConfigurationPage_Audit_FirstPage_Button_Locator}      timeout=60
    Click Element    ${PPay7_ConfigurationPage_Audit_FirstPage_Button_Locator}

Verify payer Options is visible in audit configuration
    Wait Until Element Is Visible    ${PPay7_ConfigurationPage_Audit_Table_Management_PayerOptions_Locator}      timeout=60
    Element Should Be Visible    ${PPay7_ConfigurationPage_Audit_Table_Management_PayerOptions_Locator}

Verify payer User Group is visible in audit configuration
    Wait Until Element Is Visible    ${PPay7_ConfigurationPage_Audit_Table_Management_UserGroup_Locator}      timeout=60
    Element Should Be Visible    ${PPay7_ConfigurationPage_Audit_Table_Management_UserGroup_Locator}

Click on manage button on user group
    Wait Until Element Is Visible    ${PPay7_ConfigurationPage_Audit_Manage_Button_Locator}      timeout=60
    Click Element    ${PPay7_ConfigurationPage_Audit_Manage_Button_Locator}


Verify User Group List page is visible on clicking Manage button of User Group
    Wait Until Element Is Visible     ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_Page_Locator}      timeout=60
    Element Should Be Visible     ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_Page_Locator}

Verify User Group List page is having column headers
    Wait Until Element Is Visible     ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_UserGroup_ColumnHeader_Locator}      timeout=60
    Element Should Be Visible     ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_UserGroup_ColumnHeader_Locator}
    Wait Until Element Is Visible     ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_Active_ColumnHeader_Locator}      timeout=60
    Element Should Be Visible     ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_Active_ColumnHeader_Locator}
    Wait Until Element Is Visible     ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_CreatedBy_ColumnHeader_Locator}      timeout=60
    Element Should Be Visible     ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_CreatedBy_ColumnHeader_Locator}
    Wait Until Element Is Visible     ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_LastUpdate_ColumnHeader_Locator}      timeout=60
    Element Should Be Visible     ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_LastUpdate_ColumnHeader_Locator}
    Wait Until Element Is Visible     ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_LastModifiedBy_ColumnHeader_Locator}      timeout=60
    Element Should Be Visible     ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_LastModifiedBy_ColumnHeader_Locator}
    Wait Until Element Is Visible     ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_Action_ColumnHeader_Locator}      timeout=60
    Element Should Be Visible     ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_Action_ColumnHeader_Locator}
    Wait Until Element Is Visible     ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_ActionColumn_Managebutton_Locator}      timeout=60
    Element Should Be Visible     ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_ActionColumn_Managebutton_Locator}


Click User Group header in User Group List Table and verify sorting is done in alphabetically

    wait until Element is visible   ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_UserGroup_ColumnHeader_Locator}        timeout=20
    click Element   ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_UserGroup_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_Table_UserGroupColumn_RowText_Locator}
    @{usergroup_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_usergroup}=  Get Text      ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_Table_UserGroupColumn_RowText_Locator} [${i}]
    Append To List      ${usergroup_list}    ${get_usergroup}
    END
    log      ${usergroup_list}
    ${sort_order}=  Copy list  ${usergroup_list}
    sort list     ${sort_order}
    log      ${sort_order}
    lists should be equal       ${usergroup_list}     ${sort_order}


Click Active header in User Group List Table and verify sorting is done in alphabetically

    wait until Element is visible   ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_Active_ColumnHeader_Locator}        timeout=20
    click Element   ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_Active_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_Table_ActiveColumn_RowText_Locator}
    @{Active_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_ActiveStatus}=  Get Text      ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_Table_ActiveColumn_RowText_Locator} [${i}]
    Append To List      ${Active_list}    ${get_ActiveStatus}
    END
    log      ${Active_list}
    ${sort_order}=  Copy list  ${Active_list}
    sort list     ${sort_order}
    log      ${sort_order}
    lists should be equal       ${Active_list}     ${sort_order}


Click Created By header in User Group List Table and verify sorting is done in alphabetically

    wait until Element is visible   ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_CreatedBy_ColumnHeader_Locator}        timeout=20
    click Element   ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_CreatedBy_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_Table_CreatedByColumn_RowText_Locator}
    @{CreatedBy_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_CreatedBy}=  Get Text      ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_Table_CreatedByColumn_RowText_Locator} [${i}]
    Append To List      ${CreatedBy_list}    ${get_CreatedBy}
    END
    log      ${CreatedBy_list}
    ${sort_order}=  Copy list  ${CreatedBy_list}
    sort list     ${sort_order}
    log      ${sort_order}
    lists should be equal       ${CreatedBy_list}     ${sort_order}


Click Date Created header in User Group List Table and verify sorting is done in Ascending order

    wait until Element is visible   ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_DateCreated_ColumnHeader_Locator}        timeout=20
    click Element   ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_DateCreated_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_Table_DateCreatedColumn_RowText_Locator}
    @{DateCreated_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_DateCreated}=  Get Text      ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_Table_DateCreatedColumn_RowText_Locator} [${i}]
    Append To List      ${DateCreated_list}    ${get_DateCreated}
    END
    log      ${DateCreated_list}
    ${sort_order}=  Copy list  ${DateCreated_list}
    sort list     ${sort_order}
    log      ${sort_order}
    lists should be equal       ${DateCreated_list}     ${sort_order}


Click Last Update header in User Group List Table and verify sorting is done in Ascending order

    wait until Element is visible   ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_LastUpdate_ColumnHeader_Locator}        timeout=20
    click Element   ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_LastUpdate_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_Table_LastUpdateColumn_RowText_Locator}
    @{LastUpdate_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_LastUpdate}=  Get Text      ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_Table_LastUpdateColumn_RowText_Locator} [${i}]
    Append To List      ${LastUpdate_list}    ${get_LastUpdate}
    END
    log      ${LastUpdate_list}
    ${sort_order}=  Copy list  ${LastUpdate_list}
    sort list     ${sort_order}
    log      ${sort_order}
    lists should be equal       ${LastUpdate_list}     ${sort_order}

Click Last Modified By header in User Group List Table and verify sorting is done in Ascending order

    wait until Element is visible   ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_LastModifiedBy_ColumnHeader_Locator}        timeout=20
    click Element   ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_LastModifiedBy_ColumnHeader_Locator}
    sleep   3

    ${element_count}=    get element count     ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_Table_LastModifiedByColumn_RowText_Locator}
    @{LastModifiedBy_list}=   Create List
    FOR    ${i}     IN RANGE    1   ${element_count}+1
    ${get_LastModifiedBy}=  Get Text      ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_Table_LastModifiedByColumn_RowText_Locator} [${i}]
    Append To List      ${LastModifiedBy_list}    ${get_LastModifiedBy}
    END
    log      ${LastModifiedBy_list}
    ${sort_order}=  Copy list  ${LastModifiedBy_list}
    sort list     ${sort_order}
    log      ${sort_order}
    lists should be equal       ${LastModifiedBy_list}     ${sort_order}

Click on the search box in user group list
    wait until Element is visible   ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_SearchFiled_Locator}        timeout=20
    click Element   ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_SearchFiled_Locator}
    sleep  3

Enter text in the search box in user group list
    wait until Element is visible   ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_SearchFiled_Locator}        timeout=20
    Input Text    ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_SearchFiled_Locator}    ${PPay7_UserGroupList_Text}
    sleep  3

Validate the entered user group list in the search box is displayed
    wait until Element is visible   ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_CVUserGroup_Locator}        timeout=20
    Element Should Be Visible   ${PPay7_ConfigurationPage_Audit_UserGroup_UserGroupList_CVUserGroup_Locator}


 Verify Items Per Page is present and contains 10 by default in user group of audit section
    wait until Element is Visible       ${PPay7_ConfigurationPage_Audit_UserGroup_ItemsPerPage_Label_Locator}
    Element should be visible           ${PPay7_ConfigurationPage_Audit_UserGroup_ItemsPerPage_Label_Locator}
    ${element_count}=    get element count    ${PPay7_ConfigurationPage_Audit_UserGroup_Table_Management_RowText_Locator}
    should be equal         ${element_count}         ${10}

Selects Item Per Page as 25 in user group of audit section
    Wait Until Element Is Visible    ${PPay7_ConfigurationPage_Audit_UserGroup_ItemsPerPage_DropDown_Locator}      timeout=60
    Click Element    ${PPay7_ConfigurationPage_Audit_UserGroup_ItemsPerPage_DropDown_Locator}
    Wait Until Element Is Visible      ${PPay7_ConfigurationPage_Audit_UserGroup_ItemsPerPage_DropDownOption25_Locator}          timeout=60
    Click Element     ${PPay7_ConfigurationPage_Audit_UserGroup_ItemsPerPage_DropDownOption25_Locator}


Verifies user group of audit configuration displays 25 records
    wait until Element is Visible       ${PPay7_ConfigurationPage_Audit_UserGroup_Table_Management_RowText_Locator}
    ${element_count}=    get element count     ${PPay7_ConfigurationPage_Audit_UserGroup_Table_Management_RowText_Locator}
    Run Keyword If    ${element_count}>10    log    audit configuration displays more than 10 records
