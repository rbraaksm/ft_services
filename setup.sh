#!bin/zsh
# create link in goinfre to save memory
rm -rf ~/.minikube/machines
mkdir -p ~/goinfre/machines
ln -s ~/goinfre/machines ~/.minikube/machines

# echo "\n----> Setting Minikube environment <----\n"
# minikube delete
minikube start --driver=virtualbox
# minikube addons enable metrics-server
# minikube addons enable metallb
# minikube addons enable dashboard


# echo "\n----> Creating metalLB environment <----\n"
# kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
# kubectl apply -f srcs/metallb.yaml

# eval $(minikube docker-env)


