*** Settings ***
Resource          ../resources/main.robot
Test Setup        Dado que eu acesse e realize o login
Test Teardown     Fechar o navegador

*** Test Cases ***
Caso de Teste: Criar uma publicação textual corretamente
    Dado que eu digite o conteudo
    E pressione o botao de publicar

Caso de Teste: Criar uma publicacao com midia
    Dado que eu adicione uma midia 
    E pressione o botao de publicar

