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

