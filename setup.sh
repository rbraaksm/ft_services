# # !bin/zsh

# # # create link in goinfre to save memory
# # rm -rf ~/.minikube/machines
# # mkdir -p ~/goinfre/machines
# # ln -s ~/goinfre/machines ~/.minikube/machines

# minikube stop
minikube delete
minikube start --vm-driver=virtualbox
minikube addons enable metallb
minikube addons enable dashboard
minikube addons enable metrics-server

kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb.yaml

eval $(minikube docker-env)

kubectl apply -f srcs/serviceaccount.yaml

# docker build -t my-nginx srcs/nginx/
# kubectl apply -f srcs/nginx/nginx.yaml

docker build -t my-ftps srcs/ftps/
kubectl apply -f srcs/ftps/ftps.yaml

# docker build -t my-ftps srcs/ftps_mine/
# kubectl apply -f srcs/ftps_mine/ftps.yaml

# docker build -t my-ftps srcs/ftps_tim/
# kubectl apply -f srcs/ftps_tim/ftps.yaml

# docker build -t my-mysql srcs/mysql/
# kubectl apply -f srcs/mysql/mysql.yaml

# docker build -t my-phpmyadmin srcs/phpmyadmin/
# kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml

# docker build -t my-wordpress srcs/wordpress/
# kubectl apply -f srcs/wordpress/wordpress.yaml

# docker build -t my-grafana srcs/grafana/
# kubectl apply -f srcs/grafana/grafana.yaml

# docker build -t my-influxdb srcs/influxdb/
# kubectl apply -f srcs/influxdb/influxdb.yaml

# docker build -t my-telegraf srcs/telegraf/
# kubectl apply -f srcs/telegraf/telegraf.yaml

# Log ins:
# grafana rene:ft_services