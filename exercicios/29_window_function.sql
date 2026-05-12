-- Saldo de pontos acumulado de cada usuário
WITH pontos_dia AS (
SELECT 
       IdCliente,
       substr(DtCriacao,1,10) AS dtDia,
       sum(qtdePontos) AS totalPontos,
       sum(CASE WHEN qtdePontos > 0 THEN QtdePontos ELSE 0 END) as pontosPostivos

FROM transacoes

GROUP BY IdCliente, dtDia

ORDER BY IdCliente, dtDia

)

SELECT *,
        sum(totalPontos) OVER (PARTITION BY IdCliente ORDER BY dtDia) AS pontosAcum,
        sum(pontosPostivos) OVER (PARTITION BY IdCliente ORDER BY dtDia) AS pontosPositivosAcum
FROM pontos_dia
