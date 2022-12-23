# Script para PowerShell.
# Para usar este arquivo no linux basta renomear trocando a extensão de .ps1 para .sh 
# e incluir na primeira linha do código #!/bin/bash

Write-Output "Building Docker images..."

docker build -t rodcsant/backend-k8s-project:1.0 backend/.
# Builda a imagem docker do backend a partir do dockerfile contido no diretório backend.
docker build -t rodcsant/database-k8s-project:1.0 database/.
# Builda a imagem docker do database a partir do dockerfile contido no diretório database.

Write-Output "Pushing Docker images..."

docker push rodcsant/backend-k8s-project:1.0
# Envia a imagem buidada do backend para o repositório Docker
docker push rodcsant/database-k8s-project:1.0
# Envia a imagem buidada do database para o repositório Docker

Write-Output "Deploying services on Kubernetes Cluster..."

kubectl apply -f ./services.yml
#Realiza o deploy dos serviços contidos no services.yml
Write-Output "Deploying applications on Kubernetes Cluster..."

kubectl apply -f ./deployment.yml
#Realiza o deploy das aplicações backend especificadas no deployments.yml

Write-Output "Ended."
