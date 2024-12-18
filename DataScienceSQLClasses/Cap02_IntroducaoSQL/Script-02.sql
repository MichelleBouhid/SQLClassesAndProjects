# SQL Para Análise de Dados e Data Science - Capítulo 03


-- SELECT
SELECT *
FROM cap03.estudantes_dsa;

SELECT nome, sobrenome, nota_exame1
FROM cap03.estudantes_dsa;

SELECT id, nome, sobrenome, nota_exame1, nota_exame2, tipo_sistema_operacional
FROM cap03.estudantes_dsa;


-- ORDER BY
SELECT id, nome, sobrenome, nota_exame1, nota_exame2, tipo_sistema_operacional
FROM cap03.estudantes_dsa
ORDER BY nome;

SELECT id, nome, sobrenome, nota_exame1, nota_exame2, tipo_sistema_operacional
FROM cap03.estudantes_dsa
ORDER BY nome, sobrenome;

# Default ordena em ordem crescente
SELECT id, nome, sobrenome, nota_exame1, nota_exame2, tipo_sistema_operacional
FROM cap03.estudantes_dsa
ORDER BY tipo_sistema_operacional;

# Se quiser em ordem decrescente
SELECT id, nome, sobrenome, nota_exame1, nota_exame2, tipo_sistema_operacional
FROM cap03.estudantes_dsa
ORDER BY tipo_sistema_operacional DESC;

# Primeiro ordena SO em ordem decrescente, depois nome em ordem crescente
SELECT id, nome, sobrenome, nota_exame1, nota_exame2, tipo_sistema_operacional
FROM cap03.estudantes_dsa
ORDER BY tipo_sistema_operacional DESC, nome ASC;


-- WHERE
SELECT id, nome, sobrenome, nota_exame1, nota_exame2, tipo_sistema_operacional
FROM cap03.estudantes_dsa
WHERE tipo_sistema_operacional = 'Linux'
ORDER BY nome;

SELECT nome, sobrenome, nota_exame1
FROM cap03.estudantes_dsa
WHERE tipo_sistema_operacional = 'Linux'
ORDER BY nome;

SELECT nome, sobrenome, nota_exame1, tipo_sistema_operacional
FROM cap03.estudantes_dsa
WHERE nota_exame1 > 90
ORDER BY tipo_sistema_operacional DESC;


