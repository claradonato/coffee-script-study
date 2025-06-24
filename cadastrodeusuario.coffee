#exportações
module.exports = gerarHash

# modulos necessários 
crypto = require 'crypto' #para usar createHash, update, digest
readline = require('readline').createInterface #entrada de dados
    input: process.stdin
    output: process.stdout

fs = require 'fs' # ler arquivo yaml
yaml = require 'js-yaml' # gerar dados no yaml com load()

gerarHash = (senha) ->
    crypto.createHash('sha256').update(senha).digest('hex')

# 
try
    dados = fs.readFileSync('contas.yaml', 'utf8')
    contas = yaml.load(dados) or []
catch error
    contas = []

# entrada dos dados
readline.question 'Digite seu login: ', (login) ->
    
    existe = contas.find (conta) -> conta.login == login

    if existe 
        console.log 'Erro: usuário já cadastrado'
        readline.close()
        return
    
    readline.question 'Digite sua senha: ', (senha) ->
        senhaHash = gerarHash(senha)
        novaConta = 
            login: login
            senha_hash: senhaHash
        
        contas.push(novaConta)

        try 
            yamlString = yaml.dump(contas)
            fs.writeFileSync('contas.yaml', yamlString, 'utf8')
            console.log 'Usuário cadastrado com sucesso!'
        catch error
            console.log 'Erro ao salvar o arquivo: ', error

        readline.close() 

