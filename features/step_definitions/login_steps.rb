require_relative '../hooks/hooks'

$login = Login.new()

Dado("que eu não esteja logado no Facebook") do
  $login.deleta_cookies()
end
  
Quando("realizo a requisição ao link de login da API") do
  $login.solicita_login()
end
  
Então("a API redireciona para a página de login") do
  expect($login.checa_url).to include('skip_api_login')
end

Quando("informo meus dados corretos para o login") do
  $login.faz_login($email,$senha)
end
  
Então("o login é efetuado com sucesso") do
  expect($login.checa_usuario_logado().to_s).to include($email)
end