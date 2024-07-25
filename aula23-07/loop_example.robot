*** Variables ***
${NUMERO_LOUCA}    ${5}
${NUMBER}    ${0}

*** Test Cases ***
LoopExample
    WHILE    ${NUMERO_LOUCA} > 0
        Log To Console    \nUma louça foi lavada!
        ${NUMERO_LOUCA}    Evaluate    ${NUMERO_LOUCA} - 1
        Log To Console    Restam ${NUMERO_LOUCA} louças para serem lavadas.
    END

LoopExample2
    #${i} começa em 0
    FOR    ${i}    IN RANGE    ${NUMERO_LOUCA}
        Log To Console    \nUma louça foi lavada!
        ${restam}    Evaluate    ${NUMERO_LOUCA} - ${i} - 1
        Log To Console    Restam ${restam} louças para serem lavadas.
    END

LoopExample3
    WHILE    ${NUMBER} <= 10
        Log To Console    \n${NUMBER}
        ${NUMBER}    Evaluate    ${NUMBER} + 1
        # teste comentario
        ${NOME}    Set Variable    Breno
        Log To Console    ${NOME}
    END
