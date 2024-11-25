## Junção de Tabelas - Parte 2

### RIGHT JOIN

O **RIGHT JOIN**, também conhecido como **"RIGHT OUTER JOIN"**, é uma operação SQL que combina registros de duas ou mais tabelas em um banco de dados relacional. Ele retorna todos os registros da **"tabela da direita"** e os registros correspondentes da **"tabela da esquerda"**. Se não houver correspondência entre os registros da tabela da esquerda e da direita, o resultado para a parte da **"tabela da esquerda"** será **NULL**.

Esse tipo de junção é útil quando se deseja visualizar todos os registros da tabela da direita, independentemente de haver ou não uma correspondência na tabela da esquerda, ou quando se quer analisar registros na tabela da direita que não têm correspondência na tabela da esquerda.

---

### FULL JOIN

O **FULL JOIN**, também conhecido como **FULL OUTER JOIN**, combina registros de duas tabelas de modo que você obtenha todos os registros de ambas as tabelas. Se houver um registro na primeira tabela que não tenha correspondência na segunda, ou vice-versa, esse registro ainda aparecerá no conjunto de resultados, mas com valores **NULL** na parte onde não houve correspondência.

---

### CROSS JOIN

O **CROSS JOIN** produz o produto cartesiano de duas tabelas. Isso significa que ele combina cada linha da primeira tabela com cada linha da segunda tabela, resultando em um conjunto de resultados que tem o número de linhas da primeira tabela multiplicado pelo número de linhas da segunda tabela.

---

### SELF JOIN

O **SELF JOIN** é uma técnica onde uma tabela é unida a si mesma. É usado para encontrar e combinar registros dentro da mesma tabela que compartilham alguma característica em comum.

---

### Quando usar:

- **FULL JOIN** é usado quando você deseja obter todos os registros de ambas as tabelas e identificar registros que não têm correspondência em uma ou outra tabela.

- **CROSS JOIN** é usado quando você quer combinar todas as linhas de duas tabelas, geralmente em situações onde deseja produzir combinações possíveis entre registros de duas tabelas.

- **SELF JOIN** é usado quando há uma razão para comparar ou combinar registros dentro da mesma tabela, como encontrar pares de registros que tenham valores similares em determinadas colunas.

---

### UNION e UNION ALL


-- O UNION e o UNION ALL são operadores em SQL usados para combinar os resultados 
-- de duas ou mais consultas em um único conjunto de resultados.

-- O UNION combina os resultados de duas consultas e remove quaisquer linhas duplicadas 
-- para produzir um conjunto de resultados único. 
-- As colunas e os tipos de dados nas consultas que estão sendo unidas devem ser os mesmos 
-- para que o UNION funcione.

-- O UNION ALL, por outro lado, combina os resultados de duas consultas e inclui todas as linhas, 
-- incluindo duplicatas. Ele é frequentemente mais rápido do que o UNION porque não precisa 
-- verificar a unicidade das linhas.

-- Representação gráfica:
-- UNION: Combina os resultados sem duplicatas.
-- UNION ALL: Combina os resultados incluindo duplicatas.

![Representação gráfica do UNION e UNION ALL](images/union_unionall.png)

---

## Por que usar aliases (como `p` e `pr`)?

Os aliases (`p` para `pedidos` e `pr` para `produtos`) servem para **abreviar os nomes das tabelas** em consultas SQL, facilitando a escrita e evitando ambiguidades. Quando você tem tabelas diferentes que compartilham colunas com nomes iguais (por exemplo, `id_produto` em `pedidos` e `produtos`), é necessário especificar **de qual tabela cada coluna vem**.


## Razões para especificar a tabela (com ou sem aliases)


-- Evitar ambiguidades:
-- Quando duas ou mais tabelas têm colunas com o mesmo nome, o SQL precisa saber de qual tabela cada coluna pertence. Exemplo:

```sql
SELECT id_produto FROM pedidos, produtos;
-- Isso causaria erro porque o SQL não saberia qual id_produto você quer selecionar.

-- Com tabelas explícitas:
SELECT pedidos.id_produto FROM pedidos;

-- Com aliases:
SELECT p.id_produto FROM pedidos p;
```

## Tornar o código mais curto e legível:


-- Imagine uma consulta longa onde você tem que digitar cap08.pedidos ou cap08.produtos toda vez.
-- Isso pode deixar o código pesado e difícil de ler.

-- Usar aliases (p e pr) torna o código mais conciso:
```sql
SELECT p.id_produto, pr.nome
FROM cap08.pedidos p
JOIN cap08.produtos pr ON p.id_produto = pr.id_produto;
```

## Melhor organização em joins complexos:


-- Em consultas com várias tabelas, o uso de aliases ajuda a identificar rapidamente a origem de cada coluna.

-- Com aliases:
```sql
SELECT c.nome, p.id_produto, pr.nome
FROM cap08.clientes c
JOIN cap08.pedidos p ON c.id_cliente = p.id_cliente
JOIN cap08.produtos pr ON p.id_produto = pr.id_produto;
```
-- Sem aliases, o código ficaria muito longo e confuso:
```sql
SELECT cap08.clientes.nome, cap08.pedidos.id_produto, cap08.produtos.nome
FROM cap08.clientes
JOIN cap08.pedidos ON cap08.clientes.id_cliente = cap08.pedidos.id_cliente
JOIN cap08.produtos ON cap08.pedidos.id_produto = cap08.produtos.id_produto;
```



















