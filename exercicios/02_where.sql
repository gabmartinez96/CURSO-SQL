-- 2. Lista de pedidos realizados no fim de semana

SELECT IdTransacao,
        datetime(substr(DtCriacao, 1, 19)) AS dtCriacao,
        strftime('%w', dtCriacao) IN ('0', '6') AS diaSemana

FROM transacoes

WHERE strftime('%w', dtCriacao) IN ('0', '6');