*** Settings ***
Resource          ../resources/main.robot
Test Setup        Dado que eu acesse o site
Test Teardown     Fechar o navegador

*** Test Cases ***
Caso de Teste: Realizar login com credenciais corretas 
    [Documentation]    Ao efetuar login com as credenciais corretas deve haver o redirecionamento para o feed inicial
    [Tags]    Login
    Dado que eu preencha o email
    E preencha a senha
    E clique no botao de entrar
    Entao sou redirecionado para o feed inicial

Caso de Teste: Verificar mensagens de erro do campo de email
    [Documentation]    Ao deixar o campo de email nula deve ser exibida uma mensagem de erro clara para erro no e-mail/telefone 'O e-mail ou o número de celular que você inseriu não está conectado a uma conta.’
    [Tags]    Login
    E clique no botao de entrar
    Então verifico se mensagem de erro do email foi exibida

Caso de Teste: Verificar mensagens de erro do campo de senha
    [Documentation]    Ao deixar o campo de senha nulo deve ser exibida uma mensagem de erro clara para erro no e-mail/telefone 'A senha que você inseriu está incorreta.’ 
    [Tags]    Login
    Dado que eu preencha o email
    E clique no botao de entrar
    E indique que quero continuar com a senha
    E coloco a senha de forma incorreta
    E clique no botao de entrar
    Então verifico se mensagem de erro da senha foi exibida
