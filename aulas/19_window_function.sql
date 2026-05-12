WITH tb_cliente_dia AS (

    SELECT IdCliente,
            substr(DtCriacao,1,10) AS dtDia,
            count(DISTINCT IdTransacao) AS qtdeTransacao
    FROM transacoes
    WHERE DtCriacao > '2025-08-24'
    AND DtCriacao < '2025-08-30'

    GROUP BY IDCliente, dtDia

),

tb_lag AS (

    SELECT *,
            SUM(qtdeTransacao) OVER (PARTITION BY IdCliente ORDER BY dtDia) AS acum,
            lag(qtdeTransacao) OVER (PARTITION BY IdCliente ORDER BY dtDia) AS lagTransacao
    FROM tb_cliente_dia

)

SELECT *,
       1. * qtdeTransacao/lagTransacao
       
FROM tb_lag