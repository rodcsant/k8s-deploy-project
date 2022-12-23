# Para utilizar esse script no terminal do Windows, basta renomear 
# o arquivo trocando a extensão .sh por .bat
#!/bin/bash

echo -e "\033[01;33mBuilding Docker images...\033[00;32m"
#A linha acima contém códigos para alterar a cor da fonte
docker build -t rodcsant/backend-k8s-project:1.0 backend/.
#Builda a imagem docker do backend a partir do dockerfile contido no diretório backend.
docker build -t rodcsant/database-k8s-project:1.0 database/.
#Builda a imagem docker do database a partir do dockerfile contido no diretório database.

echo -e "\033[01;33mPushing Docker images...\033[00;32m"
#A linha acima contém códigos para alterar a cor da fonte
docker push rodcsant/backend-k8s-project:1.0
#Envia a imagem buidada do backend para o repositório Docker
docker push rodcsant/database-k8s-project:1.0
#Envia a imagem buidada do database para o repositório Docker

echo -e "\033[01;33mDeploying services on Kubernetes Cluster...\033[00;32m"

kubectl apply -f ./services.yml
#Realiza o deploy dos serviços contidos no services.yml
echo -e "\033[01;33mDeploying applications on Kubernetes Cluster...\033[00;32m"

kubectl apply -f ./deployment.yml
#Realiza o deploy das aplicações backend especificadas no deployments.yml

echo -e "\033[01;33mEnded.\033[00;32m"
