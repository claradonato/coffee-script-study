{ input, print, carregarHD } = require '../utils.coffee'

dados = carregarHD()
usuario = input("Digite o nome do usuário: ").toLowerCase()

arquivosUsuario = dados.filter (item) ->
    item.usuario?.toLowerCase?() == usuario

if arquivosUsuario.length == 0
    print "Nenhum arquivo encontrado para o usuário '#{usuario}'."
    process.exit()

print "Arquivos do usuário #{usuario}:"
for item in arquivosUsuario
    print "- #{item.arquivo} (#{item.tamanho})"

total = arquivosUsuario.reduce ((soma, item) -> soma + (item.tamanho or 0)), 0
print "Espaço total ocupado: #{total}"
