@echo OFF

echo create nuclear-bot
kubectl delete namespace nuclear-bot
kubectl create namespace nuclear-bot
kubectl create -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\config\Core-config.yml
kubectl create -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\config\Parser-radon-config.yml
kubectl create -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\config\Parser-ua-config.yml
kubectl create -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\config\Telegram-config.yml
kubectl create -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\deployments\CoreDeployment.yml
kubectl create -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\deployments\ParserAgentRadonDeployment.yml
kubectl create -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\deployments\ParserAgentUaDeployment.yml
kubectl create -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\deployments\TelegramBotDeployment.yml
kubectl create -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\services\CoreService.yml
kubectl create -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\services\ParserAgentRadonService.yml
kubectl create -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\services\ParserAgentUaService.yml
kubectl create -f C:\learn\Nuclear-bot\Nuclear-bot-k8s\src\services\TelegramBotService.yml

echo deploy completed successfully..
timeout 10
