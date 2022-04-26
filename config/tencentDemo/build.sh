kubectl create ns alluxio
kubectl create configmap hdfs-config --from-file=./hdfs-site.xml --from-file=./core-site.xml -n alluxio
kubectl apply -f dataset.yaml
kubectl apply -f alluxioruntime.yaml
