{ input, input_password, print, gerarHash, carregarContas } = require './utils.coffee'
child_process = require 'child_process'

contas = carregarContas()

login = input('Login: ')
senha = input_password('*')
senhaHash = gerarHash(senha)

usuario = contas.find (conta) ->
    conta.login == login and conta.senha_hash == senhaHash

if usuario
    print 'Bem-vindo, #{login}!'
else 
    print 'Login inválido.'

