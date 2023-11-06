# MF-Bank-Api

### Este repositório tem como função tornar possível a execução do projeto MF-Bank na plataforma railway


## * Versões

<img src="https://img.shields.io/badge/3.1.2-Ruby-red"/>
<img src="https://img.shields.io/badge/6-Rails-red"/>

## * Dependências de sistema
- `Devise Token Auth`
- `Rack-Cors`
- `Railway CLI`
- `PG gem for postgres`

## * Configurações base

 #### -  Para executar esse projeto é necessário setar as variáveis de ambiente na Railway

 - *Configurações de conexão do banco de dados:* `config/database.yml` 

 - *Configurações de conexão de rota:* `config/enviroments/development.rb` && `config/enviroments/production.rb`

 - *Configurações de Cors:* `config/initializers/cors.rb` 

## * Criação do banco de dados

*No terminal:* 

`rails g scaffold atributo1:tipo atributo2:tipo`

*No terminal:* `rake db:create`

## * Inicialização do banco de dados

*No terminal:* `rake db:migrate`

## * Instruções para deploy [Railway]

- * Para realizar o deploy após todas essas cconfigurações deve-se iniciar dentro do diretório raiz do projeto o comando `railway link` para linkar o projeto à plataforma railway, após configurar as variáveis de ambiente dentro da railway o comando `raiway up` sobe o projeto para a produção.
