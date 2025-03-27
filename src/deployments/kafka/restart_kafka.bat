@echo OFF

kubectl delete namespace kafka
timeout 10
kubectl create namespace kafka
kubectl create -f 'https://strimzi.io/install/latest?namespace=kafka' -n kafka
timeout 20
kubectl apply -f https://strimzi.io/examples/latest/kafka/kafka-persistent-single.yaml -n kafka

echo deploy completed successfully..
timeout 10
