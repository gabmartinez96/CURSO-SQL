-- De quanto em quanto o tempo as pessoas assistem o canal tmw
WITH cliente_dia AS (
    SELECT 
        DISTINCT
        IdCliente,
        substr(DtCriacao, 1, 10) as dtDia

    FROM transacoes

    WHERE substr(DtCriacao, 1, 4) = '2025'

    ORDER BY IdCliente, dtDia
),

tb_lag AS (

    SELECT *,
           lag(dtDia) OVER (PARTITION BY IdCliente ORDER BY dtDia) as lagDia
    FROM cliente_dia

),

tb_diff_dt AS (

    SELECT *,
            julianday(dtDia) - julianday(lagDia) AS dtDiff

    FROM tb_lag

),

avg_cliente AS (

    SELECT IdCliente,
            avg(dtDiff) AS avgDia
    FROM tb_diff_dt
    GROUP BY IdCliente

)

SELECT avg(avgDia) AS recorrencia
FROM avg_cliente
