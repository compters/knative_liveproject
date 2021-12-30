#!/usr/bin/env bash
gcloud artifacts repositories delete $DOCKER_REPO \
    --project=$GCP_PROJECT \
    --location=$GCP_REGION