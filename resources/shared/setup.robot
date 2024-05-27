*** Settings ***
Resource          ../main.robot

*** Keywords ***
Dado que eu acesse o site
    Open Browser    url=https://www.facebook.com/   browser=Chrome
    Maximize Browser Window

Dado que eu acesse e realize o login
    Open Browser    url=https://www.facebook.com/  browser=Chrome
    Maximize Browser Window
    Dado que eu preencha o email a senha
    E clique no botao de entrar
    Entao sou redirecionado para o feed inicial

Fechar o navegador
    Close Browser