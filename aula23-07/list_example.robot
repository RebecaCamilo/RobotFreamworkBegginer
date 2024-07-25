*** Variables ***
@{LISTA_VEICULOS}    Carro    Navio    Avião

*** Test Cases ***
ListExample
    Log To Console    \n${LISTA_VEICULOS}[0]
    FOR    ${veiculo}    IN    @{LISTA_VEICULOS}
        Log To Console    \n${veiculo}
    END
