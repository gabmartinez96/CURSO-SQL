-- Qual o produto com mais pontos transacionados?
SELECT 
        IdProduto,
        sum(VlProduto * QtdeProduto) AS totalPontos,
        sum(QtdeProduto) AS qtdVendas

FROM transacao_produto

GROUP BY IdProduto

ORDER BY totalPontos DESC;


