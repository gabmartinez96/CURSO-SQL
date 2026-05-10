
-- quem participou da primeira aula
WITH tb_prim_dia AS (

    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE substr(DtCriacao,1,10) = '2025-08-25'

),

-- Quem participou do curso inteiro
tb_dias_curso AS (

SELECT DISTINCT 
       IdCliente, 
       substr(DtCriacao, 1,10) AS presenteDia

    FROM transacoes
    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'

    ORDER BY IdCliente

),

-- Contando quantas vezes quem participou do 1o dia voltou
tb_join AS (

SELECT t1.IdCliente,
       count(DISTINCT t2.presenteDia) AS qtdeDias

FROM tb_prim_dia AS t1

LEFT JOIN tb_dias_curso AS t2
ON t1.IdCliente = t2.IdCliente

GROUP BY t1.IdCliente

)

-- Calcula a média
SELECT 
      avg(qtdeDias) AS mediaDias,
      max(qtdeDias) AS maxDias,
      min(qtdeDias) AS minDias

FROM tb_join