# SQL Para Análise de Dados e Data Science - Capítulo 08


-- Criamos 2 tabelas novas, que não tem relacionamento em as tabelas
-- Então não pode usar o JOIN, só se tivesse relacionamento entre as tabelas

-- Cria a tabela
CREATE TABLE cap08.estudantes_ensino_medio (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);


-- Insere registros na tabela
INSERT INTO cap08.estudantes_ensino_medio (nome) VALUES ('Alice');
INSERT INTO cap08.estudantes_ensino_medio (nome) VALUES ('Bob');
INSERT INTO cap08.estudantes_ensino_medio (nome) VALUES ('Carla');


-- Cria a tabela
CREATE TABLE cap08.estudantes_universidade  (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    especialidade VARCHAR(255) NOT NULL
);


-- Insere registros na tabela
INSERT INTO cap08.estudantes_universidade (nome, especialidade) VALUES ('Bob', 'Direito');
INSERT INTO cap08.estudantes_universidade (nome, especialidade) VALUES ('Maria', 'Medicina');
INSERT INTO cap08.estudantes_universidade (nome, especialidade) VALUES ('José', 'Engenharia');


-- UNION: Este operador é usado para combinar os resultados de duas ou mais consultas SELECT em um único conjunto de resultados. 
-- Ele elimina duplicatas por padrão.
-- Se queremos obter uma lista de todos os estudantes, sem repetições:
SELECT nome FROM cap08.estudantes_ensino_medio
UNION
SELECT nome FROM cap08.estudantes_universidade;


-- UNION ALL: Semelhante ao UNION, ele combina os resultados de duas ou mais consultas SELECT em um único conjunto de resultados. 
-- No entanto, ele não remove duplicatas.
-- Se quisermos obter uma lista de todos os estudantes, incluindo repetições:
SELECT nome FROM cap08.estudantes_ensino_medio
UNION ALL
SELECT nome FROM cap08.estudantes_universidade;

-- E o que fazer quando não há correspondência de colunas?
-- Vai dar erro porque na tabela ensino medio não há a variavel especialidade
SELECT nome, especialidade FROM cap08.estudantes_ensino_medio
UNION ALL
SELECT nome, especialidade FROM cap08.estudantes_universidade;


-- E o que fazer quando não há correspondência de colunas? 
-- Usa para retornar uma coluna que não existe em um das tabelas
-- Como não tem coluna especialidade usamos um ELIAS para dar um apelido a um texto (string)
SELECT nome, 'Não se aplica' AS especialidade FROM cap08.estudantes_ensino_medio
UNION ALL
SELECT nome, especialidade FROM cap08.estudantes_universidade;


