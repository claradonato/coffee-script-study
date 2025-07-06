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
carregarContas = (caminho = './data/contas.yaml') -> 
    try 
        dados = fs.readFileSync(caminho, 'utf8')
        contas = yaml.load(dados) or []
    catch error
        contas = []
    contas

# salvar as contas no arquivo.yaml
salvarContas = (contas, caminho = './data/contas.yaml') ->
    try 
        yamlString = yaml.dump(contas)
        fs.writeFileSync(caminho, yamlString, 'utf8')
        true
    catch error
        console.log 'O arquivo não foi salvo!', error
        false

# carregar arquivo hd.yaml
carregarHD = (caminho = './data/hd.yaml') ->
    try 
        dados = fs.readFileSync(caminho, 'utf8')
        arquivos = yaml.load(dados) or []
    catch error
        print 'Arquivo inválido ou não encontrado'
        process.exit()
    arquivos

# lê arquivo lang.cofig
carregarLangConfig = (mensagens, caminho = 'lang.config') ->
    try 
        idioma = fs.readFileSync('lang.config', 'utf8').trim()
        mensagem = mensagens[idioma]
    
        if mensagem?
            print mensagem
        else
            print 'Idioma não configurado.'

    catch error
        print 'Erro ao ler arquivo lang.config'

# exportações
module.exports = {
    crypto
    fs
    readlineSync
    yaml
    input
    input_password
    print
    file_exists
    gerarHash
    carregarContas
    salvarContas
    carregarHD
    carregarLangConfig
} 
