{ print, carregarProcessos } = require '../utils.coffee'

processos = carregarProcessos()

processosIOBound = () ->
    if processos.length == 0
        'Não possui procesos.'
    else
        for p in processos
            if p.io_bound == true
                print "pid: #{p.pid}\n name: #{p.name}"

processosIOBound();
