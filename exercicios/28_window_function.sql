WITH atividade_cliente_dia AS (

    SELECT substr(DtCriacao, 1, 10) AS dtDia,
        IdCliente,
        count(DISTINCT IdTransacao) qtdeAtividade

    FROM transacoes

    GROUP BY IdCliente, dtDia

    ORDER BY IdCliente, dtDia

),

atividade_semana AS (

    SELECT IdCliente,
            strftime('%w', dtDia) AS diaSemana,
            sum(qtdeAtividade) AS totalAtividade
    FROM atividade_cliente_dia
    GROUP BY IdCliente, diaSemana
    ORDER BY IdCliente, totalAtividade DESC

),

tb_rn AS (

    SELECT *,
        row_number() OVER (PARTITION BY IdCliente ORDER BY totalAtividade DESC) AS rn
    FROM atividade_semana

)

SELECT IdCliente,
       totalAtividade,
       diaSemana
FROM tb_rn
WHERE rn = 1
ORDER BY totalAtividade DESC