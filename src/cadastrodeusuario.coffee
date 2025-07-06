#exportações
{ input, input_password, print, file_exists, readlineSync, gerarHash, carregarContas, salvarContas } = require '../utils.coffee'

login = input('Login: ')
senha = input_password("*")

senhaHash = gerarHash(senha)

contas = carregarContas()
contas.push({login: login, senha_hash: senhaHash})
salvarContas(contas)
print 'Conta criada!'
