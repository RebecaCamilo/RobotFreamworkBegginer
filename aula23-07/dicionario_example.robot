*** Variables ***
&{DICIONARIO}    chave1=Carro    chave2=Navio    chave3=Avião

*** Test Cases ***
DicionarioExample
    # Log To Console    \n${DICIONARIO}
    # Log To Console    \n${DICIONARIO.chave1}
    FOR    ${obj}    IN    &{DICIONARIO}
        Log To Console    \n${obj}
    END
