# k8s-deploy-project
Files for a cloud cluster deployment project using Kubernetes

Passo-a-passo da execução do projeto:

1) Crie um arquivo dockerfile dentro da pasta backend.
   Este dockerfile conterá os parâmetros para deploy do backend. 

2) Crie uma pasta database.

3) Crie um arquivo dockerfile dentro da pasta database.  
   Este dockerfile conterá os parâmetros para deploy do DB.

4) Crie um arquivo sql.sql
   Este arquivo será responsável por criar uma tabela com campos no DB.

5) Crie um arquivo deployment.yml
   Este arquivo irá conter o código YAML para realizar o deploy do PVC,  
   do MySQL e da aplicação php.

6) Crie um arquivo services.yml
   Este arquivo irá conter o código YAML para deploy dos serviços                                
   necessários para o backend se comunicar com o DB, além do Load Balance.
   Insira o nome do serviço de conexão mysql-connection na linha 2 
   do arquivo conexao.php, entre as aspas. 
   Exemplo: $servername = "mysql-connection";

7) Crie um arquivo script.bat
   Este script irá conter os comandos para buildar e subir 
   as imagens docker para o repositório, além dos comandos para
   realizar o deploy dos YAMLs.

8) Executando o deploy
   Execute o arquivo ./scripts.bat no terminal.
   Verifique se tudo ocorreu bem com os comandos:
   kubectl get pod
   kubectl get service

9) Configure o arquivo js.js com o IP para acesso externo 
   Copie o EXTERNAL-IP obtido com o comando get service referente ao
   serviço php/LoadBalancer e insira na linha 8 do arquivo js.js, entre as  
   aspas e antecedido por http:/. Exemplo: url: "http:// 

10) Teste da aplicação
    Abra o arquivo index.html e preencha o formulário com alguns dados de
    sua preferência.
 
    Execute no terminal o comando para conectar com o Pod SQL:
  
    kubectl exec --tty --stdin <pod-name> -- /bin/bash

    Chame o MySQL:

    mysql -u root -p

    Execute os comandos mysql para visualizar a tabela:

    use meubanco;

    select * FROM mensagens; 
