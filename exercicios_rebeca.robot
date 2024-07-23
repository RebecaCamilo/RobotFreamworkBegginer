# Exercicios sobre robotframework | aula 23.07.2024
*** Variables ***
#Exercicio1
${N1}    ${5}
${N2}    ${2}
#Exercicio2
${N3}    ${100}
#Exercicio3
${NOME_ALUNO}    Ana
${DISCIPLINA}    Matemática
${NOTA1}    ${10.0}
${NOTA2}    ${8.5}
${NOTA3}    ${6.5}
${NOTA4}    ${7.5}
#Exercicio4
${ANO_NASCIMENTO}    ${1993}
${ANO_FUTURO}    ${2035}
#Exercicio5
${HORAS_TRABALHADAS}    ${1760}
${HORAS_EXTRA}    ${400}
${VALOR_HORAS_TRABALHADAS}    ${10}
${VALR_HORAS_EXTRA}    ${15}
#Exercicio6
${GRAUS_CELSIUS}    ${28}
#Exercicio7
${DIVIDENDO}    ${55}
${DIVISOR}    ${10}
#Exercicio8
${LARGURA}    ${20.0}
${COMPRIMENTO}    ${40.0}
${PRECO_M2}    ${100.0}
#Exercicio9
${DISTANCIA_PERCORRIDA}    ${6000.0}
${GASTO_COMBUSTIVEL}    ${450.0}
#Exercicio10
${xxxxx}    xxxxx
#Exercicio11
${NUMERO}    ${0}
#Exercicio12
${NOTA_1}    ${9.7}
${NOTA_2}    ${8.5}
${NOTA_3}    ${6.5}
${NOTA_4}    ${7.5}
#Exercicio13
${NUMERO1}    ${4}
${NUMERO2}    ${6}

*** Test Cases ***
Exercicio1
    Log To Console    ${N1} + ${N2} = ${${N1} + ${N2}}

Exercicio2
    ${sucessor}    Evaluate    ${N3} + 1
    ${antecessor}    Evaluate    ${N3} - 1
    Log To Console    \nO número informado foi: ${N3}
    Log To Console    O sucessor é: ${sucessor}
    Log To Console    O antecessor é: ${antecessor}

Exercicio3
    ${media}    Evaluate    (${NOTA1} + ${NOTA2} + ${NOTA3} + ${NOTA4}) / 4
    Log To Console    \nA média de ${NOME_ALUNO} em ${DISCIPLINA} é ${media}

Exercicio4
    ${idade_em_2035}    Evaluate    (${ANO_FUTURO} - ${ANO_NASCIMENTO})
    Log To Console    \nA minha idade em ${ANO_FUTURO} será ${idade_em_2035} anos

Exercicio5
    ${salario_anual}    Evaluate    (${HORAS_TRABALHADAS} * ${VALOR_HORAS_TRABALHADAS}) + (${HORAS_EXTRA} * ${VALR_HORAS_EXTRA})
    Log To Console    \nSeu salário anual é de: ${salario_anual}

Exercicio6
    ${graus_fahrenheit}    Evaluate    (${GRAUS_CELSIUS} * 1.8) + 32
    Log To Console    \nO equivalente a ${GRAUS_CELSIUS}°C é ${graus_fahrenheit}°F

Exercicio7
    ${quociente}    Evaluate    ${DIVIDENDO} // ${DIVISOR}
    ${resto}    Evaluate    ${DIVIDENDO} % ${DIVISOR}
    Log To Console    \nDividendo: ${DIVIDENDO}
    Log To Console    \nDivisor: ${DIVISOR}
    Log To Console    \nQuociente: ${quociente}
    Log To Console    \nResto: ${resto}

Exercicio8
    ${area}    Evaluate    ${LARGURA} * ${COMPRIMENTO}
    ${preco}    Evaluate    ${area} * ${COMPRIMENTO}
    Log To Console    \nÁrea: ${area}m²
    Log To Console    Preço: R$${preco}

Exercicio9
    ${consumo_medio}    Evaluate    ${DISTANCIA_PERCORRIDA} / ${GASTO_COMBUSTIVEL}
    Log To Console    \nO consumo médio é: ${consumo_medio}

Exercicio10
    Log To Console    \nxxxxxxxxx

Exercicio11
    IF    ${NUMERO} > 0
        Log To Console    \nO número é positivo
    ELSE IF    ${NUMERO} < 0
        Log To Console    \nO número é negativo
    ELSE
        Log To Console    \nO número é zero
    END


Exercicio12
    ${media}    Evaluate    (${NOTA_1} + ${NOTA_2} + ${NOTA_3} + ${NOTA_4}) / 4
    IF    ${media} >= 7
        Log To Console    \nAluno aprovado
    ELSE
        Log To Console    \nAluno reprovado
    END

Exercicio13
    IF    ${NUMERO1} > ${NUMERO2}
        Log To Console    \nO número ${NUMERO1} é maior que o número ${NUMERO2}
    ELSE
        Log To Console    \nO número ${NUMERO2} é maior que o número ${NUMERO1}
    END
