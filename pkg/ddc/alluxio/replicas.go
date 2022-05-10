/*

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

package alluxio

import (
	"github.com/fluid-cloudnative/fluid/pkg/ctrl"
	fluiderrs "github.com/fluid-cloudnative/fluid/pkg/errors"
	cruntime "github.com/fluid-cloudnative/fluid/pkg/runtime"
	"github.com/fluid-cloudnative/fluid/pkg/utils"
	"k8s.io/apimachinery/pkg/types"
	"k8s.io/client-go/util/retry"
)

// SyncReplicas syncs the replicas
func (e *AlluxioEngine) SyncReplicas(ctx cruntime.ReconcileRequestContext) (err error) {
	if e.runtime.Spec.Worker.Zone == nil {
		err = retry.RetryOnConflict(retry.DefaultBackoff, func() error {
			workers, err := ctrl.GetWorkersAsStatefulset(e.Client,
				types.NamespacedName{Namespace: e.namespace, Name: e.getWorkerName()})
			if err != nil {
				if fluiderrs.IsDeprecated(err) {
					e.Log.Info("Warning: the current runtime is created by runtime controller before v0.7.0, scale out/in are not supported. To support these features, please create a new dataset", "details", err)
					return nil
				}
				return err
			}
			runtime, err := e.getRuntime()
			if err != nil {
				return err
			}
			runtimeToUpdate := runtime.DeepCopy()
			err = e.Helper.SyncReplicas(ctx, runtimeToUpdate, runtimeToUpdate.Status, workers)
			return err
		})
		if err != nil {
			_ = utils.LoggingErrorExceptConflict(e.Log, err, "Failed to sync replicas", types.NamespacedName{Namespace: e.namespace, Name: e.name})
		}
	} else {
		//todo 修改replica

	}
	return
}
