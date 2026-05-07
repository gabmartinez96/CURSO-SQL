-- 5. Lista de produtos com nome que começa com “Venda de”;
SELECT IdProduto,
        DescNomeProduto

FROM produtos

WHERE DescNomeProduto LIKE 'Venda de%';

-- 6. Lista de produtos com nome que termina com “Lover”;
SELECT IdProduto,
        DescNomeProduto

FROM produtos

WHERE DescNomeProduto LIKE '%Lover';

-- 7. Lista de produtos que são “chapéu”;
SELECT IdProduto,
        DescCategoriaProduto,
        DescNomeProduto
        
FROM produtos

WHERE DescNomeProduto LIKE '%Chapéu%';




