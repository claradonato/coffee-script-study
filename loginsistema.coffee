# pede login e senha
# verifica com o arquivo contas.yaml
#mostra mensagem se login deu certo ou não
# bonus: toca o som da MINHA VOZ falando mensagem "bem-vindo"

fs = require 'fs'
yaml = require 'js-yaml'
crypto = require 'crypto'
child_process = require 'child_process'
readline = require('readline').createInterface
    input: process.stdin
    output: process.stdout
gerarHash = require './cadastrodeusuario.coffee'

#leitura do arquivo yaml
try 
    dados = fs.readFileSync('contas.yaml', 'utf8')
    contas = yaml.load(dados) or []
catch error 
    console.log 'Arquivo contas.yaml não encontrado'
    process.exit()

#perguntar login
readline.question 'Digite seu login: ', (login) ->
    readline.question 'Digite sua senha: ', (senha) ->
        senhaHash = gerarHash(senha)

        usuario = contas.find (conta) ->
            conta.login == login and conta.senha_hash == senhaHash
        
        if usuario
            console.log 'Login bem-sucedido. Bem vindo, #{login}!'
        else 
            console.log 'Login inválido. Tente novamente.'
        

        readline.close()

