WITH tb_transacoes AS (
    SELECT IdTransacao,
            idCliente,
            QtdePontos,
            datetime(substr(DtCriacao,1,19)) AS dtCriacao,
            julianday('now') - julianday(substr(DtCriacao, 1, 10)) AS diffDate
    FROM transacoes

),

tb_cliente AS (

    SELECT IdCliente,  
           datetime(substr(DtCriacao,1,19)) AS dtCriacao,
           julianday('now') - julianday(substr(DtCriacao, 1, 10)) AS IdadeBase
           
           
    FROM clientes

),


tb_sumario_transacoes AS (

    SELECT IdCliente,
        COUNT(IdTransacao) AS qtdeTransacoesVida,
        COUNT(CASE WHEN diffDate <= 7 THEN IdTransacao END) AS qtdeTransacoesD7,
        COUNT(CASE WHEN diffDate <= 14 THEN IdTransacao END) AS qtdeTransacoesD14,
        COUNT(CASE WHEN diffDate <= 28 THEN IdTransacao END) AS qtdeTransacoesD28,
        COUNT(CASE WHEN diffDate <= 56 THEN IdTransacao END) AS qtdeTransacoesD56,
        COUNT(CASE WHEN diffDate <= 128 THEN IdTransacao END) AS qtdeTransacoesD128,
        MIN(diffDate) AS diasUltimaTransacao

    FROM tb_transacoes

    GROUP BY IdCliente

)

SELECT t1.*,
       t2.IdadeBase

FROM tb_sumario_transacoes AS t1

LEFT JOIN tb_cliente AS t2
ON t1.IdCliente = t2.IdCliente
