# language: pt
@login
Funcionalidade: Login no Facebook
Como um usuário
Eu quero realizar o login no Facebook
A fim de utilizar os recursos da rede social

Cenário: Tentativa de acesso sem efetuar login
    Dado que eu não esteja logado no Facebook
    Quando realizo a requisição ao link de login da API
    Então a API redireciona para a página de login

Cenário: Login com sucesso
    Dado que eu não esteja logado no Facebook
    Quando realizo a requisição ao link de login da API
    E informo meus dados corretos para o login
    Então o login é efetuado com sucesso
