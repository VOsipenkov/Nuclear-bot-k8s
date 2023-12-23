@echo OFF

echo create kafka..
kubectl create namespace kafka
kubectl create -f 'https://strimzi.io/install/latest?namespace=kafka' -n kafka
timeout 40
kubectl apply -f https://strimzi.io/examples/latest/kafka/kafka-persistent-single.yaml -n kafka
timeout 60
kubectl create -n kafka -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\deployments\kafka\Topic.yml
timeout 2

echo create postgresql
kubectl create namespace postgresql
echo create posgresql..
kubectl apply -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\deployments\postgres\db-persistent-volume.yaml -n postgresql
timeout 2
kubectl apply -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\deployments\postgres\db-volume-claim.yaml -n postgresql
timeout 2
kubectl apply -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\deployments\postgres\db-configmap.yaml -n postgresql
timeout 2
kubectl apply -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\deployments\postgres\db-deployment.yaml -n postgresql
timeout 2
kubectl apply -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\deployments\postgres\db-service.yaml -n postgresql
timeout 2

echo create nuclear-bot
create namespace nuclear-bot
kubectl create -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\deployments\CoreDeployment.yml
kubectl create -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\deployments\ParserAgentRadonDeployment.yml
kubectl create -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\deployments\ParserAgentUaDeployment.yml
kubectl create -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\deployments\TelegramBotDeployment.yml
timeout 2
kubectl create -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\services\CoreService.yml
kubectl create -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\services\ParserAgentRadonService.yml
kubectl create -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\services\ParserAgentUaService.yml
kubectl create -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\services\TelegramBotService.yml

timeout 2
echo deploy completed successfully..
timeout 10
