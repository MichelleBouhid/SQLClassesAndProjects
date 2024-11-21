
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


### **Os operadores **IN**, **LIKE** e **BETWEEN** em SQL são usados para filtrar dados de acordo com diferentes condições. **

---

### 1. Operador `IN`

O operador **IN** é usado para filtrar valores que correspondem a uma lista específica. Ele evita o uso de múltiplas condições **OR** e torna a consulta mais concisa.

**Sintaxe:**
```sql
SELECT * FROM tabela
WHERE coluna IN (valor1, valor2, valor3);
```
**Dica:**
- É útil para casos em que você tem uma lista específica de valores.
- A lista pode conter valores numéricos ou de texto.


### 2. Operador `LIKE`

O operador LIKE é usado para procurar valores que correspondem a um padrão. É especialmente útil para pesquisa parcial em strings.

**Sintaxe:**
```sql
SELECT * FROM tabela
WHERE coluna LIKE 'padrão';
```

**Exemplo 1: Busca por valores que começam com "João"**
```sql
SELECT * FROM usuarios
WHERE nome LIKE 'João%';
```
- `%`: Corresponde a qualquer número de caracteres (zero ou mais).
  - `'João%'` encontra: João, João Silva, João Paulo, etc.

**Exemplo 2: Busca por valores que terminam com "Silva"**
```sql
SELECT * FROM usuarios
WHERE nome LIKE '%Silva';
```
**Exemplo 3: Busca por valores que contêm "Maria"**
```sql
SELECT * FROM usuarios
WHERE nome LIKE '%Maria%';
```
**Exemplo 4: Busca com um único caractere usando `_`**
```sql
SELECT * FROM usuarios
WHERE nome LIKE 'J_ão';
```
- `_`: Corresponde a exatamente um caractere.
  - `'J_ão'` encontra: João, Jão, mas não "Joan".

### 3. Operador `BETWEEN`

O operador `BETWEEN` é usado para filtrar valores dentro de um intervalo, inclusive os limites.

**Sintaxe:**
```sql
SELECT * FROM tabela
WHERE coluna BETWEEN valor1 AND valor2;
```

**Exemplo 1: Valores numéricos**
Queremos encontrar produtos com preço entre R$10,00 e R$50,00:
```sql
SELECT * FROM produtos
WHERE preco BETWEEN 10 AND 50;
```
- Isso inclui os valores **10** e **50**.

**Exemplo 2: Datas**  
Queremos encontrar transações realizadas entre 1º de janeiro e 31 de março de 2023:
```sql
SELECT * FROM transacoes
WHERE data BETWEEN '2023-01-01' AND '2023-03-31';
```

**Dica:**
- Para números ou datas, o `BETWEEN` é inclusivo (considera os limites superior e inferior).
- Para texto, a comparação é feita com base na ordem alfabética.

### Resumo das Diferenças

| Operador | Uso Principal                               | Exemplo                          |
|----------|--------------------------------------------|----------------------------------|
| IN       | Comparar um valor com uma lista de valores | `cidade IN ('SP', 'RJ', 'BH')`  |
| LIKE     | Procurar por padrões em strings            | `nome LIKE 'João%'`             |
| BETWEEN  | Encontrar valores dentro de um intervalo   | `preco BETWEEN 10 AND 50`       |








