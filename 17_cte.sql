-- CTE: COMMON TABLE EXPRESSION

-- SELECT count(DISTINCT IdCliente)
-- FROM transacoes AS t1
-- WHERE t1.IdCliente IN (
--     SELECT DISTINCT IdCliente
--     FROM transacoes
--     WHERE substr(DtCriacao, 1,10) = '2025-08-25'
-- )

-- AND substr(t1.DtCriacao,1,10) = '2025-08-29';

WITH tb_cliente_primeiro_dia AS (

    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(DtCriacao,1,10) = '2025-08-25'
),

tb_cliente_ultimo_dia AS (

SELECT DISTINCT IdCliente
FROM transacoes
WHERE substr(DtCriacao,1,10) = '2025-08-29'

),

tb_join AS (

    SELECT t1.IdCliente AS firstDayCliente,
           t2.IdCliente AS lastDayCliente

    FROM tb_cliente_primeiro_dia AS t1

    LEFT JOIN tb_cliente_ultimo_dia AS t2
    ON t1.IdCliente = t2.IdCliente

)

SELECT count(firstDayCliente),
       count(lastDayCliente),
       1.* count(lastDayCliente) / count(firstDayCliente) AS proporcao
       
FROM tb_join