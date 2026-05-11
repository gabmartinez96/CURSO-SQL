WITH tb_clientes_janeiro AS (

    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE DtCriacao >= '2025-01-01'
    AND DtCriacao < '2025-02-01'
),

-- SELECT count(DISTINCT t1.idCliente),
--         count(DISTINCT t2.idCliente)
-- FROM tb_clientes_janeiro AS t1
-- LEFT JOIN transacoes AS t2
-- ON t1.idCliente = t2.idCliente
-- AND t2.DtCriacao >= '2025-08-25'
-- AND t2.DtCriacao < '2025-08-30'

tb_clientes_curso AS (
    SELECT DISTINCT IdCliente
    FROM transacoes
    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'
)

SELECT 
        count(t1.IdCliente) AS clientesJaneiro,
        count(t2.IdCliente) AS clientesCurso
FROM tb_clientes_janeiro AS t1
LEFT JOIN tb_clientes_curso AS t2
ON t1.IdCliente = t2.IdCliente




