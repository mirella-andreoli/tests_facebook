require_relative '../hooks/hooks'

$feed = Feed.new

Dado("que eu esteja logado no Facebook") do
    expect($feed.efetua_checa_login().to_s).to include($email)
  end
  
  Quando("realizo uma requisição de post no feed pela API") do
    $id_post = ($feed.posta_no_feed('Post de Teste'))
  end
  
  Então("meu post é incluído com sucesso ao meu feed") do
    expect($id_post[:id]).to eql($feed.verifica_post_no_feed()[:id])
  end
  
  Quando("realizo uma alteração em um post no meu feed") do
    $feed.altera_post_no_feed($id_post,'Post de Teste alterado')
  end
  
  Então("vejo meu post alterado no meu feed") do
    expect($feed.verifica_post_no_feed()[:message].to_s).to include('Post de Teste alterado')
  end