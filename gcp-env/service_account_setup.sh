#!/usr/bin/env bash

# Create service accounts for app before deploying if neccessary.
# (https://cloud.google.com/kubernetes-engine/docs/how-to/workload-identity#authenticating_to)

# First, create Kubernetes (k8s) service account (SA).
#  Then, create Google service account (which the k8s SA will act as).
# Add the permissions (Firestore and Pub/Sub) that the app needs to the Google
# service account:
kubectl create serviceaccount $KSA_NAME --namespace default 

gcloud iam service-accounts create $GSA_NAME --project $GCP_PROJECT

# Firestore is called "datastore" in IAM right now, and the most granular level
# you can apply permissions to right now is the entire GCP project containing
# the Firestore database. Therefore, we give the service account permission to
# read and write any document in any Firestore collection.
gcloud projects add-iam-policy-binding $GCP_PROJECT \
    --member "serviceAccount:$GSA_NAME@$GCP_PROJECT.iam.gserviceaccount.com" \
    --role "roles/datastore.user"

# Pub/Sub is one of the GCP products that lets you set permissions at a more
# granular level than to the entire project. Therefore, we give the service
# account permission to publish to the topic.
gcloud projects add-iam-policy-binding $GCP_PROJECT \
    --member "serviceAccount:$GSA_NAME@$GCP_PROJECT.iam.gserviceaccount.com" \
    --role "roles/pubsub.publisher"

# Then, tell Google that the k8s SA is allowed to impersonate the Google SA.
gcloud iam service-accounts add-iam-policy-binding $GSA_NAME@$GCP_PROJECT.iam.gserviceaccount.com \
    --role roles/iam.workloadIdentityUser \
    --member "serviceAccount:$GCP_PROJECT.svc.id.goog[default/$KSA_NAME]"

# Then, tell the k8s SA that it can impersonate the Google SA.
kubectl annotate serviceaccount $KSA_NAME \
    --namespace default \
    iam.gke.io/gcp-service-account=$GSA_NAME@$GCP_PROJECT.iam.gserviceaccount.com