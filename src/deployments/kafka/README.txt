########################   Ручной запуск   ########################################

1)
https://strimzi.io/quickstarts/
#Create kafka cluster

kubectl delete namespace kafka
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
kubectl -n kafka run kafka-consumer -ti --image=quay.io/strimzi/kafka:0.35.1-kafka-3.4.0 --rm=true --restart=Never -- bin/kafka-console-consumer.sh --bootstrap-server my-cluster-kafka-bootstrap:9092 --topic parser-event --from-beginning >> C:\Users\Roberto\Desktop\text.txt


##############################    Автоматически     ###########################################

https://stackoverflow.com/questions/101647/how-to-schedule-a-task-to-run-when-shutting-down-windows
For Startup/Shutdown:

Run gpedit.msc (Local Policies)
Computer Configuration -> Windows Settings -> Scripts -> Startup or Shutdown -> Properties -> Add
For Logon/Logoff:

Run gpedit.msc (Local Policies)
User Configuration -> Windows Settings -> Scripts -> Logon or Logoff -> Properties -> Add

просто пересоздается кафку create_new_k8s.bat
kubectl patch ns kafka -p '{\"spec\":{\"finalizers\":[]}}' --type=merge



