*** Settings ***
Documentation    IQS - Automação FrontEnd (WEB)
...
...              Utilizando o padrão Page Object Model (POM).
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.saucedemo.com/v1/
${BROWSER}    chrome
${USUARIO_VALIDO}    standard_user
${SENHA_VALIDA}    secret_sauce


&{LOGIN_PAGE}
...    UsernameInput=id:user-name
...    PasswordInput=xpath://input[@name='password']
...    LoginButton=css:[class=btn_action]

*** Keywords ***
Realizar login com ${username} e ${password}
    Wait Until Element Is Visible    locator=${LOGIN_PAGE.UsernameInput}
    Input Text    locator=${LOGIN_PAGE.UsernameInput}    text=${username}

    Wait Until Element Is Visible    locator=${LOGIN_PAGE.PasswordInput}
    Input Text    locator=${LOGIN_PAGE.PasswordInput}    text=${password}

    Wait Until Element Is Visible    locator=${LOGIN_PAGE.LoginButton}
    Click Element    locator=${LOGIN_PAGE.LoginButton}

*** Test Cases ***
TC001 - Realizar login com usuário válido
    Open Browser    url=${URL}    browser=${BROWSER}
    Maximize Browser Window
    Realizar login com ${USUARIO_VALIDO} e ${SENHA_VALIDA}
    Close Browser

TC001 - Realizar login com usuário inválido
    Open Browser    url=${URL}    browser=${BROWSER}
    Maximize Browser Window
    Realizar login com xxxxx e xxxxx
    Close Browser
