require_relative '../hooks/hooks'
class Login
    include HTTParty
    
    BROWSER = Selenium::WebDriver::Driver.for :chrome
    $wait = Selenium::WebDriver::Wait.new(:timeout => 10)

    def deleta_cookies
        BROWSER.manage().delete_all_cookies()
    end

    def checa_url
        return BROWSER.current_url()
    end

    def solicita_login
        BROWSER.get("#{$host}/v3.1/dialog/oauth?#{$login_params}")
    end

    def faz_login(email, password)
        input_email = $wait.until { BROWSER.find_element(:id,'email')}
        input_password = $wait.until { BROWSER.find_element(:id,'pass')}
        submit_button = $wait.until { BROWSER.find_element(:id, 'loginbutton')}

        input_email.send_keys email
        input_password.send_keys password
        submit_button.click
    end

    def retorna_token
        url_query = BROWSER.current_url()
        return (CGI::parse(url_query)["access_token"].to_s).gsub(/[^A-Za-z0-9]/,'')
    end
    

    def checa_usuario_logado
        user_token = self.retorna_token()
        response = self.class.get("#{$base_uri}/v3.1/me?fields=id,email&access_token=#{user_token}")
        return JSON.parse(response.body)
    end

    def fecha_browser
        BROWSER.close()
    end

end
