#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
pushd $SCRIPT_DIR
echo "Setting up environment - certain stages require manual confirmation"
./gke_setup.sh
./artifact_setup.sh
./service_account_setup.sh
./pubsub_setup.sh
echo "Waiting 30 seconds for kubernetes setup to be complete before install knative"
sleep 30s
./knative_install.sh
popd