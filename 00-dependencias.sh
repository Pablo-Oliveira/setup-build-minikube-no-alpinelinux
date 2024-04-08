#!/bin/bash
# Baixar e instalar o Go
curl -Lk 'https://go.dev/dl/go1.22.2.linux-amd64.tar.gz' --output go1.22.2.linux-amd64.tar.gz
rm -rf /usr/local/go
tar -C /usr/local -xzf go1.22.2.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
go version
# Instalação das dependências do minukube no Alpine Linux
apk add conntrack-tools
wget https://github.com/kubernetes-sigs/cri-tools/releases/download/v1.22.0/crictl-v1.22.0-linux-amd64.tar.gz
tar zxvf crictl-v1.22.0-linux-amd64.tar.gz
sudo mv crictl /usr/local/bin/
git clone https://github.com/Mirantis/cri-dockerd.git
cd cri-dockerd
make cri-dockerd
sudo cri-dockerd /usr/local/bin/
cri-dockerd --version
cd ..
# Clonar o repositório do Minikube e instalar binário
git clone https://github.com/kubernetes/minikube.git
cd minikube
make
ls out/
cd ..
# Install binário do Minikube
cd minikube/out/
sudo install minikube /usr/local/bin/minikube
minikube version
# Baixar e instalar o kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client