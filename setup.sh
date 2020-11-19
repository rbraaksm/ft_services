# !bin/zsh
rm -rf ~/.minikube/machines
mkdir -p ~/goinfre/machines
ln -s ~/goinfre/machines ~/.minikube/machines

echo "\n----> Setting Minikube environment <----\n"
minikube delete
minikube start --driver=virtualbox
minikube addons enable metrics-server
minikube addons enable metallb
minikube addons enable dashboard


echo "\n----> Creating metalLB environment <----\n"
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb.yaml

# Need to setup serviceaccount metallb?
kubectl apply -f srcs/serviceaccount.yaml

eval $(minikube docker-env)

Creating an serviceaccount:
kubectl apply -f srcs/serviceaccount.yaml

# Creating nginx:
docker build -t my-nginx srcs/nginx/
kubectl apply -f srcs/nginx/nginx.yaml

# Creating phpmyadmin:
docker build -t my-phpmyadmin srcs/phpmyadmin/
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml

