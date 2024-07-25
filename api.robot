*** Settings ***

Library    Collections
Library    RequestsLibrary
Library    JSONLibrary

Suite Setup    Create Session    alias=${SESSION_NAME}    url=${BASE_URL}

*** Variables ***

${BASE_URL}    https://restful-booker.herokuapp.com
${SESSION_NAME}    iqs
${PAYLOADS_DIR}    ${CURDIR}${/}payloads
${CONTRACTS_DIR}    ${CURDIR}${/}contracts

*** Keywords ***

GET /${endpoint}
    [Arguments]    ${expected_status}
    ${response}    GET On Session    alias=${SESSION_NAME}    url=/${endpoint}    expected_status=${expected_status}
    RETURN    ${response}

GET /${endpoint}/${id}
    [Arguments]    ${expected_status}
    ${response}    GET On Session    alias=${SESSION_NAME}    url=${endpoint}/${id}    expected_status=${expected_status}
    RETURN    ${response}

POST /${endpoint}
    [Arguments]    ${filename}    ${expected_status}
    ${payload}    Load Json From File    ${CURDIR}${/}payloads${/}${filename}
    ${response}    POST On Session    alias=${SESSION_NAME}    url=/${endpoint}    json=${payload}    expected_status=${expected_status}
    RETURN    ${response}

PUT /${endpoint}/${id}
    [Arguments]    ${filename}    ${expected_status}
    ${token}    Get Token
    ${payload}    Load Json From File    ${PAYLOADS_DIR}${/}${filename}
    ${headers}    Create Dictionary    Cookie=token\=${token}
    ${response}    PUT On Session    alias=${SESSION_NAME}    url=/${endpoint}/${id}   json=${payload}    headers=${headers}    expected_status=${expected_status}
    RETURN    ${response}

PATCH /${endpoint}/${id}
    [Arguments]    ${filename}    ${expected_status}
    ${token}    Get Token
    ${payload}    Load Json From File    ${PAYLOADS_DIR}${/}${filename}
    ${headers}    Create Dictionary    Cookie=token\=${token}
    ${response}    PATCH On Session    alias=${SESSION_NAME}    url=/${endpoint}/${id}   json=${payload}    headers=${headers}    expected_status=${expected_status}
    RETURN    ${response}

Get Token
    ${response}    POST /auth    PostAuthValid.json    200
    ${token}    Set Variable    ${response.json()}[token]
    RETURN    ${token}

Select Randon BookingId From Booking List
    ${response}    GET /booking    200
    ${bookingId}    Evaluate    random.choice($response.json())['bookingid']    modules=random
    RETURN    ${bookingId}

### Validation ###
Valid Json
    [Arguments]    ${response}    ${filename}
    Validate Json By Schema File    ${response.json()}    ${CONTRACTS_DIR}${/}${filename}

*** Test Cases ***

TC1: realizar autenticação com usuário válido
    ${response}    POST /auth    PostAuthValid.json    200
    Valid Json    ${response}    CreateTokenValid.json

TC2: realizar autenticação com usuário inválido
    ${response}    POST /auth    PostAuthInvalid.json    200    
    Valid Json    ${response}    CreateTokenInvalid.json

TC3: obter lista de reservas
    ${response}    GET /booking    200    
    Valid Json    ${response}    GetBooking.json

TC4: obter reserva por ID
    ${bookingId}    Select Randon BookingId From Booking List
    
    ${response}    GET /booking/${bookingId}    200
    Valid Json    ${response}    GetBookingId.json

TC5: criar reserva
    ${response}    POST /booking    PostBooking.json    200
    Valid Json    ${response}    CreateBooking.json

    ${bookingId}    Set Variable    ${response.json()}[bookingid]
    ${booking}    Set Variable    ${response.json()}[booking]

    ${response}    GET /booking/${bookingId}    200
    Dictionaries Should Be Equal    ${booking}    ${response.json()}

TC6: substituir reserva
    ${bookingId}    Select Randon BookingId From Booking List

    ${response}    PUT /booking/${bookingId}    PutBooking.json    200
    Valid Json    ${response}    UpdateBooking.json

    ${newResponse}    GET /booking/${bookingId}    200
    Dictionaries Should Be Equal    ${newResponse.json()}    ${response.json()}

TC7: editar reserva
    ${bookingId}    Select Randon BookingId From Booking List

    ${response}    PATCH /booking/${bookingId}    PatchBooking.json    200
    Valid Json    ${response}    PartialUpdateBooking.json

    ${newResponse}    GET /booking/${bookingId}    200
    Dictionaries Should Be Equal    ${newResponse.json()}    ${response.json()}
