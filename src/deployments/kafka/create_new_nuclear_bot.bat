@echo OFF

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
