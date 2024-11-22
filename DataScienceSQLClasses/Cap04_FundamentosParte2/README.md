# Fundamentos Parte 2: Funções de Agregação e Subqueries

Este diretório contém os materiais sobre **Funções de Agregação** e **Subqueries** abordados no curso de SQL. Inclui explicações detalhadas, exemplos de código e notas importantes para consulta rápida.

---

## **Funções de Agregação**

As funções de agregação são usadas para realizar cálculos em um conjunto de valores e retornar um único valor agregado. As principais funções incluem:

- **`COUNT`**: Retorna o número de linhas.
- **`SUM`**: Calcula a soma dos valores.
- **`AVG`**: Calcula a média dos valores.
- **`MIN`**: Retorna o menor valor.
- **`MAX`**: Retorna o maior valor.

**Exemplo 1: Contar o número total de clientes**
```sql
SELECT COUNT(*) AS total_clientes
FROM clientes; 
```
**Exemplo 2: Calcular a soma dos preços de todos os produtos**
```sql
SELECT SUM(preco) AS total_preco
FROM produtos;
```

## **Subqueries**

As subqueries são consultas internas usadas dentro de outra consulta. Elas permitem buscar valores intermediários para serem utilizados na consulta principal.

### Tipos de Subqueries

1. **Subqueries em `WHERE`**:  
   Usadas para filtrar resultados com base em valores retornados pela subquery.  
   **Exemplo: Encontrar produtos cujo preço é maior que a média**
   ```sql
   SELECT nome
   FROM produtos
   WHERE preco > (SELECT AVG(preco) FROM produtos);
   ```
   
2. **Subqueries em `SELECT`**:  
   Usadas para incluir valores calculados em colunas adicionais.  
   **Exemplo: Incluir a média geral do preço em cada linha**
    ```sql
    SELECT nome, preco, (SELECT AVG(preco) FROM produtos) AS media_geral
    FROM produtos;
     ```

4. **Subqueries em `FROM`**:  
   Usadas para criar tabelas temporárias.  
   **Exemplo: Calcular a média de preços agrupados por categoria**  
   ```sql
   SELECT categoria, AVG(preco) AS media_preco
   FROM (SELECT * FROM produtos WHERE ativo = 1) AS produtos_ativos
   GROUP BY categoria;
   ```


## WHERE vs HAVING

- **`WHERE`**: Filtra linhas antes que qualquer função de agregação seja aplicada.  
  **Exemplo: Filtrar produtos com preço maior que 100 antes de calcular a média**  
  ```sql
  SELECT AVG(preco) AS media_preco
  FROM produtos
  WHERE preco > 100;
  ```

- **`HAVING`**: Filtra os resultados depois que as funções de agregação são aplicadas.  
  **Exemplo: Filtrar categorias cuja média de preços seja maior que 200**
  ```sql
  SELECT categoria, AVG(preco) AS media_preco
  FROM produtos
  GROUP BY categoria
  HAVING AVG(preco) > 200;
  ```

### Resumo das Diferenças

| Cláusula | Quando usar                                              | Exemplo                       |
|----------|----------------------------------------------------------|-------------------------------|
| `WHERE`  | Para filtrar dados antes das funções de agregação serem calculadas | `WHERE preco > 100`          |
| `HAVING` | Para filtrar resultados depois que as funções de agregação atuaram | `HAVING AVG(preco) > 200`    |




   
