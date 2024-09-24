import yaml
from yaml import load

# with open('C:\\Communication Portal\\communication-portal-automation\\UI\\Regression_Suite\\TestData\\AuditHistory_TestData.yaml') as f:
# with open('C:\\gitrep\\properpay-automation\\PPay_Project\\TestData\\AuditHistory_TestData.yaml') as f:
with open('C:\\ProperPay\\ProperPay_Automation\\TestData\\UI\\AuditStudio\\PPay7_AuditQueuePage_TestData.yaml')as f:

    var = yaml.full_load(f)
    AuditQueue_AuditNumber= var.get("AuditQueue_AuditNumber")
    Assigned_Username= var.get("AssignedUserName")

PPay7_AuditQueuePage_AuditQueue_HamburgerIcon_Locator="//a[@class='tooltip'][@data-text='Audits']"
PPay7_AuditQueuePage_AuditQueue_Label_Locator="//div[@class='mat-tab-label-content'][text()= 'Audit Queue']"
PPay7_AuditQueuePage_Action_Label_Locator="//mat-label[text()='Actions']"
PPay7_AuditQueuePage_Assigned_Label_Locator="//mat-label[contains(text(),'Assigned')]"
PPay7_AuditQueuePage_TableLayout_Label_Locator="//mat-label[contains(text(),'Table Layout')]"
PPay7_AuditQueuePage_Filter_Label_Locator="//a[contains(text(),'Filter')]"
PPay7_AuditQueuePage_Search_Label_Locator="//mat-label[contains(text(),'Search')]"
PPay7_AuditQueuePage_AuditNumber_hyperlink_Locator="//a[contains(text(),'" +str(AuditQueue_AuditNumber)+"')]"
PPay7_AuditQueuePage_Assigned_UserName_Locator ="//span[@class='mat-select-min-line ng-tns-c110-6 ng-star-inserted'][contains(text()," +str(Assigned_Username)+")]"
