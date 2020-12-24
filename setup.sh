# # !bin/zsh

# # # create link in goinfre to save memory
# # rm -rf ~/.minikube/machines
# # mkdir -p ~/goinfre/machines
# # ln -s ~/goinfre/machines ~/.minikube/machines

minikube delete
minikube start --vm-driver=virtualbox
minikube addons enable metallb
minikube addons enable dashboard
minikube addons enable metrics-server

kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/service-metallb/metallb.yaml

eval $(minikube docker-env)

kubectl apply -f srcs/service-metallb/serviceaccount.yaml

docker build -t container-nginx srcs/nginx/
kubectl apply -f srcs/nginx/nginx.yaml

docker build -t container-ftps srcs/ftps/
kubectl apply -f srcs/ftps/ftps.yaml

docker build -t container-mysql srcs/mysql/
kubectl apply -f srcs/mysql/mysql.yaml

docker build -t container-phpmyadmin srcs/phpmyadmin/
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml

docker build -t container-wp srcs/wordpress/
kubectl apply -f srcs/wordpress/wordpress.yaml

docker build -t container-grafana srcs/grafana/
kubectl apply -f srcs/grafana/grafana.yaml

docker build -t container-influxdb srcs/influxdb/
kubectl apply -f srcs/influxdb/influxdb.yaml

docker build -t container-telegraf srcs/telegraf/
kubectl apply -f srcs/telegraf/telegraf.yaml

# Log ins:
# wordpress		rbraaksm:ft_services
# phpmyadmin	mysql:ft_services
# FTPS			rbraaksm:ft_services
# grafana 		admin:admin