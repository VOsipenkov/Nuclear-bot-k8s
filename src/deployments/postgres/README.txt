kubectl create namespace postgresql

kubectl apply -f db-persistent-volume.yml -n postgresql
kubectl apply -f db-volume-claim.yml -n postgresql
kubectl apply -f db-storage-class.yml -n postgresql

#создание диска для монтирования
#gcloud compute disks create --size=1GiB --zone=europe-west1-b postgres-gce-disk

kubectl apply -f db-configmap.yml -n postgresql
kubectl apply -f db-deployment.yml -n postgresql
kubectl apply -f db-service.yml -n postgresql