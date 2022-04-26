#kubectl delete crd  alluxiodataloads.data.fluid.io  --force
#kubectl delete crd  alluxioruntimes.data.fluid.io  --force
#kubectl delete crd  databackups.data.fluid.io   --force
#kubectl delete crd  dataloads.data.fluid.io   --force
#kubectl delete crd  datasets.data.fluid.io  --force
#kubectl delete crd  jindoruntimes.data.fluid.io    --force
#kubectl delete deployment dataset-controller -n fluid-system
#kubectl delete deployment alluxioruntime-controller -n fluid-system
cd ..
kubectl create ns fluid-system
kubectl delete all --all  -n fluid-system --force   --grace-period 0
kubectl apply -k config/crd
kubectl apply -k config/fluid
