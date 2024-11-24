# SQL Para Análise de Dados e Data Science - Capítulo 07


-- Estrutura básica de junções
-- Dados q queremos estão em 2 tabelas
-- Precisa existir relação entre as tabelas que dizer:
-- Trazer a chave primaria de uma tabela como chave estrangeira da outra tabela
-- No nosso casoa chave primaria da tabela clientes veio como chave estrangeira da tabela produtos
-- Isso é definido na modelagem
SELECT * FROM cap07.clientes
SELECT * FROM cap07.pedidos

-- Faz a ligação no filtro, dentro da clausula WHERE, schema/tabela/coluna
SELECT nome, quantidade
FROM cap07.clientes, cap07.pedidos
WHERE cap07.clientes.id_cliente = cap07.pedidos.id_cliente;

-- Podemos fazer a mesma query de maneira menos verbosa com inner join que faz a ligação
-- fazendo uma junção interna na tabela de pedidos, ON (regra)
SELECT nome, quantidade
FROM cap07.clientes
INNER JOIN cap07.pedidos ON cap07.clientes.id_cliente = cap07.pedidos.id_cliente;

-- Quer retorna id.cliente da tabela cliente e da tabela produto - Dá erro!!
SELECT id_cliente, id_cliente
FROM cap07.clientes
INNER JOIN cap07.pedidos ON cap07.clientes.id_cliente = cap07.pedidos.id_cliente;

-- Funciona se der um apelido c.nome e p.quantidade, 
-- Pro BD conseguir entender que são 2 informações diferentes com mesmo nome em tabelas diferentes
SELECT c.nome, c.id_cliente, p.quantidade, p.id_cliente
FROM cap07.clientes c
INNER JOIN cap07.pedidos p ON c.id_cliente = p.id_cliente;


-- Retorne id, nome e estado do cliente, id e quantidade do pedido de todos os clientes que fizeram pedido
-- Orderne pelo id do cliente
-- Tem que haver pedido pra retornar
-- Por que usamos INNER JOIN?
-- Tem que haver relação nas tabelas, mas se não houver pedido e query nao retorna
-- Para retornar tem que haver pedido e clientes iguais nas 2 tabelas
SELECT c.id_cliente, c.nome, c.estado, p.quantidade, p.id_pedido
FROM cap07.clientes c
INNER JOIN cap07.pedidos p ON c.id_cliente = p.id_cliente
ORDER BY c.id_cliente;


-- Retorne id, nome e estado do cliente, id e quantidade do pedido de todos os clientes, 
-- independente de ter feito ou não pedido!!
-- Orderne pelo id do cliente
-- Por que usamos LEFT JOIN?
-- Agora independente se fez pedido retorna clientes, mas devem ser iguais id_cliente nas 2 tabelas
SELECT c.id_cliente, c.nome, c.estado, p.quantidade, p.id_pedido
FROM cap07.clientes c
LEFT JOIN cap07.pedidos p ON c.id_cliente = p.id_cliente
ORDER BY c.id_cliente;

-- Como no LEFT JOIN aparecem pedidos nulos pq trouxe todos os clientes, vamos deixar bonito pra entregar pro chefe :)
-- Preenchendo o campo nulo na query anterior
-- CAST = se não for nula faz CAST, tem que transformar o tipo em varchar, pra escrever 'sem pedido'
-- CAST converte o tipo de dado na query, mesmo que na tabela original continue integer
-- Ele não acha bom colocar zero, mas eu achei ok... ai não precisa mudar o tipo
SELECT 
    c.id_cliente, 
    c.nome, 
    c.estado, 
    CASE 
        WHEN p.quantidade IS NULL THEN 'sem pedido' 
        ELSE CAST(p.quantidade AS VARCHAR) 
    END AS quantidade,
    CASE 
        WHEN p.id_pedido IS NULL THEN 'sem pedido' 
        ELSE CAST(p.id_pedido AS VARCHAR) 
    END AS id_pedido
FROM cap07.clientes c
LEFT JOIN cap07.pedidos p ON c.id_cliente = p.id_cliente
ORDER BY c.id_cliente;


-- O que aconteceu aqui?
SELECT c.id_cliente, c.nome, c.estado, p.quantidade, p.id_pedido
FROM cap07.pedidos p 
LEFT JOIN cap07.clientes c ON c.id_cliente = p.id_cliente
ORDER BY c.id_cliente;

-- Igual a query anterior, mas mudou a ordem
-- Pedidos ficou a esquerda do LEFT JOIN e no left join quero retorna tudo da tabela a esquerda
-- Agora a query trouxe todos os pedidos primeiro, e como nao tem pedido sem cliente porque fizemos e integridade referencial
-- Vemos que a ordem das tabelas é muito importante

-- Pra chegar ao mesmo resultado acima, sem precisar troca a ordem (colocar cap07.pedidos, no WHERE)
-- É só colocar RIGHT JOIN

SELECT c.id_cliente, c.nome, c.estado, p.quantidade, p.id_pedido
FROM cap07.clientes c
RIGHT JOIN cap07.pedidos p ON c.id_cliente = p.id_cliente
ORDER BY c.id_cliente;