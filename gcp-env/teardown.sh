#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
pushd $SCRIPT_DIR
./artifact_teardown.sh
./pubsub_teardown.sh
./service_account_teardown.sh
./gke_teardown.sh
popd