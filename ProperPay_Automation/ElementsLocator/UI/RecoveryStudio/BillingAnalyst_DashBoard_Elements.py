import yaml
from yaml import load
import os

with open(os.getcwd()+'\\TestData\\UI\\RecoveryStudio\\BillingAnalyst_DashBoard_TestData.yaml') as f:
    var = yaml.full_load(f)
    PtAccNumAudit = var.get("PtAccNumAudit")
    PtAccNumAppeal = var.get("PtAccNumAppeal")
    CheckboxOptions1= var.get ("CheckboxOptions1")
    CheckboxOptions2 = var.get("CheckboxOptions2")
    CheckboxOptions3 = var.get("CheckboxOptions3")
    PDFFileName=var.get("PDFFileName")
    DOB = var.get("DOB")
    AuditNum = var.get("AuditNum")
    AuditType = var.get("AuditType")
    DOS = var.get("DOS")
    MediRecNum = var.get("MediRecNum")
    ClaimNum = var.get("ClaimNum")
    ProviderName = var.get("ProviderName")
    ProviderNumber = var.get("ProviderNumber")
    ProviderID=var.get("ProviderID")
    PtName = var.get("PtName")
    SubscriberID = var.get("SubscriberID")
    GroupID = var.get("GroupID")
    ClaimType = var.get("ClaimType")
    AuditStatus = var.get("AuditStatus")
    DivisionCode = var.get("DivisionCode")
    AdmitDate = var.get("AdmitDate")
    DischargeDate = var.get("DischargeDate")
    AppealDecision=var.get("AppealDecision")
    AppealfindingTile_PtName=var.get("AppealfindingTile_PtName")
    AppealfindingTile_DOB= var.get("AppealfindingTile_DOB")
    AppealfindingTile_AuditNum= var.get("AppealfindingTile_AuditNum")
    AppealfindingTile_MediRecNum= var.get("AppealfindingTile_MediRecNum")
    AppealfindingTile_ClaimNum= var.get("AppealfindingTile_ClaimNum")
    AppealfindingTile_ProviderName= var.get("AppealfindingTile_ProviderName")
    AppealfindingTile_ProviderNumber= var.get("AppealfindingTile_ProviderNumber")
    AppealfindingTile_SubscriberID= var.get("AppealfindingTile_SubscriberID")
    AppealfindingTile_GroupID= var.get("AppealfindingTile_GroupID")
    AppealfindingTile_ClaimType= var.get("AppealfindingTile_ClaimType")
    AppealfindingTile_AuditStatus=  var.get("AppealfindingTile_AuditStatus")
    AppealfindingTile_AuditType= var.get("AppealfindingTile_AuditType")
    AppealfindingTile_DivisionCode= var.get("AppealfindingTile_DivisionCode")
    AppealfindingTile_AdmitDate= var.get("AppealfindingTile_AdmitDate")
    AppealfindingTile_DischargeDate= var.get("AppealfindingTile_DischargeDate")
    AppealfindingTile_AppealDecision=var.get("AppealfindingTile_AppealDecision")
    AppealfindingTile_DOS=var.get("AppealfindingTile_DOS")
    PtAccNumFilter = var.get("PtAccNumFilter")
    MedicalRecNumberFilter = var.get("MedicalRecNumberFilter")
    AuditNumberFilter = var.get("AuditNumberFilter")
    ProviderNumberFilter = var.get("ProviderNumberFilter")
    ClaimNumberFilter = var.get("ClaimNumberFilter")
    REPtAccNumAudit= var.get("REPtAccNumAudit")
    REPtAccNumAppeal= var.get("REPtAccNumppeal")
    DefaultIndex= var.get("DefaultIndex")
    AppealDecisionFilter= var.get("AppealDecisionFilter")
    PDFFileName1= var.get("PDFFileName1")
BillingAnalyst_AuditFindings_ReviewButton_Locator="//div[normalize-space()='" +str(PtAccNumAudit)+"']//ancestor::div[@class='card audit ng-star-inserted']//button[contains(text(),'Review')]"
BillingAnalyst_AppealFindings_ReviewButton_Locator= "//div[normalize-space()='" +str(PtAccNumAppeal)+"']//ancestor::div[@class='card selected appeal']//button[contains(text(),'Review')]"
BillingAnalyst_AgreeWithFindings_Button_Locator="//button[normalize-space()='Agree with Findings']"
BillingAnalyst_AppealFindings_Button_Locator="//button[normalize-space()='Appeal Findings']"
BillingAnalyst_AppealFindings_latestAppeal_Tab_Locator="css:div.tabs>:last-child"
BillingAnalyst_AppealFindings_UploadDocuments_Tab_Locator="//h3[normalize-space()='Upload Documents']"
BillingAnalyst_AppealFindings_BrowseFile_Locator="//span[@class='fake-btn']"
BillingAnalyst_AppealFindings_Comments_Authorized_eSignature_Locator="//h3[normalize-space()='Comment and Authorized eSignature']"
BillingAnalyst_AppealFindings_Authorized_eSignature_Locator="//h3[normalize-space()='Authorized eSignature']"
BillingAnalyst_AppealFindings_Cancel_Button_Locator="//button[normalize-space()='Cancel']"
BillingAnalyst_AppealFindings_BrowseFileTab_Locator="//input[@type='file']"
BillingAnalyst_UploadDocuments_Window_Locator="//div[@class='header']//div[@class='title']//h3[text()='Upload Documents']"
BillingAnalyst_UploadDocuments_Cancel_Button_Locator="//em[normalize-space()='close']"
BillingAnalyst_UploadDocuments_Button_Locator="xpath://button[@class='ui primary large uploadAlign'][text()=' Upload Documents']"
BillingAnalyst_UploadDocuments_DocumentType_dropDown_Locator="//span[@class='dropdown-btn']"
BillingAnalyst_UploadDocuments_DocumentType_dropDownCheckboxOptions1_Locator="//input[@aria-label='" +str(CheckboxOptions1)+"']//ancestor::li[@class='multiselect-item-checkbox']"
BillingAnalyst_UploadDocuments_DocumentType_dropDownCheckboxOptions2_Locator="//input[@aria-label='" +str(CheckboxOptions2)+"']//ancestor::li[@class='multiselect-item-checkbox']"
BillingAnalyst_UploadDocuments_DocumentType_dropDownCheckboxOptions3_Locator="//input[@aria-label='" +str(CheckboxOptions3)+"']//ancestor::li[@class='multiselect-item-checkbox']"
BillingAnalyst_UploadDocuments_Done_Button_Locator="//button[contains(text(),'Done')]"
BillingAnalyst_UploadDocuments_fileAttached_Locator="//span[@class='fileName'][contains(text(),'"+str(PDFFileName)+"')]"
BillingAnalyst_UploadDocuments_fileAttached_100MB_Locator="//span[@class='fileName'][contains(text(),'"+str(PDFFileName1)+"')]"
BillingAnalyst_UploadDocuments_DocumentSelectionErrors_window_Locator="//h3[normalize-space()='Document Selection Errors']"
BillingAnalyst_AppealFindings_ConfirmAppeal_Button_Locator="//button[normalize-space()='Confirm Appeal']"
BillingAnalyst_AppealFindings_appealReasonComments_Locator="//textarea[@name='appealReasonComments']"
BillingAnalyst_Esignature_Locator="//input[@id='fileUploadereSignatureInput']"
BillingAnalyst_Title_Locator="//input[@id='fileUploaderTitleInput']"
BillingAnalyst_date_Locator="//input[@id='fileUploaderDateInput']"
file100MB_Remove_Attachment_Close_Locator="//span[@class='fileName'][contains(text(),'"+str(PDFFileName1)+"')]//ancestor::li//em[normalize-space()='cancel']"
fileupload_Inprogress_locator="//label[@id='fileUploaderProgress'] "
RecordAnalyst_Remove_Attachment_Cancle_Locator="//span[@class='fileName'][contains(text(),'"+str(PDFFileName)+"')]//ancestor::li//em[normalize-space()='cancel']"
BillingAnalyst_window_Confirm_Delete_Document_Locator="//h3[normalize-space()='Confirm Delete Document']"
BillingAnalyt_window_Remove_This_Document_From_Pending_Upload_Queue_Locator="//div[@class='content']//div[@class='content']"
BillingAnalyst_Button_Yes_Confirm_Delete_Document_window_Locator="//button[normalize-space()='YES']"
BillingAnalyst_Window_Document_Delete_Locator="//h3[normalize-space()='Document Delete']"
BillingAnalyst_window_Document_uploading_error_locator="//div[@class='ui modal visible active']//div[@class='content']//p[@class='white-space-pre-wrap']"
BillingAnalyst_button_close_Document_uploading_error_locator="//div[@class='actions actions-default show-defaults-actions']//button[@class='ui button tertiary large uploadAlignCancel'][normalize-space()='Close']"
BillingAnalyst_button_OK_Document_uploading_error_locator= "//button[normalize-space()='OK']"
BillingAnalyst_button_close_Document_delete_windw_locator="//div[@class='title']//h3[contains(text(),' Document Delete')]//ancestor::div[@class='header']//a//em[@class='material-icons-outlined'][contains(text(),'close')]"
BillingAnalyst_AuditInfo_DOB_Detail_Locator="//div[@class='shortBox']//h5[contains(text(),'Date Of Birth')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AuditInfo_SubscriberID_Detail_Locator="//div[@class='info']//h5[contains(text(),'Subscriber ID')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AuditInfo_GroupID_Detail_Locator="//div[@class='shortBox']//h5[contains(text(),'Group ID')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AuditInfo_ClaimNum_Detail_Locator="//div[@class='box']//h5[contains(text(),'Claim Number')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AuditInfo_ClaimType_Detail_Locator="//div[@class='box']//h5[contains(text(),'Claim Type')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AuditInfo_MediRecNum_Detail_Locator="//div[@class='box']//h5[contains(text(),'Medical Record Number')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AuditInfo_AuditNum_Detail_Locator="//div[@class='shortBox']//h5[contains(text(),'Audit Number')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AuditInfo_AuditStatus_Detail_Locator="//div[@class='mediumBox']//h5[contains(text(),'Audit Status')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AuditInfo_AuditType_Detail_Locator="//div[@class='shortBox']//h5[contains(text(),'Audit Type')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AuditInfo_ProviderName_Detail_Locator="//div[@class='box']//h5[contains(text(),'Provider Name')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AuditInfo_ProviderNum_Detail_Locator="//div[@class='box']//h5[contains(text(),'Provider Number')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AuditInfo_DivisionCode_Detail_Locator="//div[@class='box']//h5[contains(text(),'Division Code')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AuditInfo_AdmitDate_Detail_Locator="//div[@class='box']//h5[contains(text(),'Admit Date')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AuditInfo_DischargeDate_Detail_Locator="//div[@class='box']//h5[contains(text(),'Discharge Date')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AuditInfo_Prepay_Detail_Locator="//*[@id='main']//div[contains(@class,'clsPrepay')]/span"

BillingAnalyst_AppealInfo_DOB_Detail_Locator="//div[@class='shortBox']//h5[contains(text(),'Date Of Birth')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AppealInfo_SubscriberID_Detail_Locator="//div[@class='info']//h5[contains(text(),'Subscriber ID')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AppealInfo_GroupID_Detail_Locator="//div[@class='shortBox']//h5[contains(text(),'Group ID')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AppealInfo_ClaimNum_Detail_Locator="//div[@class='box']//h5[contains(text(),'Claim Number')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AppealInfo_ClaimType_Detail_Locator="//div[@class='box']//h5[contains(text(),'Claim Type')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AppealInfo_MediRecNum_Detail_Locator="//div[@class='box']//h5[contains(text(),'Medical Record Number')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AppealInfo_AuditNum_Detail_Locator="//div[@class='shortBox']//h5[contains(text(),'Audit Number')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AppealInfo_AuditStatus_Detail_Locator="//div[@class='mediumBox']//h5[contains(text(),'Audit Status')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AppealInfo_AuditType_Detail_Locator="//div[@class='shortBox']//h5[contains(text(),'Audit Type')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AppealInfo_ProviderName_Detail_Locator="//div[@class='box']//h5[contains(text(),'Provider Name')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AppealInfo_ProviderNum_Detail_Locator="//div[@class='box']//h5[contains(text(),'Provider Number')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AppealInfo_DivisionCode_Detail_Locator="//div[@class='box']//h5[contains(text(),'Division Code')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AppealInfo_AdmitDate_Detail_Locator="//div[@class='box']//h5[contains(text(),'Admit Date')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AppealInfo_DischargeDate_Detail_Locator="//div[@class='box']//h5[contains(text(),'Discharge Date')]//following-sibling::p[contains(text(),'texttoreplace')]"
BillingAnalyst_AppealInfo_Prepay_Detail_Locator="//*[@id='main']//div[contains(@class,'clsPrepay')]/span"



# BillingAnalyst_AuditInfo_PtName_Locator="//ancestor::div[@class='card selected audit']//h3[@class='name'][contains(text(),'"+str(PtName)+"')]"
# BillingAnalyst_AuditInfo_DOB_Detail_Locator="//ancestor::div[@class='card selected audit']//div[@class='title'][contains(text(),'Date Of Birth')]//following-sibling::div[@class='data'][contains(text(),'"+str(DOB)+"')]"
# BillingAnalyst_AuditInfo_PtAccNum_Detail_Locator="//ancestor::div[@class='card selected audit']//div[@class='title'][contains(text(),'Patient Account Number')]//following-sibling::div[@class='data'][contains(text(),'"+str(PtAccNumAudit)+"')]"
# BillingAnalyst_AuditInfo_AuditNum_Detail_Locator="//ancestor::div[@class='card selected audit']//div[@class='title'][contains(text(),'Audit Number')]//following-sibling::div[@class='data'][contains(text(),'"+str(AuditNum)+"')]"
# BillingAnalyst_AuditInfo_DOS_Detail_Locator="//ancestor::div[@class='card selected audit']//div[@class='title'][contains(text(),'Dates Of Service')]//following-sibling::div[@class='data'][contains(text(),'"+str(DOS)+"')]"
#BillingAnalyst_AuditInfo_MediRecNum_Detail_Locator="//ancestor::div[@class='card selected audit']//div[@class='title'][contains(text(),'Medical Record Number')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
# BillingAnalyst_AuditInfo_ClaimNum_Detail_Locator="//ancestor::div[@class='box']//h5[contains(text(),'Claim Number')]//following-sibling::p[contains(text(),'"+str(ClaimNum)+"')]"
# BillingAnalyst_AuditInfo_ProviderName_Detail_Locator="//ancestor::div[@class='card selected audit']//div[@class='title'][contains(text(),'Provider Name')]//following-sibling::div[@class='data'][contains(text(),'"+str(ProviderName)+"')]"
# BillingAnalyst_AuditInfo_ProviderID_Detail_Locator="//ancestor::div[@class='card selected audit']//div[@class='title'][contains(text(),'Provider Number')]//following-sibling::div[@class='data'][contains(text(),'"+str(ProviderID)+"')]"


BillingAnalyst_AuditFindingsTile_PtName_Locator="//ancestor::div[@class='card selected audit']//h3[@class='name'][contains(text(),'texttoreplace')]"
BillingAnalyst_AuditFindingsTile_DOB_Detail_Locator="//ancestor::div[@class='card selected audit']//div[@class='title'][contains(text(),'Date Of Birth')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
BillingAnalyst_AuditFindingsTile_PtAccNum_Detail_Locator="//ancestor::div[@class='card selected audit']//div[@class='title'][contains(text(),'Patient Account Number')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
BillingAnalyst_AuditFindingsTile_AuditNum_Detail_Locator="//ancestor::div[@class='card selected audit']//div[@class='title'][contains(text(),'Audit Number')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
BillingAnalyst_AuditFindingsTile_DOS_Detail_Locator="//ancestor::div[@class='card selected audit']//div[@class='title'][contains(text(),'Dates Of Service')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
BillingAnalyst_AuditFindingsTile_MediRecNum_Detail_Locator="//ancestor::div[@class='card selected audit']//div[@class='title'][contains(text(),'Medical Record Number')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
BillingAnalyst_AuditFindingsTile_ClaimNum_Detail_Locator="//ancestor::div[@class='card selected audit']//div[@class='title'][contains(text(),'Claim Number')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
BillingAnalyst_AuditFindingsTile_ProviderName_Detail_Locator="//ancestor::div[@class='card selected audit']//div[@class='title'][contains(text(),'Provider Name')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
BillingAnalyst_AuditFindingsTile_ProviderID_Detail_Locator="//ancestor::div[@class='card selected audit']//div[@class='title'][contains(text(),'Provider Number')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
BillingAnalyst_AuditFindingsTile_AppealDecision_Detail_Locator="//ancestor::div[@class='card selected audit']//div[@class='title'][contains(text(),'Appeal Decision')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
BillingAnalyst_AuditFindingsTile_Prepay_Detail_Locator = "//ancestor::div[@class='card selected audit']//div[@class='title'][contains(text(),'Prepay')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"

BillingAnalyst_AppealFindingsTile_PtName_Locator="//ancestor::div[@class='card selected appeal']//h3[@class='name'][contains(text(),'texttoreplace')]"
BillingAnalyst_AppealFindingsTile_DOB_Detail_Locator="//ancestor::div[@class='card selected appeal']//div[@class='title'][contains(text(),'Date Of Birth')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
BillingAnalyst_AppealFindingsTile_PtAccNum_Detail_Locator="//ancestor::div[@class='card selected appeal']//div[@class='title'][contains(text(),'Patient Account Number')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
BillingAnalyst_AppealFindingsTile_AuditNum_Detail_Locator="//ancestor::div[@class='card selected appeal']//div[@class='title'][contains(text(),'Audit Number')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
BillingAnalyst_AppealFindingsTile_DOS_Detail_Locator="//ancestor::div[@class='card selected appeal']//div[@class='title'][contains(text(),'Dates Of Service')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
BillingAnalyst_AppealFindingsTile_MediRecNum_Detail_Locator="//ancestor::div[@class='card selected appeal']//div[@class='title'][contains(text(),'Medical Record Number')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
BillingAnalyst_AppealFindingsTile_ClaimNum_Detail_Locator="//ancestor::div[@class='card selected appeal']//div[@class='title'][contains(text(),'Claim Number')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
BillingAnalyst_AppealFindingsTile_ProviderName_Detail_Locator="//ancestor::div[@class='card selected appeal']//div[@class='title'][contains(text(),'Provider Name')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
BillingAnalyst_AppealFindingsTile_ProviderID_Detail_Locator="//ancestor::div[@class='card selected appeal']//div[@class='title'][contains(text(),'Provider Number')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
BillingAnalyst_AppealFindingsTile_AppealDecision_Detail_Locator="//ancestor::div[@class='card selected appeal']//div[@class='title'][contains(text(),'Appeal Decision')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"
AuditResults_Tile_Locator="//div[@class='card selected audit' or @class='card selected appeal']"
BillingAnalyst_AppealFindingsTile_Prepay_Detail_Locator="//ancestor::div[@class='card selected appeal']//div[@class='title'][contains(text(),'Prepay')]//following-sibling::div[@class='data'][contains(text(),'texttoreplace')]"


BillingAnalyst_AppealFinding_DocumentDetailsList_Table_rows_Locator="//div[@class='fileList']//ul//li["+ str(DefaultIndex) +"]"
BillingAnalyst_AppealFinding_DocumentNameList_Table_rows_Locator="//div[@class='fileList']//ul//li//div[@class='documents']"

#BillingAnalyst_AppealFindings_DocumentName_Locator= "//div[@class='fileList']//ul//li["+ str(DefaultIndex) +"]//div[@class='documents']"
BillingAnalyst_AppealFindings_DocumentSize_Locator="//span[@class='fileName'][contains(text(),'"+str(PDFFileName)+"')]//ancestor::li//span[@id='fileUploaderDocumentFileSize']"
BillingAnalyst_AppealFindings_DocumentUploadDate_Locator="//span[@class='fileName'][contains(text(),'"+str(PDFFileName)+"')]//ancestor::li//span[@id='fileUploaderDocumentUploadDate']"
BillingAnalyst_AppealFindings_DocumentUploadTime_Locator="//span[@class='fileName'][contains(text(),'"+str(PDFFileName)+"')]//ancestor::li//span[@id='fileUploaderDocumentUploadTime']"
BillingAnalyst_AppealFindings_DocumentUser_Locator="//span[@class='fileName'][contains(text(),'"+str(PDFFileName)+"')]//ancestor::li//span[@id='fileUploaderDocumentUploadUser']"

BillingAnalyst_AppealFinding_RequestExtension_Button_Locator="//div[normalize-space()='" + str(PtAccNumAppeal) + "']//ancestor::div[@class='card selected appeal']//button[contains(text(),'Request Extension')]"
BillingAnalyst_AuditFinding_RequestExtension_Button_Locator="//div[normalize-space()='" + str(PtAccNumAudit) + "']//ancestor::div[@class='card selected audit']//button[contains(text(),'Request Extension')]"
BillingAnalyst_RequestExtension_Popup_Locator="//h3[normalize-space()='Request Extension']"
BillingAnalyst_AuditFindings_RequestExtension_ExtensionGranted_Locator="//div[normalize-space()='" + str(PtAccNumAudit) + "']//ancestor::div[@class='card selected audit' or @class='card audit']//div[contains(text(),'Extension Granted')]"
BillingAnalyst_AppealFindings_RequestExtension_ExtensionGranted_Locator="//div[normalize-space()='" + str(PtAccNumAppeal) + "']//ancestor::div[@class='card selected appeal' or @class='card appeal']//div[contains(text(),'Extension Granted')]"
BillingAnalyst_DaysRemaining_Audit_Locator="//div[normalize-space()='" + str(PtAccNumAudit) + "']/preceding-sibling::div[contains(text(),'Day')]"
BillingAnalyst_DaysRemaining_Appeal_Locator="//div[normalize-space()='" + str(PtAccNumAppeal) + "']/preceding-sibling::div[contains(text(),'Day')]"
Comm_Portal_FilterTab_AppealDecesion_ReviewButton_Locator1="//div[@class='title'][contains(text(),'Appeal Decision')]//following-sibling::div[@class='data'][contains(text(),'MWS')]//ancestor::div[@class ='card selected audit' or @class='card selected appeal']//button[contains(text(),'Review')]"
Comm_Portal_FilterTab_AppealDecesion_ReviewButton_Locator2="//div[@class='title'][contains(text(),'Appeal Decision')]//following-sibling::div[@class='data'][contains(text(),'MOD')]//ancestor::div[@class ='card selected audit' or @class='card selected appeal']//button[contains(text(),'Review')]"

Comm_Portal_FilterTab_AppealDecision_DropDown_Locator="//select[@id='filterAppealDecision']"
Comm_Portal_FilterTab_AppealDecision_DropDown_option1_Locator="//select[@id='filterAppealDecision']//ancestor::option[text()='Appeal Is Modified']"
Comm_Portal_FilterTab_AppealDecision_DropDown_option2_Locator="//select[@id='filterAppealDecision']//ancestor::option[text()='Appeal Is Upheld']"
Comm_Portal_FilterTab_Review_Button_Locator="//div[@class ='card selected appeal' or @class ='card selected audit' or @class ='card selected']//button[contains(text(),'Review')]"
Comm_Portal_FilterTab_Prepay_DropDown_Locator="//*[@id='filterPrepayValue']"
Comm_Portal_FilterTab_Prepay_DropDown_Yes_option_Locator="//*[@id='filterPrepayValue']/option[contains(text(),'Yes')]"
Comm_Portal_FilterTab_Prepay_DropDown_No_option_Locator="//*[@id='filterPrepayValue']/option[contains(text(),'No')]"
Comm_Portal_FilterTab_Prepay_Yes_Locator="//div[@class='title'][contains(text(),'Prepay')]//following-sibling::div[contains(text(),'Yes')]"
Comm_Portal_FilterTab_Prepay_No_Locator="//div[@class='title'][contains(text(),'Prepay')]//following-sibling::div[contains(text(),'No')]"

#AN


BillingAnalyst_AppealFindingsTile_Agreewithfinding_Esignature_Locator="//input[@id='agreeFormeSignatureInput']"
BillingAnalyst_AppealFindingsTile_Agreewithfinding_Title_Locator="//input[@id='agreeFormTitleInput']"
BillingAnalyst_AppealFindingsTile_Agreewithfinding_Date_Locator="//input[@id='agreeFormDateSignedInput']"
BillingAnalyst_AppealFindingsTile_LatestAppeal_CancelButton_Locator="//button[@id='agreeFormCancelButton']"
Comm_Portal_FilterButton_Locator="//a[@class='filterButton']"
Comm_Portal_FilterButton_filterPatientAccountLabel_Locator="//label[@id='filterPatientAccountLabel']"
Comm_Portal_FilterButton_filterMRNumberLabel_Locator="//label[@id='filterMRNumberLabel']"
Comm_Portal_FilterButton_filterAuditNumberLabel_Locator="//label[@id='filterAuditNumberLabel']"
Comm_Portal_FilterButton_filterClaimTypeLabel_Locator="//label[@id='filterClaimTypeLabel']"
Comm_Portal_FilterButton_filterProviderNumber_Locator="//label[text()='Provider Number']"
Comm_Portal_FilterButton_filterDaysRemainingLabel_Locator="//label[@id='filterDaysRemainingLabel']"
Comm_Portal_FilterButton_filterClaimNumberLabel_Locator="//label[@id='filterClaimNumberLabel']"
Comm_Portal_FilterButton_filterAppealDecisionLabel_Locator="//label[@id='filterAppealDecisionLabel']"
Comm_Portal_FilterButton_ClearFilterButton_Locator="//a[@id='filterClearButton']"
Comm_Portal_FilterButton_ApplyFilterButton_Locator="//button[@id='filterApplyButton']"
Comm_Portal_FilterButton_PatientAccountNumber_TextField_Locator="//input[@id='filterPatientAccountInput']"
Comm_Portal_FilterButton_MRNumber_TextField_Locator="//input[@id='filterMRNumberInput']"
Comm_Portal_FilterButton_AuditNumber_TextField_Locator="//input[@id='filterAuditNumberInput']"
Comm_Portal_FilterButton_AppealDecesion_TextField_Locator="//select[@id='filterAppealDecision']"
Comm_Portal_FilterButton_ClaimType_TextField_Locator="//select[@id='filterClaimType']//ancestor::option[text()='Inpatient']"
Comm_Portal_FilterButton_ClaimType_TextField_Locator1="//select[@id='filterClaimType']//ancestor::option[text()='Outpatient']"
Comm_Portal_FilterButton_ProviderNumber_TextField_Locator="//input[@id='providerNumber']"
Comm_Portal_FilterButton_DaysRemaining_TextField_Locator="//select[@id='filterDaysRemaining']"
Comm_Portal_FilterButton_ClaimNumber_TextField_Locator= "//input[@id='filterClaimNumberInput']"
Comm_Portal_FilterButton_AppealDecision_Upheld_TextField_Locator="//select[@id='filterAppealDecision']//ancestor::option[text()='Upheld']"
Comm_Portal_FilterButton_AppealDecision_Modified_TextField_Locator= "//select[@id='filterAppealDecision']//ancestor::option[text()='Modified']"
Comm_Portal_FilterButton_PatientAccountNumber_Locator="//div[text() ='texttoreplace']// ancestor::div[@class ='card selected appeal' or @class ='card selected audit' or @class ='card selected']//button[contains(text(),'Review')]"
Comm_Portal_FilterButton_MedicalRecordNumber_Locator="//div[normalize-space()='texttoreplace']//ancestor::div[@class ='card selected appeal' or @ class ='card selected audit']//button[contains(text(),'Review')]"
Comm_Portal_FilterButton_AuditNumber_Locator="//div[normalize-space()='texttoreplace']//ancestor::div[@class ='card selected appeal' or @class ='card selected audit' or @class ='card selected']//button[contains(text(),'Review')]"
Comm_Portal_FilterButton_ProviderNumber_Locator = "//div[normalize-space()='texttoreplace']//ancestor::div[@class ='card selected appeal' or @class ='card selected audit' or @class ='card selected']//button[contains(text(),'Review')]"
Comm_Portal_FilterButton_ClaimNumber_Locator = "//div[normalize-space()='texttoreplace']//ancestor::div[@class ='card selected appeal' or @class ='card selected audit' or @class ='card selected']//button[contains(text(),'Review')]"
BillingAnalyst_AppealFindingsTile_AppealFinding_CofirmAppeal_Button_Locator="//button[@id='fileUploaderSubmitButton']"
#Satheesh

BillingAnalyst_Overdue_locator="//div[normalize-space()='" + str(PtAccNumAppeal) + "']/preceding-sibling::div[@class='deadline redCountdown'][contains(text(),'OVERDUE')]"
BillingAnalyst_Apoproaching_Overdue_locator="//div[normalize-space()='" + str(PtAccNumAppeal) + "']/preceding-sibling::div[@class='deadline redCountdown'][contains(text(),'Days')]"
BillingAnalyst_NotApoproaching_Overdue_locator="//div[normalize-space()='" + str(PtAccNumAppeal) + "']/preceding-sibling::div[@class='deadline greenCountdown'][contains(text(),'Days')]"
BillingAnalyst_AgreeWithFindings_Confirm_Agreement_button="//button[@id='agreeFormConfirmAgreementButton']"
BillingAnalyst_Confirm_Findings_Agreement_PopUp_Head_Locator="//h3[normalize-space()='Confirm Findings Agreement']"
BillingAnalyst_Confirm_Findings_Agreement_PopUp_Body_Locator="//p[normalize-space()='Are you ready to approve the audit findings?']"
BillingAnalyst_Confirm_Findings_Agreement_PopUp_Yes_Button_Locator="//button[@id='agreeFormYesButton']"
BillingAnalyst_Confirm_Findings_Agreement_PopUp_No_Button_Locator="//button[@id='agreeFormNoButton']"
BillingAnalyst_Confirm_Findings_Agreement_Successful_PopUp_GoToDashboard_Button_Locator="//*[@id='agreeFormGoToDashboardButton']"

BillingAnalyst_Initial_Appeal_Findings_Tab_locator="//h6[text()=' initial findings']"
BillingAnalyst_First_level_Appeal_Findings_Tab_locator="//h6[text()=' First Appeal Findings ']"
BillingAnalyst_Second_level_Appeal_Findings_Tab_locator="//h6[text()=' Second Appeal Findings ']"
BillingAnalyst_First_Appeal_Findings_ReasonForAppeal="//div[@class='appealReasonList']//div"
BillingAnalyst_Second_Appeal_Findings_ReasonForAppeal="//div[@class='appealReasonList']//div"
BillingAnalyst_Cancel_Appeal_Submission_PopUp_Head_Locator="//h3[normalize-space()='Cancel Appeal Submission']"
BillingAnalyst_Cancel_Appeal_Submission_PopUp_Body_Locator="//p[contains(text(),'Creation of this appeal has been cancelled. Any uploaded files are still pending submission. This audit will continue to remain on your Audit Results dashboard until an agreement is confirmed or a new appeal is created. ')]"
BillingAnalyst_Cancel_Appeal_Submission_PopUp_GoToDashboard_Button_Locator="//button[@class='ui secondary large uploadAlign']"
BillingAnalyst_Cancel_Appeal_Submission_PopUp_ContinueToNextAudit_Button_Locator="//button[@class='ui primary large uploadAlignCancel']"
BillingAnalyst_Filtered_result_Text_locator ="//span[@class='filteredResults']"
BillingAnalyst_AppealFinding__Confirm_Findings_Appeal_PopUp_Head_Locator= "//h3[normalize-space()='Confirm Findings Appeal']"
BillingAnalyst_AppealFinding__Confirm_Findings_Appeal_PopUp_Body_Locator="//p[normalize-space()='Are you ready to submit the appeal?']"
BillingAnalyst_AppealFinding__Confirm_Findings_Appeal_PopUp_Yes_Button_Locator= "//button[@id='fileUploaderRAFormYesButton']"
BillingAnalyst_AppealFinding__Confirm_Findings_Appeal_PopUp_No_Button_Locator= "//button[@id='fileUploaderRAFormNoButton']"
BillingAnalyst_Appeal_Submission_Success_PopUp_GoToDashboard_Button_Locator="//button[contains(text(),'Go To Dashboard')]"

BillingAnalyst_AppealFindings_Remove_Attachment_Locator = "//*[@id='fileUploaderRemoveFileIcon']"


#AN
BillingAnalyst_Dashboard_Text="//h2[text()='Audit Results : Awaiting Provider Response ']"



BillingAnalyst_ExportAudit_Button_Locator="//*[@id='main']//a/em[contains(text(),'download')]"

##List View
BillingAnalyst_ListView_Element_Locator= "//*[@id='dashboardPageLinkControl']"
BillingAnalyst_ListView_Actions_ColumnHeader_Element_Locator="//*[@id='dashboardPageTableControl']//table[1]/thead/tr/th[1]"
BillingAnalyst_ListView_DaysLeft_ColumnHeader_Element_Locator="//*[@id='dashboardPageTableControl']//table[1]/thead/tr/th[2]"
BillingAnalyst_ListView_PatientName_ColumnHeader_Element_Locator="//*[@id='dashboardPageTableControl']//table[1]/thead/tr/th[3]"
BillingAnalyst_ListView_PatientAccountNumber_ColumnHeader_Element_Locator="//*[@id='dashboardPageTableControl']//table[1]/thead/tr/th[4]"
BillingAnalyst_ListView_Prepay_ColumnHeader_Element_Locator="//*[@id='dashboardPageTableControl']//table[1]/thead/tr/th[5]"
BillingAnalyst_ListView_ProviderName_ColumnHeader_Element_Locator="//*[@id='dashboardPageTableControl']//table[1]/thead/tr/th[6]"
BillingAnalyst_ListView_AuditType_ColumnHeader_Element_Locator="//*[@id='dashboardPageTableControl']//table[1]/thead/tr/th[7]"
BillingAnalyst_ListView_AppealDecision_ColumnHeader_Element_Locator="//*[@id='dashboardPageTableControl']//table[1]/thead/tr/th[8]"
BillingAnalyst_ListView_BirthDate_ColumnHeader_Element_Locator="//*[@id='dashboardPageTableControl']//table[1]/thead/tr/th[9]"
BillingAnalyst_ListView_DatesOfService_ColumnHeader_Element_Locator="//*[@id='dashboardPageTableControl']//table[1]/thead/tr/th[10]"
BillingAnalyst_ListView_ProviderNumber_ColumnHeader_Element_Locator="//*[@id='dashboardPageTableControl']//table[1]/thead/tr/th[11]"
BillingAnalyst_ListView_AuditNumber_ColumnHeader_Element_Locator="//*[@id='dashboardPageTableControl']//table[1]/thead/tr/th[12]"
BillingAnalyst_ListView_ClaimNumber_ColumnHeader_Element_Locator="//*[@id='dashboardPageTableControl']//table[1]/thead/tr/th[13]"
BillingAnalyst_ListView_MedicalRecordNumber_ColumnHeader_Element_Locator="//*[@id='dashboardPageTableControl']//table[1]/thead/tr/th[14]"
BillingAnalyst_ListView_DueDate_ColumnHeader_Element_Locator="//*[@id='dashboardPageTableControl']//table[1]/thead/tr/th[15]"

BillingAnalyst_ListView_RequestExtension_Button_Locator= "//table[1]/tbody//td[contains(text(),'texttoreplace')]//preceding-sibling::td[contains(@class,'actioncolumn')]//button[contains(@id,'tableComponentRequestExtensionButton')]"
BillingAnalyst_ListView_ExtensionGranted_Locator= "//table[1]/tbody//td[contains(text(),'texttoreplace')]//preceding-sibling::td[contains(@class,'actioncolumn')]//div[contains(text(),'Extension Granted')]"
BillingAnalyst_ListView_Audit_Review_Button_Locator="//table[1]/tbody//td[contains(text(),'texttoreplace')]//preceding-sibling::td[contains(@class,'actioncolumn')]//button[contains(text(),'Review')]"
BillingAnalyst_ListView_DaysRemaining_Audit_Locator="//table[1]/tbody//td[contains(text(),'texttoreplace')]//preceding-sibling::td[2]"
BillingAnalyst_ListView_AuditType_Locator="//table[1]//tbody//td[7][contains(text(),'Audit')]//following-sibling::td[5]"
Comm_Portal_FilterButton_List_view_PatientAccountNumber_Locator="//table[1]/tbody/tr[1]/td[4][contains(text(),'texttoreplace')]"
Comm_Portal_FilterButton_List_view_ProviderName_Information_Locator="//table[1]/tbody/tr[1]/td[4][contains(text(),'texttoreplace')]//following-sibling::td[2]/app-table-tooltip/div/em"
Comm_Portal_FilterButton_List_view_ProviderName_Information_Icon_Text_Locator="//table[1]/tbody/tr[1]/td[4][contains(text(),'texttoreplace')]//following-sibling::td[2]/app-table-tooltip/div/span/span"
BiilingAnalyst_List_view_Table_PatientAccountNumber_Locator="//table[1]/tbody/tr/td[4]"
BiilingAnalyst_List_view_PatientAccountNumber_Locator="//table[1]/tbody/tr/td[4][contains(text(),'texttoreplace')]"
BiilingAnalyst_List_view_DateOfBirth_Locator="//table[1]/tbody/tr/td[9][contains(text(),'texttoreplace')]"
BiilingAnalyst_List_view_Prepay_Locator="//table[1]/tbody/tr/td[5][contains(text(),'texttoreplace')]"

BiilingAnalyst_List_view_Next_Link_Locator="//pagination-controls/pagination-template/ul/li/a[contains(text(),'Next')]"
BiilingAnalyst_List_view_Second_page_Locator="//pagination-controls/pagination-template/ul/li[4]"
BiilingAnalyst_List_view_First_page_Locator="//pagination-controls/pagination-template/ul/li[3]"
BiilingAnalyst_List_view_Previous_Link_Locator="//pagination-controls/pagination-template/ul/li/a[contains(text(),'Previous')]"


Comm_Portal_FilterButton_List_view_PatientName_Locator="//table[1]/tbody/tr[1]/td[3][contains(text(),'texttoreplace')]"
Comm_Portal_FilterButton_List_view_MedicalRecordNumber_Locator="//table[1]/tbody/tr[1]/td[14][contains(text(),'texttoreplace')]"
Comm_Portal_FilterButton_List_view_AuditNumber_Locator="//table[1]/tbody/tr[1]/td[12][contains(text(),'texttoreplace')]"
Comm_Portal_FilterButton_List_view_ClaimNumber_Locator="//table[1]/tbody/tr[1]/td[13][contains(text(),'texttoreplace')]"
Comm_Portal_FilterButton_List_view_AppealDecisson_AppealUpheld_Locator="//table[1]/tbody/tr[1]/td[8][contains(text(),'UPH')]"
Comm_Portal_FilterButton_List_view_AppealDecisson_AppealModified_Locator="//table[1]/tbody/tr[1]/td[8][contains(text(),'MOD')]"
Comm_Portal_FilterButton_List_view_ProviderName_Locator="//table[1]/tbody/tr[1]/td[6]/p[contains(text(),'texttoreplace')]"
Comm_Portal_FilterButton_List_view_DateOFService_Locator="//table[1]/tbody/tr[1]/td[10][contains(text(),'texttoreplace')]"
Comm_Portal_FilterButton_List_view_AppealDecision_Locator="//table[1]/tbody/tr[1]/td[8][contains(text(),'texttoreplace')]"
Comm_Portal_FilterButton_List_view_AppealDecisson_Locator="//table[1]/tbody/tr[1]/td[8]"

Comm_Portal_FilterButton_List_view_ProviderNumber_Locator="//table[1]/tbody/tr[1]/td[11][contains(text(),'texttoreplace')]"
Comm_Portal_FilterButton_No_Filter_Records_Element_Locator="//*[@id='dashboardPageTableControl']/span/div"
Comm_Portal_FilterButton_List_view_Prepay_No_Element_Locator="//table[1]/tbody/tr/td[5][contains(text(),'No')]"
Comm_Portal_FilterButton_List_view_Prepay_Yes_Element_Locator="//table[1]/tbody/tr/td[5][contains(text(),'Yes')]"

BillingAnalyst_ListView_Filtered_List_Review_Button_Locator="//table[1]/tbody//td[1]/button[contains(text(),'Review')]"
BillingAnalyst_DetailsPage_ClaimType_Locator ="//h5[contains(text(),'Claim Type')]//following-sibling::p"
BillingAnalyst_ListView_PatientsName_Table_Locator="(//table[1]/tbody/tr/td[3])"
BillingAnalyst_ListView_PatientAccountNumber_Table_Locator="(//table[1]/tbody/tr/td[4])"
BillingAnalyst_ListView_Prepay_Table_Locator="(//table[1]/tbody/tr/td[5])"
BillingAnalyst_ListView_ProviderName_Table_Locator="(//table[1]/tbody/tr/td[6])"
BillingAnalyst_ListView_AuditType_Table_Locator="(//table[1]/tbody/tr/td[7])"
BillingAnalyst_ListView_AppealDecision_Table_Locator="(//table[1]/tbody/tr/td[8])"
BillingAnalyst_ListView_BirthDate_Table_Locator="(//table[1]/tbody/tr/td[9])"
BillingAnalyst_ListView_DateOfService_Table_Locator="(//table[1]/tbody/tr/td[10])"
BillingAnalyst_ListView_ProviderNumber_Table_Locator="(//table[1]/tbody/tr/td[11])"
BillingAnalyst_ListView_AuditNumber_Table_Locator="(//table[1]/tbody/tr/td[12])"
BillingAnalyst_ListView_ClaimNumber_Table_Locator="(//table[1]/tbody/tr/td[13])"
BillingAnalyst_ListView_MedicalRecord_Table_Locator="(//table[1]/tbody/tr/td[14])"
BillingAnalyst_ListView_DueDate_Table_Locator="(//table[1]/tbody/tr/td[15])"

BillingAnalyst_Total_Records_Element_Locator="//app-audits-requests-access//div[contains(text(),'Audit Results')]"