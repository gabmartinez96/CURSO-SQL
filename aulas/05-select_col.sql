SELECT IdCliente,
    --    QtdePontos,
    --    QtdePontos + 10 AS QtdePontosPlus10,
    --    QtdePontos + 2 AS QtdePontosPlus2,
       datetime(substr(DtCriacao, 1, 19)) AS dtCriacao,

       strftime('%w', datetime(substr(DtCriacao, 1, 19))) AS diaSemanaCriacao,

       datetime(substr(DtAtualizacao, 1, 19)) AS DtAtualizacao,

       strftime('%w', datetime(substr(DtAtualizacao, 1, 19))) AS diaSemanaAtt,

       timediff(dtCriacao, DtAtualizacao) AS lifeTime



FROM clientes