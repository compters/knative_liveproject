#!/usr/bin/env bash

gcloud pubsub topics create feedback-created --project=$GCP_PROJECT
gcloud pubsub topics create feedback-classified --project=$GCP_PROJECT