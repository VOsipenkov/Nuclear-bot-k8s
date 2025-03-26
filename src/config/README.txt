kubectl create namespace nuclear-bot

kubectl create -f config/Core-config.yml -n nuclear-bot
kubectl create -f config/Parser-radon-config.yml -n nuclear-bot
kubectl create -f config/Parser-ua-config.yml -n nuclear-bot
kubectl create -f config/Telegram-config.yml -n nuclear-bot

kubectl create -f deployments/CoreDeployment.yml -n nuclear-bot
kubectl create -f deployments/ParserAgentRadonDeployment.yml -n nuclear-bot
kubectl create -f deployments/ParserAgentUaDeployment.yml -n nuclear-bot
kubectl create -f deployments/TelegramBotDeployment.yml -n nuclear-bot