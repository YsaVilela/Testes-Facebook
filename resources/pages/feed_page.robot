*** Settings ***
Resource          ../main.robot

*** Variables ***
${ABRIR_AREA_CONTEUDO}       xpath=//span[contains(text(), 'No que você está pensando, Pedro?')]
${AREA_CONTEUDO}             css=div[aria-label="No que você está pensando, Pedro?"]
${BOTAO_CRIAR_PUBLICACAO}    css=div[aria-label="Publicar"]
${BOTAO_DESATIVADO}          css=button[aria-disabled="true"]

${BOTAO_ADICIONAR_MIDIA}     css=button[aria-label="Add photos or video"]
${CAMINHO_IMAGEM}            C:\\dev\\workspace\\Teste-LinkedIn\\images\\bolt.jpg
${IMAGEM_ANEXADA}            css=div[aria-label="Mídia anexada"]

${NIRCMD_PATH}               C:\\dev\\tools\\nircmd\\nircmd\\nircmd.exe

*** Keywords ***
Dado que eu digite o conteudo
    Wait Until Element Is Visible     ${ABRIR_AREA_CONTEUDO}     10s
    Click Element                     ${ABRIR_AREA_CONTEUDO} 
    Wait Until Element Is Visible     ${AREA_CONTEUDO}           10s
    ${Conteudo}                       FakerLibrary.Text
    Input Text                        ${AREA_CONTEUDO}           ${Conteudo} 

E pressione o botao de publicar
    Capture Page Screenshot           ../../prints/publicando-{index}.jpg
    Element Should Not Be Visible     ${BOTAO_DESATIVADO} 
    Click Element                     ${BOTAO_CRIAR_PUBLICACAO}
    Sleep                             5s    

Dado que eu adicione uma midia  
    Copy Image To Clipboard           ${CAMINHO_IMAGEM}
    Wait Until Element Is Visible     ${ABRIR_AREA_CONTEUDO}     10s
    Click Element                     ${ABRIR_AREA_CONTEUDO} 
    Wait Until Element Is Visible     ${AREA_CONTEUDO}           10s
    Click Element                     ${AREA_CONTEUDO}    
    Focus on Browser
    Paste From Clipboard
    Capture Page Screenshot           ../../prints/captura-{index}.jpg
    Wait Until Element Is Visible     ${IMAGEM_ANEXADA}          90s
    Element Should Be Visible         ${IMAGEM_ANEXADA}

Copy Image To Clipboard
    [Arguments]    ${image_path}
    OperatingSystem.Run   ${NIRCMD_PATH} clipboard copyimage ${image_path}

Paste From Clipboard
    AutoItLibrary.Send    ^v

Focus on Browser
    ${window_handles}=    Get Window Handles
    Switch Window         ${window_handles[0]} 