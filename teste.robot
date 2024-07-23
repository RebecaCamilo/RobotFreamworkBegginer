*** Settings ***
*** Variables ***
${GREETING}    Hello World!

*** Test Cases ***
Greet User
    Log To Console    ${GREETING}
