*** Settings ***
Resource          ../main.robot

*** Variables ***
${ABRIR_AREA_CONTEUDO}       xpath=//span[contains(text(), 'No que você está pensando, Pedro?')]
${AREA_CONTEUDO}             css=div[aria-label="No que você está pensando, Pedro?"]
${BOTAO_CRIAR_PUBLICACAO}    css=div[aria-label="Publicar"]
${BOTAO_DESATIVADO}          xpath=//div[@aria-label="Publicar" and @aria-disabled="true"]

${BOTAO_ADICIONAR_MIDIA}     css=button[aria-label="Add photos or video"]
${CAMINHO_IMAGEM}            C:\\dev\\workspace\\Teste-Facebook\\images\\bolt.jpg
${IMAGEM_ANEXADA}            css=div[aria-label="Mídia anexada"]
${CARREGANDO_PUBLICACAO}     xpath=//span[contains(text(), 'Publicando')]

${CONTEUDO}                  None

${NIRCMD_PATH}               C:\\dev\\tools\\nircmd\\nircmd\\nircmd.exe

*** Keywords ***
Dado que eu abra area de criar publicacao
    Wait Until Element Is Visible     ${ABRIR_AREA_CONTEUDO}     10s
    Click Element                     ${ABRIR_AREA_CONTEUDO} 

E digite o conteudo
    Wait Until Element Is Visible     ${AREA_CONTEUDO}           10s
    ${Conteudo}                       FakerLibrary.Word
    Set Global Variable               ${CONTEUDO}                ${Conteudo}
    Input Text                        ${AREA_CONTEUDO}           ${Conteudo} 

E pressione o botao de publicar
    Click Element                     ${BOTAO_CRIAR_PUBLICACAO}

E verificar se o botao de publicar foi habilitado
    Element Should Not Be Visible     ${BOTAO_DESATIVADO} 

Entao o botao de publicar deve estar desabilitado
    Wait Until Element Is Visible     ${BOTAO_DESATIVADO}         10s
    Element Should Not Be Visible     ${BOTAO_DESATIVADO} 

Entao a publicacao deve ser exibida no feed
    Wait Until Element Is Not Visible    ${CARREGANDO_PUBLICACAO}          30s   
    ${Publicacao}                        xpath=//div[contains(text(), "${CONTEUDO}")]  
    Wait Until Element Is Visible        ${Publicacao}                     10s    
    Element Should Be Visible            ${Publicacao}

E adicione uma midia  
    Copiar Imagem para Area de Tranferencia    ${CAMINHO_IMAGEM}
    Wait Until Element Is Visible              ${AREA_CONTEUDO}    10s
    Click Element                              ${AREA_CONTEUDO}    
    Foco no Browser
    Colar da área de transferência
    Capture Page Screenshot                    ../../prints/captura-{index}.jpg
    Wait Until Element Is Visible              ${IMAGEM_ANEXADA}          90s
    Element Should Be Visible                  ${IMAGEM_ANEXADA}

Copiar Imagem para Area de Tranferencia
    [Arguments]           ${CaminhoDaImagem}
    OperatingSystem.Run   ${NIRCMD_PATH} clipboard copyimage ${CaminhoDaImagem}

Colar da área de transferência
    AutoItLibrary.Send    ^v

Foco no Browser
    ${window_handles}=    Get Window Handles
    Switch Window         ${window_handles[0]} 





