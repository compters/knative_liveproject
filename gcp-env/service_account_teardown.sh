#!/usr/bin/env bash

gcloud iam service-accounts delete $GSA_NAME --project $GCP_PROJECT
