# language: pt
@feed
Funcionalidade: Post no feed do usuário no Facebook
Como um usuário
Eu quero realizar posts no meu feed no Facebook

Cenário: Post no feed com sucesso
    Dado que eu esteja logado no Facebook
    Quando realizo uma requisição de post no feed pela API
    Então meu post é incluído com sucesso ao meu feed

Cenário: Alteração no post no feed
    Dado que eu esteja logado no Facebook
    Quando realizo uma alteração em um post no meu feed
    Então vejo meu post alterado no meu feed
