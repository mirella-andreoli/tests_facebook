# tests_facebook

Prova de conceito de documentação, levantamento de cenários e automatação de testes de API e UI.

--

Liguagem utilizada: 
    Ruby
Frameworks utilizados:
    Cucumber --Para a documentação dos cenários
    RSpec --Para validações dos resultados dos steps
    Selenium-webdriver --Interação com browser
    Httparty --Requests a API

Comando para execução dos testes: 
    Em ~\tests_facebook-master, executar linha de comando:
        cucumber features --format html --out reports.html

Cenários da funcionalidade de login em 'features/specifications/login.feature'
Cenários da funcionalidade de post no feed em 'features/specifications/feed.feature'

Relatório dos resultados dos testes dos cenários em reports.html