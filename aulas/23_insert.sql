DELETE FROM relatorio_diario;

WITH transacao_dia AS (

    SELECT
            substr(DtCriacao, 1, 10) as dtDia,
            count(IdTransacao) qtdeTransacao

    FROM transacoes

    GROUP BY dtDia

    ORDER BY dtDia

),

tb_acum AS (

        SELECT *,
                sum(qtdeTransacao) OVER (ORDER BY dtDia) AS acumTransacao
        FROM transacao_dia
)

INSERT INTO relatorio_diario

SELECT *
FROM tb_acum
;

SELECT *
FROM relatorio_diario;