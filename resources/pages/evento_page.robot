*** Settings ***
Resource          ../main.robot

*** Variables ***
${ABRIR_SESSAO_EVENTOS}       xpath=//span[contains(text(), 'Eventos')]
${BOTAO_CRIAR_NOVO_EVENTO}    xpath=//span[contains(text(), 'Criar novo evento')]
${CAMPO_NOME_EVENTO}          xpath=//label[@aria-label="Nome do evento"]//input
${SELETOR_QUEM_PODE_VER}      css=label[aria-label="Quem pode ver?"]
${SELECIONAR_PRIVADO}         xpath=//span[contains(text(), 'Privado')]
${BOTAO_CRIAR_EVENTO}         css=div[aria-label="Criar evento"] 
${MENSAGEM_EVENTO_CRIADO}     xpath=//span[contains(text(), 'Seu evento foi criado.')]

*** Keywords ***
Dado que eu abra a aba de eventos
    Wait Until Element Is Visible    ${ABRIR_SESSAO_EVENTOS}       10s
    Click Element                    ${ABRIR_SESSAO_EVENTOS}      

E clique em criar novo evento 
    Wait Until Element Is Visible    ${BOTAO_CRIAR_NOVO_EVENTO}    10s
    Click Element                    ${BOTAO_CRIAR_NOVO_EVENTO}       

E complete os dados do evento
    Wait Until Element Is Visible    ${CAMPO_NOME_EVENTO}          10s
    ${NomeEvento}                    FakerLibrary.Word
    Input Text                       ${CAMPO_NOME_EVENTO}          ${NomeEvento}
    Click Element                    ${SELETOR_QUEM_PODE_VER}  
    Wait Until Element Is Visible    ${SELECIONAR_PRIVADO}         10s
    Click Element                    ${SELECIONAR_PRIVADO}      

E clique no botao criar evento
    Click Element                    ${BOTAO_CRIAR_EVENTO}         

Entao e exibido a mesagem de evento criado com sucesso
    Wait Until Element Is Visible    ${MENSAGEM_EVENTO_CRIADO}      10s
    Element Should Be Visible        ${MENSAGEM_EVENTO_CRIADO}