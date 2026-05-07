-- SELECT IdProduto,
--         count(*) AS countProdutos

-- FROM transacao_produto

-- GROUP BY IdProduto

SELECT IdCliente,
    sum(qtdePontos) AS qtdePontos,
    count(IdTransacao) AS qtdeTransacoes,
    sum(qtdePontos) / count(IdTransacao) AS mediaPontosTransacao


FROM transacoes

WHERE DtCriacao >= '2025-07-01' AND DtCriacao < '2025-08-01'

GROUP BY IdCliente
HAVING sum(qtdePontos) >= 4000
ORDER BY mediaPontosTransacao DESC, qtdePontos DESC

LIMIT 10