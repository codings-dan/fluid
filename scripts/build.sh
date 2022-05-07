cd ..
#make build
#make docker-build-all
#make docker-push-all

#cd ..
#make docker-build-alluxio
#make docker-push-alluxio
#sudo make csi-build

# make docker-build-csi
# make docker-push-csi



#
##清理本地docker镜像
docker system prune
#
#cd ..
#make update-crd
#make dataset-controller-build
#make alluxioruntime-controller-build
#make docker-build-dataset-controller
#make docker-build-alluxioruntime-controller
#make docker-push-dataset-controller
#make docker-push-alluxioruntime-controller

#bulid webhook
#make webhook-build
#make docker-build-webhook
#make docker-push-webhook

#build dataset controller
#make dataset-controller-build
#make docker-build-dataset-controller
#make docker-push-dataset-controller

##build alluxioruntime controller
make alluxioruntime-controller-build
make docker-build-alluxioruntime-controller
make docker-push-alluxioruntime-controller

#make docker-build-node-info
#make docker-push-node-info
