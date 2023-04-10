*** Settings ***
Documentation       To-Do List Website Test Cases

Library             SeleniumLibrary


*** Variables ***
${URL}          https://abhigyank.github.io/To-Do-List/
${BROWSER}      Chrome


*** Test Cases ***
Create To-Do List Item
    Open Browser To Todo List
    Add New Item
    Verify Item Created Successfully
    Delete Item
    Add New Item
    Verify Item Created Successfully
    Mark Item As Complete
    Verify Item Completed Successfully


*** Keywords ***
Open Browser To Todo List
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    id=new-task

Add New Item
    Click Element    xpath=//html/body/div/div/div[1]/a[1]/span
    Input Text    xpath=//*[@id="new-task"]    New Item
    Click Element    xpath=//*[@id="add-item"]/button

Verify Item Created Successfully
    Click Element    xpath=//html/body/div/div/div[1]/a[2]/span
    Wait Until Element Is Visible    //*[@id="incomplete-tasks"]/li[1]/label

Delete Item
    Click Element    xpath=//span[contains(text(),'New Item')]/following::button[1]
    Element Should Not Be Visible    xpath=//span[contains(text(),'New Item')]

Mark Item As Complete
    Click Element    xpath=//html/body/div/div/div[1]/a[2]/span
    Click Element    xpath=//*[@id="incomplete-tasks"]/li[1]/label/span[4]

Verify Item Completed Successfully
    Click Element    xpath=/html/body/div/div/div[1]/a[3]/span
    Wait Until Element Is Visible    xpath=//span[contains(text(),'New Item')]
    Element Should Contain    xpath=//*[@id="completed-tasks"]/li[1]    New Item
