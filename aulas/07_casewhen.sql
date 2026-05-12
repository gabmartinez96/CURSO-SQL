-- Intervalos
-- 0 a 500 -> Ponei
-- 501 a 1000 -> Ponei Premium
-- 1001 a 5000 -> Mago Aprendiz
-- 5001 = 10000 -> Mago Mestre
-- > 10001 --> Mago Supremo

SELECT IdCliente,
        QtdePontos,
        
        CASE
            WHEN QtdePontos  <= 500 THEN 'Ponei'
            WHEN QtdePontos > 500 AND QtdePontos <= 1000 THEN 'Ponei Premium'
            WHEN QtdePontos > 1000 AND QtdePontos <= 5000 THEN 'Mago Aprendiz'
            WHEN QtdePontos > 5000 AND QtdePontos <= 10000 THEN 'Mago Mestre'
            WHEN QtdePontos > 10000 THEN 'Mago Supremo'
        END AS NivelCliente,

        CASE
            WHEN QtdePontos <= 1000 THEN 1
            ELSE 0
        END AS flPonei,

        CASE
            WHEN QtdePontos > 1000 THEN 1
            ELSE 0
        END AS flMago

FROM clientes

WHERE flMago = 0

ORDER BY QtdePontos DESC

