*** Settings ***
Documentation    Script to Test ppay 7
Library    SeleniumLibrary
#Variables    ..//ProperPay_Automation//ElementsLocator//UI//CommonFunctionality//PPay7_CommonFunctionality_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//CommonFunctionality//PPay7_CommonFunctionality_TestData.yaml

*** Keywords ***

Finish TestCase
    Close Browser



Launch PPay7 login Page
    Set Selenium Implicit Wait    10
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --start-maximized
    Call Method    ${options}    add_argument      disable-web-security
    Call Method    ${options}    add_argument      allow-running-insecure-content
    Create WebDriver    Chrome    chrome_options=${options}
    Go To    ${PPay7_url}
    Wait Until Keyword Succeeds    10x    2s    Title Should Be    ${PPay7_LandingPageTitle}



