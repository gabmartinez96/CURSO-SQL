-- Qual o produto mais transacionado?
SELECT 
    IdProduto,
    count(IdTransacao) AS transacoesProduto
    
FROM transacao_produto
GROUP BY IdProduto
ORDER BY transacoesProduto DESC 
LIMIT 1