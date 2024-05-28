*** Settings ***
Resource          ../main.robot

*** Variables ***
${CAMPO_EMAIL}         css=input[data-testid="royal_email"]
${CAMPO_SENHA}         id:pass
${BOTAO_LOGIN}         xpath=//button[contains(text(), 'Entrar')]
${ICONE_FORYOU}        css=a[aria-label="Página inicial"]

${MENSAGEM_ERRO_EMAIL}       xpath=//div[contains(text(), 'O email ou o número de celular que você inseriu não está conectado a uma conta. ')]
${BOTAO_SEGUIR_COM_SENHA}    xpath=//a[contains(text(), 'Entrar com a senha')]
${MENSAGEM_ERRO_SENHA}       xpath=//div[contains(text(), 'A senha que você inseriu está incorreta. ')]

${DIV_BLOQUEIO}        __fb-light-mode x1n2onr6 x1vjfegm

# Credenciais 
${EMAIL}    ysavilela.dev@gmail.com
${SENHA}    ysa.dev030515

*** Keywords ***
Dado que eu preencha o email
    Wait Until Element Is Visible   ${CAMPO_EMAIL}      15s
    Input Text                      ${CAMPO_EMAIL}      ${EMAIL}   

E preencha a senha
    Wait Until Element Is Visible   ${CAMPO_SENHA}      15s
    Input Text                      ${CAMPO_SENHA}      ${SENHA}

E clique no botao de entrar
    Click Element                   ${BOTAO_LOGIN} 

Entao sou redirecionado para o feed inicial
    Sleep    5s
    Execute JavaScript    document.querySelector('.${DIV_BLOQUEIO.replace(' ', '.')}').remove();
    Run Keyword And Ignore Error    Element Should Not Be Visible    css:.${DIV_BLOQUEIO.replace(' ', '.')}
    Wait Until Element Is Visible   ${ICONE_FORYOU}        15s
    Click Element                   ${ICONE_FORYOU} 


Então verifico se mensagem de erro do email foi exibida
    Wait Until Element Is Visible   ${MENSAGEM_ERRO_EMAIL}        15s
    Element Should Be Visible       ${MENSAGEM_ERRO_EMAIL} 

Então verifico se mensagem de erro da senha foi exibida
    Wait Until Element Is Visible   ${MENSAGEM_ERRO_SENHA}         15s
    Element Should Be Visible       ${MENSAGEM_ERRO_SENHA}  

E indique que quero continuar com a senha
    Wait Until Element Is Visible   ${BOTAO_SEGUIR_COM_SENHA}        15s
    Click Element                   ${BOTAO_SEGUIR_COM_SENHA}

E coloco a senha de forma incorreta
    Wait Until Element Is Visible   ${CAMPO_SENHA}      15s
    ${SenhaInvalida}                FakerLibrary.Word
    Input Text                      ${CAMPO_SENHA}      ${SenhaInvalida}