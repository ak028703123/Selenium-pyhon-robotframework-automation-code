import yaml
from yaml import load
import os

with open(os.getcwd()+'\\TestData\\UI\\RecoveryStudio\\RecordAnalyst_DashBoard_TestData.yaml') as f:
    var = yaml.full_load(f)
    PtAccNumRecordRequest = var.get("PtAccNumRecordRequest")
    CheckboxOptions = var.get("CheckboxOptions")
    PDFFileName = var.get("PDFFileName")
    DOB = var.get("DOB")
    AuditNum = var.get("AuditNum")
    DOS = var.get("DOS")
    MediRecNum = var.get("MediRecNum")
    ClaimNum = var.get("ClaimNum")
    ProviderName = var.get("ProviderName")
    ProviderID = var.get("ProviderID")
    PtName= var.get("PtName")
    SubscriberID=var.get("SubscriberID")
    GroupID=var.get("GroupID")
    ClaimType=var.get("ClaimType")
    AuditStatus=var.get("AuditStatus")
    DivisionCode=var.get("DivisionCode")
    AdmitDate=var.get("AdmitDate")
    DischargeDate=var.get("DischargeDate")
    REPtAccNum=var.get("REPtAccNum")
    ClaimType1=var.get("ClaimType1")
RecordRequest_ReviewButton_Locator = "//div[normalize-space()='" + str(PtAccNumRecordRequest) + "']//ancestor::div[@class='card selected']//button[contains(text(),'Review')]"
RecordAnalyst_SubmitDocuments_Button_Locator ="//button[@id='fileUploaderSubmitButton']"
#RecordAnalyst_PtName_Locator="//div[normalize-space()='" + str(PtAccNumRecordRequest) + "']//preceding-sibling::h3[@class='name']"
RecordAnalyst_PtName_Locator="//h3[@class='name'][contains(text(),'texttoreplace')]"
RecordAnalyst_DOB_Detail_Locator="//div[@class='title'][contains(text(),'Date Of Birth')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
RecordAnalyst_PtAccNum_Detail_Locator="//div[@class='title'][contains(text(),'Patient Account Number')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
RecordAnalyst_AuditNum_Detail_Locator="//div[@class='title'][contains(text(),'Audit Number')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
RecordAnalyst_DOS_Detail_Locator="//div[@class='title'][contains(text(),'Dates Of Service')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
RecordAnalyst_MediRecNum_Detail_Locator="//div[@class='title'][contains(text(),'Medical Record Number')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
RecordAnalyst_ClaimNum_Detail_Locator="//div[@class='title'][contains(text(),'Claim Number')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
RecordAnalyst_ProviderName_Detail_Locator="//div[@class='title'][contains(text(),'Provider Name')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
RecordAnalyst_ProviderID_Detail_Locator="//div[@class='title'][contains(text(),'Provider Number')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
RecordAnalyst_Prepay_Detail_Locator="//div[@class='title'][contains(text(),'Prepay')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
RecordAnalyst_Esignature_Locator="//input[@id='fileUploadereSignatureInput']"
RecordAnalyst_Title_Locator="//input[@id='fileUploaderTitleInput']"
RecordAnalyst_date_Locator="//input[@id='fileUploaderDateInput']"
RecordAnalyst_Overdue_locator="//div[normalize-space()='" + str(PtAccNumRecordRequest) + "']/preceding-sibling::div[@class='deadline redCountdown'][contains(text(),'OVERDUE')]"
RecordAnalyst_Apoproaching_Overdue_locator="//div[normalize-space()='" + str(PtAccNumRecordRequest) + "']/preceding-sibling::div[@class='deadline redCountdown'][contains(text(),'Day')]"
RecordAnalyst_NotApoproaching_Overdue_locator="//div[normalize-space()='" + str(PtAccNumRecordRequest) + "']/preceding-sibling::div[@class='deadline greenCountdown'][contains(text(),'Day')]"
RecordAnalyst_RecordInfo_AuditNum_Detail_Locator="//div[@class='box']//h5[contains(text(),'Audit Number')]//following-sibling::p[contains(text(),'texttoreplace')]"
RecordAnalyst_RecordInfo_DOB_Detail_Locator="//div[@class='box']//h5[contains(text(),'Date Of Birth')]//following-sibling::p[contains(text(),'texttoreplace')]"
RecordAnalyst_RecordInfo_SubscriberID_Detail_Locator="//div[@class='box']//h5[contains(text(),'Subscriber ID')]//following-sibling::p[contains(text(),'texttoreplace')]"
RecordAnalyst_RecordInfo_GroupID_Detail_Locator="//div[@class='box']//h5[contains(text(),'Group ID')]//following-sibling::p[contains(text(),'texttoreplace')]"
RecordAnalyst_RecordInfo_ClaimNum_Detail_Locator="//div[@class='box']//h5[contains(text(),'Claim Number')]//following-sibling::p[contains(text(),'texttoreplace')]"
RecordAnalyst_RecordInfo_ClaimType_Detail_Locator="//div[@class='box']//h5[contains(text(),'Claim Type')]//following-sibling::p[contains(text(),'texttoreplace')]"
RecordAnalyst_RecordInfo_MediRecNum_Detail_Locator="//div[@class='box']//h5[contains(text(),'Medical Record Number')]//following-sibling::p[contains(text(),'texttoreplace')]"
RecordAnalyst_RecordInfo_AuditStatus_Detail_Locator="//div[@class='box']//h5[contains(text(),'Audit Status')]//following-sibling::p[contains(text(),'texttoreplace')]"
RecordAnalyst_RecordInfo_ProviderName_Detail_Locator="//div[@class='box']//h5[contains(text(),'Provider Name')]//following-sibling::p[contains(text(),'texttoreplace')]"
RecordAnalyst_RecordInfo_ProviderID_Detail_Locator="//div[@class='box']//h5[contains(text(),'Provider Number')]//following-sibling::p[contains(text(),'texttoreplace')]"
RecordAnalyst_RecordInfo_DivisionCode_Detail_Locator="//div[@class='box']//h5[contains(text(),'Division Code')]//following-sibling::p[contains(text(),'texttoreplace')]"
RecordAnalyst_RecordInfo_AdmitDate_Detail_Locator="//div[@class='box']//h5[contains(text(),'Admit Date')]//following-sibling::p[contains(text(),'texttoreplace')]"
RecordAnalyst_RecordInfo_DischargeDate_Detail_Locator="//div[@class='box']//h5[contains(text(),'Discharge Date')]//following-sibling::p[contains(text(),'texttoreplace')]"
RecordAnalyst_RecordInfo_Prepay_Detail_Locator="//*[@id='main']//div[contains(@class,'clsPrepay')]/span"
RecordAnalyst_RequestExtension_Button_Locator="//div[normalize-space()='" + str(REPtAccNum) + "']//ancestor::div[@class ='card selected' or @class= 'card selected audit' or @class ='card']//button[contains(text(),'Request Extension')]"
RecordAnalyst_RequestExtension_Popup_Locator="//h3[normalize-space()='Request Extension']"
RecordAnalyst_RequestExtension_Button_ConfirmRequest_Locator="//button[@id='modalConfirmButton' or @id='modalConfirmRequestButton']"
RecordAnalyst_RequestExtension_message_Locator= "//p[@id='modalCompExtensionConfirmationMessage']"
RecordAnalyst_RequestExtension_Button_ConfirmRet_Locator="//button[@class='ui primary large uploadAlign']"
RecordAnalyst_RequestExtension_ExtensionGranted_Locator="//div[normalize-space()='" + str(REPtAccNum) + "']//ancestor::div[@class='card selected']//div[contains(text(),'Extension Granted')]"
# RecordAnalyst_RequestExtension_ExtensionGranted_Locator="//div[normalize-space()='" + str(REPtAccNum) + "']//ancestor::div[@class='card selected']//div[@class='extGranted']"
RecordAnalyst_RecordRequest_DaysRemaining_Locator="//div[normalize-space()='" + str(REPtAccNum) + "']/preceding-sibling::div[contains(text(),'Day')]"
RecordAnalyst_button_OK_Document_uploading_error_locator= "//button[normalize-space()='OK']"
RecordAnalyst_Remove_Attachment_Cancle_Locator="//span[@class='fileName'][contains(text(),'"+str(PDFFileName)+"')]//ancestor::li//em[normalize-space()='cancel']"
RecordRequest_UploadDocuments_Tab_Locator="//h3[normalize-space()='Upload Documents']"
RecordRequest_Authorized_eSignature_Locator="//h3[normalize-space()='Authorized eSignature']"
RecordRequest_ClaimReviewDetails_Tab_Locator="//h3[normalize-space()='Claim Review Details']"
RecordAnalyst_ListView_Icon_locator="//em[@class='material-icons'][contains(text(),'list')]"
RecordAnalyst_GridView_Icon_locator="//em[@class='material-icons-outlined'][contains(text(),'view_module')]"
RecordAnalyst_ListView_Active_locator="//div[@class='tableView active']"
RecordAnalyst_ListView_Inactive_locator="//div[@class='tableView inactive']"
RecordAnalyst_GridView_Active_locator="//div[@class='cardView active']"
RecordAnalyst_GridView_Inactive_locator="//div[@class='cardView inactive']"
RecordRequest_Tile_Locator="//div[@class='card selected']"
RecordAnalyst_RecordInfo_Filter_ClaimType_Detail_Locator ="//div[@class='box']//h5[contains(text(),'Claim Type')]//following-sibling::p"
#AN
RecordAnalyst_FilterButton_Locator="//a[@class='filterButton']"
RecordAnalyst_FilterButton_filterPatientAccountLabel_Locator="//label[@id='filterPatientAccountLabel']"
RecordAnalyst_FilterButton_filterMRNumberLabel_Locator="//label[@id='filterMRNumberLabel']"
RecordAnalyst_FilterButton_filterAuditNumberLabel_Locator="//label[@id='filterAuditNumberLabel']"
RecordAnalyst_FilterButton_filterClaimTypeLabel_Locator="//label[@id='filterClaimTypeLabel']"
RecordAnalyst_FilterButton_filterProviderNumber_Locator="//label[text()='Provider Number']"
RecordAnalyst_FilterButton_filterDaysRemainingLabel_Locator="//label[@id='filterDaysRemainingLabel']"
RecordAnalyst_FilterButton_ClearFilterButton_Locator="//a[@id='filterClearButton']"
RecordAnalyst_FilterButton_ApplyFilterButton_Locator="//button[@id='filterApplyButton']"
RecordAnalyst_filter_ClaimType_Locator="//select[@id='filterClaimType']"
RecordAnalyst_filter_ClaimType_Outpatient_Locator="//select[@id='filterClaimType']//ancestor::option[text()='Outpatient']"
RecordAnalyst_GoodCauseLanguage_Link_Locator="//a[@class='goodCauseLang']"
RecordAnalyst_UploadDocument_Title_Locator="//h3[@id='fileUploaderUploadDocumentsTitle']"
RecordAnalyst_GoodCauseLanguage_Header_Locator="//div[@class='header']"
RecordAnalyst_GoodCauseLanguage_Body_Locator="//div[@class='modalContent']"
RecordAnalyst_ClaimDetail_Locator="//h3[text()='Claim Review Details ']"
RecordAnalyst_NextAudit_button_Locator="//button[@id='prevNextRequestButton']"
RecordAnalyst_DetailsPage_ClaimType_Locator="//div[@class='box']//h5[contains(text(),'Claim Type')]//following-sibling::p[contains(text(),'"+str(ClaimType1)+"')]"
RecordAnalyst_Dashboard_Text="//h2[text()='Outstanding Record Requests'] "
RecordAnalyst_Dashboard_CONFIRM_DELETE_DOCUMENT_Popup_Locator="//h3[@id='fileUploaderConfirmDeleteDocumentModalTitle']"
RecordAnalyst_Dashboard_CONFIRM_DELETE_DOCUMENT_Popup_Head_Locator="//h3[@id='fileUploaderDocumentDeleteModalTitle']"
RecordAnalyst_Dashboard_CONFIRM_DELETE_DOCUMENT_Popup_Body_Locator="//div[@class='content']//p//ancestor::strong"
RecordAnalyst_Dashboard_CONFIRM_DELETE_DOCUMENT_Popup_Ok_Button_Locator="//*[@id='fileUploaderDeleteUploadedFileYesButton']"
RecordAnalyst_Dashboard_Cancel_Button_Locator="//button[@id='fileUploaderCancelButton']"
RecordAnalyst_Dashboard_Cancel_Record_Submission_PopUp_GoToDashboard_Button_Locator="//button[@class='ui secondary large uploadAlign']"
RecordAnalyst_Dashboard_CONFIRM_FILE_SUBMISSION_PopUp_GoToDashboard_Button_Locator="//button[@id='fileUploaderRAFormYesButton']"
RecordAnalyst_Dashboard_SubmitDocument_PopUp_GoToDashboard_Button_Locator="//button[@id='fileUploaderGoToDashboard']"
RecordAnalyst_Dashboard_Request_Extension_Cancel_Button_Locator="//button[@id='modalCancelButton']"
RecordAnalyst_Dashboard_Submiited_Record_Locator="//*[@id='main']//table[1]/tbody/tr/td[3][contains(text(), 'texttoreplace')]"
#satheesh

RecordAnalyst_Overdue_Data_FilterResult_Locator= "(//div[@class='infoContain']//div[@class='deadline redCountdown'])"
RecordAnalyst_1_2_3_4_5_Great5_Data_FilterResult_Locator= "(//div[@class='infoContain']//div[@class='deadline redCountdown' or @class='deadline greenCountdown'])[contains(text(),'Day')]"
# RecordAnalyst_Overdue_4_5_Great5_Data_FilterResult_Locator= "(//div[@class='infoContain']//div[@class='deadline greenCountdown'][contains(text(),'Days')])"
RecordAnalyst_filter_ClaimType_dropdown_Locator= "//select[@id='filterClaimType']"
RecordAnalyst_Cancel_Records_Submission_PopUp_Head_Locator= "//h3[normalize-space()='Cancel Records Submission']"
RecordAnalyst_Cancel_Records_Submission_PopUp_Body_Locator= "//p[contains(text(),'Record submission has been cancelled. Any uploaded')]"

RecordAnalyst_Dashboard_PageLoad_RedFlower_Image_Locator="//*[@class='waitingImage']"
RecordAnalyst_Dashboard_Details_Page_Locator="//*[@id='detailPageRequests']"

RecordAnalyst_ExportAudit_Button_Locator="//*[@id='main']//a/em[contains(text(),'download')]"

# List View
RecordAnalyst_ListView_Element_Locator= "//*[@id='dashboardPageLinkControl']"
RecordAnalyst_ListView_Actions_ColumnHeader_Element_Locator="//table[1]/thead/tr/th[1][contains(text(),'Actions')]"
RecordAnalyst_ListView_DaysLeft_ColumnHeader_Element_Locator="//table[1]/thead/tr/th[2][contains(text(),'Days Left')]"
RecordAnalyst_ListView_PatientName_ColumnHeader_Element_Locator="//table[1]/thead/tr/th[3][contains(text(),'Patient Name')]"
RecordAnalyst_ListView_PatientAccountNumber_ColumnHeader_Element_Locator="//table[1]/thead/tr/th[4][contains(text(),'Patient Account')]"
RecordAnalyst_ListView_Prepay_ColumnHeader_Element_Locator="//table[1]/thead/tr/th[5][contains(text(),'Prepay')]"
RecordAnalyst_ListView_ProviderName_ColumnHeader_Element_Locator="//table[1]/thead/tr/th[6][contains(text(),'Provider Name')]"
RecordAnalyst_ListView_BirthDate_ColumnHeader_Element_Locator="//table[1]/thead/tr/th[7][contains(text(),'Birth Date')]"
RecordAnalyst_ListView_DateOfService_ColumnHeader_Element_Locator="//table[1]/thead/tr/th[8][contains(text(),'Dates Of')]"
RecordAnalyst_ListView_ProviderNumber_ColumnHeader_Element_Locator="//table[1]/thead/tr/th[9][contains(text(),'Provider')]"
RecordAnalyst_ListView_AuditNumber_ColumnHeader_Element_Locator="//table[1]/thead/tr/th[10][contains(text(),'Audit')]"
RecordAnalyst_ListView_ClaimNumber_ColumnHeader_Element_Locator="//table[1]/thead/tr/th[11][contains(text(),'Claim Number ')]"
RecordAnalyst_ListView_MedicalRecord_ColumnHeader_Element_Locator="//table[1]/thead/tr/th[12][contains(text(),'Medical Record')]"
RecordAnalyst_ListView_DueDate_ColumnHeader_Element_Locator="//table[1]/thead/tr/th[13][contains(text(),'Due Date')]"

RecordAnalyst_ListView_DaysLeft_Element_Locator="//table[1]/tbody/tr[1]/td[2]/div[contains(text(),'texttoreplace')]"

RecordAnalyst_ListView_FirstRecord_AuditNumber_Element_Locator="//table[1]/tbody/tr[1]/td[10]"

RecordAnalyst_ListView_DaysLeft_Element_Locator="//table[1]/tbody/tr/td[2]/div[contains(text(),'texttoreplace')]"
RecordAnalyst_ListView_PatientLastName_Element_Locator="//table[1]/tbody/tr/td[3][contains(text(),'texttoreplace')]"
RecordAnalyst_ListView_PatientFirstName_Element_Locator="//table[1]/tbody/tr/td[3]/br[contains(text(),'texttoreplace')]"
RecordAnalyst_ListView_PatientAccountNumber_Element_Locator="//table[1]/tbody/tr/td[4][contains(text(),'texttoreplace')]"
RecordAnalyst_ListView_Prepay_Element_Locator="//table[1]/tbody/tr/td[5][contains(text(),'texttoreplace')]"
RecordAnalyst_ListView_ProviderName_Element_Locator="//table[1]/tbody/tr/td[6]/p[contains(text(),'texttoreplace')]"
RecordAnalyst_ListView_BirthDate_Element_Locator="//table[1]/tbody/tr/td[7][contains(text(),'texttoreplace')]"
RecordAnalyst_ListView_DatesOfService_Element_Locator="//table[1]/tbody/tr/td[8][contains(text(),'texttoreplace')]"
RecordAnalyst_ListView_ProviderNumber_Element_Locator="//table[1]/tbody/tr/td[9][contains(text(),'texttoreplace')]"
RecordAnalyst_ListView_AuditNumber_Element_Locator="//table[1]/tbody/tr[1]/td[10][contains(text(),'texttoreplace')]"
RecordAnalyst_ListView_ClaimNumber_Element_Locator="//table[1]/tbody/tr[1]/td[11][contains(text(),'texttoreplace')]"
RecordAnalyst_ListView_MedicalRecordNumber_Element_Locator="//table[1]/tbody/tr/td[12][contains(text(),'texttoreplace')]"
RecordAnalyst_ListView_DueDate_Element_Locator="//table[1]/tbody/tr/td[13][contains(text(),'texttoreplace')]"

RecordAnalyst_ListView_RequestExtension_Button_Locator= "//table[1]/tbody//td[contains(text(),'texttoreplace')]//preceding-sibling::td[contains(@class,'actioncolumn')]//button[contains(@id,'tableComponentRequestExtensionButton')]"
RecordAnalyst_ListView_ExtensionGranted_Locator= "//table[1]/tbody//td[contains(text(),'texttoreplace')]//preceding-sibling::td[contains(@class,'actioncolumn')]//div[contains(text(),'Extension Granted')]"
RecordAnalyst_ListView_Audit_Review_Button_Locator="//table[1]/tbody//td[contains(text(),'texttoreplace')]//preceding-sibling::td[contains(@class,'actioncolumn')]//button[contains(text(),'Review')]"
RecordAnalyst_RecordsCount_Element_Locator="//app-audits-requests-access/div/div/a[2]/div/div"

RecordAnalyst_ListView_FilterTab_Review_Button_Locator= "//tbody/tr/td[1]/button[contains(text(),'Review')]"
RecordAnalyst_ListView_Overdue_Data_FilterResult_Locator="(//table[1]/tbody/tr/td[2]/div[contains(text(),'OVERDUE')])"
RecordAnalyst_Filtered_result_Text_locator ="//*[@id='main']//span[contains(@class,'filteredResults')]"

RecordAnalyst_ListView_RequestExtension_Button_Locator="//table[1]/tbody//td[contains(text(),'texttoreplace')]//preceding-sibling::td[contains(@class,'actioncolumn')]//button[contains(@id,'tableComponentRequestExtensionButton')]"
RecordAnalyst_ListView_ExtensionGranted_Locator= "//table[1]/tbody//td[contains(text(),'texttoreplace')]//preceding-sibling::td[contains(@class,'actioncolumn')]//div[contains(text(),'Extension Granted')]"
RecordAnalyst_ListView_DaysRemaining_Audit_Locator="//table[1]/tbody//td[contains(text(),'texttoreplace')]//preceding-sibling::td[2]"

RecordAnalyst_ListView_DaysLeft_Table_Locator="(//table[1]/tbody/tr/td[2]/div)"
RecordAnalyst_ListView_PatientsName_Table_Locator="(//table[1]/tbody/tr/td[3])"
RecordAnalyst_ListView_PatientAccountNumber_Table_Locator="(//table[1]/tbody/tr/td[4])"
RecordAnalyst_ListView_Prepay_Table_Locator="(//table[1]/tbody/tr/td[5])"
RecordAnalyst_ListView_ProviderName_Table_Locator="(//table[1]/tbody/tr/td[6])"
RecordAnalyst_ListView_BirthDate_Table_Locator="(//table[1]/tbody/tr/td[7])"
RecordAnalyst_ListView_DateOfService_Table_Locator="(//table[1]/tbody/tr/td[8])"
RecordAnalyst_ListView_ProviderNumber_Table_Locator="(//table[1]/tbody/tr/td[9])"
RecordAnalyst_ListView_AuditNumber_Table_Locator="(//table[1]/tbody/tr/td[10])"
RecordAnalyst_ListView_ClaimNumber_Table_Locator="(//table[1]/tbody/tr/td[11])"
RecordAnalyst_ListView_MedicalRecord_Table_Locator="(//table[1]/tbody/tr/td[12])"
RecordAnalyst_ListView_DueDate_Table_Locator="(//table[1]/tbody/tr/td[13])"