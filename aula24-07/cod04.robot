*** Settings ***
Documentation    IQS - Automação FrontEnd (WEB)
...
...              Mapeando as propiedades dos elementos.
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.saucedemo.com/v1/
${BROWSER}    chrome

*** Keywords ***

*** Test Cases ***
TC001 - Realizar login com usuário válido
    Open Browser    url=${URL}    browser=${BROWSER}
    Maximize Browser Window
    Input Text    locator=id:user-name    text=standard_user
    Input Text    locator=xpath://input[@name='password']    text=secret_sauce
    Click Element    locator=css:[class=btn_action]
    Close Browser
