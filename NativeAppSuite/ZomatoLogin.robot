*** Settings ***

Library    AppiumLibrary
Library    Process 
Resource    Resources/commonfunctionality.resource  
Suite Setup    Start Process    appium    -p    4724    --relaxed-security     shell=True    alias=appiumserver    stdout=D:\\appium.txt    stderr=D:\\appium1.txt     
Suite Teardown    Terminate Process    appiumserver    kill=true    

Test Template    TC1_ZomatoMiniProject_Login/Registration_Template


*** Test Cases ***

TC1_ZomatoMiniProject_Login/Registration using  4724
    

*** Keywords ***

TC1_ZomatoMiniProject_Login/Registration_Template
    [Arguments]    ${port}    
    Open Zomato     ${port}
    Wait Until Page Contains    Send OTP    
    Input Text    xpath=(//*[@class='android.widget.EditText'])[2]    7019650699
    Click Element    xpath=//*[@text='Send OTP']
    Wait Until Page Contains Element    xpath=//*[@text='Use current location']    
    Click Element    xpath=//*[@text='Use current location']
    Wait Until Page Contains Element    xpath=//*[@text='While using the app']    
    Click Element    xpath=//*[@text='While using the app']
    Sleep    5 
    

    
    
    
    


    