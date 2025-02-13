kubectl create namespace postgresql

#не используется kubectl apply -f db-persistent-volume.yaml -n postgresql
#не используется kubectl apply -f db-volume-claim.yaml -n postgresql
#не используется kubectl apply -f db-storage-class.yml -n postgresql

создание диска для монтирования
gcloud compute disks create --size=1GiB --zone=europe-west1-b mongodb

kubectl apply -f db-configmap.yaml -n postgresql
kubectl apply -f db-deployment.yaml -n postgresql
kubectl apply -f db-service.yaml -n postgresql