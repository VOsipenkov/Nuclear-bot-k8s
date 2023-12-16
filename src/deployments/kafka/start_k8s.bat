@echo OFF
echo start docker and k8s..
timeout 30
echo docker started!
echo k8s cluster started!

kubectl uncordon docker-desktop
echo start k8s node..
timeout 20
echo k8s node started!
timeout 30

echo pod status
kubectl get pods -n kafka
timeout 60

echo pod status
kubectl get pods -n kafka
timeout 60

echo pod status
kubectl get pods -n kafka
timeout 60

echo pod status
kubectl get pods -n kafka
timeout 60

echo pod status
kubectl get pods -n kafka
timeout 60

echo pod status
kubectl get pods -n kafka
timeout 60