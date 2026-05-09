-- Clientes mais antigos, tem mais frequência de transação?
SELECT IdCliente, DtCriacao
FROM clientes
ORDER BY DtCriacao
LIMIT 5;

SELECT 
        t1.idCliente,
        t2.DtCriacao AS DtRegistro,
        t2.DtAtualizacao,
        CAST(julianday(datetime(t2.DtAtualizacao)) - julianday(datetime(t2.DtCriacao)) AS INTEGER) AS lifeTime,
        count(DISTINCT t1.idTransacao) AS qtdeTransacoes,
        count(DISTINCT t1.idTransacao) / (julianday(datetime(t2.DtAtualizacao)) - julianday(datetime(t2.DtCriacao)) AS freqPorDia

        

FROM transacoes AS t1

LEFT JOIN clientes AS t2
ON t1.idCliente = t2.idCliente

GROUP BY t2.idCliente

ORDER BY DtRegistro;