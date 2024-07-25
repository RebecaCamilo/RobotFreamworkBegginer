*** Variables ***
${IDADE}    ${20}
${NOME}    Rebeca Camilo
${PESO}    ${80}
${ALTURA}    ${1.73}
${ESTADO_CIVIL}    S

*** Test Cases ***
Math
    Log To Console    \nSoma: 3 + 1 = ${3 + 1}
    Log To Console    \nSubtração: 12 - 40 = ${12 - 40}
    Log To Console    \nMultiplicação: 5 x 7 = ${5 * 7}
    Log To Console    \nDivisão: 16 / 3 = ${16 // 3}
    Log To Console    \nResto da Divisão: 9 % 3 = ${9 % 3}
