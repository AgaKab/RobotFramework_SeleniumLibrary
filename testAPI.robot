*** Settings ***
Library  RequestsLibrary


*** Variables ***
${url}      http://127.0.0.1:5000


*** Test Cases ***
Test create new game
    [Documentation]    Test tworzenia nowej gry
    ${response}  POST    ${url}/game
#   powonanie danych ale muszą byc wszytskie w tym samym typie wiec zmiana od razu na numbers obu
    should be equal as numbers    ${response.status_code}  201
    ${json_data}       set variable        ${response.json()}
#    log    ${json_data}
    log to console    ${json_data}
    log     ${json_data["message"]}
    log to console      ${json_data["message"]}
    should be equal     ${json_data["message"]}     New game created
#   set suite varialbe ma taką samą funkcje jak w linijce 14 (przypisywanie zmiennej) ale to daje nam globalną zmienną
    set suite variable      ${game_id}      ${json_data["game_id"]}
    log     ${game_id}
    log to console  ${game_id}

Get Game Status
    [documentation]   Test pobierania stanu gry
    ${response}     GET        ${url}/game/${game_id}
    should be equal as numbers   ${response.status_code}  200
    ${json_data}       set variable        ${response.json()}
    log to console   ${json_data}
    log     ${json_data}
    should be empty     ${json_data["moves"]}

Make First Move
    [Documentation]   Test wykonania pierwszego ruchu
    ${body}  create dictionary      cellIndex=3
    ${response}   POST        ${url}/game/${game_id}/move       json=${body}
    should be equal as numbers   ${response.status_code}  200
    ${json_data}       set variable        ${response.json()}
    log to console   ${json_data}
    log     ${json_data}
    should be equal     ${json_data["game_id"]}     ${game_id}
    should be equal     ${json_data["message"]}     Move made
    should be equal     ${json_data["moves"]}     3X