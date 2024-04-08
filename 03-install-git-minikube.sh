#!/bin/bash
# Install binário do Minikube
cd minikube/out/
sudo install minikube /usr/local/bin/minikube
minikube version
minikube start --force
minikube kubectl get nodes