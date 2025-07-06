{ print, carregarProcessos } = require '../utils.coffee'

processos = carregarProcessos();

# criando listas por estado
processosEstado = (estado) ->
    print "Processos no estado '#{estado}':"
    filtrados = processos.filter (p) -> p.state == estado
    
    if filtrados.length == 0
        print 'Nenhum processo encontrado'
    else 
        for p in filtrados
            print "pid: #{p.pid}: #{p.name}"

processosEstado 'ready'
processosEstado 'blocked'
processosEstado 'running'
processosEstado 'finished'
