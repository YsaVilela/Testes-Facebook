*** Settings ***
Resource          ../resources/main.robot
Test Setup        Dado que eu acesse o site
Test Teardown     Fechar o navegador

*** Test Cases ***
Caso de Teste: Realizar login coreto 
    [Documentation]    Login no sistema com sucesso
    [Tags]    Login
    Dado que eu preencha o email a senha
    E clique no botao de entrar
    Entao sou redirecionado para o feed inicial


