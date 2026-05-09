-- SELECT 
--     count(*),
--     count(1), -- Valores não nulos
--     count(IdCliente)
-- FROM clientes

SELECT COUNT(DISTINCT IdCliente)
FROM clientes