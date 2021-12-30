#!/usr/bin/env bash
# Build image via Cloud Build
# Knative requires a change to have been made to the service YAML file for it
# to create a new revision. Therefore, we use a unique value for the image tag
# for each build. A Git commit hash is a good choice for this, but because this
# script may be run from outside of a Git repo, we use a random string.
# credit: https://gist.github.com/earthgecko/3089509
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
export TAG=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 32 | head -n 1)
pushd $SCRIPT_DIR
gcloud builds submit --tag $GCP_REGION-docker.pkg.dev/$GCP_PROJECT/$DOCKER_REPO/$IMAGE_NAME:$TAG
envsubst < deployment.yaml | kubectl apply -f -
popd
# Fill in service.yaml template with project-specific info and then use it to
# deploy. Forward slashes in image name are escaped using backslashes.
