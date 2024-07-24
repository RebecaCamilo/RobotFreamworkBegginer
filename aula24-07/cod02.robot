*** Settings ***
Documentation    IQS - Automação FrontEnd (WEB)
...
...              Manipulando o navegador.
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***

*** Test Cases ***
TC001 - Realizar login com usuário válido
    Open Browser    url=https://www.saucedemo.com/v1/    browser=chrome
    Maximize Browser Window
    Close Browser

