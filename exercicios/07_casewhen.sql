-- 9. Listar todas as transações adicionando uma coluna nova sinalizando “alto”, “médio” e “baixo” para o valor dos pontos [<10 ; <500; >=500]

SELECT IdTransacao,
        QtdePontos,
        CASE
        WHEN QtdePontos < 10 THEN 'Baixo'
        WHEN QtdePontos < 500 THEN 'Medio'
        ELSE 'Alto'
        END AS nivelTransacao
FROM transacoes
WHERE nivelTransacao IN ('Alto')
ORDER BY QtdePontos DESC
LIMIT 100
