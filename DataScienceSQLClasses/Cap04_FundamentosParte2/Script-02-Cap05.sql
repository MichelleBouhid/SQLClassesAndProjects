# SQL Para Análise de Dados e Data Science - Capítulo 05


-- Utilizando funções de Agregação, MEDIA, MIN, MAX, SUM, COUNT
-- Query SQL para retornar a média de Valor_Unitario_Venda.
-- REtorna com varias casas decimais
SELECT AVG(Valor_Unitario_Venda) AS Media_Valor_Unitario
FROM cap05.dsa_vendas;


-- Query SQL para retornar a média de Valor_Unitario_Venda com duas casas decimais.
-- Agora com 2 casas decimais
SELECT ROUND(AVG(Valor_Unitario_Venda), 2) AS Media_Valor_Unitario
FROM cap05.dsa_vendas;


-- Query SQL para retornar a contagem, valor mínimo, valor máximo e soma (total) de Valor_Unitario_Venda.
SELECT 
    COUNT(Valor_Unitario_Venda) AS Contagem,
    MIN(Valor_Unitario_Venda) AS Valor_Minimo,
    MAX(Valor_Unitario_Venda) AS Valor_Maximo,
    SUM(Valor_Unitario_Venda) AS Soma_Total
FROM cap05.dsa_vendas;


-- Query SQL para retornar a média (com duas casas decimais) de Valor_Unitario_Venda por categoria de produto.
-- Column 'dsa_vendas.categoria_produto must appear in the GROUP BY clause or in an aggregate function'
-- Qdo precisa usar a função de agregação por outra coluna, precisa usar GROUP BY
-- Calculou a media por cada categoria diferente do media calculada acimaque foi uma media geral

SELECT 
    Categoria_Produto,
    ROUND(AVG(Valor_Unitario_Venda), 2) AS Media_Valor_Unitario
FROM cap05.dsa_vendas
GROUP BY Categoria_Produto;

-- pode tirar o coluna do SELECT, mas fica sem nome na coluna
SELECT 
    ROUND(AVG(Valor_Unitario_Venda), 2) AS Media_Valor_Unitario
FROM cap05.dsa_vendas
GROUP BY Categoria_Produto;

-- Tetnativa de colocar o nome da categoria por produto, mas não funciona
SELECT 
    Nome_Produto,
    ROUND(AVG(Valor_Unitario_Venda), 2) AS Media_Valor_Unitario
FROM cap05.dsa_vendas
GROUP BY Categoria_Produto;


-- Query SQL para retornar a média (com duas casas decimais) de Valor_Unitario_Venda por categoria de produto, 
-- ordenado pela média em ordem decrescente.
SELECT 
    Categoria_Produto,
    ROUND(AVG(Valor_Unitario_Venda), 2) AS Media_Valor_Unitario
FROM cap05.dsa_vendas
GROUP BY Categoria_Produto
ORDER BY Media_Valor_Unitario DESC;


-- Query SQL para retornar a soma de Valor_Unitario_Venda por produto. 
SELECT 
    Nome_Produto,
    SUM(Valor_Unitario_Venda) AS Soma_Valor_Unitario
FROM cap05.dsa_vendas
GROUP BY Nome_Produto;


-- Query SQL para retornar a soma de Valor_Unitario_Venda por produto e categoria. (Leia a mensagem de erro ao executar)
-- Precisa colocar as 2 categorias no GROUP BY

SELECT 
    Nome_Produto,
    Categoria_Produto,
    SUM(Valor_Unitario_Venda) AS Soma_Valor_Unitario
FROM cap05.dsa_vendas
GROUP BY Nome_Produto;


-- Query SQL para retornar a soma de Valor_Unitario_Venda por produto e categoria, ordenado por produto e categoria.
-- Primeiro agrupando por Nome_Produto é uma tabela... se muda a ordem do agrupamento muda a tabela tb!
SELECT 
    Nome_Produto,
    Categoria_Produto,
    SUM(Valor_Unitario_Venda) AS Soma_Valor_Unitario
FROM cap05.dsa_vendas
GROUP BY Nome_Produto, Categoria_Produto
ORDER BY Nome_Produto, Categoria_Produto;


-- Query SQL para retornar a soma de Valor_Unitario_Venda por categoria e produto, ordenado por categoria e produto.
-- Agrupando por Categoria_Produto primeiro, muda a hierarquia da tabela.
SELECT 
    Categoria_Produto,
    Nome_Produto,
    SUM(Valor_Unitario_Venda) AS Soma_Valor_Unitario
FROM cap05.dsa_vendas
GROUP BY Categoria_Produto, Nome_Produto
ORDER BY Categoria_Produto, Nome_Produto;

-- Muda tb a tabela por causa da hieraquia - Essa ficou melhor organizado, categoria e depois produto
SELECT 
    Categoria_Produto,
    Nome_Produto,
    SUM(Valor_Unitario_Venda) AS Soma_Valor_Unitario
FROM cap05.dsa_vendas
GROUP BY Categoria_Produto, Nome_Produto
ORDER BY  Nome_Produto , Categoria_Produto;


-- Query SQL para retornar a média (com duas casas decimais) de Valor_Unitario_Venda por produto, 
-- somente se a média for maior ou igual a 16. 
-- Filtro é colocado na cláusula WHERE
-- Qdo tem que filtrar com base nas funções de agregação, não faz o filtro com a Clausula WHERE
-- Tem que usar a clausula HAVING!

-- Errado:
SELECT 
    Nome_Produto,
    ROUND(AVG(Valor_Unitario_Venda), 2) AS Media_Valor_Unitario
FROM cap05.dsa_vendas
WHERE Media_Valor_Unitario >= 16
GROUP BY Nome_Produto;

-- Qdo chega na clausula WHERE ainda não calculou a agregação, por isso não funciona
-- Correto:
SELECT 
    Nome_Produto,
    ROUND(AVG(Valor_Unitario_Venda), 2) AS Media_Valor_Unitario
FROM cap05.dsa_vendas
GROUP BY Nome_Produto
HAVING AVG(Valor_Unitario_Venda) >= 16;


-- Query SQL para retornar a média (com duas casas decimais) de Valor_Unitario_Venda por produto e categoria, 
-- somente se a média for maior ou igual a 16 e unidades vendidas maior do que 4, ordenado por nome de produto.
-- Mesmo o filtro de média ter sido pedido antes do filtro de coluna, mas só podemos aplicar o filtro de agregação
-- Depois que tiver feito o agrupamento, e isso depende que seja feito antes o filtro da clausula WHERE :). 

SELECT * FROM cap05.dsa_vendas;

SELECT 
    Nome_Produto, 
    Categoria_Produto,
    ROUND(AVG(Valor_Unitario_Venda), 2) AS Media_Valor_Unitario
FROM cap05.dsa_vendas
WHERE unidades_vendidas > 4
GROUP BY Nome_Produto, Categoria_Produto
HAVING AVG(Valor_Unitario_Venda) >= 16
ORDER BY Nome_Produto;


-- Query SQL para retornar a média (com duas casas decimais) de Valor_Unitario_Venda por produto e categoria, 
-- somente se a média for maior ou igual a 16 e o produto for B ou C, ordenado por categoria.
-- OBS: WHERE (filtra linha normal) tem que vir ANTES do HAVING (para fç de agregação, tipo media)
-- WHERE, onde nome_produto estiver dentro (IN) da lista ('Produto B' , 'Produto C')
-- Filtrando pela media >= a 16.. depois

SELECT 
    Nome_Produto, 
    Categoria_Produto,
    ROUND(AVG(Valor_Unitario_Venda), 2) AS Media_Valor_Unitario
FROM cap05.dsa_vendas
WHERE Nome_Produto IN ('Produto B', 'Produto C')
GROUP BY Nome_Produto, Categoria_Produto
HAVING AVG(Valor_Unitario_Venda) >= 16
ORDER BY Categoria_Produto;



