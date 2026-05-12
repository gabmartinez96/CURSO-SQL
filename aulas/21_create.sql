-- DROP TABLE IF EXISTS relatorio_diario;
DROP TABLE IF EXISTS relatorio_diario;
CREATE TABLE IF NOT EXISTS relatorio_diario AS 

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

SELECT *
FROM tb_acum
;

SELECT *
FROM relatorio_diario;