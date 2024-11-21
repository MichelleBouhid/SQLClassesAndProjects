# SQL Para Análise de Dados e Data Science - Capítulo 04

-- OPERADORES RELACIONAIS

SELECT * 
FROM cap04.estudantes
WHERE nota_exame1 = 90;

SELECT * 
FROM cap04.estudantes
WHERE nota_exame1 > 90;

# O sinal de maior tem que vir antes!
SELECT * 
FROM cap04.estudantes
WHERE nota_exame1 >= 90;

SELECT * 
FROM cap04.estudantes
WHERE nota_exame2 <= 76.5;

# Diferente
SELECT * 
FROM cap04.estudantes
WHERE nota_exame1 != 90;

# Diferente
SELECT * 
FROM cap04.estudantes
WHERE nota_exame1 <> 90;

SELECT * 
FROM cap04.estudantes
WHERE nota_exame1 = 90;

# É o mesmo, mas não recomendado, apesar de funcionar
SELECT * 
FROM cap04.estudantes
WHERE 90 = nota_exame1;

# Operador relacional retorna V ou F, então retornou tudo
# Força o uso de indice WHERE 1=1, retorna tudo com indice
SELECT * 
FROM cap04.estudantes
WHERE 90 = 90;

# Case sensitive e tb o nome é uma string, tem que buscar entre aspas
SELECT * 
FROM cap04.estudantes
WHERE nome = Xavier;

SELECT * 
FROM cap04.estudantes
WHERE nome = 'xavier';

SELECT * 
FROM cap04.estudantes
WHERE nome = 'Xavier';


-- OPERADORES LÓGICOS - usando conectores AND, OR
# Concatena as consdições relacionais

SELECT nome, nota_exame1, nota_exame2
FROM cap04.estudantes
WHERE nota_exame1 > 90 AND nota_exame2 > 90;

SELECT nome, nota_exame1, nota_exame2
FROM cap04.estudantes
WHERE nota_exame1 > 90 OR nota_exame2 > 90;

# Retorna igual a 90, mas nenhuma maior que 90
SELECT nome, nota_exame1, nota_exame2
FROM cap04.estudantes
WHERE NOT nota_exame1 > 90;

SELECT nome, nota_exame1, nota_exame2
FROM cap04.estudantes
WHERE nota_exame1 > 90 AND nota_exame2 > 90 AND tipo_sistema_operacional = 'Windows';

# Indicado para a legibilidade usar parenteses
SELECT nome, nota_exame1, nota_exame2
FROM cap04.estudantes
WHERE (nota_exame1 > 90 OR nota_exame2 > 90) 
  AND tipo_sistema_operacional = 'Linux';

SELECT nome, nota_exame1, nota_exame2
FROM cap04.estudantes
WHERE (nota_exame1 > 90 OR nota_exame2 > 90) 
  AND tipo_sistema_operacional != 'Linux';

# Não quer o grupo de nomes dentro (IN) da lista("Carol", 'Grace')
SELECT nome, nota_exame1, nota_exame2
FROM cap04.estudantes
WHERE (nota_exame1 > 90 OR nota_exame2 > 90) 
  AND tipo_sistema_operacional != 'Linux'
  AND NOT nome IN ('Carol', 'Grace');


-- OUTROS OPERADORES RELACIONAIS
# OBS: Bons em termos de lógica, mas não são mto bons em termos de performance.

-- OPERADOR IN

SELECT nome, sobrenome, nota_exame1, tipo_sistema_operacional
FROM cap04.estudantes
WHERE tipo_sistema_operacional IN ('Linux', 'Mac');

SELECT nome, sobrenome, nota_exame1, tipo_sistema_operacional
FROM cap04.estudantes
WHERE tipo_sistema_operacional IN ('Linux', 'FreeBSD');

SELECT nome, sobrenome, nota_exame1, tipo_sistema_operacional
FROM cap04.estudantes
WHERE tipo_sistema_operacional IN ('Unix');

SELECT nome, sobrenome, nota_exame1, tipo_sistema_operacional
FROM cap04.estudantes
WHERE tipo_sistema_operacional NOT IN ('Linux', 'Mac');


-- OPERADOR LIKE

# Abre e fecha Asas para string, A (case sencitive) e %, caracter coringa não importa oq vem depois
SELECT nome || ' ' || sobrenome AS nome_completo, 
       nota_exame1, 
	   nota_exame2
FROM cap04.estudantes
WHERE nome LIKE 'A%'
ORDER BY nome_completo;

SELECT nome || ' ' || sobrenome AS nome_completo, 
       nota_exame1, 
	   nota_exame2
FROM cap04.estudantes
WHERE nome LIKE 'A%' OR nome LIKE 'B%' 
ORDER BY nome_completo;

SELECT nome || ' ' || sobrenome AS nome_completo, 
       nota_exame1, 
	   nota_exame2
FROM cap04.estudantes
WHERE nome NOT LIKE 'A%'
ORDER BY nome_completo;

# Erro porque tem que colocar o nome da coluna nas 2 condições
SELECT nome || ' ' || sobrenome AS nome_completo, 
       nota_exame1, 
	   nota_exame2
FROM cap04.estudantes
WHERE nome NOT LIKE 'A%' AND NOT LIKE 'B%'
ORDER BY nome_completo;

# Query de cima corrigida
SELECT nome || ' ' || sobrenome AS nome_completo, 
       nota_exame1, 
	   nota_exame2
FROM cap04.estudantes
WHERE nome NOT LIKE 'A%' AND nome NOT LIKE 'B%'
ORDER BY nome_completo;


-- OPERADOR BETWEEN - filtra um range de possibilidades

SELECT nome || ' ' || sobrenome AS nome_completo, 
       nota_exame1, 
	   nota_exame2
FROM cap04.estudantes
WHERE nota_exame1 BETWEEN 88 AND 90
ORDER BY nome_completo;

SELECT nome || ' ' || sobrenome AS nome_completo, 
       nota_exame1, 
	   nota_exame2
FROM cap04.estudantes
WHERE nota_exame1 NOT BETWEEN 88 AND 90
ORDER BY nome_completo;

# Reune todos e ainda cria uma coluna Status, que vai retorna aprovado
SELECT nome || ' ' || sobrenome AS nome_completo, 
       nota_exame1, 
	   nota_exame2,
	   'Aprovado' AS status
FROM cap04.estudantes
WHERE nota_exame1 BETWEEN 88 AND 90
  AND tipo_sistema_operacional IN ('Linux', 'Mac')
  AND nome LIKE 'C%' OR nome LIKE 'H%' OR nome LIKE 'J%'
  AND nota_exame2 != 80
ORDER BY nome_completo;


-- LIMPAR A TABELA (USE COM CUIDADO)
TRUNCATE TABLE cap04.estudantes;





