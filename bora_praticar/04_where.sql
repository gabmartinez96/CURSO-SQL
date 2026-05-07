--- Selecione os produtos que tem churn no nome
SELECT *
FROM produtos

--- Churn_10pp
--- Churn_2pp
--- Churn_5pp

-- WHERE DescNomeProduto = 'Churn_10pp'
-- OR DescNomeProduto = 'Churn_5pp'
-- OR DescNomeProduto = 'Churn_2pp'

-- WHERE DescNomeProduto IN ('Churn_10pp', 'Churn_5pp', 'Churn_2pp')

WHERE DescNomeProduto LIKE 'churn%'