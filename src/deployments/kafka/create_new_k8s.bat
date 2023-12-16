@echo OFF
echo create namespace..
kubectl create namespace kafka

echo deploy strimzi..
kubectl create -f 'https://strimzi.io/install/latest?namespace=kafka' -n kafka
timeout 40

echo deploy kafka..
kubectl apply -f https://strimzi.io/examples/latest/kafka/kafka-persistent-single.yaml -n kafka
timeout 60

echo create topics..
kubectl create -n kafka -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\deployments\kafka\Topic.yml

echo deploy complete
timeout 10
