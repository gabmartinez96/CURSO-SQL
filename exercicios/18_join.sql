-- Do início ao fim do nosso curso (2025/08/25 a 2025/08/29), quantos clientes assinaram a lista de presença?
-- SELECT 
--         count(DISTINCT t1.idCliente) AS qtdeClientes,
--         'Presente' AS Status

-- FROM transacoes AS t1

-- LEFT JOIN transacao_produto AS t2
-- ON t1.IdTransacao = t2.IdTransacao

-- LEFT JOIN produtos AS t3
-- ON t2.IdProduto = t3.IdProduto

-- WHERE t1.DtCriacao >= '2025-08-25'
-- AND t1.DtCriacao < '2025-08-30'
-- AND t3.DescNomeProduto = 'Lista de presença'

SELECT 
        t1.IdCliente,
        julianday('now') - julianday(datetime(t1.DtCriacao)) AS tempoCliente,
        count(t2.IdTransacao) AS totalTransacoes
        

FROM clientes AS t1

LEFT JOIN transacoes AS t2
ON t1.idCliente = t2.idCliente

GROUP BY t1.idCliente, tempoCliente
