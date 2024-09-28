*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}  https://google.com

# tutaj zawsze jako srting sie ustawia z automatu
${photo}  1


*** Keywords ***
Take Screenshot
    ${filename}  Set Variable  screenshot_0${photo}.png
    capture page screenshot  ${filename}
    ${photo}    Convert To Integer  ${photo}
    ${photo}  Set Variable  ${photo + 1}
#   wypchniecie jako globalnej zmiennej zwiekszonej o jeden
    Set suite variable  ${photo}

*** Test Cases ***
Test open browser
    Open Browser    ${url}  Chrome
    Maximize Browser Window
    sleep   1
    click element  id:L2AGLb
    sleep  1
    input text  name:q  Merito
#    capture page screenshot  screen01.png
    Take Screenshot
    sleep  1
    press keys  name:q  ENTER
#    capture page screenshot  screen02.png
    Take Screenshot
    sleep  1
    element attribute value should be  id:APjFqb  value  Merito


