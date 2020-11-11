*** Settings ***

Resource    Resources/commonfunctionality.resource  
#Suite Setup    Start Process    appium    -p    4724    --relaxed-security     shell=True    alias=appiumserver    stdout=D:\\appium.txt    stderr=D:\\appium1.txt     
#Suite Teardown    Terminate Process    appiumserver    kill=true   
 
Test Template    TC2_ZomatoMiniProject_Search&PlaceOrder_Template        


*** Test Cases ***

TC2_ZomatoMiniProject_Search&PlaceOrder using    4724    Biryani    Big Chicken    Mutton       
TC3_ZomatoMiniProject_Search&PlaceOrder using    4724    Fried Rice    Rongkup    Chicken Fried Rice 
    
 
*** Keywords ***
   
TC2_ZomatoMiniProject_Search&PlaceOrder_Template
    [Arguments]    ${port}    ${item}    ${hotel}    ${food}  
    Open Zomato    ${port}
    Click Skip
    Search    ${item}
    Wait Until Element Is Visible    xpath=//*[contains(@text,'- Delivery')]
    Click Element    xpath=//*[contains(@text,'- Delivery')]
    Sleep    3 
    Wait Until Element Is Visible    xpath=//*[@text='Filters'] 
    Click Element    xpath=//*[@text='Filters']      
    Click Element    xpath=//*[@text='Rating'] 
    Swipe    727    1839    727    1400    1500
    Click Element    xpath=//*[@text='Sort by'] 
    Click Element    xpath=//*[@text='Rating: High To Low']
    Click Element    xpath=//*[@text='Apply']
    Hotel searcher    ${hotel}
    Sleep    2    
    Dish searcher    ${food}    
    Wait Until Element Is Visible    xpath=//*[@text='View Cart']  
    Click Element    xpath=//*[@text='View Cart']
    Sleep    8    
    Page Should Contain Text    Grand Total    
    Click Element    xpath=//*[contains(@content-desc,'tap to remove 1')]
    Sleep    5
        

   
        
    
    
    
    
    
    


    