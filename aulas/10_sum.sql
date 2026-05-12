SELECT
        sum(QtdePontos),

        sum(CASE
        WHEN QtdePontos > 0 THEN QtdePontos
        ELSE 0
        END) AS QtdePontosPositivos,
        
        sum(CASE
        WHEN QtdePontos < 0 THEN QtdePontos
        ELSE 0
        END) AS QtdePontosNegativos,

        COUNT(CASE
        WHEN QtdePontos < 0 THEN QtdePontos
        END) AS qtdeTransacoesNegativas,

        count(CASE
        WHEN QtdePontos > 0 THEN QtdePontos
        END) AS qtdeTransacoesPositivas

FROM transacoes

WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01'

