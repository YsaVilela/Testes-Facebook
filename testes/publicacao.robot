*** Settings ***
Resource          ../resources/main.robot
Test Setup        Dado que eu acesse e realize o login
Test Teardown     Fechar o navegador

*** Test Cases ***
Caso de Teste: Criar uma publicação textual corretamente
    [Documentation]    Verifica se o campo de texto aceita entrada, habilita o botão de publicar após a inserção de texto, e garante que o post aparece no feed. 
    [Tags]             Realizar publicação
    Dado que eu abra area de criar publicacao
    E digite o conteudo
    E verificar se o botao de publicar foi habilitado
    E pressione o botao de publicar
    Entao a publicacao deve ser exibida no feed

Caso de Teste: Criar uma publicacao com midia
    [Documentation]    Verifica se o campo de texto aceita entrada, permite upload de mídia, habilita o botão de publicar após inserir texto e mídia, e garante que o post com mídia aparece no feed.
    [Tags]             Realizar publicação
    Dado que eu abra area de criar publicacao
    E adicione uma midia  
    E verificar se o botao de publicar foi habilitado
    E pressione o botao de publicar

Caso de Teste: Verifica se botao permanece desabilitado se nao houver conteudo a ser publicado
    [Documentation]    Verifica se o campo de texto aceita entrada, permite upload de mídia, habilita o botão de publicar após inserir texto e mídia, e garante que o post com mídia aparece no feed.
    [Tags]             Realizar publicação
    Dado que eu abra area de criar publicacao
    Entao o botao de publicar deve estar desabilitado

Caso de Teste: Cancelar uma publicação e o conteudo permance como rascunho
    [Documentation]    Verica se ao fechar o pop-up de criar publicação que já cotinha um conteudo o mesmo deve permancer no input como rascunho visivel ao usuario
    [Tags]             Realizar publicação
    Dado que eu abra area de criar publicacao
    E digite o conteudo
    E pressione o botao de fechar 
    Entao conteudo deve permaner no campo de criar publicacao como rascunho