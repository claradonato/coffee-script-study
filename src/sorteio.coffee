{ print, carregarContas } = require '../utils.coffee'

contas = carregarContas()

# verifica se há usuários
if contas.length == 0
    print 'Nenhum usuário cadastrado.'
    process.exit()

# sorteia um índice aleatório
indice = Math.floor(Math.random() * contas.length)
sorteado = contas[indice]

print "Parabéns, #{sorteado.login}! Você ganhou um prêmio!"

# bônus: tentar tocar aúdio com nome da pessoa
