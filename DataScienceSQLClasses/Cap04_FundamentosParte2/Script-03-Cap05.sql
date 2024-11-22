# SQL Para Análise de Dados e Data Science - Capítulo 05


-- Subqueries (ou sub-consultas) são usadas em SQL quando uma consulta é aninhada dentro de outra consulta. 
-- Elas podem ser muito úteis em vários cenários, como:

-- Para Obter Valores para Filtrar
-- Operações de Agregação em Filtragem
-- Existência de Registros
-- Seleção de Colunas


-- Sem usar subquery
-- Query SQL para retornar a média de Valor_Unitario_Venda por produto, 
-- somente se a média for maior do que 5 e categoria de produtos for 1 ou 2. 
SELECT 
    Nome_Produto,
    ROUND(AVG(Valor_Unitario_Venda), 2) AS Media_Valor_Unitario
FROM cap05.dsa_vendas
WHERE Categoria_Produto IN ('Categoria 1', 'Categoria 2')
GROUP BY Nome_Produto
HAVING AVG(Valor_Unitario_Venda) > 5;


-- Usando subquery
-- Query SQL para retornar a média de Valor_Unitario_Venda por produto, 
-- somente se a média for maior do que 5 e categoria de produtos for 1 ou 2. 
SELECT 
    Nome_Produto,
    ROUND(AVG(Valor_Unitario_Venda), 2) AS Media_Valor_Unitario
FROM (
    SELECT Nome_Produto, Valor_Unitario_Venda
    FROM cap05.dsa_vendas
    WHERE Categoria_Produto IN ('Categoria 1', 'Categoria 2')
) AS sub_query
GROUP BY Nome_Produto
HAVING AVG(Valor_Unitario_Venda) > 5;


-- 1) Query SQL que retorne somente registros cuja média de unidades vendidas seja maior do que 2. 
-- 2) Desse resultado, retorne os produtos cuja média de vendas foi maior do que 15.
-- 3) Somente registros se categoria de produtos for 1 ou 2. 

-- Tudo que retornar no SELECT tem que retornar no GROUP BY
-- Mas não precisa usar a fç de agregação no SELECT, pode usar no HAVING

-- Faz uma sub_query unidades >2, depois coloca dentro da query maior que 15
SELECT Nome_Produto, Valor_Unitario_Venda
FROM cap05.dsa_vendas
GROUP BY Nome_Produto, Valor_Unitario_Venda
HAVING AVG(Unidades_Vendidas) > 2;


SELECT 
    Nome_Produto,
    ROUND(AVG(Valor_Unitario_Venda), 2) AS Media_Valor_Unitario
FROM (
    SELECT Nome_Produto, Valor_Unitario_Venda
    FROM cap05.dsa_vendas
    GROUP BY Nome_Produto, Valor_Unitario_Venda
    HAVING AVG(Unidades_Vendidas) > 2
) AS sub_query
GROUP BY Nome_Produto
HAVING AVG(Valor_Unitario_Venda) > 15;


-- no problema 3, o problema é onde colocar a clausula WHERE
-- Erro: Coluna categoria_produto, não existe!
-- O motivo é que a coluna categoria_produto existe na tabela dsa_vendas, não existe na tabela chamada subquery
-- Tem que colocar o WHERE dentro da query da tabela cap05.vendas

-- ERRADO
SELECT 
    Nome_Produto,
    ROUND(AVG(Valor_Unitario_Venda), 2) AS Media_Valor_Unitario
FROM (
    SELECT Nome_Produto, Valor_Unitario_Venda
    FROM cap05.dsa_vendas
    GROUP BY Nome_Produto, Valor_Unitario_Venda
    HAVING AVG(Unidades_Vendidas) > 2
) AS sub_query
WHERE Categoria_Produto IN ('Categoria 1', 'Categoria 2')
GROUP BY Nome_Produto
HAVING AVG(Valor_Unitario_Venda) > 15;

-- CORRETO
SELECT 
    Nome_Produto,
    ROUND(AVG(Valor_Unitario_Venda), 2) AS Media_Valor_Unitario
FROM (
    SELECT Nome_Produto, Valor_Unitario_Venda
    FROM cap05.dsa_vendas
    WHERE Categoria_Produto IN ('Categoria 1', 'Categoria 2')
    GROUP BY Nome_Produto, Valor_Unitario_Venda
    HAVING AVG(Unidades_Vendidas) > 2
) AS sub_query
GROUP BY Nome_Produto
HAVING AVG(Valor_Unitario_Venda) > 15;







