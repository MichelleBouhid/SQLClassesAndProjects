### O que é Categorização?

Categorização é o processo de organizar dados em grupos ou categorias baseadas em características comuns. Em SQL, ela é amplamente utilizada para:

- Agrupar dados para análise, como vendas por região ou desempenho por setor.
- Criar categorias personalizadas com base em condições específicas, como idades em faixas etárias (ex.: "Jovens", "Adultos", "Idosos").
- Ajudar na visualização de padrões ou tendências em grandes conjuntos de dados.

Este processo pode ser realizado de várias formas no SQL, como:

- **Utilizando a cláusula `CASE`**: Para criar categorias com base em condições específicas.
- **Aplicando funções de agrupamento (`GROUP BY`)**: Para agrupar os dados em categorias pré-definidas.
- **Combinando colunas e critérios**: Para criar categorias dinâmicas a partir dos dados.

A categorização é especialmente útil em análises exploratórias, relatórios e dashboards, permitindo que os dados sejam compreendidos de forma mais estruturada e intuitiva.

A **categorização em variáveis numéricas**, no contexto da análise de dados, refere-se ao processo de transformar dados numéricos contínuos ou discretos em categorias ou grupos discretos. Esse processo é também frequentemente chamado de "binning" ou "bucketing". A ideia é simplificar a análise ou visualização de distribuições numéricas, ou preparar os dados para algoritmos que operam melhor com dados categóricos.

### Aqui estão algumas razões para categorizar variáveis numéricas:

- **Simplificação de Análise**: Categorizar dados numéricos pode simplificar a interpretação, especialmente quando há uma grande variedade de valores numéricos.

- **Visualização**: Em alguns casos, é mais intuitivo visualizar dados categóricos do que dados numéricos contínuos. Histogramas, por exemplo, são uma forma de visualizar a distribuição de dados numéricos através de "bins".

- **Tratamento de Outliers**: A categorização pode ajudar a lidar com outliers, agrupando valores extremos em categorias mais amplas.

- **Preparação para Modelos Específicos**: Alguns modelos de Machine Learning podem exigir, ou operar melhor, com características categóricas em vez de numéricas.

### O processo de categorização em variáveis numéricas geralmente envolve:

1. **Definição de Intervalos**: Escolher os limites que definirão as categorias. Isso pode ser feito com base em intervalos de igual tamanho, percentis ou utilizando conhecimento específico do domínio.

2. **Transformação**: Convertendo os valores numéricos nas categorias definidas com base nos intervalos escolhidos.

3. **Rotulação (opcional)**: Em vez de usar os intervalos como rótulos, pode-se atribuir rótulos mais descritivos às categorias, como "baixo", "médio" e "alto".


### O que é Encoding?

Encoding é o processo de transformar dados categóricos ou textuais em um formato numérico que pode ser interpretado por algoritmos de Machine Learning ou outros sistemas computacionais. Muitos algoritmos de aprendizado de máquina não conseguem trabalhar diretamente com dados categóricos, e o encoding permite traduzir essas informações para números, preservando o significado dos dados.

Existem diferentes tipos de encoding que podem ser aplicados dependendo da natureza dos dados e do objetivo da análise:

1. **Label Encoding**:
   
   - Converte cada valor categórico em um número único.
   - Exemplo: Para as categorias ["Baixo", "Médio", "Alto"], o encoding poderia ser:
     - "Baixo" → 0
     - "Médio" → 1
     - "Alto" → 2
   - É simples e eficiente, mas pode introduzir uma ordem implícita que nem sempre é apropriada.
  
     ### Vantagens:

- Economiza espaço, pois você tem apenas uma coluna com valores inteiros em vez de várias colunas binárias.
- Pode ser útil para modelos baseados em árvore (como árvores de decisão e random forests) que são capazes de lidar com variáveis categóricas codificadas dessa forma.

   ### Desvantagens:

- Introduz uma ordem arbitrária às categorias, o que pode não ser representativo da natureza da variável. Por exemplo, se tivermos uma variável "cor" com valores "vermelho", "azul" e "verde", e eles são codificados como 1, 2 e 3 respectivamente, isso pode sugerir que "verde" (3) é de alguma forma "maior" ou "melhor" do que "azul" (2) e "vermelho" (1), o que pode não ser verdadeiro e pode levar a resultados indesejados em alguns modelos.

### One-Hot Encoding:

Em One-Hot Encoding, para cada categoria da variável categórica, é criada uma nova coluna binária chamada de variável dummy. Para um dado registro, a coluna correspondente à sua categoria recebe o valor 1 e todas as outras colunas recebem o valor 0, conforme imagem abaixo:


3. **One-Hot Encoding**: (Criação de variáveis Dummy)
   
   - Cada categoria única de uma variável é convertida em uma nova coluna binária (com valores 0 ou 1).
   - Cria uma nova coluna para cada valor único da variável categórica e preenche com 0 ou 1, indicando a presença do valor.
   - Exemplo: Para a categoria "Cor" com valores ["Vermelho", "Azul", "Verde"], o resultado seria:
     - "Vermelho" → [1, 0, 0]
     - "Azul" → [0, 1, 0]
     - "Verde" → [0, 0, 1]
   - É mais adequado para variáveis sem ordem (nominais), mas pode aumentar muito o número de colunas se houver muitas categorias.
  
   ### Vantagens:

- Não introduz uma ordem arbitrária às categorias.
- É útil para muitos modelos lineares, redes neurais e outros modelos que não tratam bem variáveis categóricas com Label Encoding.

  ### Desvantagens:

- Pode aumentar significativamente a dimensionalidade do dataset, especialmente se a variável categórica tiver muitas categorias distintas.
- Pode ser menos eficiente em termos de espaço e tempo, especialmente quando a variável categórica tem muitos valores.

A escolha entre Label Encoding e One-Hot Encoding deve ser feita com base no tipo de modelo que se planeja usar e na natureza da variável categórica.

One-Hot Encoding: https://scikit-learn.org/stable/modules/generated/sklearn.preprocessing

4. **Ordinal Encoding**:
   
   - Similar ao Label Encoding, mas aplicado a variáveis ordinais, onde há uma relação de ordem entre os valores.
   - Exemplo: Para as categorias ["Pequeno", "Médio", "Grande"], o encoding poderia ser:
     - "Pequeno" → 1
     - "Médio" → 2
     - "Grande" → 3
   - Preserva a relação de ordem entre os valores.

6. **Frequency Encoding**:
   - Substitui cada categoria pela frequência com que ela aparece nos dados.
   - Exemplo: Se "Vermelho" aparece 50 vezes, "Azul" 30 vezes, e "Verde" 20 vezes, o encoding seria:
     - "Vermelho" → 50
     - "Azul" → 30
     - "Verde" → 20
   - Útil para lidar com categorias raras.

7. **Target Encoding**:
   
   - Substitui cada categoria pela média da variável alvo para aquela categoria.
   - Exemplo: Em um problema de regressão, se "Vermelho" tem uma média alvo de 75, "Azul" de 60, e "Verde" de 80, o encoding seria:
     - "Vermelho" → 75
     - "Azul" → 60
     - "Verde" → 80
   - Pode introduzir viés e precisa ser usado com cuidado.

9. **Codificação Baseada em Aprendizado (Embedding Encoding)**:
    
  - Usada principalmente com redes neurais, onde categorias são representadas como vetores densos em um espaço n-dimensional. Esses vetores são aprendidos durante o treinamento da rede neural.
- **Aplicação**: Muito usada em Inteligência Artificial.

  **Exemplo**: 
Considere um dataset de filmes onde cada filme está associado a um gênero (e.g., "Ação", "Comédia", "Drama").
Em vez de usar one-hot encoding, você pode utilizar embeddings para mapear cada gênero para um vetor denso de 3 dimensões.
- Ação → [0.8, 0.1, 0.5]
- Comédia → [0.3, 0.9, 0.2]
- Drama → [0.6, 0.4, 0.7]

Esses vetores são aprendidos automaticamente durante o treinamento de um modelo de rede neural e ajudam a capturar relações semânticas entre os gêneros.

**Ao escolher uma técnica de codificação, é importante considerar:**
- O tipo de modelo a ser usado.
- A relação entre a característica categórica e a variável alvo.
- O potencial de introduzir ruído ou multicolinearidade nos dados.

Encoding é uma etapa crucial no pré-processamento de dados e deve ser escolhida com base nas características do conjunto de dados e no algoritmo utilizado. Escolher o método errado pode levar a problemas de desempenho ou introduzir vieses nos resultados.

## **Binarização**

### **Binarização**
Binarização, no contexto da análise e processamento de dados, refere-se ao processo de **converter dados numéricos ou categóricos em formato binário**, ou seja, em valores **0 ou 1**. Essa técnica é amplamente utilizada em diversas áreas, incluindo:

- **Simplificação de Dados**: Reduzir dados contínuos ou categóricos a uma forma mais simples.
- **Preparação para Algoritmos**: Alguns algoritmos exigem que os dados estejam em formato binário para funcionar corretamente.
- **Processamento de Imagens**: Identificação de características relevantes em imagens, como transformar pixels em valores binários (0 para preto, 1 para branco).

#### Exemplo de Binarização:
Se tivermos um conjunto de dados numéricos e quisermos categorizá-los em dois grupos, podemos definir um limiar (por exemplo, 50) para separá-los:

```sql
SELECT
    id,
    CASE 
        WHEN valor > 50 THEN 1
        ELSE 0
    END AS binarizado
FROM tabela;


OBS: Para salvar em pdf: Tabela, botao direito, import export data
