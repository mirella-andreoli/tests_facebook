Before do

    $base_uri = "https://graph.facebook.com"
    $host = "https://www.facebook.com"
    $login_params = "client_id=#{$client}&redirect_uri=#{$redirect}&state=#{$state}&response_type=#{$type}"

    $client = "264115990863813" #ID do app no Facebook
    $redirect = "https://www.facebook.com/profile.php" #URL de redirecionamento ao logar com o app
    $state = "{st=state123abc,ds=123456789}" #Validar response
    $type = "token" #Tipo de retorno

    $email = "open_qrrxfxh_user@tfbnw.net" #E-mail do usuário de teste do app
    $senha = "testuser123" #Senha do usuário de teste do app

end