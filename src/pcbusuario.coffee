{ print, carregarProcessos, carregarUsuarios } = require '../utils.coffee'

processos = carregarProcessos()
usuarios = carregarUsuarios()

procUser = () ->
    if processos.length == 0 || usuarios.length == 0
        'Não há processos ou usuários para executar a função'
    else 
        for p in processos
            usuario = usuarios.find (u) -> u.uid == p.uid

            if usuario?
                print "Processo #{p.name} (pid #{p.pid}) foi iniciado por #{usuario.login}."
            else 
                print "Processo #{p.name} (pid #{p.pid}) foi iniciado por UID desconhecido"

procUser()
