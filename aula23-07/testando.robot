*** Settings ***
Library           Dialogs

*** Variables ***
${NUM1}           10
${NUM2}           5

*** Test Cases ***
Calculadora Simples
    # Solicita ao usuário o primeiro número
    ${NUM1}    Get Value From User    Digite o primeiro número
    # Solicita ao usuário o segundo número
    ${NUM2}    Get Value From User    Digite o segundo número
    # Solicita ao usuário a operação
    ${OPERACAO}    Get Selection From User    Selecione a operação    +    -    *    /
    
    # Converte as entradas para float para garantir operações com decimais
    ${NUM1}    Evaluate    float(${NUM1})
    ${NUM2}    Evaluate    float(${NUM2})
    
    # Calcula o resultado com base na operação selecionada
    ${resultado}    Run Keyword If    '${OPERACAO}' == '+'    Evaluate    ${NUM1} + ${NUM2}
    ...    ELSE IF    '${OPERACAO}' == '-'    Evaluate    ${NUM1} - ${NUM2}
    ...    ELSE IF    '${OPERACAO}' == '*'    Evaluate    ${NUM1} * ${NUM2}
    ...    ELSE IF    '${OPERACAO}' == '/'    Evaluate    ${NUM2} != 0 and ${NUM1} / ${NUM2}
    ...    ELSE    Log    Operação inválida    WARN

    # Exibe o resultado da operação
    Log To Console    O resultado da operação ${OPERACAO} entre ${NUM1} e ${NUM2} é ${resultado}
