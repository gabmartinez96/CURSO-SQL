WITH tb_cadastros_dia AS (

    SELECT 
        substr(DtCriacao, 1, 10) AS dtDia,
        count(DISTINCT idCliente) AS qtdeCadastros

    FROM clientes

    GROUP BY dtDia

    ORDER BY dtDia

)

SELECT *,
       SUM(qtdeCadastros) OVER (ORDER BY dtDia) AS cadastrosAcum
       
FROM tb_cadastros_dia
