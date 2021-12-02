*** Settings ***
Documentation     Play around with selenium library
...               more documentation
Library           SeleniumLibrary

*** Variables ***
${SITE_URL}    https://vaccine-haven.herokuapp.com/
${BROWSER}     Chrome

*** Keywords ***
# user defined expressions and actions

Open Application
    Open Browser  ${SITE_URL}  ${BROWSER}

*** Test Cases ***
Go to Home Page
    Open Application
    Title Should Be    Vaccine Haven
    Page Should Contain  Citizen Registration
    Page Should Contain  Vaccine Reservation

Reserve a person
    Click Link  Reserve Vaccine
    Input Text   name:citizen_id     9621054559951
    Select from list by value    name:site_name  OGYHSite
    Select from list by value    name:vaccine_name  Pfizer
    Click Element    id:reserve__btn
    Sleep   3

Check reservation
    Click Link  My Info
    Input Text   name:citizen_id     9621054559951
    Click Element    id:info__btn
    Sleep   3
    Page Should Contain  Phuwanut
    Page Should Contain  Jiamwatthanaloet
    Page Should Contain  Pfizer

Cancel reservation
    Click Element    id:cancel__btn
