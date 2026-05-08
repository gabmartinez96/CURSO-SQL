-- Qual categoria tem mais produtos vendidos?

SELECT  
        t2.DescCategoriaProduto,
        count(t1.idTransacaoProduto) AS totalProdutos
        

FROM transacao_produto AS t1
LEFT JOIN produtos AS t2
ON t1.IdProduto = t2.IdProduto

GROUP BY t2.DescCategoriaProduto

ORDER BY 2 DESC