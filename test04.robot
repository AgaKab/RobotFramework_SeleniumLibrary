*** Settings ***
Library  Collections

*** Variables ***
${zmienna}  moja zmienna jest fajna
@{lista}    Adam Bartosz Cecylia Damian

*** Test Cases ***
Test zmiennej
    Log to console  ${zmienna}
    Log  ${zmienna}

Test listy
    Log     @{lista}
    FOR     ${imie}  IN  @{lista}
        Log to console  ${imie}
        Log  ${imie}
    END
