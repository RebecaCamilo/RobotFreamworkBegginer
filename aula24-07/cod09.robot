*** Settings ***
Documentation    IQS - Automação FrontEnd (WEB)
...
...              Utilizando Test Setup e Test Teardown.
Library    SeleniumLibrary

Test Setup    Run Keywords
...    Open Browser    url=${URL}    browser=${BROWSER}    AND
...    Maximize Browser Window

Test Teardown    Close Browser

*** Variables ***
### Dados de configuração ###
${URL}    https://www.saucedemo.com/v1/
${BROWSER}    chrome
### Massa de teste ###
${USUARIO_VALIDO}    standard_user
${USUARIO_INVALIDO}    locked_out_user
${SENHA}    secret_sauce
### Page Object Model (POM) ###
&{LOGIN_PAGE}
...    UsernameInput=id:user-name
...    PasswordInput=xpath://input[@name='password']
...    LoginButton=css:[class=btn_action]

*** Keywords ***
### Ações ###
Realizar login com ${username} e ${password}
    Wait Until Element Is Visible    locator=${LOGIN_PAGE.UsernameInput}
    Input Text    locator=${LOGIN_PAGE.UsernameInput}    text=${username}
    Wait Until Element Is Visible    locator=${LOGIN_PAGE.PasswordInput}
    Input Text    locator=${LOGIN_PAGE.PasswordInput}    text=${password}
    
    Wait Until Element Is Enabled    locator=${LOGIN_PAGE.LoginButton}
    Click Element    locator=${LOGIN_PAGE.LoginButton}
    
*** Test Cases ***
TC001 - Realizar login com usuário válido
    [Tags]    FLUXO-POSITIVO    REQ001
    Realizar login com ${USUARIO_VALIDO} e ${SENHA}

TC002 - Realizar login com usuário invalido
    [Tags]    FLUXO-NEGATIVO    REQ002
    Realizar login com ${USUARIO_INVALIDO} e ${SENHA}
