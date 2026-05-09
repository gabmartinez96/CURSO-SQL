-- 4. Lista de clientes com 100 a 200 pontos (inclusive ambos);
SELECT IdCliente,
        QtdePontos

FROM clientes

WHERE qtdePontos >= 100 AND qtdePontos <= 200

