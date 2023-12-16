########################   Ручной запуск   ########################################

1)
https://strimzi.io/quickstarts/
#Create kafka cluster

kubectl create namespace kafka
kubectl create -f 'https://strimzi.io/install/latest?namespace=kafka' -n kafka
kubectl apply -f https://strimzi.io/examples/latest/kafka/kafka-persistent-single.yaml -n kafka

опционально: kubectl apply -f https://k8s.io/examples/admin/dns/dnsutils.yaml

3)
#Create topic
kubectl create -n kafka -f .\src\deployments\kafka\Topic.yml

#Get list of topics
kubectl get kafkatopic -n kafka

4) Start/stop node

kubectl cordon docker-desktop
kubectl drain docker-desktop --delete-local-data --ignore-daemonsets --force

kubectl uncordon docker-desktop



#METAINFO
#Send messages
kubectl -n kafka run kafka-producer -ti --image=quay.io/strimzi/kafka:0.35.1-kafka-3.4.0 --rm=true --restart=Never -- bin/kafka-console-producer.sh --bootstrap-server my-cluster-kafka-bootstrap:9092 --topic parser-event

#Receive messages
kubectl -n kafka run kafka-consumer -ti --image=quay.io/strimzi/kafka:0.35.1-kafka-3.4.0 --rm=true --restart=Never -- bin/kafka-console-consumer.sh --bootstrap-server my-cluster-kafka-bootstrap:9092 --topic parser-event --from-beginning


##############################    Автоматически     ###########################################

Батники start_k8s.bat и stop_k8s.bat
пересоздается кафку create_new_k8s.bat