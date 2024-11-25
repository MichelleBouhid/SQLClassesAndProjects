# SQL Para Análise de Dados e Data Science - Capítulo 08


-- Quais produtos não têm pedido associado?
-- Retorne id do produto, nome do produto, preço do produto, id do cliente associado ao pedido, quantidade e id do pedido
-- Ordene por nome do produto
SELECT pr.id_produto, pr.nome, pr.preco, p.id_cliente, p.quantidade, p.id_pedido
FROM cap08.pedidos p
RIGHT JOIN cap08.produtos pr ON pr.id_produto = p.id_produto
ORDER BY pr.nome;


-- Mostre somente os produtos sem pedido associado.
SELECT pr.id_produto, pr.nome, pr.preco, p.id_cliente, p.quantidade, p.id_pedido
FROM cap08.pedidos p
RIGHT JOIN cap08.produtos pr ON pr.id_produto = p.id_produto
WHERE p.id_pedido IS NULL
ORDER BY pr.nome;


-- Sem modificar a ordem das tabelas retorne somente os produtos que tiveram pedido.
-- Só mudou is not null
SELECT pr.id_produto, pr.nome, pr.preco, p.id_cliente, p.quantidade, p.id_pedido
FROM cap08.pedidos p
RIGHT JOIN cap08.produtos pr ON pr.id_produto = p.id_produto
WHERE p.id_pedido IS NOT NULL
ORDER BY pr.nome;

-- Com LEFT retorna o mesmo resultado, ver qual tem melhor performance!
-- Como o lEFT tem 1 passo a menos, teoricamente será melhor
SELECT pr.id_produto, pr.nome, pr.preco, p.id_cliente, p.quantidade, p.id_pedido
FROM cap08.pedidos p
LEFT JOIN cap08.produtos pr ON pr.id_produto = p.id_produto
ORDER BY pr.nome;


-- Observe o que acontece sem integridade referencial:

-- Retorne todos os pedidos com ou sem produto associado (Não faz sentido ter pedido sem produto ou cliente associado, banco de dados fica inconsistente)
-- Retorne id do produto, nome do produto, preço do produto, id do cliente associado ao pedido, quantidade e id do pedido
-- Ordene por nome do produto


-- Resposta com tabelas onde a IR foi implementada
-- Resultado - todos os pedidos tem produto associado
SELECT pr.id_produto, pr.nome, pr.preco, p.id_cliente, p.quantidade, p.id_pedido
FROM cap08.produtos pr
RIGHT JOIN cap08.pedidos p ON pr.id_produto = p.id_produto
ORDER BY pr.nome;


-- Resposta com tabelas onde a IR NÃO foi implementada
-- Resultado: Pedidos vendidos sem o nome do produto, sem nome de cliente
-- Pode até usar a query para identificar problemas
SELECT pr.id_produto, pr.nome, pr.preco, p.id_cliente, p.quantidade, p.id_pedido
FROM cap08.produtos pr
RIGHT JOIN cap08.pedidos_sem_ir p ON pr.id_produto = p.id_produto
ORDER BY pr.nome;


-- FULL JOIN ou FULL OUTER JOIN (são iguais)
-- Une o left e o right join
-- Devemos evitar 
-- Retorna todos os registros havendo ou não correspondência entre as tabelas

SELECT * 
FROM cap08.produtos pr
FULL JOIN cap08.pedidos p ON pr.id_produto = p.id_produto;

SELECT * 
FROM cap08.produtos pr
FULL OUTER JOIN cap08.pedidos p ON pr.id_produto = p.id_produto;


-- CROSS JOIN
-- Produto cartesiano, ou seja, retorna todas as combinações possíveis entre as tabelas
-- Senta o banco de dados, rs, trava o BD
-- Não tem a clausula ON, que estabelece o relacionamento, faz o produto cartesiano de todas as tabelas!!

SELECT * 
FROM cap08.produtos pr
CROSS JOIN cap08.pedidos p;


-- SELF JOIN - conceito de recursão
-- Queremos listar os pares de pedidos feitos pelo mesmo cliente.
-- Ou seja, queremos todas as combinações de 2 pedidos diferentes para cada cliente.
-- Relaciona a tabela com ela mesma.
-- O SELF JOIN de fato é um INNER JOIN só que faz relação com a mesma tabela, mas para o BD são tabelas difernetes
-- Por isso chamos de p1 e p2, como se fossem 2 tabelas

SELECT * 
FROM cap08.pedidos
ORDER BY id_cliente; 

-- Aqui ele traz as combinações indo e voltando, ele repete os pedidos
-- Isto é, traz pedido 1 5 e 1, e pedido 1 e 5, que são a mesma coisa
SELECT p1.id_pedido AS Pedido1_ID, p2.id_pedido AS Pedido2_ID, p1.id_cliente 
FROM cap08.pedidos p1
JOIN cap08.pedidos p2 
ON p1.id_cliente = p2.id_cliente;

-- Conserta o problema colocando filtro AND pedido da p1 tem que ser diferente da p2
-- Mas trouxe a combinações possiveis, oq ainda não é oq queremos
SELECT p1.id_pedido AS Pedido1_ID, p2.id_pedido AS Pedido2_ID, p1.id_cliente 
FROM cap08.pedidos p1
JOIN cap08.pedidos p2 
ON p1.id_cliente = p2.id_cliente AND p1.id_pedido != p2.id_pedido;

-- Colocamos outro filtro, colocamos maior em vez de diferente. 
-- bom para sistema de indicações como na Amazon :)
SELECT p1.id_pedido AS Pedido1_ID, p2.id_pedido AS Pedido2_ID, p1.id_cliente 
FROM cap08.pedidos p1
JOIN cap08.pedidos p2 
ON p1.id_cliente = p2.id_cliente AND p1.id_pedido < p2.id_pedido;











