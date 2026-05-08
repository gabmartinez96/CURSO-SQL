-- Qual mês tivemos mais lista de presença assinada?

SELECT 
        t2.DescNomeProduto,
        count(t1.idTransacaoProduto) AS totalAssinaturas,
        substr(t3.DtCriacao, 1,7) AS anoMes

FROM transacao_produto AS t1

LEFT JOIN produtos AS t2

ON t1.IdProduto = t2.IdProduto

LEFT JOIN transacoes AS t3
ON t1.IdTransacao = t3.IdTransacao

WHERE t2.DescNomeProduto = 'Lista de presença'

GROUP BY anoMes

ORDER BY totalAssinaturas DESC, anoMes

LIMIT 12;