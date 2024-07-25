*** Variables ***
${IDADE}    ${20}
${NOME}    Rebeca Camilo
${PESO}    ${80}
${ALTURA}    ${1.73}
${ESTADO_CIVIL}    S

*** Test Cases ***
showUserInfo
    Log To Console    \n\nNome: ${NOME} \nIdade: ${IDADE} \nPeso: ${PESO} \nAltura: ${ALTURA} \nEstado Civil: ${ESTADO_CIVIL}
