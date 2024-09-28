*** Settings ***
Library     SeleniumLibrary
Library     Collections

*** Variables ***
${url}  https://www.empik.com/bestsellery

*** Test Cases ***
Test empik
    open browser     ${url}     Chrome
    sleep  5
    Maximize Browser Window
#   css=. kropka odnosi sie do CLASS; css=# odnosi sie do ID
    click element   css=button[data-ta="cookie-btn-accept-all"]
    @{best}  Get WebElements    css=.ta-product-title
#    Log     ${best}
    @{list}  Create List
    FOR     ${element}  IN      @{best}
        Log To Console    ${element.text}
        Log    ${element.text}
        Append To List  ${list}  ${element.text}
    END

    List Should contain value   ${list}  5 Red Shirt

# liste tworzymy z @ a zmienną z $
# liste i zmienną drukujemy poprzez $