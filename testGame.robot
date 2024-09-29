*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}  file:///home/agakab/Pobrane/webTicTacToe-master/index.html

*** Test Cases ***
#Test New Game Button
#    [Documentation]   Test otwiera aplikację webową i klika przycisk 'New Game'
#    open browser  ${url}  Chrome
##    Maximize Browser Window
#    click element  id:new-game
#    capture page screenshot  screen_game1.png
#    sleep  2
#    close browser

Test CLick Cell and Verify
    [Documentation]  Test otwiera nową gre i klika w pole
    open browser  ${url}  Chrome
#    Maximize Browser Window
    click element  id:new-game
    click element  //*[@id="game-board"]/div[2]/div[2]
    sleep  3
    capture page screenshot  screen_game2.png
    ${celltext}  Get_Text    //*[@id="game-board"]/div[2]/div[2]
    Log   ${celltext}
    Log to console    ${celltext}
    Should Be Equal     ${celltext}     X
    sleep  1
    click element  //*[@id="game-board"]/div[2]/div[2]
    sleep  1
    alert should be present
    ${celltext}  Get_Text    //*[@id="game-board"]/div[2]/div[2]
    Should Be Equal     ${celltext}     X


    close browser



