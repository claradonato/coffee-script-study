{ fs, carregarLangConfig } = require '../utils.coffee'

mensagens = 
    pt: 'Oi, tudo bem?'
    en: 'Hello, how are you?'
    es: 'Hola, todo bien?'
    fr: 'Salut, ça va?'
    it: 'Ciao, tutto bene?'

# le o arquivo lang.config
carregarLangConfig(mensagens)
