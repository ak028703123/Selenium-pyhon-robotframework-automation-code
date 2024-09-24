import yaml
from yaml import load
import os

with open(os.getcwd()+'\\TestData\\UI\\RecoveryStudio\\AuditHistory_TestData.yaml') as f:
    var = yaml.full_load(f)
    HistoryTab_PatientName=var.get("HistoryTab_PatientName")
    HistoryTab_PatientName_Header=var.get("HistoryTab_PatientName_Header")
    HistoryTab_PatientAuditNumber=var.get("HistoryTab_PatientAuditNumber_Header")
    HistoryTab_PatientAccountNumber = var.get("HistoryTab_PatientAccountNumber")
    HistoryTab_PatientAccNumber = var.get("HistoryTab_PatientAccNumber")
    HistoryTab_PageNumber = var.get("Page_Number")


# Satheesh
# AuditHistory_PatientName_Hyperlink_Locator= "//a[normalize-space()='"+ str(HistoryTab_PatientName)+"']"
AuditHistory_PatientName_Hyperlink_Locator= "//tbody/tr/td[2]/a[contains(text(),'"+ str(HistoryTab_PatientName)+"')]"
AuditHistory_PatientName_Header_Locator= "//h1[normalize-space()='texttoreplace']"
AuditHistory_PatientAuditNumber_Locator= "//span[contains(text(),'texttoreplace')]"
AuditHistory_DOB_Detail_Locator= "//p[normalize-space()='texttoreplace']"
AuditHistory_AuditStatus_Locator= "//h4[normalize-space()='Patient Account Number: texttoreplace']"
AuditHistory_AuditNum_Locator= "//p[normalize-space()='texttoreplace']"
AuditHistory_Claimnum_Locator= "//p[normalize-space()='texttoreplace']"


AuditHistory_PatientsName_Table_Locator= "(//table[1]/tbody/tr/td/a)"
AuditHistory_PatientAccountNumber_Table_Locator= "(//table[1]/tbody/tr/td[3])"
AuditHistory_MedicalRecordNumber_Table_Locator= "(//table[1]/tbody/tr/td[4])"
AuditHistory_ProviderNumber_Table_Locator= "(//table[1]/tbody/tr/td[5])"
AuditHistory_DatesOfService_Table_Locator= "(//table[1]/tbody/tr/td[6])"
AuditHistory_PortalStatus_Table_Locator= "(//table[1]/tbody/tr/td[7])"
AuditHistory_StatusDate_Table_Locator= "(//table[1]/tbody/tr/td[8])"
AuditHistory_AuditNumber_Table_Locator= "(//table[1]/tbody/tr/td[9])"
AuditHistory_ClaimNumber_Table_Locator= "(//table[1]/tbody/tr/td[10])"
AuditHistory_HamburgerHomeIcon_Locator= "//body/app-root/app-header/div[@class='sideNav']/div/ul/li[1]/a[1]"
AuditHistory_HamburgerMenu_Locator= "//input[@type='checkbox']"
AuditHistory_HistoryIcon_Locator= "//span[normalize-space()='History']"
AuditHistory_CancelIcon_Locator= "//input[@class='toggler ng-valid ng-dirty ng-touched']"
AuditHistory_dashboard_hyperlink_Locator ="//div[@class='breadcrumbs']//a[contains(text(),'DASHBOARD ')]"
AuditHistory_Header_Locator ="//h1[@class='section-title']"
AuditHistory_Filterhyperlink_Locator ="//a[@class='filterButton']"
AuditHistory_Action_headercolumn_Locator ="//body//app-root//th[1]"
AuditHistory_PatientName_ColumnHeader_Locator ="//th[@data-order='desc']"
AuditHistory_PatientAccountNumber_ColumnHeader_Locator ="//th[text()='Patient Account']//em"
AuditHistory_MedicalRecordNumber_ColumnHeader_Locator ="//th[text()='Medical Record']//em"
AuditHistory_ProviderNumber_ColumnHeader_Locator ="//th[text()='Provider']//em"
AuditHistory_Datesofservice_ColumnHeader_Locator ="//th[text()='Dates Of']//em"
AuditHistory_PortalStatus_ColumnHeader_Locator ="//th[text()='Audit Status']//em"
AuditHistory_StatusDate_ColumnHeader_Locator ="//th[text()='Status Date']//em"
AuditHistory_AuditNumber_ColumnHeader_Locator ="//th[text()='Audit']//em"
AuditHistory_ClaimNumber_ColumnHeader_Locator ="//th[text()='Claim Number']//em"
AuditHistory_ItemsPerPage_label_Locator= "//label[text()='Items per page: ']"
AuditHistory_ItemsPerPage_Dropdown_Locator ="//div[@id='main']//select"
AuditHistory_ItemsPerPage5_Locator= "//div[@id='main']//option[text()=' 5 ']"
AuditHistory_ItemsPerPage10_Locator ="//div[@id='main']//option[text()=' 10 ']"
AuditHistory_Selected_Page_Number_Locator ="//li[@class='current']//span[text()='" +str(HistoryTab_PageNumber)+"']"
AuditHistory_Nextpage_Locator ="//a[@aria-label='Next page']"
AuditHistory_Prevpage_Locator ="//a[@aria-label='Prev page']"
AuditHistory_Filter_button_Locator= "//div[@class='alignToBox']//a[@class='filterButton']"
AuditHistory_PatientAccountNumber_FilterOption_TextBox_Locator ="//input[@id='sharedHistoryPatientAccountInput']"
AuditHistory_ApplyFilter_button_Locator= "//button[@id='sharedHistoryApplyFiltersButton']"
AuditHistory_RA_OverdueAuditStatus_Locator= "//td[text()=' Record Request Overdue ']"
AuditHistory_RA_NonOverdueAuditStatus_Locator= "//td[text()=' Medical Record Requested ']"
AuditHistory_BA_OverdueAuditStatus_Locator= "//td[text()=' Findings Response Overdue ']"
AuditHistory_BA_NonOverdueAuditStatus_Locator= "//td[text()=' Findings Notification Sent ']"
AuditHistory_AuditStatus_Filter_Dropdown_Locator= "//div[@class='select']//select[@id='sharedHistoryStatus']"
AuditHistory_Page_number="//span[normalize-space()='" +str(HistoryTab_PageNumber)+"']"





# AK




#AN
AuditHistory_FilterButton_Locator="//a[@class='filterButton']"
AuditHistory_ApplyFilterButton_Locator="//button[@id='sharedHistoryApplyFiltersButton']"
AuditHistory_ClearFilterButton_Locator="//a[@id='sharedHistoryClearFiltersButton']"
AuditHistory_filter_FromstatusDatelabel_Locator="//label[@id='sharedHistoryFromStatusDateLabel']"
AuditHistory_filter_FromstatusDate_Textfield_Locator="//input[@id='sharedHistoryFromStatusDateInput']"
AuditHistory_filter_TostatusDateLabel_Locator="//label[@id='sharedHistoryToStatusDateLabel']"
AuditHistory_filter_TostatusDate_Textfield_Locator="//input[@id='sharedHistoryToStatusDateInput']"
AuditHistory_filter_PatientAccountNumberLabel_Locator="//label[@id='sharedHistoryPatientAccountLabel']"
AuditHistory_filter_MRNumberLabel_Locator="//label[@id='sharedHistoryMRNumberLabel']"
AuditHistory_filter_AuditStatusLabel_Locator="//label[text()='Audit Status']"
AuditHistory_filter_AuditNumberLabel_Locator="//label[@id='sharedHistoryAuditNumberLabel']"
AuditHistory_filter_ClaimTypeLabel_Locator="//label[@id='sharedHistoryClaimTypeLabel']"
AuditHistory_filter_ProviderNumberLabel_Locator="//label[text()='Provider Number']"
# AuditHistory_UploadDocument_Locator="(//button[text()='Upload Documents'])[2]"
# AuditHistory_MedicalRecordNumber_Locator="//table[@class='main-table mobile-optimised']/tbody/tr/td[text()=' "+str(HistoryTab_MedicalRecNumber)+" ']"
AuditHistory_PatientAccountNumber_Locator="//tbody/tr/td[contains(text(),'texttoreplace')]//ancestor::tr//td//button[@id='sharedHistoryUploadDocuments']"
# AuditHistory_PatientName_Hyperlink_Locator1= "//a[normalize-space()='" +str(HistoryTab_PatientName1)+"']//button[contains(text(),'Upload Documents')]"
# AuditHistory_MedicaRecordNumber_Locator="(//table[@class='main-table mobile-optimised']/tbody/tr/td/a)[2]"
AuditHistory_Breadcrumbs_Locator="//a[@routerlink='/ba-dashboard']"
Comm_Portal_PatientAccountNumber_Locator="//div[text() ='" +str(HistoryTab_PatientAccountNumber)+"']// ancestor::div[@class ='card selected appeal' or @class ='card selected audit' or @class ='card selected']//button[contains(text(),'Review')]"
Comm_Portal_PatientAccNumber_Locator="//div[text() ='" +str(HistoryTab_PatientAccNumber)+"']// ancestor::div[@class ='card selected appeal' or @class ='card selected audit' or @class ='card selected']//button[contains(text(),'Review')]"

AuditHistory_ExportAudit_Button_Locator="//*[@id='main']//a/em[contains(text(),'download')]"