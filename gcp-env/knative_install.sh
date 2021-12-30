#!/usr/bin/env bash

kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.1.0/serving-crds.yaml
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.1.0/serving-core.yaml

kubectl apply -f https://github.com/knative/net-istio/releases/download/knative-v1.1.0/net-istio.yaml