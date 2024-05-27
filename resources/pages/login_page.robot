*** Settings ***
Resource          ../main.robot

*** Variables ***
${CAMPO_EMAIL}         css=input[data-testid="royal_email"]
${CAMPO_SENHA}         css=input[data-testid="royal_pass"]
${BOTAO_LOGIN}         css=button[data-testid="royal_login_button"]
${ICONE_FORYOU}        css=a[aria-label="Página inicial"]

${DIV_CLASS}    __fb-light-mode x1n2onr6 x1vjfegm

# Credenciais 
${EMAIL}    ysavilela.dev@gmail.com
${SENHA}    ysa.dev030515

*** Keywords ***
Dado que eu preencha o email a senha
    Wait Until Element Is Visible   ${CAMPO_EMAIL}      15s
    Input Text                      ${CAMPO_EMAIL}      ${EMAIL}   
    Input Text                      ${CAMPO_SENHA}      ${SENHA}

E clique no botao de entrar
    Click Element                   ${BOTAO_LOGIN} 

Entao sou redirecionado para o feed inicial
    Sleep    5s
    Execute JavaScript    document.querySelector('.${DIV_CLASS.replace(' ', '.')}').remove();
    Run Keyword And Ignore Error    Element Should Not Be Visible    css:.${DIV_CLASS.replace(' ', '.')}
    Wait Until Element Is Visible   ${ICONE_FORYOU}        15s
    Click Element                   ${ICONE_FORYOU} 
