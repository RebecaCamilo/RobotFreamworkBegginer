*** Variables ***
${NOME}    João
${SENHA}    123

*** Test Cases ***
ConditionExample
    IF    "${NOME}" == "João" and "${SENHA}" == "123"
        Log To Console    Consegue logar      
    ELSE
        Log To Console    Acesso negado
    END
