#minikube
minikube start --cpus=4 --memory=3072 --vm-driver=kvm2
eval $(minikube docker-env)

minikube addons enable metrics-server
minikube addons enable dashboard
minikube addons enable metallb

#metallb
kubectl apply -f srcs/metallb/metallb-conf.yaml

#nginx
docker build -t nginx ./srcs/nginx
kubectl apply -f srcs/nginx/nginx.yaml

#mysql
docker build -t mysql ./srcs/mysql
kubectl apply -f srcs/mysql/mysql.yaml
kubectl apply -f srcs/mysql/secrets.yaml
kubectl apply -f srcs/mysql/pv.yaml

#phpmyadmin
docker build -t pma ./srcs/pma
kubectl apply -f srcs/pma/pma.yaml

#wordpress
docker build -t wp ./srcs/wordpress
kubectl apply -f srcs/wordpress/wp.yaml

#ftps
docker build -t ftps ./srcs/ftps
kubectl apply -f srcs/ftps/ftps.yaml

#influxdb
docker build -t influxdb ./srcs/influxdb
kubectl apply -f srcs/influxdb/influxdb.yaml
kubectl apply -f srcs/influxdb/pv.yaml

#grafana
docker build -t grafana ./srcs/grafana
kubectl apply -f srcs/grafana/grafana.yaml