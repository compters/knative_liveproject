#!/usr/bin/env bash

gcloud artifacts repositories create $DOCKER_REPO --repository-format=docker \
    --location=$GCP_REGION \
    --description="Docker repository"\
    --project=$GCP_PROJECT