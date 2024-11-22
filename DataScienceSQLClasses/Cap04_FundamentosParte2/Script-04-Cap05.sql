# SQL Para Análise de Dados e Data Science - Capítulo 05


-- Query SQL para retornar o valor total final de vendas por dia.
-- Nivel de granularidade, detalhamento, aqui o nivel de granularidade é o dia

SELECT * FROM cap05.dsa_vendas;

SELECT 
    Data_Venda,
    SUM(Valor_Unitario_Venda * Unidades_Vendidas) AS Valor_Total_Final_Venda
FROM cap05.dsa_vendas
GROUP BY Data_Venda
ORDER BY Data_Venda;


-- Query SQL para retornar a média do valor total final de vendas por mês.
SELECT 
    EXTRACT(YEAR FROM Data_Venda) AS Ano,
    EXTRACT(MONTH FROM Data_Venda) AS Mes,
    ROUND(AVG(Valor_Unitario_Venda * Unidades_Vendidas), 2) AS Media_Valor_Final_Venda
FROM cap05.dsa_vendas
GROUP BY EXTRACT(YEAR FROM Data_Venda), EXTRACT(MONTH FROM Data_Venda)
ORDER BY Ano, Mes;

-- Pode colocar o GROUP BY com o nme que demos para o EXTRACT, nesse SGBD.. Outro pode reclamar :)
SELECT 
    EXTRACT(YEAR FROM Data_Venda) AS Ano,
    EXTRACT(MONTH FROM Data_Venda) AS Mes,
    ROUND(AVG(Valor_Unitario_Venda * Unidades_Vendidas), 2) AS Media_Valor_Final_Venda
FROM cap05.dsa_vendas
GROUP BY Ano, Mes
ORDER BY Ano, Mes;


-- Query SQL para retornar a média do valor total final de venda no dia 1 de cada mês.
-- Pode usar o WHERE pra filtrar porque a agregação não é no dia 1, é no mês
-- Então não precisa usar HAVING, porque vai filtrar pelo dia 1, pode usar WHERE
SELECT 
    EXTRACT(YEAR FROM Data_Venda) AS Ano,
    EXTRACT(MONTH FROM Data_Venda) AS Mes,
    ROUND(AVG(Valor_Unitario_Venda * Unidades_Vendidas), 2) AS Media_Valor_Final_Venda
FROM cap05.dsa_vendas
WHERE EXTRACT(DAY FROM Data_Venda) = 1
GROUP BY Ano, Mes
ORDER BY Ano, Mes;


-- Query SQL para retornar a média do valor total final de venda entre os dias 10 e 20 de cada mês.
-- Mesma coisa, agrega por mes, mas na hora de filtrar vai ser pelos registros de 10 a 20, entao pode usar o WHERE
SELECT 
    EXTRACT(YEAR FROM Data_Venda) AS Ano,
    EXTRACT(MONTH FROM Data_Venda) AS Mes,
    ROUND(AVG(Valor_Unitario_Venda * Unidades_Vendidas), 2) AS Media_Valor_Final_Venda
FROM cap05.dsa_vendas
WHERE EXTRACT(DAY FROM Data_Venda) BETWEEN 10 AND 20
GROUP BY Ano, Mes
ORDER BY Ano, Mes;