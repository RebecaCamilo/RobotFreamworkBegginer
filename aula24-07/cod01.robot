*** Settings ***
Documentation    IQS - Automação FrontEnd (WEB)
...
...              Exemplo de automação com Robot Framework e Selenium.
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***

*** Test Cases ***
TC001 - Realizar login com usuário válido
    Open Browser    url=https://www.saucedemo.com/v1/    browser=chrome

