-- Em 2024, quantas transações de Lovers tivemos?

SELECT 
        t2.DescCategoriaProduto,
        count(t1.idTransacaoProduto) AS totalVendas,
        substr(t3.DtCriacao, 1, 4) AS Ano

FROM transacao_produto AS t1

LEFT JOIN produtos as t2
ON t1.IdProduto = t2.IdProduto

LEFT JOIN transacoes AS t3
ON t1.IdTransacao = t3.IdTransacao

-- WHERE t3.DtCriacao >= '2024-01-01'
-- AND t3.DtCriacao < '2025-01-01'

GROUP BY t2.DescCategoriaProduto, Ano

ORDER BY Ano, totalVendas DESC;

SELECT t2.IdProduto,
        t3.DescCategoriaProduto AS nomeProduto,
        count(t3.DescCategoriaProduto) AS totalVendido

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE t1.DtCriacao >= '2024-01-01' AND t1.DtCriacao < '2025-01-01'
AND t3.DescCategoriaProduto = 'lovers';