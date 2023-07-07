kubectl create namespace postgresql

kubectl apply -f db-persistent-volume.yaml -n postgresql
kubectl apply -f db-volume-claim.yaml -n postgresql
kubectl apply -f db-configmap.yaml -n postgresql
kubectl apply -f db-deployment.yaml -n postgresql
kubectl apply -f db-service.yaml -n postgresql