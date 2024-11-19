
## Capítulo 01: Criando um Container Docker com PostgreSQL

### Descrição
Neste capítulo, aprendemos como configurar e criar um container Docker rodando PostgreSQL, além de explorar conceitos de mapeamento de portas e comunicação via TCP/IP.

#### **Objetivo**
- Ensinar os fundamentos de contêineres Docker no contexto de bancos de dados.
- Demonstrar como configurar variáveis de ambiente para contêineres.
- Configurar o PostgreSQL para uso em projetos usando linguagem SQL.

#### **Passos**
1. Instale o **Docker Desktop** .
2. Crie o contêiner Docker com o comando:

   ```bash
   docker run --name dbdsa -p 5434:5432 -e POSTGRES_USER=dsa -e POSTGRES_PASSWORD=dsa1010 -e POSTGRES_DB=dsadb -d postgres:16.0

#### Explicação dos parâmetros do comando:

- `--name dbdsa`: Define o nome do contêiner como "dbdsa".
- `-p 5434:5432`: Redireciona a porta 5432 do contêiner para a porta 5434 no host (computador local).
- `-e POSTGRES_USER=dsa`: Define a variável de ambiente `POSTGRES_USER` como "dsa".
- `-e POSTGRES_PASSWORD=dsa1010`: Define a senha "dsa1010" para o usuário do banco.
- `-e POSTGRES_DB=dsadb`: Nomeia o banco de dados como "dsadb".
- `-d`: Faz o contêiner rodar em modo detached (segundo plano).

#### Passos adicionais:

1. Instale o **pgAdmin** conforme as instruções do curso para gerenciar o banco de dados.
2. Crie uma senha master ao acessar o **pgAdmin** pela primeira vez (sugestão: `dsa1010`).

Abaixo está a configuração utilizada no **pgAdmin** para conectar ao banco de dados quando registrar o server:

![Configuração do Servidor no pgAdmin](https://github.com/MichelleBouhid/SQLClassesAndProjects/blob/main/DataScienceSQLClasses/Cap01_ContainerDocker/config_pgadmin.png)
   
![Configuração do Servidor no pgAdmin2](https://github.com/MichelleBouhid/SQLClassesAndProjects/blob/main/DataScienceSQLClasses/Cap01_ContainerDocker/pgadminfinal.png)

## 2. Conceitos Fundamentais: TCP/IP

### O que é TCP/IP?
O **TCP/IP** (*Transmission Control Protocol/Internet Protocol*) é um conjunto de protocolos que permite a comunicação entre computadores em uma rede, incluindo a internet.

### Características principais do TCP/IP:

- **Modularidade**: Estrutura composta por camadas (*Aplicação*, *Transporte*, *Internet* e *Rede de Acesso*), permitindo a divisão de responsabilidades.
- **Protocolos-chave**:
  - **TCP (*Transmission Control Protocol*)**: Responsável por estabelecer conexões confiáveis e garantir a entrega ordenada dos pacotes de dados.
  - **IP (*Internet Protocol*)**: Trata do roteamento e endereçamento dos pacotes entre dispositivos.

### Problema ao Instalar ou Iniciar o Docker no Windows

Ao instalar ou iniciar o Docker no Windows, caso tenha a mensagem de erro abaixo:

![Erro WSL Kernel Version](https://github.com/MichelleBouhid/SQLClassesAndProjects/blob/main/DataScienceSQLClasses/Cap01_ContainerDocker/erro_wsl_kernel_version.png)
 Abra o prompt de comando e então execute:

### Links Úteis

- [PostgreSQL](https://www.postgresql.org/)
- [pgAdmin](https://www.pgadmin.org/)
- [Docker](https://www.docker.com/)



