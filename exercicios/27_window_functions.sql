WITH tb_cadastros_dia AS (

    SELECT 
        substr(DtCriacao, 1, 10) AS dtDia,
        count(DISTINCT idCliente) AS qtdeCadastros

    FROM clientes

    GROUP BY dtDia

    ORDER BY dtDia

),

tb_acum AS (

    SELECT *,
        SUM(qtdeCadastros) OVER (ORDER BY dtDia) AS cadastrosAcum
        
    FROM tb_cadastros_dia

)

SELECT *
FROM tb_acum
WHERE cadastrosAcum > 3000
ORDER BY cadastrosAcum
LIMIT 1