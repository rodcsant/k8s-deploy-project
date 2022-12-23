REM Script para CMD.
REM Para usar este arquivo no linux basta renomear trocando a extensão de .bat para .sh 
REM e incluir no cabeçalho do código #!/bin/bash

echo "Building Docker images..."

docker build -t rodcsant/backend-k8s-project:1.0 backend/.
REM Builda a imagem docker do backend a partir do dockerfile contido no diretório backend.
docker build -t rodcsant/database-k8s-project:1.0 database/.
REM Builda a imagem docker do database a partir do dockerfile contido no diretório database.

echo "Pushing Docker images..."

docker push rodcsant/backend-k8s-project:1.0
REM Envia a imagem buidada do backend para o repositório Docker
docker push rodcsant/database-k8s-project:1.0
REM Envia a imagem buidada do database para o repositório Docker

echo "Deploying services on Kubernetes Cluster..."

kubectl apply -f ./services.yml
REM Realiza o deploy dos serviços contidos no services.yml
echo "Deploying applications on Kubernetes Cluster..."

kubectl apply -f ./deployment.yml
REM Realiza o deploy das aplicações backend especificadas no deployments.yml

echo "Ended."
