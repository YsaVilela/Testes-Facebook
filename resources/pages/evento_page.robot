*** Settings ***
Resource          ../main.robot

*** Variables ***
${BOTAO_VER_MAIS}             xpath=//div[@aria-label="Atalhos"]/div/div/div/div/div/div/div[1]/div[1]
${ABRIR_SESSAO_EVENTOS}       xpath=//span[contains(text(), 'Eventos')]
${BOTAO_CRIAR_NOVO_EVENTO}    xpath=//span[contains(text(), 'Criar novo evento')]
${CAMPO_NOME_EVENTO}          xpath=//label[@aria-label="Nome do evento"]//input
${SELETOR_QUEM_PODE_VER}      css=label[aria-label="Quem pode ver?"]
${SELECIONAR_PRIVADO}         xpath=//span[contains(text(), 'Privado')]
${BOTAO_CRIAR_EVENTO}         css=div[aria-label="Criar evento"] 
${MENSAGEM_EVENTO_CRIADO}     xpath=//span[contains(text(), 'Seu evento foi criado.')]

${BOTAO_CRIAR_EVENTO_DESATIVADO}    xpath=//div[@aria-label="Criar evento" and @aria-disabled="true"]

${CAMPO_DETALHES_EVENTO}       xpath=//label[@aria-label="Quais são os detalhes deste evento?"]/div/div/div/textarea

${SELECIONAR_DATA_INICIO}      xpath=//label[@aria-label="Data de início"]
${VIZUALIZAR_PROXIMO_MES}      css=div[aria-label="Próximo mês"]
${EVENTO_DIA_20}               xpath=//span[@aria-hidden="true"]/span[text()="20"]

${SELETOR_MODALIDADE}          xpath=//label[@aria-label="É presencial ou virtual?"]
${SELECIONAR_VIRTUAL}          xpath=//span[contains(text(),'Virtual')]
${SELECIONAR_CAMPO_OUTRO}      xpath=//span[contains(text(),'Outro')]


*** Keywords ***
Dado que eu abra a aba de eventos
    ${CriarEventoVisivel}=           Run Keyword And Return Status         Element Should Be Visible         ${ABRIR_SESSAO_EVENTOS}
    Run Keyword If                   '${CriarEventoVisivel}' == 'False'    Clicar em Ver Mais
    Wait Until Element Is Visible    ${ABRIR_SESSAO_EVENTOS}       10s
    Click Element                    ${ABRIR_SESSAO_EVENTOS}      

Clicar em Ver Mais
    Wait Until Element Is Visible    ${BOTAO_VER_MAIS}        10s
    Click Element                    ${BOTAO_VER_MAIS}

E clique em criar novo evento 
    Wait Until Element Is Visible    ${BOTAO_CRIAR_NOVO_EVENTO}    10s
    Click Element                    ${BOTAO_CRIAR_NOVO_EVENTO}       

E complete o nome do evento
    Wait Until Element Is Visible    ${CAMPO_NOME_EVENTO}          10s
    ${NomeEvento}                    FakerLibrary.Word
    Input Text                       ${CAMPO_NOME_EVENTO}          ${NomeEvento}

E complete quem pode ver o evento
    Click Element                    ${SELETOR_QUEM_PODE_VER}  
    Wait Until Element Is Visible    ${SELECIONAR_PRIVADO}         10s
    Click Element                    ${SELECIONAR_PRIVADO}      

E clique no botao criar evento
    Click Element                    ${BOTAO_CRIAR_EVENTO}         

Entao e exibido a mesagem de evento criado com sucesso
    Wait Until Element Is Visible    ${MENSAGEM_EVENTO_CRIADO}          10s
    Element Should Be Visible        ${MENSAGEM_EVENTO_CRIADO}

Entao o botao de criar evento deve estar desabilitado
    Wait Until Element Is Visible    ${BOTAO_CRIAR_EVENTO_DESATIVADO}    10s
    Element Should Be Visible        ${BOTAO_CRIAR_EVENTO_DESATIVADO} 

E complete a data de inicio
    Click Element                    ${SELECIONAR_DATA_INICIO} 
    ${evento_visivel}=               Run Keyword And Return Status     Element Should Be Visible         ${EVENTO_DIA_20}
    Run Keyword If                   '${evento_visivel}' == 'False'    Clicar Em Vizualizar Proximo Mes
    Wait Until Element Is Visible    ${EVENTO_DIA_20}    10s
    Click Element                    ${EVENTO_DIA_20}

Clicar Em Vizualizar Proximo Mes
    Wait Until Element Is Visible    ${VIZUALIZAR_PROXIMO_MES}    10s
    Click Element                    ${VIZUALIZAR_PROXIMO_MES}

E complete detalhes do evento
    ${Detalhes}    FakerLibrary.Text
    Input Text     ${CAMPO_DETALHES_EVENTO}     ${Detalhes}

E completar modalidade do evento online 
    Click Element                    ${SELETOR_MODALIDADE} 
    Wait Until Element Is Visible    ${SELECIONAR_VIRTUAL}        10s
    Click Element                    ${SELECIONAR_VIRTUAL} 
    Wait Until Element Is Visible    ${SELECIONAR_CAMPO_OUTRO}    10s
    Click Element                    ${SELECIONAR_CAMPO_OUTRO}