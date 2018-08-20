require_relative '../hooks/hooks'
require_relative 'login_page'
class Feed
    include HTTParty

    $user = Login.new

    def efetua_checa_login
        $user.deleta_cookies()
        $user.solicita_login()
        $user.faz_login($email,$senha)
        return $user.checa_usuario_logado()
    end

    def user_token
        return $user.retorna_token()
    end

    def posta_no_feed(msg)
        id_user = $user.checa_usuario_logado()[:id]
        response = self.class.post("#{$base_uri}/v3.0/#{id_user}/feed?message=#{msg+Time.now.strftime("%d/%m/%Y %H:%M")}&access_token=#{self.user_token()}")
        return id_post = JSON.parse(response.body)
    end

    def altera_post_no_feed(post_id, msg)
        response = self.class.post("#{$base_uri}/#{post_id}?message=#{msg}")
        return id_post = JSON.parse(response.body)
    end

    def verifica_post_no_feed
        response = self.class.post("#{$base_uri}/v3.0/me?fields=id,name,email,posts.limit(1)&access_token=#{self.user_token()}")
        response = JSON.parse(response.body)
        posts = response[:posts]
        data = posts[:data]
        return data
    end
end