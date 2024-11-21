
## Filtros de Colunas e Filtros de Linhas

No SQL, os filtros são usados para refinar os dados retornados em uma consulta, seja restringindo as colunas exibidas ou selecionando apenas as linhas que atendem a certas condições.

---

### **Filtros de Colunas**

Os filtros de colunas determinam quais colunas serão exibidas no resultado da consulta. Eles são usados na cláusula **`SELECT`** e podem incluir:

- Colunas específicas: Você pode listar apenas as colunas que deseja exibir.
  ```sql
  SELECT nome, idade FROM usuarios;

### **Filtros de Linhas**

Os filtros de linhas são usados para limitar os dados retornados com base em condições definidas. Eles são aplicados na cláusula WHERE

- Coluna e linha juntos:
    ```sql
  SELECT * FROM usuarios WHERE idade = 30;

  SELECT * FROM pagamentos WHERE data_pagamento IS NULL;


### **Operadores Lógicos x Operadores Relacionais**

Em SQL, tanto os operadores relacionais quanto os lógicos são usados para definir condições em consultas, mas eles têm propósitos diferentes.

### Operadores Relacionais:

Estes são usados para comparar dois valores e retornam um valor verdadeiro ou falso. Eles são semelhantes aos operadores relacionais que você pode encontrar em muitas linguagens de programação. Os operadores relacionais em SQL incluem:

- `=` (Igual)  
- `<>` ou `!=` (Diferente)  
- `<` (Menor que)  
- `>` (Maior que)  
- `<=` (Menor ou igual a)  
- `>=` (Maior ou igual a)  

### Operadores Lógicos:

Eles são usados para combinar duas ou mais condições e retornar um valor verdadeiro ou falso. São eles:

- **AND**: Retorna verdadeiro se ambas as condições forem verdadeiras.  
- **OR**: Retorna verdadeiro se pelo menos uma das condições for verdadeira.  
- **NOT**: Inverte o resultado da condição que o segue. Se a condição for verdadeira, o NOT a torna falsa e vice-versa.

Enquanto os operadores relacionais comparam valores e determinam a relação entre eles, os operadores lógicos são usados para combinar resultados de diferentes condições e determinar a veracidade geral de uma ou mais condições combinadas.

