-- Qual o valor médio de pontos positivos por dia?
SELECT IdTransacao,
        datetime(DISTINCT substr(DtCriacao, 1, 19)) AS DiaCriacao,
        avg(QtdePontos) AS MediaPontosPositivos
        

FROM transacoes

WHERE QtdePontos > 0

GROUP BY strftime('%D',DiaCriacao);

SELECT sum(QtdePontos) AS totalPontos,
        COUNT(DISTINCT substr(DtCriacao, 1, 10)) AS QtdeDiasUnicos,
        sum(QtdePontos) / COUNT(DISTINCT substr(DtCriacao, 1, 10)) AS avgPontosDia

FROM transacoes

WHERE QtdePontos > 0;

