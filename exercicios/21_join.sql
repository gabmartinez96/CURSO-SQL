-- Quantidade de transações Acumuladas ao longo do tempo?

SELECT count(DISTINCT IdTransacao) AS qtdeTransacoes
FROM transacoes