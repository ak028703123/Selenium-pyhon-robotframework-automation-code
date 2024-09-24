*** Settings ***
Documentation    Script to Test Edit Studio Login Page
Library    SeleniumLibrary
Library    XML
Variables    ..//ProperPay_Automation//ElementsLocator//UI//EditStudio//LoginPage_Elements.py
#Variables    ..//ProperPay_Automation//ElementsLocator//UI//EditStudio//PPay7_Homepage_Elements.py
Variables    ..//ProperPay_Automation//TestData//UI//EditStudio//LoginPage_TestData.yaml




*** Keywords ***
Launch Edit Studio Page
    Set Selenium Implicit Wait    10
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --start-maximized
    Call Method    ${options}    add_argument      disable-web-security
    Call Method    ${options}    add_argument      allow-running-insecure-content
    Create WebDriver    Chrome    chrome_options=${options}
    Go To    ${Edit_Studio_url}
#    Wait Until Keyword Succeeds    10x    2s    Title Should Be    ${Edit_Studio_LandingPage_Title}             timeout=120
    #Wait Until Element Is Visible     ${Comm_Portal_LoginPageBKgrdImage_Locator}   timeout=120
#    Element Should Be Visible         ${Edit_Studio_LoginPageTitleHeader_Locator}                                   timeout=120

Finish TestCase
    Close Browser


Valid User Login
#   [Arguments]    ${Edit_Studio_Username}  ${Edit_Studio_Password}
   #Verify if a user can login with a valid username and a valid password.


    Input Text    ${Edit_Studio_LoginPageUsername_Locator}    ${Edit_Studio_Username}
    Input Text    ${Edit_Studio_LoginPagePassword_Locator}    ${Edit_Studio_Password}
    Click Button    ${Edit_Studio_LoginPageLoginButton_Locator}