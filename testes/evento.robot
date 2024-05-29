*** Settings ***
Resource          ../resources/main.robot
Test Setup        Dado que eu acesse e realize o login
Test Teardown     Fechar o navegador

*** Test Cases ***
Caso de Teste: Criar evento apenas com os campos obrigatorios
    [Documentation]    Verifica se todos os campos obrigatórios aceitam entrada, habilita o botão de criar evento após preencher os campos obrigatórios e exibe mensagem de sucesso após ser criado.
    [Tags]             Criar evento
    Dado que eu abra a aba de eventos
    E clique em criar novo evento 
    E complete o nome do evento
    E complete quem pode ver o evento
    E clique no botao criar evento
    Entao e exibido a mesagem de evento criado com sucesso

Caso de Teste: Verifica se botao de criar evento permanece desabilitado se nao houver completado os campos obrigatorios
    [Documentation]    Verifica se o botão de criar evento permanece desabilitado se os campos de "nome do evento" e "quem pode ver" não estiverem preenchidos
    [Tags]             Criar evento
    Dado que eu abra a aba de eventos
    E clique em criar novo evento 
    Entao o botao de criar evento deve estar desabilitado

Caso de Teste: Criar um evento com todos os campos preenchidos
    [Documentation]    Verifica se todos os campos aceitam entrada, permite upload de imagem de capa, habilita o botão de criar evento após preencher os campos obrigatórios e exibe mensagem de sucesso após ser criado.
    [Tags]             Criar evento
    Dado que eu abra a aba de eventos
    E clique em criar novo evento 
    E complete o nome do evento
    E complete quem pode ver o evento
    E complete a data de inicio
    E complete detalhes do evento
    E completar modalidade do evento online 
    E clique no botao criar evento
    Entao e exibido a mesagem de evento criado com sucesso
