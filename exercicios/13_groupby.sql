-- Qual dia da semana quem mais pedidos em 2025?
SELECT 
        COUNT(IdTransacao) AS totalPedidos,
        strftime('%w',datetime(substr(DtCriacao, 1, 19))) AS diaSemana

FROM transacoes

WHERE substr(DtCriacao, 1, 4) = '2025'

GROUP BY diaSemana

ORDER BY totalPedidos DESC