#!bin/zsh

echo "\n----> Setting Minikube environment <----\n"
minikube delete
minikube start --driver=virtualbox
minikube addons enable metrics-server
minikube addons enable metallb
minikube addons enable dashboard


echo "\n----> Creating metalLB environment <----\n"
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb.yaml

eval $(minikube docker-env)


