### Relacionamento entre Tabelas

Relacionamento entre tabelas de um banco de dados refere-se à conexão estabelecida entre duas ou mais tabelas com base em um ou mais campos em comum, permitindo associar, combinar e recuperar dados de múltiplas tabelas de maneira eficiente. Os relacionamentos são fundamentais em bancos de dados relacionais para garantir a integridade e consistência dos dados, além de evitar redundâncias.

#### Diagrama de Relacionamento
![Diagrama de Relacionamento](https://github.com/MichelleBouhid/SQLClassesAndProjects/blob/main/DataScienceSQLClasses/Cap06_ConsultaJuncaoTabelaParte1/RelacionamentoTabelas.png)

## Principais Tipos de Relacionamentos Entre Tabelas

### Um Para Um (1:1)
Cada registro em uma tabela corresponde a um único registro em outra tabela. Por exemplo, cada pessoa tem um único CPF. Portanto, você poderia ter uma tabela de pessoas e uma tabela de cadastro de CPFs, e elas teriam um relacionamento um para um.

---

### Um Para Muitos (1:N) ou Muitos Para Um (N:1)
Um registro em uma tabela pode se relacionar com vários registros em outra tabela. Por exemplo, em um banco de dados de uma livraria, um autor pode escrever vários livros, mas cada livro tem apenas um autor principal. Portanto, você teria um relacionamento um para muitos entre o autor e os livros. Esse é o tipo de relacionamento mais comum.

---

### Muitos Para Muitos (N:N)
Um registro em uma tabela pode se relacionar com vários registros em outra tabela e vice-versa. Por exemplo, em um banco de dados de uma escola, um aluno pode se matricular em várias disciplinas e cada disciplina pode ter vários alunos. Neste caso, geralmente é necessário uma tabela intermediária (também chamada de tabela de junção ou associação) para gerenciar esse tipo de relacionamento.

---

### Chaves Primárias e Estrangeiras
Para estabelecer esses relacionamentos, geralmente se utiliza:
- **Chaves Primárias (Primary Key, PK)**: Campo ou conjunto de campos em uma tabela que identifica unicamente um registro.
- **Chaves Estrangeiras (Foreign Key, FK)**: Campo ou conjunto de campos em uma tabela que corresponde à chave primária de outra tabela, estabelecendo assim o vínculo entre elas.

Por exemplo, em um banco de dados de uma escola:

- A tabela **"Aluno"** pode ter uma coluna **"ID_Aluno"** como chave primária.
- A tabela **"Turma"** pode ter uma coluna **"ID_Turma"** como chave primária.
- Uma tabela **"Professor_Relacao_Aluno"** que relaciona aluno com professor pode ter chaves estrangeiras **"ID_Professor"** e **"ID_Aluno"**, que se referem às chaves primárias das tabelas **"Professor"** e **"Aluno"**, respectivamente.

Os sistemas de gerenciamento de banco de dados (SGBD) oferecem ferramentas para definir, estabelecer e gerenciar esses relacionamentos, garantindo a integridade dos dados através de restrições e regras de integridade referencial.

## Tipos de Chaves em Bancos de Dados

1. **Chave Primária (Primary Key)**:
   - Identifica exclusivamente cada registro em uma tabela.
   - Deve ser única e não conter valores nulos.
   - Exemplo: **ID_Aluno** na tabela **Aluno**.

2. **Chave Estrangeira (Foreign Key)**:
   - Estabelece um relacionamento entre tabelas.
   - Refere-se a uma chave primária em outra tabela.
   - Exemplo: **ID_Professor** na tabela **Professor_Relacao_Aluno**, referenciando **Professor**.

3. **Chave Candidata (Candidate Key)**:
   - Coluna ou conjunto de colunas que poderia ser uma chave primária.
   - Exemplo: Email de um aluno pode ser uma chave candidata, desde que seja único.
  
4. **Chave Composta (Composite Key)**:
   - Combinação de duas ou mais colunas para criar uma chave única.
   - Exemplo: Na tabela **Professor_Relacao_Aluno**, a combinação de **ID_Professor** e **ID_Aluno**.
  
### Integridade Referencial

Integridade referencial é um conceito fundamental em bancos de dados relacionais que garante a consistência e a confiabilidade das relações entre tabelas. No contexto de um banco de dados relacional, as tabelas estão frequentemente interligadas por meio de chaves estrangeiras. A integridade referencial assegura que estas relações entre tabelas se mantenham válidas e consistentes.

Por exemplo, se uma tabela "A" tem uma chave estrangeira que aponta para uma chave primária em outra tabela "B", a integridade referencial garante que para cada registro em "A" que tenha uma referência em "B", deve existir um registro correspondente em "B". Isso evita situações em que um registro em "A" apontaria para um registro inexistente em "B", o que comprometeria a confiabilidade dos dados.

Além disso, a integridade referencial também determina que qualquer tentativa de excluir um registro em "B" que seja referenciado por um registro em "A" será rejeitada, a menos que medidas adicionais, como a exclusão em cascata, sejam implementadas. Da mesma forma, tentativas de inserir ou atualizar registros em "A" que não tenham correspondência válida em "B" também serão bloqueadas.

A integridade referencial é essencial para evitar erros e inconsistências nos dados, garantindo que as relações entre as tabelas sejam sempre válidas e representem fielmente a realidade modelada no banco de dados.

Mecanismos para gerenciar a integridade referencial, como cascata de exclusão ou atualização, são fornecidos por sistemas de gerenciamento de banco de dados para lidar com situações em que registros relacionados precisam ser modificados ou excluídos.

### INNER JOIN - Conceito e quando usar:

O **"INNER JOIN"** é uma operação em bancos de dados relacionais que combina registros de duas ou mais tabelas baseado em uma condição de correspondência entre elas. Especificamente, ele retorna todas as linhas quando há pelo menos uma correspondência nas tabelas que estão sendo unidas.

Para visualizar o funcionamento do **"INNER JOIN"**, imagine duas tabelas: uma tabela "Clientes" e outra tabela "Pedidos". Se quisermos listar todos os clientes e seus respectivos pedidos, poderíamos usar um **INNER JOIN** baseado no ID do cliente, que estaria presente em ambas as tabelas. O resultado desta operação incluiria somente os clientes que fizeram pelo menos um pedido, excluindo clientes que não fizeram nenhum pedido e pedidos que, por alguma razão, não tenham um cliente associado.

A decisão de usar o **"INNER JOIN"** se dá quando se deseja obter registros que tenham correspondência em ambas as tabelas envolvidas. Isso significa que, se um registro de uma tabela não tiver uma correspondência na outra tabela, ele não aparecerá no resultado final.

### LEFT JOIN - Conceito e quando usar:

O **"LEFT JOIN"**, também conhecido como **"LEFT OUTER JOIN"**, é uma operação em bancos de dados relacionais que combina registros de duas tabelas, retornando todos os registros da tabela à esquerda (a primeira tabela mencionada na instrução JOIN) e os registros correspondentes da tabela à direita (a segunda tabela). Se não houver uma correspondência para um registro específico da tabela à esquerda na tabela à direita, os campos desta última no resultado final serão preenchidos com valores nulos.

Usando o exemplo anterior de duas tabelas, "Clientes" e "Pedidos", um **LEFT JOIN** entre elas, baseado no ID do cliente, retornaria todos os clientes, independentemente de eles terem feito um pedido ou não. Para os clientes que fizeram pedidos, veríamos os detalhes dos pedidos. Para os clientes que não fizeram pedidos, os campos relacionados aos pedidos seriam nulos no conjunto de resultados.

O **"LEFT JOIN"** é particularmente útil quando se deseja obter todos os registros de uma tabela (a tabela à esquerda) e as correspondências possíveis de outra tabela (a tabela à direita). A decisão de usar um **"LEFT JOIN"** surge quando se deseja garantir que todos os registros da tabela principal sejam exibidos, mesmo que não haja correspondência na tabela secundária.


![Junção de Tabelas](attachment-path/image.png)



