-- Qual o total de pontos trocados no Stream Elements em Junho de 2025?
SELECT 
        t3.IdProduto,
        t3.DescNomeProduto,
        t3.DescCategoriaProduto,
        sum(abs(t1.qtdePontos)) AS totalPontos

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE t1.DtCriacao >= '2025-06-01'
AND t1.DtCriacao < '2025-07-01'

GROUP BY DescNomeProduto
ORDER BY totalPontos DESC;

-- SELECT DISTINCT DescNomeProduto
-- FROM produtos;