# k8s-deploy-project
## Files for a cloud cluster deployment project using Kubernetes and GCP

### Passo-a-passo da execução do projeto:

#### 1) Crie um arquivo dockerfile dentro da pasta backend.

   _Este dockerfile conterá os parâmetros para deploy do backend_. 

#### 2) Crie uma pasta **database**.

#### 3) Crie um arquivo dockerfile dentro da pasta database.
   _Este dockerfile conterá os parâmetros para deploy do DB_.

#### 4) Crie um arquivo **sql.sql**

   _Este arquivo será responsável por criar uma tabela com campos no DB_.

#### 5) Crie um arquivo **deployment.yml**
   _Este arquivo irá conter o código YAML para realizar o deploy do PVC, do MySQL e da aplicação php_.

#### 6) Crie um arquivo **services.yml**
   _Este arquivo irá conter o código YAML para deploy dos serviços necessários para o backend se comunicar com o DB, além do Load Balance.
   Insira o nome do serviço de conexão mysql-connection na linha 2 do arquivo conexao.php, entre as aspas._
 
   Exemplo: `$servername = "mysql-connection";`

#### 7) Crie um arquivo **script.bat**
   _Este script irá conter os comandos para buildar e subir as imagens docker para o repositório, além dos comandos para realizar o deploy dos YAMLs._

#### 8) Executando o **deploy**
   _Execute o arquivo `./scripts.bat` no terminal.
   Verifique se tudo ocorreu bem com os comandos:_

   `kubectl get pod`

   `kubectl get service`

#### 9) Configure o arquivo js.js com o IP para acesso externo 
   _Copie o EXTERNAL-IP obtido com o comando get service referente ao serviço php/LoadBalancer e insira na linha 8 do arquivo js.js, entre as aspas e antecedido por http:/._ Exemplo: `url: "http://189.40.54.20"` 

#### 10) Testando a aplicação
_Abra o arquivo index.html e preencha o formulário com dados de sua preferência._

_Execute no terminal o comando para conectar com o Pod SQL:_

`kubectl exec --tty --stdin <pod-name> -- /bin/bash`

_Chame o MySQL:_

`mysql -u root -p`

_Execute os comandos mysql para visualizar a tabela:_

`use meubanco;`

`select * FROM mensagens;`
 
    
---

Este desafio de projeto é parte do bootcamp da DIO Jornada DevOps com AWS - Impulso, ministrado por https://github.com/denilsonbonatti.
