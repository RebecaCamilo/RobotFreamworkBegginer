*** Settings ***
Documentation    IQS - Automação FrontEnd (WEB)
...
...              Utilizando Test Setup e Test Teardown.
Library    SeleniumLibrary

Test Setup    Run Keywords
...    Open Browser    url=${URL}    browser=${BROWSER}    AND
...    Maximize Browser Window    AND
...    Realizar login com ${USUARIO_VALIDO} e ${SENHA}

Test Teardown    Close Browser

*** Variables ***
### Dados de configuração ###
${URL}    https://www.saucedemo.com/v1/
${BROWSER}    chrome
### Massa de teste ###
${USUARIO_VALIDO}    standard_user
${SENHA}    secret_sauce
${SAUCE_LABS_BACKPACK_ITEN_NAME}    Sauce Labs Backpack
${SAUCE_LABS_BIKE_LIGHT_ITEM_NAME}    Sauce Labs Bike Light
${T_SHISRT_RED_ITEN_NAME}    Test.allTheThings() T-Shirt (Red)

### Page Object Model (POM) ###
&{LOGIN_PAGE}
...    UsernameInput=id:user-name
...    PasswordInput=xpath://input[@name='password']
...    LoginButton=css:[class=btn_action]
&{HOME_PAGE}
...    SauceLabsBackpackAddCartButton=//div[contains(text(),'Sauce Labs Backpack')]//..//..//..//button
...    SauceLabsBikeLightAddCartButton=//div[contains(text(),'Sauce Labs Bike Light')]//..//..//..//button
...    TShirtRedSauceLabsBikeLightAddCartButton=//div[contains(text(),'T-Shirt (Red)')]//..//..//..//button
...    CartIcon=id:shopping_cart_container
...    CartSpanNumberIcon=xpath://*[@id="shopping_cart_container"]/a/span
...    SortSelect=//select
...    AZSortSelect=//select//option[contains(text(),'Name (A to Z)')]
...    SauceLabsBackpackIten=xpath://*[@id="item_4_title_link"]/div
...    SauceLabsBikeLightIten=xpath://*[@id="item_0_title_link"]/div
&{DETAIL_PAGE}
...    ItenTitle=xpath://*[@id="inventory_item_container"]/div/div/div/div[1]
&{CART_PAGE}
#como usar o localizador 'normal', sem ser por xpath?
...    SauceLabsBackpackIten=xpath://*[@id="item_4_title_link"]/div
...    SauceLabsBikeLightIten=xpath://*[@id="item_0_title_link"]/div
...    TShirtRedSauceLabsBikeLightIten=xpath://*[@id="item_3_title_link"]/div
    
*** Keywords ***
### Ações ###
Realizar login com ${username} e ${password}
    Wait Until Element Is Visible    locator=${LOGIN_PAGE.UsernameInput}
    Input Text    locator=${LOGIN_PAGE.UsernameInput}    text=${username}
    Wait Until Element Is Visible    locator=${LOGIN_PAGE.PasswordInput}
    Input Text    locator=${LOGIN_PAGE.PasswordInput}    text=${password}    
    Wait Until Element Is Enabled    locator=${LOGIN_PAGE.LoginButton}
    Click Element    locator=${LOGIN_PAGE.LoginButton}

Clicar no botao ${botao} para adicionar item ao carrinho 
    Wait Until Element Is Enabled    locator=${botao}
    Click Element    locator=${botao}

Clicar na caixa de selecao de ordenacao
    Wait Until Element Is Enabled    locator=${HOME_PAGE.SortSelect}
    Click Element    locator=${HOME_PAGE.SortSelect}

Clicar em ${opcao} na caixa de selecao
    Wait Until Element Is Enabled    locator=${opcao}
    Click Element    locator=${opcao}

Clicar no icone carrinho de compras
    Wait Until Element Is Visible    locator=${HOME_PAGE.CartIcon}
    Click Element    locator=${HOME_PAGE.CartIcon}

Clicar no item ${item}
    Wait Until Element Is Visible    locator=${item}
    Click Element    locator=${item}

### Verificações ###
Verificar se item ${item} do ${locator} foi adicionado corretamente
    ${mensagem_obtida}=    Get Text    locator=${locator}
    ${mensagem_esperada}=    Set Variable    ${item}
    Should Be Equal    first=${mensagem_obtida}    second=${mensagem_esperada}

Verificar se ${span} carrinho acrescentou ${quantidade} itens
    ${mensagem_obtida}=    Get Text    locator=${span}
    ${mensagem_esperada}=    Set Variable    ${quantidade}
    Should Be Equal    first=${mensagem_obtida}    second=${mensagem_esperada}

Verificar se itens estao exibidos em ordem alfabética crescente
        Wait Until Element Is Visible    locator=${HOME_PAGE.CartIcon}

Verificar se o nome do item ${item} selecionado é mostrado no ${locator}
    ${mensagem_obtida}=    Get Text    locator=${locator}
    ${mensagem_esperada}=    Set Variable    ${item}
    Should Be Equal    first=${mensagem_obtida}    second=${mensagem_esperada}

*** Test Cases ***
TC000 - Adicionar item ao carrinho de compras
    [Tags]    FLUXO-POSITIVO    REQ001
    #selecionar botao "ADD CART" do item escolhido
    Wait Until Element Is Visible    locator=${HOME_PAGE.SauceLabsBackpackAddCartButton}
    Click Element    locator=${HOME_PAGE.SauceLabsBackpackAddCartButton}
    #clicar no carrinho
    Wait Until Element Is Visible    locator=${HOME_PAGE.CartIcon}
    Click Element    locator=${HOME_PAGE.CartIcon}
    #Verificar se o item escolhido esta lá
    Verificar se item ${SAUCE_LABS_BACKPACK_ITEN_NAME} do ${CART_PAGE.SauceLabsBackpackIten} foi adicionado corretamente

TC001 - Adicionar varios itens ao carrinho
    [Tags]    FLUXO-POSITIVO    REQ001
    Clicar no botao ${HOME_PAGE.SauceLabsBackpackAddCartButton} para adicionar item ao carrinho 
    Clicar no botao ${HOME_PAGE.SauceLabsBikeLightAddCartButton} para adicionar item ao carrinho 
    Clicar no botao ${HOME_PAGE.TShirtRedSauceLabsBikeLightAddCartButton} para adicionar item ao carrinho
    Verificar se ${HOME_PAGE.CartSpanNumberIcon} carrinho acrescentou 3 itens

TC002 - Ordenar produtos por nome (A a Z)
    [Tags]    FLUXO-POSITIVO    REQ002
    Clicar na caixa de selecao de ordenacao
    Clicar em ${HOME_PAGE.AZSortSelect} na caixa de selecao
    #Verificar se itens estao exibidos em ordem alfabética crescente

TC003 - Ordenar produtos por nome (Z a A)
    [Tags]    FLUXO-POSITIVO    REQ003
    Clicar na caixa de selecao de ordenacao
    Clicar em ${HOME_PAGE.AZSortSelect} na caixa de selecao
    #Verificar se itens estao exibidos em ordem alfabética decrescente

TC004 - Verificar detalhes de vários produtos
    [Tags]    FLUXO-POSITIVO    REQ004
    Clicar no item ${HOME_PAGE.SauceLabsBackpackIten}
    Verificar se o nome do item ${SAUCE_LABS_BACKPACK_ITEN_NAME} selecionado é mostrado no ${DETAIL_PAGE.ItenTitle}    

TC005 - Verificar detalhes do segundo produto
    [Tags]    FLUXO-POSITIVO    REQ005
    Clicar no item ${HOME_PAGE.SauceLabsBikeLightIten}
    Verificar se o nome do item ${SAUCE_LABS_BIKE_LIGHT_ITEM_NAME} selecionado é mostrado no ${DETAIL_PAGE.ItenTitle}    

TC006 - Remover vários itens do carrinho
    [Tags]    FLUXO-POSITIVO    REQ006
    Clicar no botao ${HOME_PAGE.SauceLabsBackpackAddCartButton} para adicionar item ao carrinho 
    Clicar no botao ${HOME_PAGE.SauceLabsBikeLightAddCartButton} para adicionar item ao carrinho 
    Clicar no botao ${HOME_PAGE.TShirtRedSauceLabsBikeLightAddCartButton} para adicionar item ao carrinho
    #clicar no carrinho
    Wait Until Element Is Visible    locator=${HOME_PAGE.CartIcon}
    Click Element    locator=${HOME_PAGE.CartIcon}
    #Remover itens do carrinho
