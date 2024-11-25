# SQL Para Análise de Dados e Data Science - Capítulo 08

-- Veremos junção de varias tabelas

--DICA DO PROF: Ao construir uma query
-- Olhe os dados, se as tabelas forem mto grande use LIMIT
-- Comece a query com os JOIN e depois colocque filtro e agrupamentos, pois é a parte mais complexa é criar as junções
-- Isto é, implemente os relacionamentos, faça as junções entre as tabelas antes de tudo


-- A cláusula ON especifica a condição de junção entre duas tabelas.
-- Join de pedidos com clientes primeiro e JOIN de pedidos com produtos depois
-- Qdo só colocar JOIN = INNER JOIN

SELECT p.id_pedido, c.nome AS nome_cliente, pr.nome AS nome_produto, p.quantidade, p.data_pedido
FROM cap08.pedidos p
JOIN cap08.clientes c ON p.id_cliente = c.id_cliente
JOIN cap08.produtos pr ON p.id_produto = pr.id_produto;


-- A cláusula ON pode ser usada normalmente com outras cláusulas SQL

SELECT pr.nome AS nome_produto, ps.quantidade
FROM cap08.pedidos ps
LEFT JOIN cap08.clientes c ON ps.id_cliente = c.id_cliente
LEFT JOIN cap08.produtos pr ON ps.id_produto = pr.id_produto
ORDER BY nome_produto;


-- A integridade referencial é ainda mais importante na junção de múltiplas tabelas
-- Vai aparecer um monte de celulas NULL, por não ter Integridade referenical nas tabelas
SELECT c.nome AS nome_cliente, pr.nome AS nome_produto, ps.quantidade
FROM cap08.pedidos ps
LEFT JOIN cap08.clientes c ON ps.id_cliente = c.id_cliente
LEFT JOIN cap08.produtos pr ON ps.id_produto = pr.id_produto
ORDER BY nome_produto;


-- A integridade referencial é ainda mais importante na junção de múltiplas tabelas
SELECT c.nome AS nome_cliente, pr.nome AS nome_produto, ps.quantidade
FROM cap08.pedidos_sem_ir ps
LEFT JOIN cap08.clientes c ON ps.id_cliente = c.id_cliente
LEFT JOIN cap08.produtos pr ON ps.id_produto = pr.id_produto
ORDER BY nome_produto;



-- Podemos usar filtros condicionais na junção de múltiplas tabelas
SELECT pr.nome AS nome_produto, ps.quantidade
FROM cap08.pedidos ps
LEFT JOIN cap08.clientes c ON ps.id_cliente = c.id_cliente
LEFT JOIN cap08.produtos pr ON ps.id_produto = pr.id_produto
WHERE pr.nome IN ('Produto D', 'Produto H')
ORDER BY nome_produto;


-- Podemos usar agregações na junção de múltiplas tabelas

SELECT pr.nome AS nome_produto, ROUND(AVG(ps.quantidade), 2) AS media_quantidade
FROM cap08.pedidos ps
LEFT JOIN cap08.clientes c ON ps.id_cliente = c.id_cliente
LEFT JOIN cap08.produtos pr ON ps.id_produto = pr.id_produto
WHERE pr.nome IN ('Produto D', 'Produto H')
GROUP BY nome_produto
ORDER BY nome_produto;


-- Para filtrar me dia que foi a funçao de agregação usada tem que usar o HAVING
-- Agrupa pela coluna que não esta na agregação AVG, e filtra usando having para filtrar pela função de agregação
SELECT pr.nome AS nome_produto, ROUND(AVG(ps.quantidade), 2) AS media_quantidade
FROM cap08.pedidos ps
LEFT JOIN cap08.clientes c ON ps.id_cliente = c.id_cliente
LEFT JOIN cap08.produtos pr ON ps.id_produto = pr.id_produto
WHERE pr.nome IN ('Produto D', 'Produto H')
GROUP BY nome_produto
HAVING ROUND(AVG(ps.quantidade), 2) > 42
ORDER BY nome_produto;


-- A cláusula ON especifica a condição de junção entre duas tabelas.
SELECT p.id_pedido, c.nome AS nome_cliente, pr.nome AS nome_produto, p.quantidade, p.data_pedido
FROM cap08.pedidos p
JOIN cap08.clientes c ON p.id_cliente = c.id_cliente
JOIN cap08.produtos pr ON p.id_produto = pr.id_produto;


-- A cláusula USING é útil quando as colunas de junção em ambas as tabelas têm o mesmo nome. 
-- Ela simplifica a sintaxe ao evitar que você tenha que especificar a tabela para cada coluna.
-- A Cláusula USING é uma maneira simplificada de fazer a junção de tabelas (JOIN) quando as colunas usadas para o relacionamento têm exatamente o mesmo nome em ambas as tabelas.
-- CLI é um alias pra Cliente.
SELECT p.id_pedido, cli.nome AS nome_cliente, prod.nome AS nome_produto, p.quantidade, p.data_pedido
FROM cap08.pedidos p
JOIN cap08.clientes cli USING (id_cliente)
JOIN cap08.produtos prod USING (id_produto);


-- Também podemos empregar USING com outras cláusulas SQL
SELECT cli.nome AS nome_cliente, prod.nome AS nome_produto, ROUND(AVG(p.quantidade), 2) AS media_quantidade
FROM cap08.pedidos p
JOIN cap08.clientes cli USING (id_cliente)
JOIN cap08.produtos prod USING (id_produto)
WHERE prod.nome IN ('Produto D', 'Produto H')
GROUP BY cli.nome, nome_produto
HAVING ROUND(AVG(p.quantidade), 2) > 42
ORDER BY nome_produto;


-- Imagine que você quer encontrar os produtos mais vendidos e para cada um desses produtos, deseja obter 
-- os detalhes do cliente que fez o maior pedido em termos de quantidade para esse produto.
-- Na parte cima é a criação de um tabela em tempo de execução!
-- Não aparece na aba TABLES
-- Na parte embaixo é a query que usa a tabela no JOIN
WITH ProdutosMaisVendidos AS (
    SELECT id_produto, SUM(quantidade) AS total_quantidade
    FROM cap08.pedidos
    GROUP BY id_produto
    ORDER BY total_quantidade DESC
    LIMIT 5
)
SELECT prod.nome AS produto, prod.categoria, cli.nome AS nome_cliente, cli.sobrenome, p.quantidade
FROM ProdutosMaisVendidos pmv
JOIN cap08.pedidos p ON pmv.id_produto = p.id_produto
JOIN cap08.produtos prod ON p.id_produto = prod.id_produto
JOIN cap08.clientes cli ON p.id_cliente = cli.id_cliente
WHERE p.quantidade = (SELECT MAX(quantidade) FROM cap08.pedidos WHERE id_produto = pmv.id_produto);

-- A subquery ProdutosMaisVendidos identifica os 5 produtos mais vendidos.
-- Em seguida, juntamos essa subquery com as tabelas pedidos, produtos e clientes para obter os detalhes 
-- do cliente que fez o maior pedido para cada um dos produtos mais vendidos.







