-- Quais clientes mais perderam pontos por Lover?
SELECT 
        t1.idCliente,
        sum(t1.QtdePontos) AS pontosPerdidos

FROM transacoes AS t1

LEFT JOIN transacao_produto AS t2
ON t1.IdTransacao = t2.IdTransacao

LEFT JOIN produtos AS t3
ON t2.IdProduto = t3.IdProduto

WHERE t1.QtdePontos < 0
AND t3.DescCategoriaProduto = 'lovers'

GROUP BY t1.IdCliente

ORDER BY pontosPerdidos

