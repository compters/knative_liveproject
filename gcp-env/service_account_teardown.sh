#!/usr/bin/env bash

gcloud iam service-accounts delete "$GSA_NAME@$GCP_PROJECT.iam.gserviceaccount.com" --project $GCP_PROJECT
