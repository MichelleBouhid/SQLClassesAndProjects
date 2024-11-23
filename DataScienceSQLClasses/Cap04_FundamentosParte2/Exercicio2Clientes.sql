# SQL Para Análise de Dados e Data Science - Capítulo 05
-- ANALISANDO E RESUMINDO DADOS DE CLIENTES

-- Criando a tabela 'clientes'
CREATE TABLE cap05.clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255),
    cidade VARCHAR(255),
    estado VARCHAR(2),
    data_nascimento DATE
);


-- Inserindo registros na tabela 'clientes'
INSERT INTO cap05.clientes (nome, email, cidade, estado, data_nascimento) VALUES
('Carlos Silva', 'carlos.silva@exemplo.dsa.com', 'São Paulo', 'SP', '1980-05-15'),
('Maria Oliveira', 'maria.oliveira@exemplo.dsa.com', 'Rio de Janeiro', 'RJ', '1990-08-20'),
('João Pereira', 'joao.pereira@exemplo.dsa.com', 'Belo Horizonte', 'MG', '1985-11-30'),
('Ana Santos', '', 'Curitiba', 'PR', '1975-02-28'),
('Paulo Souza', 'paulo.souza@exemplo.dsa.com', 'Porto Alegre', 'RS', '1995-06-10'),
('Fernanda Barbosa', '', 'Salvador', 'BA', '1983-07-15'),
('Rodrigo Lima', 'rodrigo.lima@exemplo.dsa.com', 'Recife', 'PE', '1988-12-05'),
('Aline Teixeira', '', 'Fortaleza', 'CE', '1992-04-18'),
('Renato Gonçalves', 'renato.goncalves@exemplo.dsa.com', 'Goiânia', 'GO', '1978-09-12'),
('Patrícia Alves', 'patricia.alves@exemplo.dsa.com', 'São Luís', 'MA', '1987-03-22'),
('Ricardo Martins', 'ricardo.martins@exemplo.dsa.com', 'Natal', 'RN', '1993-01-19'),
('Sandra Ferreira', 'sandra.ferreira@exemplo.dsa.com', 'João Pessoa', 'PB', '1970-10-31'),
('Thiago Correia', 'thiago.correia@exemplo.dsa.com', 'Aracaju', 'SE', '1996-08-07'),
('Fábio Azevedo', 'fabio.azevedo@exemplo.dsa.com', 'Maceió', 'AL', '1982-05-21'),
('Juliana Castro', 'juliana.castro@exemplo.dsa.com', 'Teresina', 'PI', '1989-06-14');

-- Verificando dados:
SELECT * From cap05.clientes LIMIT 10;


# Use SQL para responder às perguntas abaixo:

-- Pergunta 1: Quantos clientes estão registrados por estado?
-- Pergunta 2: Qual é a idade média dos clientes?
-- Pergunta 3: Quantos clientes têm mais de 30 anos?
-- Pergunta 4: Quais são as 3 cidades com o maior número de clientes?
-- Pergunta 5: Quantos clientes têm um endereço de e-mail registrado?


-- Pergunta 1: Quantos clientes estão registrados por estado?

        SELECT estado, COUNT(*) AS total_cliente  
        FROM cap05.clientes 
        GROUP BY estado
        ORDER BY total_cliente DESC;

-- Explicação técnica:
-- Quando você usa GROUP BY: (Porque usou estado para agrupar)

-- Todas as colunas selecionadas precisam ser agregadas ou estar na cláusula GROUP BY.
-- Como você quer contar os clientes agrupados por estado, a coluna estado é usada no SELECT e no GROUP BY.
-- Você usa SELECT estado porque está agrupando por estado

-- Se a tabela fosse:
| estado | nome           |
|--------|----------------|
| SP     | Carlos Silva   |
| SP     | Maria Oliveira |
| RJ     | João Pereira   |
| SP     | Ana Santos     |

-- O resultado seria:

| estado | total_clientes |
|--------|----------------|
| SP     | 3              |
| RJ     | 1              |



-- Pergunta 2: Qual é a idade média dos clientes?

-- Explicação:
-- EXTRACT(YEAR FROM AGE(data_nascimento)):
    -- AGE(data_nascimento): Calcula a diferença entre a data atual e a data de nascimento.
    -- EXTRACT(YEAR ...): Extrai apenas o número de anos dessa diferença.

-- AVG(...):
    --Calcula a média dos anos (idades) obtidos para todos os clientes.

-- AS idade_media: Dá o nome de saída "idade_media" à coluna do resultado.

-- O professor explicitou o uso da data atual (current_date) para calcular a idade, mas o PostgreSQL já assume isso automaticamente no AGE(data_nascimento).
-- Mas tb usou a função AGE

        SELECT ROUND(AVG(EXTRACT(YEAR FROM AGE(data_nascimento))),0) AS idade_media
        FROM cap05.clientes

        
        SELECT AGE(current_date, data_nascimento) AS idade_media
        FROM cap05.clientes;

        SELECT EXTRACT(YEAR FROM AGE(current_date, data_nascimento)) AS idade_media
        FROM cap05.clientes;

        SELECT AVG(EXTRACT(YEAR FROM AGE(current_date, data_nascimento))) AS idade_media
        FROM cap05.clientes;


-- Pergunta 3: Quantos clientes têm mais de 30 anos?

        SELECT COUNT(*) AS total_clientes_mais_30
        FROM cap05.clientes
        WHERE EXTRACT(YEAR FROM AGE(current_date, data_nascimento)) > 30;


-- Explicação:
-- EXTRACT(YEAR FROM AGE(current_date, data_nascimento)): 
        --Calcula a idade de cada cliente em anos com base na diferença entre a data atual (current_date) e a data de nascimento (data_nascimento).

-- WHERE ... > 30:
        -- Filtra apenas os clientes cuja idade é maior que 30 anos.

-- COUNT(*): 
        -- Conta o número total de clientes que atendem ao critério de idade superior a 30 anos.

-- AS total_clientes_mais_30:
        -- Nomeia a coluna do resultado como total_clientes_mais_30.



-- Pergunta 4: Quais são as 3 cidades com o maior número de clientes?
-- Todas as cidades tem o mesmo numero de clientes = 1

        SELECT cidade, COUNT(*) AS total_clientes
        FROM cap05.clientes
        GROUP BY cidade
        ORDER BY total_clientes DESC
        LIMIT 3;


-- Explicação:
-- SELECT cidade, COUNT(*) AS total_clientes:
    --Seleciona a cidade e o número total de clientes em cada cidade.

-- FROM cap05.clientes:
    -- Especifica a tabela de onde os dados serão consultados.

-- GROUP BY cidade:
    --Agrupa os registros por cidade para que a contagem (COUNT(*)) seja feita para cada cidade.

-- ORDER BY total_clientes DESC:
    -- Ordena os resultados de forma decrescente pelo número total de clientes (total_clientes).

-- LIMIT 3:
    -- Restringe o resultado às 3 primeiras cidades, ou seja, as cidades com o maior número de clientes.



-- Pergunta 5: Quantos clientes têm um endereço de e-mail registrado?
-- Não preciso o GROUP BY, porque a resposta é da tabela inteira

    SELECT COUNT(*) 
    FROM cap05.clientes;

    -- Filtra onde o cliente tem email difernete <> de vazio ''.
    SELECT COUNT(*) 
    FROM cap05.clientes 
    WHERE email <> '';

ou 

    SELECT COUNT(*) AS total_clientes_com_email
    FROM cap05.clientes
    WHERE email IS NOT NULL AND email != '';


-- Explicação:
-- WHERE email IS NOT NULL:
    -- Filtra os registros para garantir que o campo email não seja NULL.

-- AND email != '':
    -- Garante que o campo email não está vazio (''), porque um campo vazio não é o mesmo que NULL.

-- COUNT(*):
    -- Conta o número total de registros que atendem às condições acima.

-- AS total_clientes_com_email:
    -- Nomeia a coluna do resultado como total_clientes_com_email.
