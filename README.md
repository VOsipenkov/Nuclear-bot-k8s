# k8s

# To config ingress

https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.41.2/deploy/static/provider/cloud/deploy.yaml
this deploys ingress controller

kubectl get pods --all-namespaces  
find ingress and if in okey than

kubectl delete -A ValidatingWebhookConfiguration ingress-nginx-admission
fix issue with certs

then can deploy ingress

 # (Config kafka)
first
https://levelup.gitconnected.com/how-to-deploy-apache-kafka-with-kubernetes-9bd5caf7694f
about plug in kafka and zookeeper containters

second
kubectl port-forward kafka-broker-c856f4d9b-tcrcp 9092

third
then config kafka tool
localhost 9092



