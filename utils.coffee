# biblioteca coffee

crypto = require 'crypto'
fs = require 'fs'
yaml = require 'js-yaml'
readlineSync = require 'readline-sync'

# entrada de texto
input = (msg = '') ->
    process.stdout.write msg if msg
    readlineSync.question('')

# entrada de texto com ocultação
input_password = (mask = '*') ->
    readlineSync.question('Senha: ', { hideEchoBack: true, mask })

# printar na tela
print = console.log

# verifica se o arquivo existe
file_exists = (path) ->
    fs.existsSync(path)

# gerar hash da senha
gerarHash = (senha) -> crypto.createHash('sha256').update(senha).digest('hex')

# lê yaml com fallback  
carregarContas = (caminho = 'contas.yaml') -> 
    try 
        dados = fs.readFileSync(caminho, 'utf8')
        contas = yaml.load(dados) or []
    catch error
        contas = []
    contas

# salvar as contas no arquivo.yaml
salvarContas = (contas, caminho = 'contas.yaml') ->
    try 
        yamlString = yaml.dump(contas)
        fs.writeFileSync(caminho, yamlString, 'utf8')
        true
    catch error
        console.log 'O arquivo não foi salvo!', error
        false

# exportações
module.exports = {
    input
    input_password
    print
    file_exists
    gerarHash
    carregarContas
    salvarContas
} 
