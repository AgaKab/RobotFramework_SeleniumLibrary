*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}  https://google.com




*** Test Cases ***
Test open browser
    Open Browser    ${url}  Chrome
    Maximize Browser Window
    sleep   1
    execute JavaScript  window.scrollBy(0,600)
    click element  id:L2AGLb
    sleep  1
    input text  name:q  Merito
    capture page screenshot  screen01.png
    sleep  1
    press keys  name:q  ENTER
    capture page screenshot  screen02.png
#    sleep  2
#    execute JavaScript  window.scrollBy(0,900)
    sleep  1
    execute JavaScript  window.scrollBy(0, document.body.scrollHeight)
    sleep  1
    element attribute value should be  id:APjFqb  value  Merito