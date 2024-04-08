#!/bin/bash
# Clonar o repositório do Minikube e instalar binário
git clone https://github.com/kubernetes/minikube.git
cd minikube
make
ls out/