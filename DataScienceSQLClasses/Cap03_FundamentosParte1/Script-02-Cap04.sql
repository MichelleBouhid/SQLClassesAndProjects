# SQL Para Análise de Dados e Data Science - Capítulo 04


-- FILTROS DE COLUNA

-- Selecione todas as linhas e colunas da tabela
SELECT * 
FROM cap04.estudantes;

# Não importa a ordem no SELECT, tem que colocar a ordem que a pessoa quiser na tabela gerada
-- Selecione nome e sobrenome de todos os estudantes
SELECT nome, sobrenome
FROM cap04.estudantes;

-- Selecione tipo de sistema operacional, nota no exame 1 e nota no exame 2 de todos os estudantes
SELECT tipo_sistema_operacional, nota_exame1, nota_exame2
FROM cap04.estudantes;

# Pipe usado para concatenar as colunas nome e sobrenome - 2pipes, aspas espaço
-- Selecione tipo de sistema operacional, nota no exame 1, nota no exame 2, nome e sobrenome de todos os estudantes.
-- Nome e sobrenome devem estar em uma única coluna no resultado mostrando o nome completo.
SELECT tipo_sistema_operacional, nota_exame1, nota_exame2, nome || ' ' || sobrenome
FROM cap04.estudantes;

# Colocamos o nome da coluna criada acima, com elias AS 
-- Selecione tipo de sistema operacional, nota no exame 1, nota no exame 2, nome e sobrenome de todos os estudantes.
-- Nome e sobrenome devem estar em uma única coluna no resultado mostrando o nome completo.
-- Crie um alias para a nova coluna de nome completo
SELECT tipo_sistema_operacional, nota_exame1, nota_exame2, nome || ' ' || sobrenome AS nome_completo
FROM cap04.estudantes;


-- FILTROS DE LINHA

-- Selecione os 10 primeiros estudantes da tabela
SELECT *
FROM cap04.estudantes
LIMIT 10;


# OPERADORES RELACIONAIS
-- Selecione todos os estudantes que conseguiram nota igual a 90 em nota_exame1
SELECT * 
FROM cap04.estudantes
WHERE nota_exame1 = 90;

-- Selecione todos os estudantes que conseguiram nota maior do que 90 em nota_exame1
SELECT * 
FROM cap04.estudantes
WHERE nota_exame1 > 90;

-- Selecione somente os nomes dos estudantes que conseguiram nota maior do que 90 em nota_exame1
# Filtra coluna: SELECT nome e filtra linha WHERE.
# Obs: não exibe o nota, se quiser tem que colocar no SELECT nota_exame1
SELECT nome
FROM cap04.estudantes
WHERE nota_exame1 > 90;

-- Selecione somente os nomes dos estudantes que conseguiram nota menor do que 90 em nota_exame1
-- Ordene o resultado ORDER default ascendente, se quiser DESC tem que colocar
SELECT nome
FROM cap04.estudantes
WHERE nota_exame1 < 90
ORDER BY nome;

-- Observe no resultado anterior que um mesmo nome aparece mais de uma vez
-- Retorne somente um nome se houver duplicidade de nome
SELECT DISTINCT nome
FROM cap04.estudantes
WHERE nota_exame1 < 90
ORDER BY nome;

-- Agora queremos valores distintos por nome e sobrenome, ordenado por nome
-- Observe a diferença
SELECT DISTINCT nome, sobrenome
FROM cap04.estudantes
WHERE nota_exame1 < 90
ORDER BY nome;




