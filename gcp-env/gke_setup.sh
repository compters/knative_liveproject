#!/usr/bin/env bash

gcloud config set compute/zone $GKE_ZONE

gcloud beta container clusters create $GKE_CLUSTER \
    --addons=Istio --istio-config=auth=MTLS_PERMISSIVE \
    --cluster-version=1.21.5-gke.1302 \
    --machine-type=e2-standard-2 \
    --num-nodes=1 \
    --workload-pool="$GCP_PROJECT.svc.id.goog" \
    --project $GCP_PROJECT

kubectl label namespace default istio-injection=enabled    
echo "You now need to run the upgrade-14-16 script - read the output of the script as it has to run multiple times!"

