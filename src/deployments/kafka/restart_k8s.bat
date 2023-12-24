@echo OFF
echo start docker and k8s..
timeout 20

echo stop node k8s..
kubectl cordon docker-desktop
kubectl delete pod my-cluster-kafka-0 -n kafka
kubectl drain docker-desktop --delete-emptydir-data  --ignore-daemonsets --delete-local-data --force
timeout 20

kubectl uncordon docker-desktop
echo start k8s node..
echo pod status
kubectl get pods -n kafka
timeout 60

echo pod status
kubectl get pods -n kafka
timeout 60