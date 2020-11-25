# !bin/zsh

# # create link in goinfre to save memory
rm -rf ~/.minikube/machines
mkdir -p ~/goinfre/machines
ln -s ~/goinfre/machines ~/.minikube/machines

echo "\n----> Setting Minikube environment <----\n"
# minikube stop
minikube delete
minikube start --driver=virtualbox
minikube addons enable metrics-server
minikube addons enable metallb
minikube addons enable dashboard

echo "\n----> Creating metalLB environment <----\n"
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb.yaml

eval $(minikube docker-env)

# Creating an serviceaccount:
kubectl apply -f srcs/serviceaccount.yaml

# Creating nginx:
docker build -t my-nginx srcs/nginx/
kubectl apply -f srcs/nginx/nginx.yaml

# Creating ftps:
docker build -t my-ftps srcs/ftps/
kubectl apply -f srcs/ftps/ftps.yaml

# Creating phpmyadmin:
docker build -t my-phpmyadmin srcs/phpmyadmin/
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml

# Creating wordpress:
docker build -t wordpress srcs/wordpress/
kubectl apply -f srcs/wordpress/wordpress.yaml
