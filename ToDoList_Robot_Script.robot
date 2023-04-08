*** Settings ***
Documentation    Testing Todo List website using Robot Framework
Library          Selenium2Library
Library          FakerLibrary

*** Variables ***
${BROWSER}       chrome
${URL}           https://abhigyank.github.io/To-Do-List/
${WAIT_TIME}     5s

*** Test Cases ***
Test Case 1: Verify that the user can add a new task
    [Tags]    add_task
    Open Browser To Todo List
    Input Task Details
    Click Add Task
    Verify Task Added Successfully

Test Case 2: Verify that the user can mark a task as completed
    [Tags]    mark_completed
    Open Browser To Todo List
    Input Task Details
    Click Add Task
    Mark Task As Completed
    Verify Task Marked As Completed

Test Case 3: Verify that the user can delete a task
    [Tags]    delete_task
    Open Browser To Todo List
    Input Task Details
    Click Add Task
    Delete Task
    Verify Task Deleted Successfully

Test Case 4: Verify that the user can edit a task
    [Tags]    edit_task
    Open Browser To Todo List
    Input Task Details
    Click Add Task
    Edit Task
    Verify Task Edited Successfully

Test Case 5: Verify that the user can clear all completed tasks
    [Tags]    clear_completed
    Open Browser To Todo List
    Input Task Details
    Click Add Task
    Mark Task As Completed
    Clear All Completed Tasks
    Verify All Completed Tasks Cleared Successfully

Test Case 6: Verify that the user can clear all tasks
    [Tags]    clear_all_tasks
    Open Browser To Todo List
    Input Task Details
    Click Add Task
    Clear All Tasks
    Verify All Tasks Cleared Successfully

*** Keywords ***
Open Browser To Todo List
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    id=taskInput

Input Task Details
    ${task} =    FakerLibrary.Random String    length=10
    Input Text    id=taskInput    ${task}

Click Add Task
    Click Element    id=addButton
    Wait Until Page Contains Element    xpath=//li[contains(@class, 'list-group-item
