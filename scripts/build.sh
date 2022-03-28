cd ..
#make build
#make docker-build-all
#make docker-push-all

#cd ..
#make docker-build-alluxio
#make docker-push-alluxio
#sudo make csi-build
#sudo make docker-build-csi
#sudo make docker-push-csi
#
##清理本地docker镜像
#docker system prune
#
#cd ..
#make update-crd
#make dataset-controller-build
#make alluxioruntime-controller-build
##make docker-build-dataset-controller
#make docker-build-alluxioruntime-controller
##make docker-push-dataset-controller
make docker-push-alluxioruntime-controller