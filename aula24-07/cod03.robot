*** Settings ***
Documentation    IQS - Automação FrontEnd (WEB)
...
...              Interagindo com o navegador.
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
    Input Text    locator=id:password    text=secret_sauce
    Click Element    locator=id:login-button
    Close Browser
