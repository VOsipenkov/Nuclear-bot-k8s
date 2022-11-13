# k8s

To config ingress

https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.41.2/deploy/static/provider/cloud/deploy.yaml
this deploys ingress controller

kubectl get pods --all-namespaces  
find ingress and if in okey than

kubectl delete -A ValidatingWebhookConfiguration ingress-nginx-admission
fix issue with certs

then can deploy ingress