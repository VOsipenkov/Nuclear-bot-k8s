@echo OFF
echo stop node k8s..
echo step 1..
kubectl cordon docker-desktop
timeout 1

echo step 2..
kubectl delete pod my-cluster-kafka-0 -n kafka
timeout 1
kubectl drain docker-desktop --delete-emptydir-data  --ignore-daemonsets --delete-local-data --force
timeout 5