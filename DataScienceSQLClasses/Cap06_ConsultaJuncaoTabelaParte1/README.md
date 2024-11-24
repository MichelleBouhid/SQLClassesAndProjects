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

