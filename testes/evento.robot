*** Settings ***
Resource          ../resources/main.robot
Test Setup        Dado que eu acesse e realize o login
Test Teardown     Fechar o navegador

*** Test Cases ***
Caso de Teste: Criar evento 
    [Documentation]    Verifica se todos os campos obrigatórios aceitam entrada, permite upload de imagem de capa, habilita o botão de criar evento após preencher os campos obrigatórios, e garante que o evento aparece na seção de eventos após ser criado.
    [Tags]             Criar evento
    Dado que eu abra a aba de eventos
    E clique em criar novo evento 
    E complete os dados do evento
    E clique no botao criar evento
    Entao e exibido a mesagem de evento criado com sucesso