#!/usr/bin/env bash

gcloud pubsub topics delete feedback-created --project=$GCP_PROJECT
gcloud pubsub topics delete feedback-classified --project=$GCP_PROJECT