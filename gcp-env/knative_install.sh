#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
pushd $SCRIPT_DIR

./upgrade-14-16 --reset
./upgrade-14-16
 kubectl label namespace default istio-injection- istio.io/rev=istio-1611 --overwrite
./upgrade-14-16
./upgrade-14-16

kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.1.0/serving-crds.yaml
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.1.0/serving-core.yaml
kubectl apply -f https://github.com/knative/net-istio/releases/download/knative-v1.1.0/net-istio.yaml

popd