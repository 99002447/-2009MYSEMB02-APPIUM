*** Settings ***
Documentation    This file will take care of login credentials
...    browser activites and ,screenshot folder
Library    AppiumLibrary   
Library    Process         


#Library    DataDriver    file=../data/login.xlsx    sheet_name=ValidCredentialtemplate


*** Keywords ***
Open Zomato
    [Arguments]    ${port}
   Open Application    remote_url=http://localhost:${port}/wd/hub
    ...    platformName=Android    deviceName=POCO F1        appPackage=com.application.zomato    appActivity=com.application.zomato.activities.Splash     
    ...    noReset=true    adbExecTimeout=80000    uiautomator2ServerInstallTimeout=150000    androidInstallTimeout=250000    
    #...    #app=${EXECDIR}${/}APP${/}Khan Academy_v6.2.1_apkpure.com.apk
    Set Appium Timeout    40
    
Click Skip
    Wait Until Page Contains    Skip    
    Click Element    xpath=//*[@text='Skip']
    
Search
    [Arguments]    ${item}
    Wait Until Element Is Visible    xpath=//*[contains(@text,'Search')]    
    Click Element    xpath=//*[contains(@text,'Search')]   
    Wait Until Element Is Visible    xpath=//*[contains(@text,'Start typing')]
    Input Text    xpath=//*[contains(@text,'Start typing')]    ${item}
    
    
Hotel searcher
    [Arguments]    ${hotel}
    FOR    ${i}    IN RANGE    0    999
        ${list}    Run Keyword And Ignore Error    Get Webelements    xpath=//*[contains(@text,'${hotel}')]
        Exit For Loop If    '${list}[0]'=='PASS'
        Swipe By Percent    50    75    50    25    3000
    END
    Click Element    xpath=//*[contains(@text,'${hotel}')] 
    
Dish searcher
    [Arguments]    ${dish}
    FOR    ${i}    IN RANGE    0    999
        ${list}    Run Keyword And Ignore Error    Get Webelements    xpath=//*[contains(@text,'${dish}')]
        Exit For Loop If    '${list}[0]'=='PASS'
        Swipe By Percent    50    75    50    25    3000
    END
    Click Element    xpath=//*[contains(@text,'${dish}')]/following::*[@content-desc='Add 1 item to cart'] 
    Page Should Not Contain Text    Currently not accepting orders 
