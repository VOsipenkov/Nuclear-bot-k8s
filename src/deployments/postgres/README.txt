# Это был изначальный вариант запуска в кластере k8s но не сохранялись данные в бд после рестарта ноды
kubectl delete namespace postgresql
kubectl create namespace postgresql
kubectl apply -f db-persistent-volume.yaml -n postgresql
kubectl apply -f db-volume-claim.yaml -n postgresql
kubectl apply -f db-configmap.yaml -n postgresql
kubectl apply -f db-deployment.yaml -n postgresql
kubectl apply -f db-service.yaml -n postgresql


#Актуальный вариант с сохранением в директории Windows
kubectl delete namespace postgresql
kubectl create namespace postgresql

#1. Создать руками volume с именем postgres-data
#2. В докере расшарить папку C:/data/db
#3. Эту папку расшарить по сети виндовс
#4. Принудительно создаем структуру папок (powershell_
    mkdir C:\data\db\postgres -Force

    # Даем полный доступ для ВСЕХ (включая SYSTEM и Docker)
    icacls "C:\data\db\postgres" /grant "Everyone:(OI)(CI)(F)" /T

    # Проверяем результат
    icacls "C:\data\db\postgres"

#5. ЗАПУСК ПОДОВ
kubectl apply -f postgres-configmap.yaml -n postgresql
kubectl apply -f psql-pv.yaml -n postgresql
kubectl apply -f psql-claim.yaml -n postgresql
kubectl apply -f ps-deployment.yaml -n postgresql
kubectl apply -f ps-service.yaml -n postgresql

#6. ПРОБРОС ПОДА для Dbeaver
    kubectl port-forward postgres-86877dcdcc-xssgw 5432:5432 -n postgresql

#7. Первичное подключение к базе
    postgres
    localhost 5432
    pgadmin/pgadmin

#8 на всякий случай я еще ставил вот такие драйверы csi-smb-controller-8498b54988-2qqgl и csi-smb-node-k4kdw в k8s но кажется они не нужны