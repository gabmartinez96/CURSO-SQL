-- Quantos produtos são de rpg
SELECT 
    DescCategoriaProduto,
    Count(*) AS QtdeProdutos
FROM produtos
GROUP BY DescCategoriaProduto
ORDER BY QtdeProdutos DESC
